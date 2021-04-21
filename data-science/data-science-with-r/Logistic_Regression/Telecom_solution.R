
library(MASS)
library(car)
library(e1071)
library(caret)
library(ggplot2)
library(cowplot)
library(caTools)
library(GGally)
library(e1071)

rm(list = ls())
getwd()
#setwd('D:/Simplilearn/Faculty/Datasets/Logistic_Regression')

# Loading 3 files

churn_data<- read.csv("churn_data.csv", stringsAsFactors = F)
customer_data<- read.csv("customer_data.csv", stringsAsFactors = F)
internet_data<- read.csv("internet_data.csv", stringsAsFactors = F)

dim(churn_data)    
dim(customer_data) 
dim(internet_data) 

View(churn_data)
View(customer_data)
View(internet_data)

# Assignment1 :
# Check if there are any duplicate customer ids in the data  
# hint : 
# - length of unique cust ids must match the total number of records . 
# - perform and aggregate on cust ids and take the count of each cust id .
# All must have count = 1 . 

# Assignment2 :
# Validate if all the datasets have all the  customer ids. No cust ids must be 
# missing in any of the data . 
# hint : use setdiff() method . 


# merge the datasets to one . 

telecom<- merge(churn_data,customer_data, by="customerID", all = F)
telecom<- merge(telecom,internet_data, by="customerID", all = F)

View(telecom) #master file

### Data Preparation & Exploratory Data Analysis


str(telecom)


# Barcharts for categorical features with stacked telecom information
bar_theme1<- theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5), 
                   legend.position="none")



plot_grid(ggplot(telecom, aes(x=PhoneService,fill=Churn))+ geom_bar(), 
          ggplot(telecom, aes(x=Contract,fill=Churn))+ geom_bar()+bar_theme1,
          ggplot(telecom, aes(x=PaperlessBilling,fill=Churn))+ geom_bar()+bar_theme1,
          ggplot(telecom, aes(x=PaymentMethod,fill=Churn))+ geom_bar()+bar_theme1,
          ggplot(telecom, aes(x=gender,fill=Churn))+ geom_bar()+bar_theme1,
          ggplot(telecom, aes(x=factor(SeniorCitizen),fill=Churn))+ geom_bar()+bar_theme1,
          align = "h")   

# Assignment
# Histogram and Boxplots for numeric variables in single plot . 



# Correlation between numeric variables


ggpairs(telecom[, c("tenure", "MonthlyCharges", "TotalCharges")])

# tenure and TotalCharges are highly correlated (corr 0.83)


### Data Preparation


# Bringing the variables in the correct format

telecom$SeniorCitizen<- ifelse(telecom$SeniorCitizen==1,"Yes","No")

# Outlier treatment and imputing missing value

seq(0,1,.01)

sapply(telecom[,c("tenure","MonthlyCharges","TotalCharges")], 
       function(x) quantile(x,seq(0,1,.01),na.rm = T)) 


# Missing value

sapply(telecom, function(x) sum(is.na(x))) 

View(subset(telecom, is.na(TotalCharges)))

### Tenure is 0 for all the records with total charges = NA . 

## droping those records. 

telecom <- telecom[!is.na(telecom$TotalCharges),]

dim(telecom)

################################################################
# Feature standardisation

# converting target variable telecom from No/Yes character to factorwith levels 0/1 

telecom$Churn<- ifelse(telecom$Churn=="Yes",1,0)


View(telecom)
# creating a dataframe of categorical features

telecom_chr<- telecom[,-c(1,2,7,8,9)]

# extracting categorical variables 
telecom_fact<- data.frame(sapply(telecom_chr, function(x) factor(x)))

# creating dummy variables for factor attributes
dummies<- data.frame(sapply(telecom_fact, 
                            function(x) data.frame(model.matrix(~x,data =telecom_fact))[,-1]))



View(dummies)
names(dummies)
# For variables having only two levels, verified PhoneService, PaperlessBilling, Partner, Dependents "yes" is 1,
#gender "male" is 1 and SeniorCitizen "1" is 1 

# Final dataset
telecom_final<- cbind(telecom[,c(9,2,7,8)],dummies) 

View(telecom_final) #7032 obs. of  31 variables

########################################################################
# splitting the data between train and test
set.seed(100)

indices = sample.split(telecom_final$Churn, SplitRatio = 0.7)

train = telecom_final[indices,]

test = telecom_final[!(indices),]

dim(train)
dim(test)

# MODEL BUILDING

model_1 = glm(Churn ~ ., data = train, family = "binomial")
summary(model_1) 

#final_model<- model_1

View(test)

### Model Evaluation

### Test Data ####

#predicted probabilities of Churn 1 for test data

test_pred = predict(model_1, type = "response", newdata = test[,-1])

test_pred

test$prob <- test_pred
View(test)


# Let's use the probability cutoff of 50%.

test_pred_churn <- factor(ifelse(test_pred >= 0.50, "Yes", "No"))
test_actual_churn <- factor(ifelse(test$Churn==1,"Yes","No"))
test_actual_churn

table(test_actual_churn,test_pred_churn)



test_conf <- confusionMatrix(test_pred_churn, test_actual_churn, positive = "Yes")
test_conf

  

test_pred_churn <- factor(ifelse(test_pred >= 0.40, "Yes", "No"))
table(test_actual_churn,test_pred_churn)
test_conf <- confusionMatrix(test_pred_churn, test_actual_churn, positive = "Yes")
test_conf



perform_fn <- function(cutoff) 
{
  predicted_churn <- factor(ifelse(test_pred >= cutoff, "Yes", "No"))
  conf <- confusionMatrix(predicted_churn, test_actual_churn, positive = "Yes")
  acc <- conf$overall[1]
  sens <- conf$byClass[1]
  spec <- conf$byClass[2]
  out <- t(as.matrix(c(sens, spec))) 
  colnames(out) <- c("sensitivity", "specificity")
  return(out)
}


s = seq(.01,.80,length=100)
s
OUT = matrix(0,100,2)
OUT

for(i in 1:100)
{
  OUT[i,] = perform_fn(s[i])
} 
OUT

plot(s, OUT[,1],xlab="Cutoff",ylab="Value",cex.lab=1.5,cex.axis=1.5,ylim=c(0,1),type="l",lwd=2,axes=FALSE,col=2)
axis(1,seq(0,1,length=5),seq(0,1,length=5),cex.lab=1.5)
axis(2,seq(0,1,length=5),seq(0,1,length=5),cex.lab=1.5)
lines(s,OUT[,2],col="darkgreen",lwd=2)
#lines(s,OUT[,3],col=4,lwd=2)
box()
#legend(0,.50,col=c(2,"darkgreen",4,"darkred"),lwd=c(2,2,2,2),c("Sensitivity","Specificity","Accuracy"))



cutoff <- s[which(abs(OUT[,1]-OUT[,2])<0.01)]

cutoff
# Let's choose a cutoff value of 0.3132 for final model

test_cutoff_churn <- factor(ifelse(test_pred >=0.3132, "Yes", "No"))

conf_final <- confusionMatrix(test_cutoff_churn, test_actual_churn, positive = "Yes")
conf_final

acc <- conf_final$overall[1]

sens <- conf_final$byClass[1]

spec <- conf_final$byClass[2]

acc

sens

spec


