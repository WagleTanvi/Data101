library(readr)
data <- read.csv('Gun_Control.csv', sep = ",")
View(data)
summary(data)
gun <- data[data$Weapon_Used == "Gun",]

#My Argumement
average <- tapply(gun$Monetary_Damage,gun$Gun_Laws, mean)
average
barplot(tapply(gun$Monetary_Damage,gun$Gun_Laws, mean), horziontal=TRUE, main="Mean Monetary Damages", col=heat.colors(2), ylab="Mean Monetary Damages", xlab="Gun Laws")


mediumControl <- gun[gun$Gun_Laws == "Medium_Gun_Laws",]
average <- tapply(mediumControl$Monetary_Damage,mediumControl$Weather, mean)
average
looseControl <- gun[gun$Gun_Laws == "Loose_Gun_Laws",]
average <- tapply(looseControl$Monetary_Damage,looseControl$Weather, mean)
average

install.packages("devtools")
devtools::install_github("devanshagr/PermutationTestSecond")
PermutationTestSecond::Permutation(gun, "Gun_Laws", "Monetary_Damage",10000, "Medium_Gun_Laws", "Loose_Gun_Laws")

#Opponent 
average <- tapply(gun$Monetary_Damage,gun$Weather, mean)
average

#Rebuttal
xnames <- names(tapply(gun$Monetary_Damage,gun$Weather,mean))
barplot(tapply(gun$Monetary_Damage,gun$Weather, mean), names.arg=xnames, horziontal=TRUE)

averageMedium <- tapply(mediumControl$Monetary_Damage,mediumControl$Weather, mean)
averageMedium
averageLoose <- tapply(looseControl$Monetary_Damage,looseControl$Weather, mean)
averageLoose

PermutationTestSecond::Permutation(gun, "Weather", "Monetary_Damage",10000, "Lightning_Storm", "Hurricane")