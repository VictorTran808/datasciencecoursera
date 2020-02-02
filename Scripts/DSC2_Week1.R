
#setting up working directory for this script file
setwd("C:/Users/calamity/Documents/R_Research/datasciencecoursera")

#creating a simple 2x3 matrix
m <- matrix(1:6, nrow = 2, ncol = 3)
m

#turning a vector into a matric
v <- 1:10
#vector into 2x5 matrix
dim(v) <- c(2,5)
#V is now a matrix
v

#cbind(x,y) & rbind(x,y), where x & y are vectors

y <- c(1:4)
x <- c(5:8)
y
x
c_xy <- cbind(x,y)
c_xy

#'data type- factor
#'are used to represent categorical daata. 
#'Can be order or unordered. Think of it as an integer vector where 
#'each integer has a label.

f <- factor(c("yes", "yes", "no", "no"))
f
# looking at the level, it seem that yes is counted as 2 and no as 1
# The order of the level is alphabetical, hence no comes first before yes
# to fix this, we can add in the levels parameters to establishes what comes first
f <- factor(c("yes", "yes", "no", "no"), levels = c("yes", "no"))
f #now yes comes first before no in the level 

#Data types - Missing Values
#' missing value are denoted by NA or NaN for undefined mathematical operations
#' is.na() is used to test objects if they are NA
#' is.nan() is used to test for NaN
#' NA values have a class also, so there are integer NA, character NA, etc.
#' A NaN value is also NA but the converse is not true
#'

x <- c(1,2,NA,10,3)
is.na(x)
is.nan(x)


#Data type- Data Frames
#' Data frame are uses to store 'tabular data'
#' They are represented as a special type of list where every element of the list has 
#' to the same length
#' 
#' Each element of the list can be thought of as a column and the length of each element 
#' if the list is the number of rows.
#' 
#' Unlike matrices, data frames can store different classes of objects in each column (just like list)
#' matrices must have every elements be the same class
#' 
#' Data frames also have a special attribute called row.names
#' Data frames are usually created by calling read.table() or read.csv()
#' 
#' can be converted to a matric by calling data.matrix()
#' 

x <- data.frame(foo = 1:4, bar = c(T,T,F,F))
x
nrow(x)
ncol(x)

#Data types- Names
#' R objects can also have names, which is useful for readability
#' 
#' atomic classesL numeric, logical, characters, integer, comple
#' Vectors, lists
#' factors
#' missing value
#' data frame
#' names
#' 

# Reading Tabular Data
#' A few principle functions for reading data into R
#' 
#' -read.table, read.csv, for reading tabular data
#' -readLines, for reading lines of a text file
#' -source, for reading in R code files (inverse of dump)
#' -dget, for reading in R code files (inverse of dput)
#' -load, for reading in saved workspace
#' -unserialize, for reading single R objects in binary form 
#' 
#' Reading data files with read.table (some its argument)
#' file, the name of a file, or a connection
#' header, logical indicating if the file has a header line
#' sep, a string indicating how the column are seperated
#' colClasses, a character vector indicating the class of each column in the dataset
#' nrow, the # or row in the dataset
#' skip, the number of lines to skip from the begining
#' stringsAsFactor, should character variables be coded as factors?
#' 
#' ex.
#' data <- read.table("name.txt")
#' read.table is uses for small to moderately sized datasets
#' 
#' Reading in Large Datasets with read.table
#' 
#' Note: Make a rough calculation of the memory required to store my dataset. 
#' If the dataset is larger than the amount of RAM on your computer, you should stop now!
#' 
#' Set comment.char = "" if there are no commented lines in your file.
#' 
#' Use the colClasses argument. Specifying this option instead of using the default can make 
#' 'read.table' run MUCH faster, often twice as fast. In order to use this option, you have 
#' to know the class of each column in your data frame. 
#' 
#' Example: If all the columns are "numeric" then colClasses ="numeric"
#' 
#' A quick and dirty way to figure out the classes of each column is the following:
#' 

inital <- read.table("datatable.txt", nrows = 100)
classes <- sapply(initial, classes)
tabAll <- read.table("datatable.txt", colClasses = classes)
# set nrows. This doesn't make R run faster but it helps with memory usage.

#Calculating Memory Requiremnents
#review lecture "Reading Large Table"



