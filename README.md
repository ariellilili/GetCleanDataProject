# GetCleanDataProject
This is the the course project for Getting and Cleaning Data on Coursera. 

## This repository contains the following files
- README.md, which explains how the data set was generated.
- tidyData.txt, the generated data set.
- CodeBook.md, which describes the variables of the data set.
- run_analysis.R, the R script that was used to generate the data set.

## How was tidyData.txt created
The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.
The original data sets were downloaded through this link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
run_analysis.R was used to:
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- Store the created data set as tidyData.txt

The run_analysis.R was run in R version 3.5.2 (2018-12-20) on Windows 10 64bit system.