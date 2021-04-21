## VECTORS ###

# homogenous collection of data . 

v <- c( 11 , 32 , 48 , 89, 45)
v 
class ( v )

str( v )

typeof(v)

v_int <- as.integer(v)

class ( v_int )

is.vector( v )

class ( is.vector( v ) )

length ( v )


v[3]


v[5]

v[2:5]

v[c(2,5)]

v[-3]

v[-(2:4)]



## Assignment - extract elements from odd intervals . 
## Assignment - extract the last three elements from a vector whose length is unknown . 


v[length(v)] # fetch me the last element of the vector . 

## mixed vectors

mv1 <-c(TRUE , 'nine', 9 )

class ( mv1 )

mv1 


mv2 <- c ( FALSE , 10 )

class ( mv2 )

mv2


mv3 <- c ( TRUE , 10 )

class ( mv3 )

mv3


mv4 <- c ( FALSE , 'saswat')
class(mv4)


# Hierarchy of mixed vectors : 

# 1 - character 
# 2 - Numeric 
# 3 - Logical . 




# Operations on vectors : 

vec1 <- c( 34 , 56, 90, 67 , 89)


vec1 <- vec1 + 5 

print(vec1 )


vec2 <- c ( 5 , 5 ,5 ,5 ,5 )

vec3 <- vec1 + vec2 

vec3 

vec4 <- c( 4 , 5, 6)

vec4
vec5 <- vec3 + vec4 


### Extract the elements of a vecgtor using a for loop 

# hint : for ( i in 1:length(v)){ print v[i]}

## inbuilt functions used in vectors :

vec5

min(vec5)

max( vec5 )

length ( vec5 )

sort ( vec5 )

sort ( vec5 , decreasing =  TRUE)

mean(vec5)

#### Assignment : Write a function which accepts two vectors , and returns the sum of these vectors . 


# missing values :


my_vec <- c(1,4,NA,5,NA,0,9)

is.na(my_vec)

sum(is.na(my_vec))

sum(my_vec)


# append two vectors . 


mv1 <- c( 3 , 6, 8,  34, 56 )
mv2 <- c( 4 , 8, 1, 0 , 3)

append(mv1,mv2)


var1 <- 34 
is.vector(var1)
length(var1)


append(mv1, 89)

append(89,mv1)

append(mv1,89,after=2)


append(mv1,mv2,after = 2)


### factors of a vector  . 

temp <- c('low','very low', 'high','low','medium','high', 'medium','high')


temp_factor <- factor(temp) # convert a vector to a factor. 

temp_factor


levels(temp_factor)

summary(temp_factor)

class(temp_factor)


temp_vec <- as.vector(temp_factor)  # convert a factor to a vector . 
class(temp_vec)


# Assignment : try the factor operations in a vector of numeric elements. 




######  Matrices 

### Homogenous collection of two dimensional data .

vector <- c(1,2,3,4)
vector

mat1 <- matrix(vector,nrow =2,ncol=2) # converting the vector into a 2 * 2 matrix 


mat1


vec <- c(1:12)
vec

mat2 <- matrix(vec,nrow =4)
mat2


mat2[2,3]

mat2[3,2]


mat2[,3]

mat2[3,]

mat2[c(2:3),]

mat2[c(2:3),c(1,2)]



mat3 <- matrix(vec,nrow =4,byrow = TRUE)
mat3
mat2


### NEURAL NETWORK 

### Assignment : try to create a matrix where you explicitly mention user defined columns names :

### like col1 , col2 , col3 etc 

### dimnames  = c(col1,col2,col3)



# functions used for matrices :


dim(mat2)

nrow(mat2)

ncol(mat2)

class(mat2)


## Matrix multiplication . 

mv1 <- matrix (1:6,nrow = 2)
mv2 <- matrix (101:106 , nrow = 2)

mv1
mv2

mv1 * mv2 

mv2 / mv1

# matrix(1,nrow=1)

mv1 + 3  

### Assignments : perform matrix multiplication using function



#### Arrays is a multi dimensinal representation of homogenous data .



v1 <- c(1:3)
v2 <- c(4:12)
v3 <- c(13:21)

length(v1)
length(v2)
length(v3)

c(v1,v2,v3)

arr1 <- array(c(v1,v2,v3) , dim = c(4,3,2)) # Two 4 * 3 matrices 
arr1

arr1[2,2,2]
arr1[1,2,1]

arr1[4,3,1]

arr1[4,3,1]

#### Lists ###

# List is a heterogenous collection of one dimensional data . 


ls1 <- list (1,2,"two",TRUE)
ls1 

class(ls1)

str(ls1)

summary(ls1)

vec<- c(1,5,10,46)


iris

ls2 <- list(1,TRUE,'school',vec,mv1,iris) ## iris is an inbuilt dataframe . 
class(ls2)
summary(ls2)

ls2[2]

ls2[3]

ls2[1]

class(ls2[1])


ls2[4]

ls2[[4]]

ls2[[1]] + 5

class(ls2[[1]])



ls2[[4]][3] ### fetches the third element of the vector inside the list . 



ls2[5]

ls2[[5]]


# list is recursive in nature . A list can have another list within it . 


ls3 <- list(1,TRUE,ls1)
ls3


# Vector is atomic as it cannot have another vector within itself . 

# create three vectors v1 , v2 , v3  .
# c(v1,v2,v3)

###########
#  apply  #
###########

# apply function applies a function to a matrix / dataframe . 

m <- matrix(c(1:12),3,4)
m

apply(m,1,sum)
apply(m,2,sum)


class(apply(m,2,sum))




# lapply : It takes a list as input and applies the function on all the elements
# and returns a list . 


a <- c(1,2,3)
b <- c(4,5)
c <- c(7,8)

list1 <- list(a,b,c)

list1

lapply(list1,sum)

class(lapply(list1,sum))


# sapply : it takes a list as input . 
# but returns a vector or a matrix depending on the output 

sapply(list1,sum)

class(sapply(list1,sum))


a <- c(2,3,4)
b <- c(6,7,8)
c <- c(11,15,12)


range(a)



l <- list(a,b,c)
sapply ( l , range)

class(sapply ( l , range))


?apply

###### Dataframes ######


# it is a two dimensional representation of heterogenous data . 

iris


head(iris)

head(iris,10)


tail(iris)

tail(iris,10)


nrow(iris)

ncol(iris)

dim(iris)

class(iris)


first_name <- c('first1','first2','first3')
last_name <- c('last1','last2','last3')
roll_no <- c('1','2','3')


class1 <- data.frame(first_name,last_name,roll_no)

class1


class(class1)


str(class1)



class1 <- data.frame(first_name,last_name,roll_no,stringsAsFactors = FALSE)

str(class1)

class1


class1[1,]

class1[,2]


class1$last_name

class1[c(1,2),]



first_name <- c('first4','first5','first6')
last_name <- c('last4','last5','last6')
roll_no <- c('4','5','6')

class2 <- data.frame(first_name,last_name,roll_no,stringsAsFactors = FALSE)
class2


class_total <- rbind(class1,class2)
class_total


### Assignment : perform rbind on two dataframes of unequal columns .



maths_score <- c(89,78,90,95,67,86)
science_score <- c(91,93,84,77,72,61)


class_total <- cbind(class_total,maths_score,science_score)

class_total


# Assignment : make a df out of sc score and math score and perform a cbin on this df 



### Merge ###

eng_score <- c(67,65,90,89,82,45)
history_score <- c(60,70,75,65,56,80)
roll_no <- c('5','4','3','1','2','6')

class3 <- data.frame(roll_no,eng_score,history_score,stringsAsFactors = FALSE)

class3



### inner merge 

class_total_1 <- merge( class_total,class3,by = 'roll_no')
class_total_1


#Assignment : try to perform a merge when the common columns have a different name in both the dataframes 
## hint :  by.x and by.y  by.x = 'col.x' by.y = 'col.y'

external_exam <- c(92,93,94)
roll_no <- c(4,2,6)

class_3.1 <- data.frame(external_exam,roll_no,stringsAsFactors = FALSE)

class_3.1 


merge(class_total_1,class_3.1,by = 'roll_no')


# left merge :

class_total_2 <- merge(class_total_1,class_3.1,by = 'roll_no',all.x = TRUE )
class_total_2

# right merge :

class_total_3 <- merge (class_3.1,class_total_1,by = 'roll_no',all.y =TRUE)

class_total_3




