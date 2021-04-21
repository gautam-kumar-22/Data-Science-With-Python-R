
getwd()
library(caTools)
getwd()
setwd('F:\\my_work\\simplilearn\\data-science\\data-science-with-r\\Logistic_Regression')
getwd()

dataset <- read.csv('framingham.csv')
View(dataset)

#### Find the features with NAs

colSums(is.na(dataset))

#### Look for Outliers

boxplot(dataset$education)
boxplot(dataset$cigsPerDay)
boxplot(dataset$BPMeds)
boxplot(dataset$totChol)
boxplot(dataset$BMI)
boxplot(dataset$heartRate)
boxplot(dataset$glucose)


education.mean <- mean(dataset$education, na.rm = TRUE)
education.mean
dataset[is.na(dataset$education) == TRUE, "education"] <- education.mean


cigsPerDay.median <- median(dataset$cigsPerDay, na.rm = TRUE)
dataset[is.na(dataset$cigsPerDay) == TRUE, "cigsPerDay"] <- cigsPerDay.median


BPMeds.null <- 0
dataset[is.na(dataset$BPMeds) == TRUE, "BPMeds"] <- BPMeds.null

totChol.median <- median(dataset$totChol, na.rm = TRUE)
dataset[is.na(dataset$totChol) == TRUE, "totChol"] <- totChol.median

BMI.median <- median(dataset$BMI, na.rm = TRUE)
dataset[is.na(dataset$BMI)== TRUE, "BMI"] <- BMI.median

heartRate.median <- median(dataset$heartRate, na.rm = TRUE)
dataset[is.na(dataset$heartRate) == TRUE, "heartRate"] <- heartRate.median

glucose.median <- median(dataset$glucose, na.rm = TRUE)
dataset[is.na(dataset$glucose) == TRUE, "glucose"] <- glucose.median


## check for NAs after removing them  
colSums(is.na(dataset))

# understand the summary and the corelation of the features.
summary(dataset)
cor(dataset)

str(dataset)

## Plot age and sysBP to understand the relation . 

plot(dataset$age, dataset$sysBP)
points(dataset$age, dataset$sysBP, col = ifelse(dataset$male == 0, "blue", "red"), pch = 19)
abline(h = 190, col = "black")

### split the dataset into test and train 
split <- sample.split(dataset$TenYearCHD, SplitRatio = 0.6)
train <- subset(dataset, split == TRUE)
test <- subset(dataset, split == FALSE)


#logistic_model <- glm(TenYearCHD ~ male + age + education + currentSmoker + cigsPerDay + BPMeds + prevalentStroke + prevalentHyp + diabetes + totChol + sysBP + diaBP + BMI + heartRate + glucose, train, family = gaussian(link = "identity"))


logit_model <-  glm(TenYearCHD ~ . , train, family = "binomial")
library("MASS")
summary(logit_model)

#vif(logit_model)
##library("psyche")
#library(car)

#### Test the model  ####
summary(test)

names(test[,-16])

test_pred = predict(logit_model,type = "response", newdata = test[,-16])

test_pred

test$prob <- test_pred
names(test)


test_pred_CHD <- factor(ifelse(test_pred >= 0.40, '1','0'))

table(test_pred_CHD,test$TenYearCHD)


library(e1071)
library(caret)
#factor(test_pred_CHD)
#factor(test$TenYearCHD)
#length(test$TenYearCHD)
#length(test_pred_CHD)
test_conf <- confusionMatrix(factor(test_pred_CHD), factor(test$TenYearCHD))
test_conf
