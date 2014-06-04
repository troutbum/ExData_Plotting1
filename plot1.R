# Exploratory Data Analysis
# June 2014
# Course Project 1

# create a data subdirectory if it does not exist
if (!file.exists("data")) {
        dir.create("data")
}

# download file if it isn't already there
filePath <- "./data/"
fileZipName <- "exdata-data-household_power_consumption.zip"
fileName <- "household_power_consumption.txt"
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

ZipFile <- paste0(filePath, fileZipName)        # path to zipped data file
xFile <- paste0(filePath, fileName)             # path to unzipped data file

if (!file.exists(xFile)) {
        download.file(fileUrl, destfile = ZipFile, method ="curl")
        unzip(ZipFile, exdir=filePath)
        dateDownloaded <- date()
}

# sample data file to determine 


sampleData <- read.csv(xFile, stringsAsFactors=FALSE,sep=";",na.strings="?", nrows = 5)
classes <- sapply(sampleData, class)


largeData <- read.csv("huge-file.csv", header = TRUE, colClasses = classes)
str(largeData)


data <- read.csv(xFile, stringsAsFactors=FALSE,sep=";",na.strings="?")

classes <- sapply(data, class)

as.Date(classes[1],"%d %m %Y")

subdata <- data$Date=="16/12/2006"
summary(subdata)



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