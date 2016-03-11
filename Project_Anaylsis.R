library(httr)
library(dplyr)
library(reshape2)
#download the file
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "Dataset.zip", method="curl")

#unzip the file
unzip(zipfile="Dataset.zip")

#path to the data folder
path <- file.path(getwd(), "UCI HAR Dataset")

list.files(path, recursive=TRUE)

#Read Feature Files X_test.txt and X_train.txt
featuresDataTest <- read.table(file.path(path, "test", "X_test.txt"), header=FALSE)
featuresDataTrain <- read.table(file.path(path, "train", "X_train.txt"), header=FALSE)

#Read Activity Files y_test.txt and y_train.txt
activityDataTest <- read.table(file.path(path, "test", "y_test.txt"), header=FALSE)
activityDataTrain <- read.table(file.path(path, "train", "y_train.txt"), header=FALSE)

#Read Subject Files subject_test.txt and subject_train.txt
subjectDataTest <- read.table(file.path(path, "test", "subject_test.txt"), header=FALSE)
subjectDataTrain <- read.table(file.path(path, "train", "subject_train.txt"), header=FALSE) 

#Combine tables together
featuresData <- rbind(featuresDataTrain,featuresDataTest)
activityData <- rbind(activityDataTrain, activityDataTest)
subjectData <- rbind(subjectDataTrain, subjectDataTest)

#assign column names
featuresDataName <- read.table(file.path(path, "features.txt"), header=FALSE)
names(featuresData) <- featuresDataName$V2
names(activityData) <- c("Activity")
names(subjectData) <- c("Subject")

#Combine all data
Data <- cbind(featuresData, subjectData, activityData)

#Extract only the mean and standard deviation
meanStdDataNames <- featuresDataName$V2[grep('mean|std', featuresDataName$V2)]

meanStdData <- Data[,c(as.character(meanStdDataNames))]

#Name activity labels
activityLabels <- read.table(file.path(path, "activity_labels.txt"),header =FALSE)

Data$Activity <- factor(Data$Activity, levels = activityLabels[,1], labels = activityLabels[,2])

names(Data) <- gsub("^t", "time", names(Data))
names(Data) <- gsub("^f", "frequency", names(Data))
names(Data) <- gsub("Gyro", "Gyroscope", names(Data))
names(Data) <- gsub("Acc", "Accelerometer", names(Data))
names(Data) <- gsub("Mag", "Magnitude", names(Data))
names(Data) <- gsub("BodyBody", "Body", names(Data))

#creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#Reshape the data
meltData <- melt(Data, id = c("Subject", "Activity"))
averageData <- dcast(meltData, Subject + Activity ~ variable, mean)

write.table(averageData, "tidy_data_2.txt", row.name=FALSE)

