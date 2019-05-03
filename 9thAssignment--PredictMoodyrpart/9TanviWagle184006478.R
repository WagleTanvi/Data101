library(readr)
install.packages(rpart)
data <- read.csv('M2019btrain.csv', sep = ",")
View(data)
library(rpart)
library(rpart.plot)
tree <- rpart(GRADE ~ SCORE+ASKS_QUESTIONS+LEAVES_EARLY+PARTICIPATION,data=data)
tree <- rpart(GRADE ~ SCORE+ASKS_QUESTIONS+LEAVES_EARLY+PARTICIPATION,data=data,control = rpart.control(minbucket=10))
rpart.plot(tree)
tree <- rpart(GRADE ~ SCORE+ASKS_QUESTIONS+LEAVES_EARLY+PARTICIPATION,data=data,control = rpart.control(minbucket=50, minsplit=50))
rpart.plot(tree)
tree <- rpart(GRADE ~ SCORE+ASKS_QUESTIONS+LEAVES_EARLY+PARTICIPATION,data=data,control = rpart.control(minsplit=400))
rpart.plot(tree)
tree <- rpart(GRADE ~ SCORE+ASKS_QUESTIONS+LEAVES_EARLY+PARTICIPATION,data=data,control = rpart.control(minbucket=100))
rpart.plot(tree)

file <- predict(tree, newdata=data ,type="class")
data$predict <- file
error <- mean(data$GRADE == data$predict)
error

View(data)
#write.csv(file, file = "mysubmission.csv",row.names=FALSE)

install.packages("devtools")
devtools::install_github("devanshagr/CrossValidation")
CrossValidation::cross_validate(data, tree, 5, 0.8)

test<- read.csv('M2019_test_students.csv', sep = ",")
decision <- predict(tree, newdata=test ,type="class")
test$predict <- decision
View(test)
sub <- read.csv('M2019_sample_submission.csv', sep = ",")
sub$GRADE <- decision
write.csv(sub, file = "mysubmission.csv",row.names=FALSE)
