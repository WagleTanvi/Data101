
# Revisit Data Structures

# Import the dataset
# NOTE that you will have to import the dataset yourself here. That is the reason the below line is commented.
# zo <- read.csv("E:/Data 101/Recitation 2/ZodiacChallenge.csv")

#accessing a column in dataframe
zo <- ZodiacChallenge
age0 <- cut(zo$AGE,10)
age0 

age1 <- cut(zo$AGE,pretty(zo$AGE,5))
age1

# You can choose to cut the numerical data in different ways
# Example 1 - Cutting the numerical data into four categories
age2<- cut(zo$AGE,pretty(zo$AGE,4),labels=c("Very Young", "Young", "Old", "Very Old"))
age2
# Example 2 - Cutting the numerical data into eight categories
age2_1<- cut(zo$AGE,pretty(zo$AGE,6),labels=c("Very Young", "Younger", "Young", "Medium Young", "Old", "Very Old", "Older than Very old", "Super Old"))
age2_1


age3 <- cut(zo$AGE,breaks=c(0,25,70,100),labels=c( "Young", "Old", "Very Old"))
age3


#lets plot it and for that we need a table
zo$age_category <- age2

range<- table(zo$age_category)
barplot(range, ylim = range(1:10000))

#Combine two columns
zo$combined <- zo$AGE/100 + zo$YEARS/10
boxplot(zo$combined)

#Subset of rows
zo.US<-subset(zo, NATIVE=="United-States")

#subset of columns
zo.except5<-subset(zo, select = c(1:4,6:9))

#Subset of Rows and Columns
zo.except5.virgo<-subset(zo, select = c(1:4,6:9), ZODIAK=="Virgo")


#tapply
# Note : There are different aggregate functions that can be used. For example, Mean, Median, Variance, Sum etc.
# Example for mean
zo.gainavg<-tapply(zo$CAPITALGAINS,zo$ZODIAK,mean)
zo.gainavg
# Example for median
zo.gainmedian<-tapply(zo$CAPITALGAINS,zo$ZODIAK,median)
zo.gainmedian


#pattern1
# las = 0 (parallel labels) and las = 2 (perpendicular labels)
# To select rows that have native = India
zo.ind <- subset(zo, NATIVE == 'India')
boxplot(zo.ind$CAPITALLOSS~zo.ind$ZODIAK,las=2, main='Capital Loss Per Zodiac Sign In India')

# To select rows that have native = India and zodiacs that are ot Virgo. 
# We add the second condition to draw more inference.
zo.ind.no.virgo <- subset(zo, NATIVE == 'India' & ZODIAK != "Virgo")
boxplot(zo.ind.no.virgo$CAPITALLOSS~zo.ind.no.virgo$ZODIAK,las=2, main='Capital Loss Per Zodiac Sign In India (No Virgo)')

#Pattern2
CapitalGainsZodMean <- tapply(zo$CAPITALGAINS, zo$ZODIAK, mean)
barplot(CapitalGainsZodMean, main = "Capital Gains vs. Zodiac Sign", font.main = 4, col.main = "red", xlab = "ZodiacSign", ylab = "CapitalGains Mean", col = c("lightblue", "mistyrose", "lightcyan", "lavender", "cornsilk"))

#Pattern3
zo.exceptUS<-subset(zo, NATIVE!="United-States")
Doctors<-subset(zo.exceptUS,EDUCATION=="Doctorate")
DoctorsByNative = table(Doctors$EDUCATION,Doctors$NATIVE)
barplot(DoctorsByNative, main = "Number of Doctorates vs Native Country Excluding US", col = 3 ,ylab = "Number of Doctorates", xlab = "Native Country", las = 2, cex.names = 0.75)


#Pattern4
mosaicplot(zo$EDUCATION~zo$ZODIAK, main="Education vs. Zodiac", shade = F, color=c("Yellow","Red","Blue","Green"),las=2)


#Not all plot are informative
zo.except5<-subset(zo, select = c(1:4,6:9))
zo.except5.virgo<-subset(zo, select = c(1:4,6:9), ZODIAK=="Virgo")
boxplot(zo$CAPITALGAINS~zo$EDUCATION)


