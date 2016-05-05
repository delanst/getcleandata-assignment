# Code book
Getting and Cleaning Data Course Project

## Subject
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Summary
The purpose of this data collection is to provide a tidy data set for further analysis in regard to the subject description above.

## Raw data
A regular expression as given below was applied on the raw data, providing only the mean and
standard diviation measurements. These are then combined with the subject and activity labels.

-mean\\(\\)|std\\(\\)

The training and test subsets were use in order to produce these final tidy data set.

The data set has been gathered from the following <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">location</a>.
A more detailed description can be found on the <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">site</a>.

## Tidy data
The tidydata.txt proceduces the measurments only on the mean and standard deviation with a more descriptive column name.

### Descriptive columns
The following replacements have happened on the column names in order to give a clearing meaning.
The replacement text spring has been taken from the features_info.txt.

| Function | Description |
| -------- | ----------- |
| gsub('^t', 'Time ', tidy.dt.names) | Replace all columns beginning with t to Time | 
| gsub('^f', 'Frequency', tidy.dt.names) | Replace all columns beginning with f to Frequency | 
| gsub('-mean', 'Mean', tidy.dt.names) |  Replace all columns containing -mean with Mean | 
| gsub('-std', 'Std', tidy.dt.names) |  Replace all columns containing -std with Mean | 
| gsub('[()-]', '', tidy.dt.names) | Removed the ()- | 
| gsub('BodyBody', 'Body', tidy.dt.names) | Replace BodyBody with Body | 
| gsub("Acc", "Accelerometer", tidynames) | Replace Acc with Accelerometer |  
| gsub("Gyro", "Gyroscope", tidynames) | Replace Gyro with Gyroscope | 
| gsub("Mag", "Magnitude", tidynames) | Replace Mag with Maginute | 

Here are some examples of the new column names that are generated in the tidy data set.

| Original column name | New column name | 
| -------------------- | --------------- | 
| tBodyAcc-mean()-X | Time BodyAccelerometerMeanX | 
| tBodyAcc-mean()-Y | Time BodyAccelerometerMeanY | 
| tBodyAcc-mean()-Z | Time BodyAccelerometeerMeanZ | 
| tBodyAcc-std()-X | Time BodyAccelerometerStdX | 
| tBodyAcc-std()-Y | Time BodyAccelerometerStdY | 
| tBodyAcc-std()-Z | Time BodyAccelerometerStdZ | 
| tGravityAcc-mean()-X | Time GravityAcccelerometerMeanX | 

