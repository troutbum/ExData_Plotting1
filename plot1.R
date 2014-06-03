# Exploratory Data Analysis
# June 2014
# Course Project 1


# create a data subdirectory if it does not exist
if (!file.exists("data")) {
        dir.create("data")
}
filePath <- "./data/"

# download dataset
fileName <- "getdata-data-GDP.csv"
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
xFile <- paste0(filePath, fileName)
if (!file.exists(xFile)) {
        download.file(fileUrl, destfile = xFile, method ="curl")
        dateDownloaded <- date()
}
x
#
# Big problems in Quiz 3 with mixed datatypes in columns
# (Need to prevent creation of factor levels)

# Method 1
data <- read.csv(xFile, stringsAsFactors=FALSE,skip=4,nrows=190)
data$X.4 <- as.numeric(gsub("[,]", "", data$X.4))                       # cleanup column
mean(data$X.4)
summary(data$X.4)

# Method 2
# not yet worked out
#
# data <- read.csv(xFile, colClasses=c("character","integer","character",
#                                   "character","numeric",rep("character",5)))
#             
# headset <- read.csv(xFile, header = TRUE, nrows = 10)           # sample data
# classes <- sapply(headset, class)
# classes[names(classes) %in% c("time")] <- "character"           # issue
# dataset <- read.csv(fname, header = TRUE, colClasses = classes)