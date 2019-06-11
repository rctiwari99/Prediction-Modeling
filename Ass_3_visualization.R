bank <- read.csv("C:/Users/rc_as/Desktop/Data_science/R_Training/Assignment/bank-additional-full.csv",header=TRUE)
library(tidyverse)
anyNA(bank)
bank = na.omit(bank)
bank$age = as.numeric(bank$age) #changed following CASE STUDY file
bank$duration = as.numeric(bank$duration)
bank$campaign= as.numeric(bank$campaign)
bank$pdays= as.numeric(bank$pdays)
bank$previous= as.numeric(bank$previous)
str(bank)
par(mfrow=c(3,3))#
boxplot(cons.conf.idx~y, data = bank, xlab="Client Subscribed", ylab="Consumer Confidence Index (monthly)")
boxplot(age~y, data = bank, xlab="Client Subscribed", ylab="Age")
boxplot(duration~y, data = bank, xlab="Client Subscribed", ylab="Duration")
boxplot(campaign~y, data = bank, xlab="Client Subscribed", ylab="Campaign")
boxplot(previous~y, data = bank, xlab="Client Subscribed", ylab="Previous")
boxplot(emp.var.rate~y, data = bank, xlab="Client Subscribed", ylab="Employment Variation Rate")
boxplot(cons.price.idx~y, data = bank, xlab="Client Subscribed", ylab="Consumer Price Index")
boxplot(euribor3m~y, data = bank, xlab="Client Subscribed", ylab="Euribor 3 Month")
boxplot(nr.employed~y, data = bank, xlab="Client Subscribed", ylab="Number of Employees")

library(ggplot2)
par(mfrow=c(3,3))
ggplot(data = bank, mapping = aes(x =y, y = cons.conf.idx)) + geom_boxplot()+labs(x="Client Subscription",
         y="Consumer Confidence Index",title =  "Consumer Confidence Index Vs Cleint Subscription") +  theme_light()
ggplot(data = bank, mapping = aes(x =y, y = age)) + geom_boxplot()+labs(x="Client Subscription",
            y="Consumer Confidence Index",title =  "Consumer Confidence Index Vs Cleint Subscription") +  theme_light()

############ HISTOGRAM ##############
ggplot(bank, aes(y)) + geom_histogram()
ggplot(mycars, aes(MPG_City, fill = cons.conf.idx)) + geom_histogram()
ggplot(bank, aes(y, fill = cons.conf.idx)) + geom_histogram(binwidth = .1)
ggplot(mycars, aes(MPG_City)) + geom_histogram(binwidth = .1)
ggplot(mycars, aes(MPG_City)) + geom_histogram() + facet_wrap( ~Type)
#SCATTER PLOT
ggplot(mycars, aes(x = MPG_City, y = MSRP_1)) + geom_point()
ggplot(mycars, aes(x = MPG_City, y = MSRP_1)) + geom_point(alpha = 0.1)
ggplot(mycars, aes(x = MPG_City, y = MSRP_1)) + geom_point(color = "blue") + facet_wrap( ~ Type)