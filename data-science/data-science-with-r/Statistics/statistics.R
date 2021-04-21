 ### ANOVA TEST ###

item1 <- c(22,42,44,52,45,37)
item2 <- c(52,33,8,47,43,32)
item3 <- c(16,24,19,18,34,39)

df1 <- data.frame(item1,item2,item3)
df1


as.matrix(df1)
t(as.matrix(df1))

r = c(t(as.matrix(df1)))
r
class(r)

f = c("Item1", "Item2", "Item3") # treatment levels
k = 3 # number of treatment levels
n = 6 # observations per treatment
tm = gl(k, 1, n*k, factor(f)) # matching treatments # 1 represents the number of times the treatment levels will be repeated . 
tm

#Apply the function aov to a formula that describes the response r by the treatment
#factor tm.
av = aov(r ~ tm)
#Print out the ANOVA table with the summary function.
summary(av)




## CHI SQUARE TEST ##

library(MASS)
head(survey)

tbl <- table(survey$Smoke,survey$Exer)
tbl
chisq.test(tbl)

# 
