
# !!IMPORTANT!!
# DO NOT USE GOOGLE WHEN STARTING TO LEARN R!!
# USE THE DATA 101 LaboRatory - http://data101.cs.rutgers.edu/ for any commands or help

# Dataset - https://archive.ics.uci.edu/ml/datasets.html
# Download the dataset from the link and insert the header information manually (As written in the ppt)

# Shortcut to comment/uncomment - Ctrl + Shift + C

# To run the below commands - Select the line to run and click on "Run" (Present on the top right corner of this window)
# Note : It is better to write each command on your own for practice and learning.

# Import library
# Readr - Read rectangular text data


# Note : Import your dataset using the name - "automobiles"
# Click on the "Import Dataset" and select "from Text(readr)" and load your dataset.

# Structure of the object/dataset
str(automobiles)
# Length of the object/dataset
length(automobiles)
# Class of the object/dataset - High level
class(automobiles)
# Type of the object/dataset - Low-level
typeof(automobiles)
# Name of the object/dataset
names(automobiles)

# Note : If you type "$" after any dataframe it will show you the different variables present in the dataframe

# Try - class(automobiles$normalized.losses) and typeof(automobiles$normalized.losses), as two separate commands
# See what happens
class(automobiles$normalized.losses)
typeof(automobiles$normalized.losses)

# Do you understand why this happens?


# Datatypes

#character
#numeric (real or decimal)
#integer
#logical
#complex

a <- "a"
b <- 2.5
c <- 6
d <- TRUE
e <- 1+4i

# You will see them appear on the Workspace as and when you store values in variables
# The Workspace is present on the right side

# How to see what is present in each variable? - Just type the variable name in the console
# For example : Type b in the console and press enter. It will display 2.5
# Note : This can be done for any of the other variables. Try doing that for other variables and see what is displayed.


# Data structures

# Note : "c()" is a combine function. It combines the information inside it and stores it in the variable.

# Vector
f <- c(1,2,5.3,6,-2,4) # numeric vector
g <- c("one","two","three") # character vector
h <- c(TRUE,TRUE,TRUE,FALSE,TRUE,FALSE) #logical vector

# Matrix
i<-matrix(1:20, nrow=5,ncol=4)

# Dataframes - Main idea is that each value can be of differnt modes(numeric, character, factor ,.etc)
j <- c(1,2,3,4)
k <- c("red", "white", "red", NA)
l <- c(TRUE,TRUE,TRUE,FALSE)
# How to create a dataframe using different modes
mydata <- data.frame(j,k,l)
# Giving column names for each of the three variables. Think of naming each column with a header name
names(mydata) <- c("ID","Color","Passed") # variable names

# Note : Lists is not used a lot. Just understand what a list is.
# Lists - ordered collection of objects
w <- list(name="Name", numbers = j)

# Factors - Tells R that the variable is nominal. Used for categorical variables.
# Note : Do not concentrate on what rep() as a function does. Concentrate on WHY gender is a factor in R.
gender <- c(rep("male",20), rep("female", 30)) 
# This is how a categorical variable is converted to a factor (data structure) in R
gender <- factor(gender) 
# Display the contents of gender
gender

# Plots

# Histogram plot - Used to see the distribution (Continuous data)
hist(automobiles$compression.ratio)

# Box plot - To show the distribution of data (Min, First Quartile, Median, Third Quartile, Max)
boxplot(automobiles$compression.ratio ~ automobiles$make)

# Bar Plot - Used to compare variables (For categorical data)
table(automobiles$make)
barplot(table(automobiles$make))

# Mosaic Plot - Represents a contingency table (Distribution of two variables against each other) 
# [Box size represents the cell frequencies]
mosaicplot(automobiles$make ~ automobiles$fuel.type)

# How to use help
?barplot
??bar  

