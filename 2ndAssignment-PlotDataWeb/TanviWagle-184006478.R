#Tanvi Wagle 184006478
# https://www.kaggle.com/szamil/who-suicide-statistics

# Load Data (make sure the path is right or import data set)
# either import data or read csv
library(readr)
data <- read.csv('data.csv', sep = ",")

# Plot One 
unitedStatesFemale <- data[data$country=="United States of America" & data$sex == "female" & data$age == "15-24 years",]
unitedStatesMale <- data[data$country=="United States of America" & data$sex == "male" & data$age == "15-24 years",]
par(mfrow=c(1,2))
plot (unitedStatesFemale$year,unitedStatesFemale$suicides_no, type="l", xlab = "Year", ylab = "Number of Suicides", col="red", ylim = range(c(0,4500)) )
title ("Female", line = 1, col.main= "red") 
plot(unitedStatesFemale$year,unitedStatesMale$suicides_no, type="l", col="blue", xlab = "Year", ylab = "Number of Suicides", ylim = range(c(0,4500)) )
title ("Male", line = 1, col.main= "blue")
title("Number of Suicides between ages 15 and 24 in the U.S.", outer = TRUE, line=-1)

par(mfrow=c(1,1))

# Plot Two 
unitedStatesAgeFemale <- data[data$country=="United States of America" & data$sex == "female" & data$year == "2015",]
barplot(unitedStatesAgeFemale$suicides_no, names.arg = c("15-24 years", "25-34 years","35-54 years", "5-14 years", "55-74 years", "75+ years"), col=c("darkblue","red", "orange", "blue", "green", "yellow"), main= "Number of Female Suicides in the United States in 2015", ylab = "Number of Suicides")


# Plot Three
year2015 <- data[data$suicides_no > 400 & data$year == "2015" & data$age == "25-34 years" & data$sex == "male" & !is.na(data$suicides_no), ]
library(plotrix)
label <- round(year2015$suicides_no, digits = 1)
pie(year2015$suicides_no, labels = label, col = rainbow(length(year2015$suicides_no)), main = "Male Suicides by Country in 2015", sub = "Suicide Numbers of the Top 15 Countries for males between 25 and 34 years old", radius=0.6)
legend("left", legend=year2015$country, cex = 0.7,
       fill = rainbow(length(year2015$country)))

