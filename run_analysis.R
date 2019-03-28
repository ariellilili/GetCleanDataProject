# set working directory
setwd("C:/Users/L/OneDrive/Documents/Coursera/Course 3")


#### download data ####

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipname <- "UCI HAR Dataset.zip"
filename <- "UCI HAR Dataset"

# if the zip file does not exist, download the zip
if (!file.exists(zipname)) {
    download.file(url, destfile = zipname)
}

# upzip the zip if it hasn't been
if (!file.exists(filename)) {
    unzip(zipname)
}

# reset the working directory
setwd("./UCI HAR Dataset")



#### read data ####

# training data
xtrain <- read.table("./train/X_train.txt")
ytrain <- read.table("./train/y_train.txt")
subjecttrain <- read.table("./train/subject_train.txt")

# testing data
xtest <- read.table("./test/X_test.txt")
ytest <- read.table("./test/y_test.txt")
subjecttest <- read.table("./test/subject_test.txt")

# features
features <- read.table("features.txt", as.is = TRUE)

# activity labels
activities <- read.table("activity_labels.txt")



#### 1. merge training and testing sets to create one data set ####

test <- cbind(subjecttest, xtest, ytest)
train <- cbind(subjecttrain, xtrain, ytrain)
all <- rbind(test, train)

# name the columns
# x = values, y = activity, subject = subject ID
colnames(all) <- c("subject", features[ ,2], "activity")




#### 2. Extracts only mean and standard deviation for each measurement ####

# a logic vector to determine the columns to keep
# keep subject, activity, mean and std
keep <- grepl("subject|activity|mean|std", colnames(all))

# keep data in these columns only
all <- all[ , keep]




#### 3. Uses descriptive activity names ####

# in dataframe activities, column 1 is number ID, column 2 is the name
# factor the activity column in dataframe all
all$activity <- factor(all$activity, 
                       levels = activities[, 1], 
                       labels = activities[, 2])



#### 4. descriptive variable names ####

allcols <- colnames(all)

# remove all punctuations
allcols <- gsub("[[:punct:]]", "\\", allcols)

# use full names
allcols <- gsub("^f", "Frequency", allcols)
allcols <- gsub("^t", "Time", allcols)
allcols <- gsub("Acc", "Accelerometer", allcols)
allcols <- gsub("Gyro", "Gyroscope", allcols)
allcols <- gsub("Mag", "Magnitude", allcols)
allcols <- gsub("mean", "Mean", allcols)
allcols <- gsub("std", "StandardDeviation", allcols)

# correct typo
allcols <- gsub("BodyBody", "Body", allcols)

# rename the columns
colnames(all) <- allcols


#### 5. creates a second, independent tidy data set ####
#### with the average of each variable 
#### for each activity and each subject

library(dplyr)
all2 <- all %>% group_by(subject, activity) %>% summarise_all(funs(mean))
    
# save the tidy data set
write.table(all2, file = "tidyData.txt", row.names = FALSE)
