##########################
#   Data Visualization   #
##########################


View(mtcars)
mtcars

###### BAR PLOT ##########


table(mtcars$gear)
counts <- table(mtcars$gear)

class(counts)

barplot(counts)

barplot(counts,horiz=TRUE)

rownames(counts)

barplot(counts,
        main="Simple Bar Plot",
        xlab="Gear_names",
        ylab="Frequency",
        legend= rownames(counts),
        col=c("red", "yellow", "green")
)

barplot(counts,
        main="Simple Bar Plot",
        xlab="Improvement",
        ylab="Frequency",
        legend=rownames(counts),
        col=c("red", "yellow", "green"),
        horiz=TRUE
)



#### grouped plots 

#unique(mtcars$vs)

table( mtcars$vs ,mtcars$gear)

counts <- table( mtcars$vs ,mtcars$gear)


barplot(counts,
        main="Car Distribution by Gears and VS",
        xlab="Number of Gears",
        col=c("yellow","cornflowerblue","red"),
        legend = rownames(counts))

class(counts)

counts <- table( mtcars$gear, mtcars$vs)
counts

barplot(counts,
        main="Car Distribution by Gears and VS",
        xlab="Number of Gears",
        col=c("yellow","cornflowerblue","red"),
        legend = rownames(counts))



barplot(counts,
         main="Car Distribution by Gears and VS",
         xlab="Number of Gears",
         col=c("grey","cornflowerblue"),
         legend = rownames(counts),
         beside=TRUE)


counts <- table( mtcars$gear, mtcars$vs)
counts

barplot(counts,
        main="Car Distribution by Gears and VS",
        xlab="Number of Gears",
        col=c("grey","cornflowerblue","green"),
        legend = rownames(counts),
        beside=TRUE)

#letters[1:5]
#sample(seq(4,15),5)



#data <- data.frame(
#  name=letters[1:5],
#  value=sample(seq(4,15),5)
#)
#data
# barplot
#barplot( height=data$value, 
#         names=c("xx","yy","zz","aa","bb") ,
#         #names = data$name,
#         xlab = "Names of the entities",
#         density=c(5,10,20,30,7) , 
#         angle=c(0,60,90,11,90) , 
#         col="blue"   )

########## PIE CHART ###############

marks_dist <- c(20 , 30 , 20 , 15 , 15 )

mark_labels <- c('long_questions','grammar','comprehension','poetry','prose')



## Building a regular pie chart out of the vectors

pie(marks_dist, 
    labels=mark_labels,
    main="Pie Chart with Percentages")

## Adding colors to the above pie chart . 

pie(marks_dist, 
    labels=mark_labels,
    col=c('red','green','magenta','white','purple'),
    main="Pie Chart with Percentages")

pie(marks_dist, 
    labels=marks_dist,
    col=c('red','green','magenta','white','purple'),
    main="Pie Chart with Percentages")

## Adding much meaningful labels to the pie chart . 

pie(marks_dist, 
    labels = paste(mark_labels," ",marks_dist,"%"),
    col=c('red','green','magenta','white','purple'),
    main="Pie Chart with Percentages")



library(plotrix )
pie3D(marks_dist,
      labels= paste(mark_labels),
      explode = 0.2,
      col=c('red','green','magenta','white','purple'),
      main="3D Pie Chart")


#### HISTOGRAM #####

mtcars$mpg   #miles per gallon data
sort(mtcars$mpg)

hist(mtcars$mpg)

# Colored Histogram with Different Number of Bins
hist(mtcars$mpg, breaks = 10, col="lightblue")



#### KERNEL DENSITY PLOT ####

mtcars$mpg
density_data <- density( mtcars$mpg )
density_data
plot(  density_data )

# Filling density Plot with color
density_data <- density( mtcars$mpg )
plot(  density_data , 
       main="Kernel Density of Miles Per Gallon")
       polygon(density_data ,  col="brown", border="black")


#### LINE CHART ####
       
weight <-  c(2.5, 2.8, 3.2, 4.8, 5.1,5.9)
months <-  c(0,2,4,6,8,10)
plot(months,
     weight,
     type = "b",
     main="Baby Weight Chart")

#plot without x axis . 
plot (weight, type = "b",main="Baby Weight Chart")

# months <-  c("Jan",'Feb',.....)


######  BOX PLOT #####
### Use of box plot is to find the outliers . 

airquality

sort(airquality$Ozone)

## quartile is percentile

summary(airquality$Ozone)

boxplot(airquality$Ozone,
  main="Mean Ozone in parts per billion at Roosevelt Island",
  xlab ="Parts Per Billion",
  ylab ="Ozone",
  horizontal=TRUE)

boxplot( airquality$Ozone,
         main="Mean Ozone in parts per billion at Roosevelt Island",
         xlab ="Parts Per Billion",
         ylab ="Ozone",
         col="lightblue",
         horizontal=TRUE)



#################################
# Visualizations using ggplot2  #
#################################



library(ggplot2)

#  https://ggplot2.tidyverse.org/reference/

df <- data.frame(dose=c("D0.5", "D1", "D2"), len=c(4.2, 10, 29.5))
df

## aesthetics

p <- ggplot(data=df, aes(x=dose, y=len)) +  geom_bar(stat="identity")

p


class(p)
# aesthetics


# Horizontal bar plot
p + coord_flip()



# Change the width of bars
ggplot(data=df, aes(x=dose, y=len)) +
  geom_bar(stat="identity", width= 0.2)

# Change colors
ggplot(data=df, aes(x=dose, y=len)) +
  geom_bar(stat="identity", color="blue", fill="lightgreen")

# Minimal theme + blue fill color

p<-ggplot(data=df, aes(x=dose, y=len)) +
  geom_bar(stat="identity", fill="steelblue") +
  theme_minimal()
p

# Choose which items to display :
p + scale_x_discrete(limits=c("D0.5", "D2"))
p

### Bar plot with labels

# Outside bars
ggplot(data=df, aes(x=dose, y=len)) +
  geom_bar(stat="identity", fill="steelblue")+
  geom_text(aes(label=len), vjust=-0.80, size=3.5)+
  theme_minimal()

# Inside bars
ggplot(data=df, aes(x=dose, y=len)) +
  geom_bar(stat="identity", fill="steelblue")+
  geom_text(aes(label=len), vjust=0.9, color="white", size=5)+
  theme_minimal()



## bar plot of counts ( no y axis provided)

## aes <- aesthetics , it defines the x axis and the y axis parameters .

table(mtcars$cyl)
ggplot(mtcars, aes(x=factor(cyl)))+
  geom_bar(stat="count", width=0.7, fill="steelblue")+
  theme_minimal()


### How to add colors to the bars using a ggplot . 


# grouped bar plots 
rep(c("VC", "OJ"), each=3)

df2 <- data.frame(supp=rep(c("VC", "OJ"), each=3),
                  dose=rep(c("D0.5", "D1", "D2"),2),
                  len=c(6.8, 15, 33, 4.2, 10, 29.5))
df2

# Stacked barplot with multiple groups
ggplot(data=df2, aes(x=dose, y=len, fill=supp)) +
  geom_bar(stat="identity")

## plot the above bar chart with fill = dose and x = supp

# Use position=position_dodge()
ggplot(data=df2, aes(x=dose, y=len, fill=supp)) +
  geom_bar(stat="identity", position=position_dodge()) 


####### DENSITY PLOT #######


df <- data.frame(
  gender=factor(rep(c("F", "M"), each=200)),
  weight=round(c(rnorm(200, mean=55, sd=5),
                 rnorm(200, mean=65, sd=5)))
)
head(df,50)



# Basic density
p <- ggplot(df, aes(x=weight)) +   geom_density()
p

# Add mean line
p + geom_vline(aes(xintercept=mean(weight)),
              color="blue", linetype="dashed", size=1)

##Assignment : Draw vline for mean of Male and Female in different colors . 


# Change line color and fill color
d <- ggplot(df, aes(x=weight))+
  geom_density(color="darkblue", fill="lightblue")


d + geom_vline(aes(xintercept=mean(weight)),
               color="blue", linetype="dashed", size=1)

# Change line type
ggplot(df, aes(x=weight))+
  geom_density(linetype="dashed")

## Assignment :
### plot multiple lines for multiple continuous data in a single plot.
## hint : ggplot () + geom_density() + geom_density ()


##### HISTOGRAM PLOT ##########


df <- data.frame(
  gender=factor(rep(c("F", "M"), each=200)),
  weight=round(c(rnorm(200, mean=55, sd=5), rnorm(200, mean=65, sd=5)))
)
head(df)


# Basic histogram
ggplot(df, aes(x=weight)) + geom_histogram()

# Change the width of bins
ggplot(df, aes(x=weight)) + 
  geom_histogram(binwidth=5)

# Change colors
p<-ggplot(df, aes(x=weight)) + 
  geom_histogram(color="black", fill="white",binwidth=5)
p




# Add mean line
p+ geom_vline(aes(xintercept=mean(weight)),
              color="blue", linetype="dashed", size=1)


# Histogram with density plot
ggplot(df, aes(x=weight)) + 
  geom_histogram(aes(y=..density..), col="black", fill="white") +
  geom_density(alpha= 0.50, fill="#FF6690") 


# Change histogram plot fill colors by groups
ggplot(df, aes(x=weight, fill=gender, color=gender)) +
  geom_histogram(position="identity") 


########### BOX PLOT ###########


sort(airquality$Ozone)


airquality$Month <- factor(airquality$Month ,
                           labels = c("May", "Jun", "Jul", "Aug","Sep"))

airquality$Month

View(airquality)


p <- ggplot(airquality, aes (x = Month, y = Ozone)) +
      geom_boxplot (fill = "blue", colour = "black") +
  
  
      scale_y_continuous (name = "Mean ozone in nparts per billion",
      breaks = seq (0, 175,20)) +
      scale_x_discrete (name = "Monthwise") +
      ggtitle ("Boxplot of mean ozone by month")
p









