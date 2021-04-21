
# Load the dataset
setwd('F:\\my_work\\simplilearn\\data-science\\data-science-with-r\\Multiple_Linear_regression')
getwd()
dataset = read.csv('kc_house_data.csv')

# install.packages('car')
# library(car) # for VIF ( Variance Inflation Factor)
library(corrplot) # for corrplot
library(caTools) # for splitting dataset
library(ggplot2)
library(MLmetrics)

# Visualize the dataset
View(dataset)


str(dataset)
# Changing date to yyyymm format

dataset$date = substr(dataset$date, 1, 6)

# Visualize the data again
View(dataset)

# Check for NA and missing values
# is.na return a vector with value T for missing values.

numberOfNA = dim(dataset[is.na(dataset),])[1]
class(numberOfNA)

if(numberOfNA > 0)
{
  cat('Number of missing values: ', numberOfNA)
  cat('\nRemoving missing values...')
  dataset = dataset[complete.cases(dataset), ]
}


sort(unique(dataset$date))

# Assignment:
##  Remove the year part and retain only the month and make
##  the model again too check if this performs better . 


# Removing columns id and date
dataset$id = NULL
dataset$date = NULL
View(dataset)


# Pair plots
# The scatterplot matrix can provide answers to the following questions:
# Are there pairwise relationships between the variables?
# If there are relationships, what is the nature of these relationships?
# Are there outliers in the data?
# Is there clustering by groups in the data?

# par(mfrow=c(3,3))
# for(i in 2:19){
#  plot(dataset[,i],
#       dataset$price,
#       main=names(dataset[i]),
#       ylab=names(dataset$price),
#       xlab="", col='indianred4')
# }
# 
# par(mfrow=c(1,1))

# Boxplot for bedrooms
boxplot(dataset$price ~ dataset$bedrooms, main = 'Bedrooms', col=c("blue","red"))

# For 11 and 33, there are hardly any houses.

# Checking the other data for these 2 houses
View(subset(dataset, dataset$bedrooms > 10))

# A house of 33 bedrooms makes no sense. 
# This makes no sense and may lead to errors.
# We would remove this 
dataset = dataset[dataset$bedrooms != 33, ]


## Assignment : Try removing records with number of bedrooms > = 10 

## Assignment : outlier : set an upper limit of the price and cap the price of the house to this upper limit for outiers .




# Boxplot for bathrooms
boxplot(dataset[, 1] ~ dataset[, 3], main = 'Bathrooms', col=c("blue","red"))


### Assignment : Explore other features in the same line to explore futher model enhancement scope . 




# Checking correltaion of price with other variables
corr = cor(dataset[, 1:19])
View(corr)

corrplot::corrplot(corr, method = "color", outline = T, cl.pos = 'n', rect.col = "black",  tl.col = "indianred4", addCoef.col = "black", number.digits = 2, number.cex = 0.60, tl.cex = 0.7, cl.cex = 1, col = colorRampPalette(c("green4","white","red"))(100))


# Dropping variables that are not needed for prediction.

dataset = subset(dataset, select = -c(lat,zipcode,yr_renovated,yr_built,sqft_above,sqft_basement,long) )

names(dataset)

### creating dummy variables. 


condition <- as.factor(dataset$condition)
# class(dataset$condition)
dummy_condition <- data.frame(model.matrix(~condition))[,-1]

view_factor <- as.factor(dataset$view)
dummy_view <- data.frame(model.matrix(~view_factor))[,-1]

grade_fact <- as.factor(dataset$grade)
dummy_grade <- data.frame(model.matrix(~grade_fact))[,-1]

floor_fact <- as.factor(dataset$floors)
dummy_floors <- data.frame(model.matrix(~floor_fact))[,-1]

View(dummy_floors)

dataset <- cbind(dataset,dummy_condition,dummy_view,dummy_grade,dummy_floors)

names(dataset)

dataset = subset(dataset, select = -c(view,condition,grade,floors) )
names(dataset)

View(dataset)

# Splitting dataset into training set and test set

set.seed(123) # Seed initializes the randomness
samples = sample.split(dataset, SplitRatio = 0.7) # Returns a vector with T for 70% of data
trainingSet = subset(dataset, sample == T)
testSet = subset(dataset, sample == F)
names(trainingSet)
str(samples)
summary(samples)
# Create model 
model = lm(formula = price ~ . , data = trainingSet)
summary(model)

y_pred_train = predict(model, newdata = trainingSet)

length(y_pred_train)
y_pred_train

# Visualizing the training set results
ggplot() + 
  geom_point(aes(x=trainingSet$price,y=y_pred_train)) +
  xlab('actual_price') +
  ylab('predicted_price')+
  ggtitle('comparison of train data')



# Visualizing the test set results
 
y_pred_test = predict(model, newdata = testSet)



ggplot() + 
  geom_point(aes(x=testSet$price,y=y_pred_test)) +
  xlab('actual_price') +
  ylab('predicted_price')+z
  ggtitle('comparison of test data')


### Parameters to validate the accuracy of the model and improvise.

MAPE(y_pred_test,trainingSet$price)

RMSE(y_pred_test,trainingSet$price)
