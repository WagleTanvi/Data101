firstName <- c("Ethan", "John", "Selina")
lastName <- c("Hunt", "Whick", "Kyle")
sex <- c("MALE", "MALE", "FEMALE")
score <- c(97, 88, 85)
stu_df1 <- data.frame(firstName, lastName, sex, score)
stu_df1
#preparing another data frame with 3 rows
surName <- c("Hunt", "Whick", "Kyle")
hairColor <- c("Black", "Black", "Red")
age <- c(40, 42, 24)
stu_df2 <- data.frame(surName, hairColor, age)
stu_df2
cbind(stu_df1,stu_df2)

file1 <- data.frame(name=c("Peter","John","Robin"), skill=c(2,1,7))
file2 <- data.frame(surname=c("P","Ro","M"),skill=c(3,1,4))
merge(file1,file2,by.x="name", by.y="surname")

moody <- read.csv("https://raw.githubusercontent.com/kunal0895/RDatasets/master/Moody2018.csv")
View(moody)
moody[,6] <- " "
moody
moody[moody$GRADE=="F",6] <- "fail"
moody[moody$GRADE!="F",6] <- "pass"
colnames(moody) <- day
moody
#"==" is a judgement sign, if grade is equal to "F", then we consider it as "fail"
moody[1:3]
u <- c(1:10)
w <- c(1,-1,3)
u[w>-1]

moody[,moody$SCORE==1]

moody[3:4]
moody["GRADE",]
moody[,c(1,2)]
moody[c(1,2)]
what <- moody[moody$GRADE == "f"]
what
u <- c("1",T,3)
u
moody[0]
hola <- matrix()
table(moody$SCORE, moody$DOZES_OFF)
u[w == u]

t<- data.frame(x=c(1,2,3), y=c(3,2,1), z=c("a","b","c"),  r=c("r","b","b"))

t[,t$z==3]

t[,2]

Crazyweek <- matrix(NA, nrow=2,ncol=7)
weather <- ("snow","ls","snow","")