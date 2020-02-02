#Coursera John Hopkin Data science Specialization 
#'Cleaning Data' Week 1 Quiz' 

setwd("C:/Users/calamity/Documents/R_Research/datasciencecoursera")
library(tidyverse)

mydata <- read_csv("Data/getdata_data_ss06hid.csv")
View(mydata)

#Looking at the codebook as given online coursera, how many property are worth $100,000,000 or more?

propertyData <- select(mydata, "VAL")
view(propertyData)
mill_property <- filter(propertyData, VAL == 24)

#There are 53 property that are worth 1,000,000 ore more

#Consider the variable FES in the code book.
#which "tidy data" principles does this variable violate?

#Tidy data has one variable per column

#library(xlsx) 
#I did not use this library for reading excel file
library(readxl)

help(readxl)
dat <- read_excel("Data/getdata_data_DATA.gov_NGAP.xlsx", range = cell_rows(18:23))
View(dat)
sum(dat$Zip*dat$Ext,na.rm=T)

#Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:

library(XML)
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileUrl, useInternal = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)

names(rootNode)

rootNode[[1]][[1]]
names(rootNode[[1]][[1]])

xmlSApply(rootNode,xmlValue)
zipcode <- xpathSApply(rootNode,"//zipcode",xmlValue)
zipcode <- data.frame(zipcode)
names(zipcode)
dim(filter(zipcode, zipcode == 21231))

Q4 <- zipcode %>%
  group_by(zipcode)%>%
  summarise(count = n())%>%
  filter(zipcode == 21231)
view(Q4)

#None of this code work
# rootNode[[1]][[1]][["zipcode"]]
# 
# zipcode = rootNode[[1]][["zipcode"]]
# 
# names(zipcode)
# 
# rootNode[[1]]
# help("xmlSApply")
# 
# xmlSApply(rootNode[[1]][[1]],"//zipcode",xmlValue = 21231)
# How many restaurants have zipcode 21231?

# rootNode[[1]][[1]][[2]]
# 
# xmlSApply(rootNode,"//address",xmlValue)


fileUrl5 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl5, destfile="./Data/IDH.csv",method="curl")
install.packages("data.table")
library(data.table)
DT <- fread("./Data/IDH.csv",sep = ,)

#using the fread() command load the data into an R object
#DT 
#Which of the following is the fastest way to calculate the average value of the variable
#pwgtp15 
#broken down by sex using the data.table package?
#Your Answer  	Score	Explanation
DT[,mean(pwgtp15),by=SEX]	#Correct	3.00	
mean(DT$pwgtp15,by=DT$SEX)			
sapply(split(DT$pwgtp15,DT$SEX),mean)			
mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)			
tapply(DT$pwgtp15,DT$SEX,mean)			
rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]

warpbreaks$replicate <- rep(1:9, len=54)
xt <- xtabs (breaks ~., data = warpbreaks)
xt
ftable(xt)
