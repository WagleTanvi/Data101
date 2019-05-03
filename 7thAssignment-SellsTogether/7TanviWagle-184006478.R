library(readr)
data <- read.csv('Walmart2.csv', sep = ",")
View(data)


table(data$BREAD,data$BUTTER)
table(data$BREAD,data$COOKIES)
table(data$BREAD,data$COFFEE)
table(data$BREAD,data$TEA)

table(data$BUTTER,data$COOKIES)
table(data$BUTTER,data$COFFEE)
table(data$BUTTER,data$TEA)

table(data$COOKIES,data$COFFEE)
table(data$COOKIES,data$TEA)

table(data$COFFEE,data$TEA)


# butter and cookies? - Intuitive Guess


install.packages("devtools")
devtools::install_github("devanshagr/PermutationTestSecond")
PermutationTestSecond::Permutation(data, "BUTTER", "BREAD",1000, "0", "1")
PermutationTestSecond::Permutation(data, "COOKIES", "BREAD",1000, "0", "1")
PermutationTestSecond::Permutation(data, "COFFEE", "BREAD",1000, "0", "1")
PermutationTestSecond::Permutation(data, "TEA", "BREAD",1000, "0", "1")
PermutationTestSecond::Permutation(data, "BUTTER", "COOKIES",1000, "0", "1")
PermutationTestSecond::Permutation(data, "BUTTER", "TEA",1000, "0", "1")
PermutationTestSecond::Permutation(data, "BUTTER", "COFFEE",1000, "0", "1")
PermutationTestSecond::Permutation(data, "COOKIES", "TEA",1000, "0", "1")
PermutationTestSecond::Permutation(data, "COOKIES","COFFEE",1000, "0", "1")
PermutationTestSecond::Permutation(data, "TEA", "COFFEE",1000, "0", "1")
#cookies, bread

