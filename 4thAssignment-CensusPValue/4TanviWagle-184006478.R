#Tanvi Wagle 184006478

# Load Data (make sure the path is right or import data set)
# either import data or read csv
library(readr)
View(census)
summary(census)
census <- read.csv('CENSUSNEW.csv', sep = ",")

# First Trend
census$EDUCATION <- factor(census$EDUCATION, levels = c("Preschool", "1st-4th","5th-6th","7th-8th", "9th", "10th", "11th", "12th","HS-grad", "Assoc-acdm", "Assoc-voc", "Some-college", "Bachelors", "Masters", "Prof-school","Doctorate"))
average <- tapply(census$CAPITALLOSS,census$EDUCATION,mean)
par(mfrow=c(1,1), mar=c(7,4,4,2))
barplot(average, las=2, col=rainbow(16), main="Capital Losses for varying degrees of education")

#Calculate P value
masters <- census[census$EDUCATION =="Masters",]
hs <- census[census$EDUCATION =="HS-grad",]
masters.loss <-masters$CAPITALLOSS
hs.loss <-hs$CAPITALLOSS

masterSD <- sd(masters.loss)
hsSD <- sd(hs.loss)

masterM <- mean(masters.loss)
hsM <- mean(hs.loss)

sd <- sqrt(masterSD^2/length(masters.loss) + hsSD^2/length(hs.loss))
z <- (masterM - hsM)/sd
z
plot(x=seq(from = -10, to= 10, by=0.1),y=dnorm(seq(from = -10, to= 10,  by=0.1),mean=0),type='l',xlab = 'mean difference',  ylab='possibility', main="Z value for Capital Loss comparison")
abline(v=z, col='red')
p = 1-pnorm(z)
p

# Confirming length of data
masters <- census[census$EDUCATION =="Masters" & census$CAPITALLOSS !=0,]
hs <- census[census$EDUCATION =="HS-grad"& census$CAPITALLOSS !=0,]
masters
hs
length(hs$CAPITALLOSS)
length(masters$CAPITALLOSS)

# Second Trend
par(mfrow=c(1,1), mar=c(4,10,4,4)) 
boxplot(census$YEARS~census$PROFESSION, horizontal = TRUE, las=1, varwidth=TRUE, outline=FALSE, cex=0.8, col=heat.colors(16), main="Years of Education", xlab="Years")
tapply(census$YEARS,census$PROFESSION,mean)

#Calculate P value
localGov <- census[census$PROFESSION =="Exec-managerial",]
fedGov <- census[census$PROFESSION =="Tech-support",]
localGov.years <-localGov$YEARS
fedGov.years <-fedGov$YEARS
localGovSD <- sd(localGov.years)
fedGovSD <- sd(fedGov.years)
localGovM <- mean(localGov.years)
fedGovM <- mean(fedGov.years)

sd <- sqrt(localGovSD^2/length(localGov.years) + fedGovSD^2/length(fedGov.years))
z <-(localGovM - fedGovM)/sd
z
plot(x=seq(from = -10, to= 10, by=0.1),y=dnorm(seq(from = -10, to= 10,  by=0.1),mean=0),type='l',xlab = 'mean difference',  ylab='possibility', main="Z value for years comparison")
abline(v=z, col='red')
p = 1-pnorm(z)
p

