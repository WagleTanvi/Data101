install.packages("devtools")
devtools::install_github("devanshagr/PermutationTestSecond")
Cat1<-rep("GroupA",10)  # for example GroupA can be Holland Tunnel 
Cat2<-rep("GroupB",10)  # for example Group B will be Lincoln Tunnel
# vector of 20 values 10 of them A, 10 of them B
Cat1
Cat2

#The rep command will repeat, the variables will be of type character and will contain 10 values each.

Cat<-c(Cat1,Cat2) # A variable with first 10 values GroupA and next 10 values GroupB
# concatenate values = 20 values 
Cat

Val1<-rnorm(10,mean=10, sd=10) #say, traffic volume in Holland T as normal distribution with mean and sd
Val2<-rnorm(10,mean=30, sd=20) #say, traffic volume in Lincoln T as normal distribution with mean and sd
Val<-c(Val1,Val2) #A variable with 20 rows, with first 10 rows containing 10 random normal values of Val1 #and the next 10 values of Val2

Val

d<-data.frame(Cat,Val)

Observed_Difference<-mean(d[d$Cat=='GroupA',2])-mean(d[d$Cat=='GroupB',2])
Observed_Difference
#This will calculate the mean of the second column (having 10 random values for each group), and the mean of groupB values is subtracted from the mean of groupA values, which will give you the value of the difference of the mean.

#Try changing mean and sd values. When you run this you will see that the difference is sometimes negative #or sometimes positive.
# null hypothesis is that there is no difference 
PermutationTestSecond::Permutation(d, "Cat", "Val",1000, "GroupA", "GroupB")

#The Permutation function returns the absolute value of the difference. So the red line is the absolute value of the observed difference. You will see a histogram having a normal distribution with a red showing the observed difference.
