library(readr)
data <- read.csv('Tillet-Analytics_train.csv', sep = ",")
View(data)
summary(data)
install.packages("devtools")
devtools::install_github("devanshagr/CrossValidation")
library(rpart)
library(rpart.plot)
tree <- rpart(Party ~ Social.Media+Favorite.song+Calories+Coffees,data=data)
rpart.plot(tree)

tree <- rpart(Party ~ Social.Media+Favorite.song+Calories+Coffees,data=data)
CrossValidation::cross_validate(data, tree, 10, 0.8)

tree <- rpart(Party ~ Social.Media+Favorite.song+Calories+Coffees,data=data, control = rpart.control(minbucket=0, minsplit=0, cp=0))
CrossValidation::cross_validate(data, tree, 10, 0.8)




## Prediction on training data and error
file <- predict(tree, newdata=data ,type="class")
data$predict <- file
error <- mean(data$Party == data$predict)
error



for (x in 0:50){
  tree <- rpart(Party ~ Social.Media+Favorite.song+Calories+Coffees,data=data, control = rpart.control(minbucket=x, minsplit=0, cp=0))
  df <- CrossValidation::cross_validate(data, tree, 10, 0.8)
  value <- df[[2]]
  if (value$average_accuracy_subset > value$average_accuracy_all){
    print(paste("X: " , x, " subset: ", value$average_accuracy_subset," variance: ",value$variance_accuracy_subset, sep=""))
  }
}

# Between 0-9 is best cross validation for minsplit
vector <- c(0)
vector
for (x in 0:9){
  tree <- rpart(Party ~ Social.Media+Favorite.song+Calories+Coffees,data=data, control = rpart.control(minsplit=x, cp=0))
  df <- CrossValidation::cross_validate(data, tree, 10, 0.8)
  value <- df[[2]]
   if (value$average_accuracy_subset > value$average_accuracy_all){
     vector <- c(vector, value$average_accuracy_subset)
     print(paste("X: " , x, " subset: ", value$average_accuracy_subset, " all: ",value$average_accuracy_all, sep=""))
   }
}
max(vector)


for (x in seq(0,2, by = 0.1)){
  tree <- rpart(Party ~ Social.Media+Favorite.song+Calories+Coffees,data=data, control = rpart.control(minbucket=x, minsplit=2, cp=0))
  df <- CrossValidation::cross_validate(data, tree, 50, 0.8)
  value <- df[[2]]
  if (value$average_accuracy_subset > value$average_accuracy_all){
    print(paste("X: " , x, " subset: ", value$average_accuracy_subset, " variance: ",value$variance_accuracy_subset, sep=""))
  }
}

for(i in seq(0, 0.001, by = 0.0001)) {
  tree <- rpart(Party ~ Social.Media+Favorite.song+Calories+Coffees,data=data, control = rpart.control(minbucket=0, minsplit=0, cp=i))
  df <- CrossValidation::cross_validate(data, tree, 50, 0.8)
  value <- df[[2]]
  if (value$average_accuracy_subset > value$average_accuracy_all){
    print(paste("X: " , i, " subset: ", value$average_accuracy_subset, " variance: ",value$variance_accuracy_subset, sep=""))
  }
}

#RPART's default values :- minsplit = 20, minbucket = round(minsplit/3)
tree <- rpart(Party ~ Social.Media+Favorite.song+Calories+Coffees,data=data, control = rpart.control(minbucket=0, minsplit=2, cp=0.0001))
test<- read.csv('Tillet_Analytics_students.csv', sep = ",")
decision <- predict(tree, newdata=test ,type="class")
test$predict <- decision
View(test)
sub <- read.csv('Tillet_Submisson.csv', sep = ",")
sub$Party <- decision
write.csv(sub, file = "mysubmission.csv",row.names=FALSE)



