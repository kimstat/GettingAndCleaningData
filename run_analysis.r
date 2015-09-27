## Instructions
# You should create one R script called run_analysis.R that does the following. 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject.

library(plyr)

#### SETUP LOCAL MACHINE ####

# set working drive
if(!file.exists("C:/R")){dir.create("C:/R")}
if(!file.exists("C:/R/GetCleanData")){dir.create("C:/R/GetCleanData")}
setwd("C:/R/GetCleanData")

# make data directory to store input data
if(!file.exists("./data")){dir.create("./data")}

#### RAW DATA COLLECTION ####

# download zipped files
fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
data_location <- "./data/activity.zip"
download.file(url = fileURL,destfile = data_location)

# identify relavent files
files <- unzip(data_location,list=T)$Name
files <- files[grep('txt',files)]
files <- files[-grep('Inertial Signals',files)]

# grab activity and feature keys
activity_labels <- read.table(unz(data_location, files[grep('activity',files)]))
features_labels <- as.character(read.table(unz(data_location, files[grep('features.txt',files)]))[,2])

# grab features
test_features <- read.table(unz(data_location, files[grep('X_test',files)]))
train_features <- read.table(unz(data_location, files[grep('X_train',files)]))
# concatenate test + train data
features <- rbind(test_features,train_features)
# use feature key for variable names
colnames(features) <- features_labels

# grab subjects
test_subjects <- read.table(unz(data_location, files[grep('subject_test.txt',files)]))
train_subjects <- read.table(unz(data_location, files[grep('subject_train.txt',files)]))
# concatenate test + train data
subjects <- rbind(test_subjects,train_subjects)

# grab activities
test_activities <- read.table(unz(data_location, files[grep('y_test.txt',files)]))
train_activities <- read.table(unz(data_location, files[grep('y_train.txt',files)]))
# concatenate test + train data
activities <- rbind(test_activities,train_activities)

# combine subjects + activities + features into single dataframe
sub_act <- data.frame(subject=subjects[,1],activity=activities[,1])
data <- cbind(sub_act,features)
str(data)

#### PREPARE TIDY DATASET ####
# select variables of interest (means, stds)
meanstd_vars <- grep('mean\\(|std\\(',colnames(data))
data <- data[,c(1,2,meanstd_vars)]

# translate numeric activity variable to words
data$activity <- activity_labels[,2][data$activity]

# decode variable names so more descriptive
colnames(data)
names(data)<-gsub("^t", "time_", names(data))
names(data)<-gsub("^f", "freq_", names(data))
names(data)<-gsub("BodyBody", "Body", names(data))
names(data)<-gsub("Acc", "_Accelerometer_", names(data))
names(data)<-gsub("Gyro", "_Gyroscope_", names(data))
names(data)<-gsub("Mag", "_Magnitude_", names(data))
names(data)<-gsub("_-", "_", names(data))
names(data)<-gsub("-", "_", names(data))
names(data)<-gsub("__", "_", names(data))

# create tidy data set with the average of each variable for each activity and each subject
tidy_data<-aggregate(. ~subject + activity, data, mean)
tidy_data<-tidy_data[order(tidy_data$subject,tidy_data$activity),]
write.table(tidy_data, file = "run_analysis.txt",row.name=FALSE)
str(read.table(file = 'run_analysis.txt',header = T))
