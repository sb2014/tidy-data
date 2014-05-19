## You should create one R script called run_analysis.R that does the following. 
## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive activity names. 
## Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Load Training and Testing data sets for the Subjects and Activities

x_train <- read.table("X_train.txt", sep="")
x_test <- read.table("X_test.txt", sep="")
y_train <-read.table("y_train.txt", sep="")
y_test <-read.table("y_test.txt", sep="")
training <- cbind(y_train, x_train)
testing <- cbind(y_test, x_test)

## Step1: Merge Training and Testing data sets
allData<- rbind(training,testing)

## Step2: Load the column headings from features.txt and extract the columns which represent Mean or STD

features <- read.table("features.txt", sep="")
colnames(allData) <- c("Subject", as.character(features$V2))
MeanCol <- grep("mean()",names(allData))
StdCol <- grep("std()",names(allData))
MeanStdData <- cbind(allData["Subject"], allData[MeanCol], allData[StdCol])

## Step3&4: Make column headings descriptive and easier to read and update MeanStdData with them

colnames(MeanStdData) <- sub("tBodyAcc", "TimeDomain-BodyAcceleration", colnames(MeanStdData), fixed=TRUE)
colnames(MeanStdData) <- sub("tGravityAcc", "TimeDomain-GravityAcceleration", colnames(MeanStdData), fixed=TRUE)
colnames(MeanStdData) <- sub("tBodyAccJerk", "TimeDomain-BodyAccelerationJerkSignal", colnames(MeanStdData), fixed=TRUE)
colnames(MeanStdData) <- sub("tBodyGyro", "TimeDomain-BodyAngularVelocity", colnames(MeanStdData), fixed=TRUE)
colnames(MeanStdData) <- sub("tBodyGyroJerk", "TimeDomain-BodyAngularVelocityJerkSignal", colnames(MeanStdData), fixed=TRUE)
colnames(MeanStdData) <- sub("tBodyAccMag", "TimeDomain-BodyAccelerationMagnitude", colnames(MeanStdData), fixed=TRUE)
colnames(MeanStdData) <- sub("tGravityAccMag", "TimeDomain-GravityAccelerationMagnitude", colnames(MeanStdData), fixed=TRUE)
colnames(MeanStdData) <- sub("tBodyAccJerkMag", "TimeDomain-BodyAccelerationJerkMagnitude", colnames(MeanStdData), fixed=TRUE)
colnames(MeanStdData) <- sub("tBodyGyroMag", "TimeDomain-BodyAngularVelocityMagnitude", colnames(MeanStdData), fixed=TRUE)
colnames(MeanStdData) <- sub("tBodyGyroJerkMag", "TimeDomain-BodyAngularVelocityJerkMagnitude", colnames(MeanStdData), fixed=TRUE)
colnames(MeanStdData) <- sub("fBodyAcc", "FrequencyDomain-BodyAcceleration", colnames(MeanStdData), fixed=TRUE)
colnames(MeanStdData) <- sub("fBodyAccJerk", "FrequencyDomain-BodyAccelerationJerkSignal", colnames(MeanStdData), fixed=TRUE)
colnames(MeanStdData) <- sub("fBodyGyro", "FrequencyDomain-BodyAngularVelocity", colnames(MeanStdData), fixed=TRUE)
colnames(MeanStdData) <- sub("fBodyAccMag", "FrequencyDomain-BodyAcelerationMagnitude", colnames(MeanStdData), fixed=TRUE)
colnames(MeanStdData) <- sub("fBodyBodyAccJerkMag", "FrequencyDomain-BodyAcelerationJerkMagnitude", colnames(MeanStdData), fixed=TRUE)
colnames(MeanStdData) <- sub("fBodyBodyGyroMag", "FrequencyDomain-BodyAngularVelocityMagnitude", colnames(MeanStdData), fixed=TRUE)
colnames(MeanStdData) <- sub("fBodyBodyGyroJerkMag", "FrequencyDomain-BodyAngularVelocityJerkMagnitude", colnames(MeanStdData), fixed=TRUE)

colnames(MeanStdData) <- sub("mean","Mean",colnames(MeanStdData),fixed=TRUE)
colnames(MeanStdData) <- sub("std","StandardDeviation",colnames(MeanStdData),fixed=TRUE)
colnames(MeanStdData) <- sub("()","",colnames(MeanStdData),fixed=TRUE)
colnames(MeanStdData) <- sub(",","-",colnames(MeanStdData),fixed=TRUE)

## Step5: Create a second, independent tidy data set with the average of each variable for each activity and subject.

## Melting the Data to calculate averages and create the final tidyData set
library(reshape2)
dataMelt <- melt(MeanStdData, id = c("Subject"))
tidyData <- dcast(dataMelt, Subject ~ variable, mean)

write.table(tidyData, file="tidyData.txt",sep=" ")