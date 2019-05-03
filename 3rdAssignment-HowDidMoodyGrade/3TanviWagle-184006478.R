#Tanvi Wagle 184006478

# Load Data (make sure the path is right or import data set)
# either import data or read csv
library(readr)
moody2019 <- read.csv('MOODY-2019.csv', sep = ",")

# First Figure
boxplot(moody2019$SCORE~moody2019$GRADE, main="Distribution of Grades based on Score", xlab="Grade", ylab="Score", col=rainbow(5))
means <- tapply(moody2019$SCORE,moody2019$GRADE,mean)
"Score Means"
means

# Second Figure
range <- tapply(moody2019$SCORE, moody2019$GRADE, range)
range

#Third Figure
overlapAB <- moody2019[moody2019$SCORE >= 77.02 & moody2019$SCORE <= 89.67,]
overlapAB$GRADE <- factor(overlapAB$GRADE)
par(mfrow=c(2,2))
overlapAB <- moody2019[moody2019$SCORE >= 77.02 & moody2019$SCORE <= 89.67,]
mosaicplot(overlapAB$GRADE~overlapAB$ASKS_QUESTIONS, las=1,col=c("green", "yellow", "red"), main="Asks Questions vs Grade", xlab="Grade", ylab ="Asks Questions")
mosaicplot(overlapAB$GRADE~overlapAB$ON_SMARTPHONE,las=1,col=c("black","blue", "purple", "pink"), main="On Smartphone vs Grade", xlab="Grade", ylab ="On Smartphone")
mosaicplot(overlapAB$GRADE~overlapAB$LATE_IN_CLASS, las=1,col=terrain.colors(4), main="Late To Class vs Grade", xlab="Grade", ylab ="Late To Class")
mosaicplot(overlapAB$GRADE~overlapAB$LEAVES_EARLY, las=1, col=heat.colors(3), main="Leaves Early vs Grade", xlab="Grade", ylab ="Leaves Early")

#Fourth Figure
overlapCDF <- moody2019[moody2019$SCORE >= 20.22 & moody2019$SCORE <= 44.76,]
overlapCDF$GRADE <- factor(overlapCDF$GRADE)
par(mfrow=c(2,2))
mosaicplot(overlapCDF$GRADE~overlapCDF$ASKS_QUESTIONS, las=1,col=c("green", "yellow", "red"), main="Asks Questions vs Grade", xlab="Grade", ylab ="Asks Questions")
mosaicplot(overlapCDF$GRADE~overlapCDF$ON_SMARTPHONE,las=1,col=c("black","blue", "purple", "pink"), main="On Smartphone vs Grade", xlab="Grade", ylab ="On Smartphone")
mosaicplot(overlapCDF$GRADE~overlapCDF$LATE_IN_CLASS, las=1,col=terrain.colors(4), main="Late To Class vs Grade", xlab="Grade", ylab ="Late To Class")
mosaicplot(overlapCDF$GRADE~overlapCDF$LEAVES_EARLY, las=1, col=heat.colors(3), main="Leaves Early vs Grade", xlab="Grade", ylab ="Leaves Early")


#Fifth Figure
par(mfrow=c(2,2))
greater77 <- moody2019[moody2019$SCORE > 77,]
notAlwaysQ <- moody2019[moody2019$ASKS_QUESTIONS == "always",]
freqSmartPhone <- moody2019[moody2019$ON_SMARTPHONE == "frequently",]
notAlwaysEarly <- moody2019[moody2019$LEAVES_EARLY != "always",]
barplot(table(greater77$GRADE), main= "Score Greater than 77", col=terrain.colors(5), ylab="frequency", xlab="grade")
barplot(table(notAlwaysQ$GRADE), main= "Not Always Asking Questions", col=terrain.colors(5), ylab="frequency", xlab="grade")
barplot(table(freqSmartPhone$GRADE), main= "Frequently on SmartPhone", col=terrain.colors(5), ylab="frequency", xlab="grade")
barplot(table(notAlwaysEarly$GRADE), main= "Not Always Leaving Early", col=terrain.colors(5), ylab="frequency", xlab="grade")

#Sixth Figure 
par(mfrow=c(1,2))
all <- moody2019[moody2019$ASKS_QUESTIONS != "always" & moody2019$ON_SMARTPHONE == "frequently" & moody2019$LEAVES_EARLY == "always" & moody2019$SCORE > 77 ,]
barplot(table(moody2019$GRADE), main= "Normal", col=topo.colors(5), cex.main =0.8,  col.lab="white")
barplot(table(all$GRADE), main= "With Advice", col=topo.colors(5), cex.main =0.8)
title("Grade Distribution", outer = TRUE, line=-1)

