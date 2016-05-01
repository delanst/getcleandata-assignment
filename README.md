# Getting cleaning Assignment

## Goal
The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project

## Todo
1. Submit a tidy data set as described below
2. Submit a link to a Github repository with your script for performing the analysis
3. Submit a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data 

## Data gathering
The initial data has been obtained from 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data has been download at the following link
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Task
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## run_analysis.R
The code for the tasks defined above is located in the run_analysis.R file. Here follows a description of how the R script works.

The code exists out of 2 functions prepareAnalysis and runAnalysis. 
### prepareAnalysis
Prepare analysis downloads the zip file and unzips it in a directory. Check if the "data"
directory exists and if not it create it.
Then the download of the zip file is executed. After that the zip file is unzipped in the "data" diretory.
As last step we remove the zip file

### runAnalysis
Holds the code as described in the tasks section. 

### runs the analysis with a given path
runAnalysis("./data/UCI HAR Dataset")