# required libraries
library(plyr)

# function that downloads the zip file and unzips it the data directory. Remove the zip file when unzip is done.
prepareAnalysis <- function() {
  print("Preparing analysis...")
  if(!dir.exists("data")) 
    dir.create("data")
  
  dataFile <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
  download.file(dataFile, './UCI-HAR-dataset.zip', method='curl')
  
  unzip('./UCI-HAR-dataset.zip',exdir = "data")
  file.remove("UCI-HAR-dataset.zip")
}

# run analysis function with the location to the data.
runAnalysis <- function(dataPath) {
    # get the data on the computer
    prepareAnalysis()
    
      # read and merge the train and test data sets
      print("Reading and merging data...")
      activityTest <- read.table(file.path(dataPath, "test" , "Y_test.txt" ),header = FALSE)
      activityTrain <- read.table(file.path(dataPath, "train", "Y_train.txt"),header = FALSE)
      subjectTrain <- read.table(file.path(dataPath, "train", "subject_train.txt"),header = FALSE)
      subjectTest  <- read.table(file.path(dataPath, "test" , "subject_test.txt"),header = FALSE)
      featuresTest  <- read.table(file.path(dataPath, "test" , "X_test.txt" ),header = FALSE)
      featuresTrain <- read.table(file.path(dataPath, "train", "X_train.txt"),header = FALSE)
      subjectSet <- rbind(subjectTrain, subjectTest)
      activitySet <- rbind(activityTrain, activityTest)
      featuresSet <- rbind(featuresTrain, featuresTest)  
  
      names(subjectSet)<-c("subject")
      names(activitySet)<- c("activity")
      featuresNames <- read.table(file.path(dataPath, "features.txt"),head=FALSE)
      names(featuresSet)<- featuresNames$V2
      
      subjectActivity <- cbind(subjectSet, activitySet)
      data <- cbind(featuresSet, subjectActivity)
      
      # Extracts only the measurements on the mean and standard deviation for each measurement.
      print("Extracting measurements...")
      featuresNamesData <-featuresNames$V2[grep("mean\\(\\)|std\\(\\)", featuresNames$V2)]
      selectedNames <- c(as.character(featuresNamesData), "subject", "activity" )
      data <-subset(data,select=selectedNames)
      
      # Uses descriptive activity names to name the activities in the data set
      print("Naming activities...")
      activityLabels <- read.table(file.path(dataPath, "activity_labels.txt"),header = FALSE)
      
      # Appropriately labels the data set with descriptive variable names.
      print("Describing variable names...")
      names(data)<-gsub("^t", "time", names(data))
      names(data)<-gsub("^f", "frequency", names(data))
      names(data)<-gsub("Acc", "Accelerometer", names(data))
      names(data)<-gsub("Gyro", "Gyroscope", names(data))
      names(data)<-gsub("Mag", "Magnitude", names(data))
      names(data)<-gsub("BodyBody", "Body", names(data))
      
      # From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
      print("Creating tidy data set...")
      tidy <- aggregate(. ~subject + activity, data, mean)
      tidy <- tidy[order(tidy$subject,tidy$activity),]
      write.table(tidy, file = "tidydata.txt",row.name=FALSE)
      
      print("Finished analysis...")      
}

# run the analysis and will generate the tidy data set file.
runAnalysis("./data/UCI HAR Dataset")



