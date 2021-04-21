# set the working directory 
library(ggplot2)

getwd()
setwd('F:\\my_work\\simplilearn\\data-science\\data-science-with-r\\Simple_Linear_Regression')
getwd()



# Read the train and test data  

trainingSet <- read.csv('train.csv')
testSet <- read.csv('test.csv')

str(trainingSet)

dim(trainingSet)

View(trainingSet)

# Find Missing values 

trainingSet[is.na(trainingSet$Revenue),]

# Remove the records with missing values . 

trainingSet = trainingSet[complete.cases(trainingSet), ]
dim(trainingSet)


## Check for outliers :

# divide the graph area into two parts. 
par(mfrow = c(1, 2))

boxplot(trainingSet$No_Salesman, main='No_Salesman', sub=paste('Outliers: ', boxplot.stats(trainingSet$No_Salesman)$out))


boxplot(trainingSet$Revenue, main='Revenue', sub=paste('Outliers: ', boxplot.stats(trainingSet$Revenue)$out))

# boxplot(trainingSet$Revenue, main='Revenue')

# Understand the trend of the data 
ggplot() +
  geom_point(aes(x = trainingSet$No_Salesman, y = trainingSet$Revenue), colour = 'red') +
  ggtitle('X vs Y (Training set)') +
  xlab('No_SalesMan') +
  ylab('Revenue')

### calculate the corelation

cor(trainingSet$No_Salesman, trainingSet$Revenue)

#### build the regressor model 

regressor = lm(formula = Revenue ~ No_Salesman,data = trainingSet)

class(regressor)
summary(regressor)

## make predictions 

trainingSet$Revenue_pred <- predict(regressor, newdata = trainingSet)

View(trainingSet)


ggplot() +
  geom_point(aes(x = trainingSet$No_Salesman, y = trainingSet$Revenue), colour = 'red') +
  geom_line(aes(x = trainingSet$No_Salesman, y = trainingSet$Revenue_pred), colour = 'darkblue') +
  ggtitle('X vs Y (Training set)') +
  xlab('No_SalesMan') +
  ylab('Revenue')

plot(trainingSet$Revenue, resid(regressor), 
     ylab="Residuals", xlab="Price", 
     main="Residual plot") 


##### Test the predictions on the test set. 


testSet$Revenue_pred <- predict(regressor, newdata = testSet)

View(testSet)

# Visualizing the test set results
ggplot() +
  geom_point(aes(x = testSet$No_Salesman, y = testSet$Revenue), colour = 'red') +
  geom_line(aes(x = testSet$No_Salesman, y = testSet$Revenue_pred),colour = 'blue') +
  ggtitle('X vs Y (Test set)') +
  xlab('X') +
  ylab('Y')


