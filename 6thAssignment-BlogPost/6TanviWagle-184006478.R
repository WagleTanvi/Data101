library(readr)
crime <- read.csv('hate.csv', sep = ",")
View(crime)
plot(crime$state, crime$avg_hatecrimes_per_100k_fbi, las=2, type="b")



plot(crime$share_voters_voted_trump, crime$hate_crimes_per_100k_splc, xlab="Percentage of people that voted for Trump", ylab="Number of Hate Crimes", main = "Number Hate Crimes vs % of Trump Supporters per state")
age2<- cut(crime$share_voters_voted_trump,pretty(crime$share_voters_voted_trump,2),labels=c("Low","High"))
age2
crime$trump_level <- age2
average <- tapply(crime$hate_crimes_per_100k_splc, crime$trump_level,mean, na.rm = TRUE)
average
PermutationTestSecond::Permutation(crime, "trump_level", "hate_crimes_per_100k_splc",10000, "Low", "High")

plot(crime$median_household_income, crime$hate_crimes_per_100k_splc, xlab="Median Household Income", ylab="Number of Hate Crimes", main = "Number Hate Crimes vs Median Income")
age2<- cut(crime$median_household_income,breaks=c(0,40000,50000,60000,70000),labels=c("<40000","<50000", "<60000", "<70000"))
age2
crime$income_level <- age2
average <- tapply(crime$hate_crimes_per_100k_splc, crime$income_level,mean, na.rm = TRUE)
average
PermutationTestSecond::Permutation(crime, "income_level", "hate_crimes_per_100k_splc",10000, "<40000", "<70000")