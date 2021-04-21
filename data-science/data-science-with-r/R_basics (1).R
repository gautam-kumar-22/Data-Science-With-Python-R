x = 10 
y = 20 

# This is a comment . 

print(x)
print(y)
print( x + y )


##############
# Data Types #
##############

x <- 10
y <- 20

print ( x )
print ( y )
print ( x + y )

10 -> x
20 -> y

print ( x )
print ( y )
print ( x + y )

x + y


class(x) # prints the data type of a variable .

z <- x 

class(z)

zz <- 'x'
class(zz)

print (zz)

dd <- 'simplilearn'
dd

# 12 <- interger
# 12.0 <- numeric 


aa <- "10"
class(aa)

# aa + 50 (it doesnt work as aa is a character .) 
x + 50 

x <- 20

print ( x )

x <- 50
class(x)
x <- as.integer(x)
class(x)

# as.numeric ( character to numeric .)

xx <- 100L
class(xx)


p <- TRUE
q <- FALSE

class (p)


is.integer(xx) # checks if the given number is an integer or not .


class( is.integer(xx) )



x <- 5 + 2i
class (x)

str <- 'simplilearn'

charToRaw(str)

class ( charToRaw(str) )

#Rules for defining variable names are as follows:

#Variable names can consist of a combination of letters, numbers, underscore, and period.

#It should begin with a letter or a period. If it starts with a period, then it cannot be followed by a digit.

#Reserved words in R cannot be used as identifiers.

  
########################
# Arithmetic Operators #
########################

x <- 10 
y <- 3

x + y 

x - y 

x / y 

x * y 

x ^ y 

x %% y  # modulus 
 
x %/% y # integer division . 


#########################
# Relational Operators  #
#########################


x > y 

x >= y 

x < y

x <= y 


class ( x > y )

x == y 

x != y 


#####################
# Logical Operators #
#####################


x == 10 && y == 2 

x == 10 && y == 3

x == 11 && y == 9



x == 10 || y == 2 

x == 10 || y == 3

x == 11 || y == 9


##########################
# Conditional statements #
##########################

total <- 1200


if ( total <  1000 ){
  
  print("Purchase a chocolate")
}else {
  
  print(" You are not allowed to purchase a chocolate")
}




### vector equivalent of if else 

age <- 30

ifelse(age >= 18 , "Major","Minor")

age <- ifelse(age >= 18 , age + 5, age + 10 )
print(age)

### else if 

num <- 10


#paste("simpli","learn",sep="")


#paste("simpli","learn",sep=":::::")


if (num > 0){
  
  print(paste("The provided  number - ", num ," is a positive number",sep=""))
  
}else if ( num < 0 ){
  
  print(paste("The provided  number - ", num ," is a negative number",sep=""))
}else {
  
  print (paste("The provided  number - ", num ," is zero",sep=""))
  
}


##########
# Loops  #
##########

vec <- c(10,20,30,40,50)


class (vec)

for ( abc in vec){
  
  print(paste("The value is ",abc))
}


vec1 <- c('s','d','r')


class (vec1)

for ( sunil in vec1){
  
  print(paste("The value is ",sunil))
}


## Assignment : 

# v <- c( 23,45,66,38,50,44,67,83)
# Add 5 to the elements of the vector if its odd number , else add 10 to the element 


### Assignment :

# v <- ("Ravi","Sunil","Anjali","Tejas","Victor","Suraj","Abhishek")
# Print the names which begin with "A"
# Print the names in lower case . 
# Print the names sorted in alphapetical order . 

## while loop 

i <- 1

while ( i < 6 )
{
  
  i = i + 1
  print(i)
  
}


## repeat loop 


x <- 1

repeat {
  
  print(x)
  
  if ( x == 6 )
    {
    break
  }
  
  x = x + 1 
  
}

#############
# Functions #
#############


new_function <- function(a,b,c){
  
  result <- ( a + b ) * c 
  
  return (result)
  
}

#rm (list = ls())


new_function(2,3,4)
new_function(4,9,12)
new_function(8,5,34)
new_function(1,9,4)
new_function(2,5,4)


vaf <- new_function(4,9,12)


l_func <- function(v){
  
  i <- v

while ( i < 6 )
{
  
  i = i + 1
  print(i)
  
}
}



l_func(1)





