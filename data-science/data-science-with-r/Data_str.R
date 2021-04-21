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



