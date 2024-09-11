### Chang Lu ###

### Homework 2                                         ###
### GGPlot Basics ###

#Put your code in this file. Make sure you assign the relevant values to the correct variable names, which are given below. 
#Uncomment the variables as you assign your final values/functions/results to them.
#install.packages('tidyverse')
#library(tidyverse)# This loads the packages necessary to run your plots. Do not delete or comment this out.

library(dplyr)
library(tidyr)
library(tibble)
library(ggplot2)
library(stringr)
### Exercise 1

spx_data <- read.csv("SPX-1Month.csv")



head(spx_data)
colnames(spx_data)
spx_plot1<-ggplot(spx_data, aes(x = Date, y = Close.Last, group =1)) +
  geom_line() +
  geom_point()

spx_plot1


spx_plot2 <- spx_plot1 +
  labs(title = "S&P 500 - Closing Price over the Last Month",
       x = "Date", 
       y = "Price") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

spx_plot2


### Exercise 2
bookdata <- read.csv("BookGenres.csv")
colnames(bookdata)
bookplot <- ggplot(bookdata, aes(x = Category, y = Price.Starting.With...., color = Season))+
  geom_point(alpha=0.40)+
  labs(title = "The Price of Fiction Books by Genre and Season", x="Genre", y ="Price($)")+
  theme_minimal()+
  theme(axis.text.x = element_text(angle = 30, hjust = 1))

bookplot

### Exercise 3
squirreldata <- read.csv("squirrel.csv")
colnames(squirreldata)
squirrelPlot<- ggplot(squirreldata, aes(x = Activities, fill =Interactions.with.Humans))+
  geom_bar(position = "dodge")+
  labs(title = "Squrriel Behavior in NYC parks", x="Squrriel's Acticity during Observation", y = "Count")+
  theme_grey()
  

squirrelPlot  
### Exercise 4
bigmacdata <- read.csv("big_mac.csv")  
str(bigmacdata)
colnames(bigmacdata)

bigmacdata$GDP.Per.Capita <- as.numeric(bigmacdata$GDP.Per.Capita)

bigMac<-ggplot(bigmacdata,aes(x=GDP.Per.Capita, y= dollar_price)) +
  geom_point()+
  geom_smooth(method = "loess", se = TRUE, color="blue")+
  labs(title = "Countries' GDP Per Capita compared to their Big Mac Index",
        x = "GDP per Capita in Dollars",
        y = "Dollar Price of a Big Mac")+
        theme_grey()
       
bigMac      
logBigMac<-ggplot(bigmacdata,aes(x=log(GDP.Per.Capita), y= dollar_price)) +
  geom_point()+
  geom_smooth(method = "loess", se = TRUE, color="blue")+
  labs(title = "Countries' GDP Per Capita compared to their Big Mac Index",
       x = "Log of Dollar GDP per Capita",
       y = "Dollar Price of a Big Mac")+
  theme_grey()
logBigMac
  