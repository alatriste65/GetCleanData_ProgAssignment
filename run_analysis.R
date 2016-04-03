library(plyr)

#Set the working directory
setwd("D:/Data Science/Getting and Cleaning Data/Exercises/Week4/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")


# Step 1. Read the relevant datasets and merge the test and training set
#Read the relevant datasets
  #Train-set
  x_train<-read.table("./train/X_train.txt")
  y_train<-read.table("./train/y_train.txt")
  subject_train <- read.table("./train/subject_train.txt")
  
  #Test-set
  x_test<-read.table("./test/X_test.txt")
  y_test<-read.table("./test/y_test.txt")
  subject_test <- read.table("./test/subject_test.txt")
  
#Merge the test and training datasets
  # create 'x' data set
  x_dat <- rbind(x_train, x_test)
  # create 'y' data set
  y_dat <- rbind(y_train, y_test)
  # create 'subject' data set
  subject_dat <- rbind(subject_train, subject_test)

# Step 2
# Extract only the measurements on the mean and standard deviation for each measurement
  # Read the features-listing file
  features <- read.table("features.txt")
  #label the x_dat variable with the features
  colnames(x_dat)<-as.character(features[,2])
  # get only columns with mean() or std() in their names
  m_s_feat <- grep("-(mean|std)\\(\\)", features[, 2])
  # subset the desired columns
  x_dat <- x_dat[, m_s_feat]

# Step 3
# Use descriptive activity names to name the activities in the data set
  activities <- read.table("activity_labels.txt")
  #Transform y_data in a factor variable
  y_dat<-factor(as.character(as.vector(as.matrix(y_dat))),levels=names(table(y_dat)),labels=as.character(activities[,2]))


# Step 4
# Appropriately label the data set with descriptive variable names
  #merge the x,y and subject data sets
  dat<-cbind(subject_dat,y_dat,x_dat)
  #label the subject and activity columns, i.e. columns 1 and 2
  dat<-rename(dat,c("V1" = "subject","y_dat" = "activity"))

# Step 5
# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject
  averaged_dat <- ddply(dat, .(subject, activity), function(x) colMeans(x[, 3:68]))

write.table(averaged_dat, "../../averaged_data.txt", row.name=FALSE)