############################
#  Data frame operations   #
############################

## Extracting data from a table data
##  Working directory  .


getwd()

setwd("/home/labsuser/2021/Jan_16/Dataframe_operations")

getwd()

## Extracting data from an excel 

library(readxl)

#install.packages("readxl")

my_df <- read_excel("Demo 1_Identifying_Data_Structures.xlsm")

View(my_df)

### Assignment # import data from different sheets in excel.

## Extracting data from a table file . 

table_data <- read.table("table_data.txt",header = TRUE)
table_data

table_data <- read.table("table_data.txt")
table_data

##  Extracting data from a CSV file ( comma separated value ) . 

US_Car_df <- read.csv("USA_cars_datasets.csv")
View(US_Car_df)

str(US_Car_df)

US_Car_df <- read.csv("USA_cars_datasets.csv",stringsAsFactors = FALSE)
str(US_Car_df)

print(head(US_Car_df,10))

US_Car_df[,4]

US_Car_df$model

?head()

head(US_Car_df$model,10)

US_Car_df[5,]


# list of column names : 
names(US_Car_df)

class ( names(US_Car_df) )

# rename the first column  

names(US_Car_df)[1]

names(US_Car_df)[1] <- "Id"

names(US_Car_df)


# newheader <- c('col1','col2'........)

# names(US_Car_df) <- newheader

# select columns from a dataframe :


US_Car_df[,1:2]

## Select data from a dataframe 
US_Car_df[1:5, c('Id','price','model')]


# Get the count of NAs . 
sum(is.na(US_Car_df$model))

sum(is.na(US_Car_df))

#### Assignment : print the count of NAs in individual column. 
 # run a for loop on names(dataframe)

US_Car_df

## most expensive car brand .

which.max(US_Car_df$price)

expensive_car <- US_Car_df[which.max(US_Car_df$price),c('brand','price')]
expensive_car

# second most expensive car 

sorted_car <- US_Car_df[order(-US_Car_df$price),]
sorted_car

sorted_car[2,c('brand','price')]



## unique values of a particular colums 

unique(US_Car_df$brand)

length(unique(US_Car_df$brand))



### Filter records . 

merc <- subset(US_Car_df, brand == 'mercedes-benz')
merc

length(unique(merc$brand))


## FIlter with multiple conditions 

merc1 <- subset(US_Car_df, brand == 'mercedes-benz' & model == 'vans')
merc1


toyota <- subset ( US_Car_df , toupper(brand) == 'TOYOTA')
toyota



dim(subset(US_Car_df, brand == 'mercedes-benz'))
nrow(subset(US_Car_df, brand == 'mercedes-benz'))
ncol(subset(US_Car_df, brand == 'mercedes-benz'))



### grouping 


aggregate(US_Car_df$price , by = list(US_Car_df$brand) , FUN = mean )


grouped <- aggregate(x = US_Car_df$price , by = list(US_Car_df$brand,US_Car_df$model) , FUN = sum )

grouped
names(grouped) <- c("brand","model","Sum")
grouped
grouped[order(grouped$brand,grouped$model),]



## sapply on a dataframe 


sapply( list(US_Car_df$price), max )

class ( sapply( list(US_Car_df$price), max ) )

sapply( list(US_Car_df$price), summary )

class (sapply( list(US_Car_df$price), summary ))


#### dplyr ####


library(dplyr)
#library(tidyr)
#install.packages("dplyr")

# 1. filter()
# 2. arrange()
# 3. select()
# 4. distinct()
# 5. mutate()
# 6. summarise()
# 7. group_by()

# 1. filter 

?filter

chevrolet <- filter(US_Car_df,brand == 'chevrolet')
chevrolet



unique(chevrolet$brand)
unique(chevrolet$model)

names(chevrolet)


chevrolet_1 <- filter(US_Car_df,brand == 'chevrolet',model == 'colorado')
chevrolet_1

nrow(chevrolet_1)

unique(chevrolet_1$model)


chevrolet_2 <- filter(US_Car_df, brand %in% c('chevrolet','toyota') )
unique(chevrolet_2$brand)

###Assignment -  Filter those records which doesnt contain 
# chevrolet and toyota .



# 2. arrange()
?arrange
View(US_Car_df)

newdata_arranged <- arrange(US_Car_df, price)  # by default its ascending .
View(newdata_arranged)
tail(newdata_arranged,15)


newdata_arranged <- arrange(US_Car_df, desc(price))
head(newdata_arranged,15)
# sort by two variables

newdata_arranged <- arrange(US_Car_df, desc(price), mileage)
head(newdata_arranged,15)
View(newdata_arranged)

newdata_arranged <- arrange(US_Car_df, desc(price), desc(mileage))
head(newdata_arranged)
View(newdata_arranged)

# 3. select()

select(US_Car_df,brand,model)

select(filter(US_Car_df,US_Car_df$brand == 'chevrolet'),brand,price,model)

unique(select(filter(US_Car_df,US_Car_df$brand == 'chevrolet'),brand,price,model)$brand)



# 4. distinct()  # unique in R base packages

distinct(US_Car_df, brand)

dim(distinct(US_Car_df, brand))

class(distinct(US_Car_df, brand))

is.vector(distinct(US_Car_df, brand))

#View(US_Car_df)

#select(df,colnames)

# 5. mutate() # creates new column based on the condition provided in the code.
?mutate
US_Car_df_mutate <- mutate(US_Car_df,  brand_model = paste(brand," ",model))
head(US_Car_df_mutate)
View(US_Car_df_mutate)


US_Car_df_mutate <- mutate(US_Car_df,  mileage_new  = mileage + 5 )


head(US_Car_df_mutate$brand_model)

#US_Car_df_transmutate <- transmute(US_Car_df,  brand_model = paste(brand," ",model))
#head(US_Car_df_transmutate)
#View(US_Car_df_transmutate)


### Assignment : Donot perform the paste(brand," ",model) operation in case of chevrolet .
#   Do it for the rest. 

# 6. summarise()
?summarise 
summarise(US_Car_df, brand_mean = mean(price, na.rm = T))

mean(US_Car_df$price)



# 7. grouping 
?group_by

# na.rm means ignore NAs if any . 

brand_groups <- group_by(US_Car_df, brand)
brand_groups

summarise(brand_groups, mean(price, na.rm = T))
summarise(brand_groups, sum(price, na.rm = T))


# Average based on price for brand and model (group by multiple columns)
brand_groups <- group_by(US_Car_df, brand,model)
summarise(brand_groups, mean(price, na.rm = T))
summarise(brand_groups, sum(price, na.rm = T))





