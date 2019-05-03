library(readr)

#ANALYSIS

data <- read.csv('M2019btrain.csv', sep = ",")
boxplot(data$SCORE~data$GRADE,ylab="score", xlab="grade", main="Score vs Grade")
range <- tapply(data$SCORE,data$GRADE,range)
range

# Conclusion: Score has a correlation to Grade. 
# However, the same score can recieve two different grades so there is other factors affecting grade assignments.
# The overlapping ranges are: 
# 0 - 37 = F
# 37 - 63 = F,D,C,B
# 63 - 73 = D,C,B
# 73 - 100 = C,B,A

mosaicplot(data$GRADE~data$LEAVES_EARLY, main = "Leaves Early vs Grade", col=rainbow(5))
mosaicplot(data$GRADE~data$ASKS_QUESTIONS, main = "Asks Questions vs Grade", col=topo.colors(4))
# No Obvious patterns for grade assignments for Asking Questions, Leaves Early. 
# This suggests they are not primary factors in determining grade. They are probably used as tie breakers

boxplot(data$PARTICIPATION~data$GRADE, main="Participation vs Grade", col=terrain.colors(5))
#Participation has corrleation to grade. The more you participate the better grade you are likely to get '''

#First Predictor Assign the most Frequent grade'''
barplot(table(data$GRADE), main="Frequency of each grade", col=rainbow(5), xlab="grade") # most frequent grade

#Between 73 - 100 '''
a73100 <- data[data$SCORE > 73.29 & data$SCORE <= 100,] 
barplot(table(a73100$GRADE), main = " Frequency of grades between the score 73 and 100", col=heat.colors(3),xlab="grade") # mst frequent grade is A

boxplot(a73100$PARTICIPATION~a73100$GRADE, col=topo.colors(3), main="Participation Distribution for each grade between score of 73-100", ylab="Participation",xlab="grade")
mosaicplot(a73100$GRADE~a73100$ASKS_QUESTIONS, col=heat.colors(3), main="Grade vs Asks Questions between score of 73-100", xlab="Grade", ylab="Asks Questions")
mosaicplot(a73100$GRADE~a73100$LEAVES_EARLY, col=terrain.colors(3),  main="Grade vs Leaves Early between score of 73-100",xlab="Grade", ylab="Leaves Early")


AB <- a73100[a73100$PARTICIPATION >= 0.5,]
boxplot(AB$SCORE~AB$GRADE, main="Score for Participation Greater than 0.5",col=topo.colors(2))

BC <- a73100[a73100$PARTICIPATION < 0.5,]
boxplot(BC$SCORE~BC$GRADE, main="Score for Participation Less than 0.5", col=heat.colors(2))


#Between 37 - 100 '''
a3773 <- data[data$SCORE >= 37.20 & data$SCORE <= 73,]
barplot(table(a3773$GRADE), main="Frequency of grades between 37-73",col=rainbow(4), xlab="Grade") # most frequent is F
boxplot(a3773$PARTICIPATION~a3773$GRADE, col=topo.colors(4), main="Participation Distribution for each grade between score of 37-73", ylab="Participation",xlab="grade")
mosaicplot(a3773$GRADE~a3773$ASKS_QUESTIONS, col=heat.colors(4), main="Grade vs Asks Questions between score of 37-73", xlab="Grade", ylab="Asks Questions")
mosaicplot(a3773$GRADE~a3773$LEAVES_EARLY, col=terrain.colors(4),  main="Grade vs Leaves Early between score of 37-73",xlab="Grade", ylab="Leaves Early")


#Either C,D or F
l51 <- a3763[a3763$PARTICIPATION < 0.51,]
barplot(table(l51$GRADE),  main="Frequency of grades between 37-73 with Low Partcipation",col=rainbow(4), xlab="Grade")
boxplot(l51$SCORE~l51$GRADE, col=heat.colors(4), main="Scores for Low Participation between score of 37-73", ylab="Scores",xlab="grade")
#No obvious Differentiation between D,F when partciipation is less. F is the most frequent grade so it safe to have that as the grade'''

#Either B,C,D,F
g51 <- a3763[a3763$PARTICIPATION >= 0.51,]
barplot(table(g51$GRADE),  main="Frequency of grades between 37-73 with Low Partcipation",col=rainbow(4), xlab="Grade")
#Most Frequent Grade is C '''
decision[data$SCORE >= 37.20 & data$SCORE <= 63.80 & data$PARTICIPATION >= 0.51] <- 'C' 
#How to Differentiate between B,C and D'''
boxplot(g51$SCORE~g51$GRADE, col=heat.colors(4), main="Scores for High Participation between score of 37-73", ylab="Scores",xlab="grade")
tapply(g51$SCORE,g51$GRADE,range)
decision[data$SCORE >= 37.20 & data$SCORE <= 46 & data$PARTICIPATION >= 0.51] <- 'D'
decision[data$SCORE <=73 & data$SCORE >= 62 & data$PARTICIPATION >= 0.51] <- 'B'
#A Score greater than 48 will be C. A Score between 37-48 will be a D'''

#Cross Vailidation 101'''
train <- data[sample(1:nrow(data)),]
training<-train[1:100,]
testing<-train[101:nrow(train),]
error <- mean(testing$GRADE!= testing$predictedGrade)
error

#-------------------------------------------------------------------------------------------------------------------------'''

#PREDICTORS'''

decision <- rep('F',nrow(data))
# Between a score of 37 and 63 there can be F,D,C,B
decision[data$SCORE >= 37 & data$SCORE <= 73 & data$PARTICIPATION >= 0.50] <- 'C' # most frequent grade within this score range
decision[data$SCORE >= 37 & data$SCORE <= 48 & data$PARTICIPATION >= 0.50] <- 'D' #high participation low grade
decision[data$SCORE > 63 & data$SCORE <= 73 & data$PARTICIPATION >= 0.50] <- 'B' #high participation and high grade

decision[data$SCORE >= 37 & data$SCORE <= 63 & data$PARTICIPATION < 0.50,] <- 'F' #low participation low grade
decision[data$SCORE > 63 & data$SCORE <= 73 & data$PARTICIPATION < 0.50] <- 'D' #low participation high grade

decision[data$SCORE > 73 & data$SCORE <= 100] <- 'A'
decision[data$SCORE > 73 & data$SCORE <= 83 & data$PARTICIPATION > 0.50] <- 'B' # low grade and high participation = B
decision[data$SCORE > 83 & data$PARTICIPATION <= 0.50] <- 'B' # high grade and low participation = B
decision[data$SCORE > 83 & data$PARTICIPATION > 0.50] <- 'A' # high grade and high participation = A
decision[data$PARTICIPATION <= 0.50 & data$SCORE < 83 & data$SCORE > 73] <- 'C' # low grade and low participation = C


data$predictedGrade <- decision
error <- mean(data$GRADE!= data$predictedGrade)
error

#-------------------------------------------------------------------------------------------------------------------------'''

#Submission Data'''

submission <- read.csv('M2019_test_students.csv', sep = ",")
decision <- rep('F',nrow(submission))
# Between a score of 37 and 63 there can be F,D,C,B
decision[submission$SCORE >= 37 & submission$SCORE <= 73 & submission$PARTICIPATION >= 0.50] <- 'C' # most frequent grade within this score range
decision[submission$SCORE >= 37 & submission$SCORE <= 48 & submission$PARTICIPATION >= 0.50] <- 'D' #high participation low grade
decision[submission$SCORE > 63 & submission$SCORE <= 73 & submission$PARTICIPATION >= 0.50] <- 'B' #high participation and high grade

decision[submission$SCORE >= 37 & submission$SCORE <= 63 & submission$PARTICIPATION < 0.50,] <- 'F' #low participation low grade
decision[submission$SCORE > 63 & submission$SCORE <= 73 & submission$PARTICIPATION < 0.50] <- 'D' #low participation high grade

decision[submission$SCORE > 73 & submission$SCORE <= 100] <- 'A'
decision[submission$SCORE > 73 & submission$SCORE <= 83 & submission$PARTICIPATION > 0.50] <- 'B' # low grade and high participation = B
decision[submission$SCORE > 83 & submission$PARTICIPATION <= 0.50] <- 'B' # high grade and low participation = B
decision[submission$SCORE > 83 & submission$PARTICIPATION > 0.50] <- 'A' # high grade and high participation = A
decision[submission$PARTICIPATION <= 0.50 & submission$SCORE < 83 & submission$SCORE > 73] <- 'C' # low grade and low participation = C
View(decision)

file <- read.csv('M2019_sample_submission.csv', sep = ",")
file$GRADE <- decision
write.csv(file, file = "mysubmission.csv",row.names=FALSE)

asksQuestions <- 
