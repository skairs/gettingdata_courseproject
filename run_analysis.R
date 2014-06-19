## 10 June 2014 -- SNK
## Coursera: Getting and Cleaning Data
## Course Project

######## Section 1 ########
##Task: Merge the training and the test sets to create one data set.
##      Use descriptive activity names to name the activities in the data set.
##      Appropriately label the data set with descriptive variable names.

## Data sourced from: 
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
## Manually unzipped to directory "UCI HAR Dataset"

data_directory <- "UCI HAR Dataset"
## Activity names are stored in the second column of activity_labels.txt file in root of data directory
activities <- read.table(paste(data_directory, "activity_labels.txt", sep="/"), header=FALSE, 
                       colClasses="character")
## Column names (features) are stored in the second column of features.txt file in root of data directory
features <- read.table(paste(data_directory, "features.txt", sep="/"), header=FALSE, 
                       colClasses="character")
## reformat variable names: change "-" to "_"; remove "()" 
features[,2] <- gsub("-", "_", features[,2])
features[,2] <- gsub("\\(\\)", "", features[,2])


## Read in training data set.  Data set is stored in 3 files: subject_train.txt, y_train.txt, X_train.txt
## See readMe in data directory for description of data files
train_subject <- read.table(paste(data_directory, "train", "subject_train.txt", sep="/"), header=FALSE, 
                    colClasses="numeric")

train_y <- read.table(paste(data_directory, "train", "y_train.txt", sep="/"), header=FALSE, 
                    colClasses="factor")
## rename levels of train_y with descriptive labels from second column of activity_labels.txt
levels(train_y[,1]) <- activities[,2]

## X_train.txt 561 columns wide.  Data is numeric. 
## reading in X_train.txt table, with column names, column classes as numeric
train_x <- read.table(paste(data_directory, "train", "X_train.txt", sep="/"), col.names=features[,2], 
                      colClasses="numeric")

## combine subject ID and train_x into one data.frame
train <- cbind(train_subject, train_y, train_x)
## rename columns 1 & 2 with descriptive labels
names(train)[1] <- "subject"
names(train)[2] <- "activity"


## Read in testing data set.  Data set is stored in 3 files: subject_test.txt, y_test.txt, X_test.txt
## See readMe in data directory for description of data files
test_subject <- read.table(paste(data_directory, "test", "subject_test.txt", sep="/"), header=FALSE, 
                            colClasses="numeric")

test_y <- read.table(paste(data_directory, "test", "y_test.txt", sep="/"), header=FALSE, 
                      colClasses="factor")
## rename levels of test_y with descriptive labels from second column of activity_labels.txt
levels(test_y[,1]) <- activities[,2]

## X_test.txt 561 columns wide.  Data is numeric. 
## Column names are stored in the second column of features.txt file in root of data directory (see train)
## reading in X_test.txt table, with column names, column classes as numeric
test_x <- read.table(paste(data_directory, "test", "X_test.txt", sep="/"), col.names=features[,2], colClasses="numeric")

## combine subject ID and test_x into one data.frame
test <- cbind(test_subject, test_y, test_x)
## rename columns 1 & 2 with descriptive labels
names(test)[1] <- "subject"
names(test)[2] <- "activity"

## tested that the column names are the same for both data.frames: sum(names(test) != names(train))
## returns 0 as expected

##merge data sets into one dataframe "train_test"
train_test <- rbind(train, test)


######## Section 2 ########
## Extract only the measurements on the mean and standard deviation for each measurement.

## get columns with _mean_ and _std_. Specifically eliminates meanFreq values
## Create filter from features list as text has not been altered for col names yet
filter <- ((grepl("_mean", features[,2]) | grepl("_meanF", features[,2])) + grepl("_std", features[,2]))
## downselect to first subject, activity and columns that pass the filter 
train_test_tidy <- cbind(train_test[,1:2], train_test[,filter==TRUE])


######## Section 3 ########
## Creates a second, independent tidy data set with the average of each variable 
## for each activity and each subject
library(reshape2)

## melt the data frame to long form, using subject & activity as id columns
melted <- melt(train_test_tidy, id.vars=c("subject", "activity"))
## dcast by subject & activity, taking the mean of each variable
reshaped <- dcast(melted, subject + activity ~ variable, mean)

######## Section 4 ########
## write reshaped table to txt file for submission
write.csv(reshaped, file="submission_data.txt", row.names=FALSE)
