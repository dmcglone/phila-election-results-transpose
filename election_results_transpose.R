#setwd
setwd("//FILESHARE/projects/Azavea_CartographicServices/CommitteeOf70_ElectionReporting/downloads/Political_Divisions/")

#read data
data <- read.csv("phila_2016_results.csv")

#get dimensions
dim(data)

#add leading zero to division
data$DIVISION <- sprintf("%02d", data$DIVISION)

#add leading zero to ward
data$WARD <- sprintf("%02d", data$WARD)

#concatenate ward and division (so we can join to the city's shapefile later)
data$WARD_DIV=paste(data$WARD,data$DIVISION,sep="")

#concatenate office and candidate
data$OFFICE_CANDIDATE=paste(data$OFFICE,data$CANDIDATE,sep=" ")

#let's remove some superfluous fields
data <- data[,-c(1:4,6:7)]

#show rows to see if it worked
head(data)

#pull up reshape library
library(reshape2)

#create new data frame with reshaped data
findat <- dcast(data, WARD_DIV ~ OFFICE_CANDIDATE, value.var = "VOTES", fun.aggregate = sum)
