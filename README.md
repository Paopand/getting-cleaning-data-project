# Getting and Cleaning Data Project


## Project Objectives

Create an R procedure called run_analysis.R that does the following on some data collected from accelerometers contained in Samsung Galaxy S smartphones:

* Merges the training and the test sets to create one data set;
* Extracts only the measurements on the mean and standard deviation for each measurement;
* Uses descriptive activity names to name the activities in the data set;
* Labels the data set with descriptive activity names;
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

A full description of the activities related to the data is available at this site: [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## How to work on this course project

Some basic knowledge of the R programming environment (setting a working directory and run a source program) is assumed to be known.

The requested steps are:
1. Download the data source and you'll have a folder titled: UCI HAR Dataset.
2. Put this folder on your working directory. 
3. Put run_analysis.R also on your working directory.
4. Run source("run_analysis.R"): it will generate a new file (avg_mean_std_by_activity_and_subject.txt) in your working directory.

## Dependencies

run_analysis.R depends on plyr. It will help you to install the dependencies automatically.