CODE BOOK - GETTING & CLEANING DATA - COURSE PROJECT
=======================================

_16 June 2014 -- SNK  
Coursera: Getting and Cleaning Data  
Course Project_  

Course website: https://class.coursera.org/getdata-004/


### Sections of this code book:  
1. Data Dictionary for Source Data (UCI HAR Dataset)  
2. Data Dictionary for Summarized Data (submission_data.txt)  
3. Variables used in `run_analysis.R` script

### Data Dictionary for Source Data

Data sourced from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Please refer to the `README.txt` and `features_info.txt` files provided in the zipped data for information on sampling, calculations and feature selection from the original study.  Information reproduced in this `README.md` about the original data is for convenient reference only.

#### Structure of unzipped UCI HAR Dataset directory:
```
UCI HAR Dataset/  
        activity_labels.txt  
        features_info.txt  
        features.txt  
        README.txt  
        test/  
            subject_test.txt  
            X_test.txt  
            y_test.txt  
            Inertial Signals/  
        train/  
            subject_train.txt  
            X_train.txt  
            y_train.txt  
            Inertial Signals/  
```
The 'Inertial Signals' subdirectories of test/ and train/ are not used for this assignment. They are discussed in the `README.txt` file included with the zipped data.

#### Descriptions from `README.txt`:  
`features_info.txt`: Shows information about the variables used on the feature vector.  
`features.txt`: List of all features.  
`activity_labels.txt`: Links the class labels with their activity name.  
`train/X_train.txt`: Training set.  
`train/y_train.txt`: Training labels.  
`test/X_test.txt`: Test set.  
`test/y_test.txt`: Test labels.  

The following files are available for the train and test data. Their descriptions are equivalent.   
`train/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.  
`train/Inertial Signals/total_acc_x_train.txt`: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the `total_acc_x_train.txt` and `total_acc_z_train.txt` files for the Y and Z axis.  
`train/Inertial Signals/body_acc_x_train.txt`: The body acceleration signal obtained by subtracting the gravity from the total acceleration.  
`train/Inertial Signals/body_gyro_x_train.txt`: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.   

### Data Dictionary for Summarized Data

Data presented in `submission_data.txt` as comma-separated values, with header, without row names.  The data frame is 180 rows by 68 columns.  Columns 1-2 contain identifying information on subject & activity.  Columns 3-68 are numeric, and contain the mean of all observed measurements for each variable for a given subject & activity.

#### Variable descriptions:
`subject` - numeric - Subject ID. Range 1-30.  
`activity` - factor - Activity performed during observation.  6 levels: "WALKING", "WALKING\_UPSTAIRS",  "WALKING\_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"  

The following measurements have been normalized, and are therefore unitless.  Their extended description can be found in the `features_info.txt` file (excerpt reproduced below).  In the `submission_data.txt` file, the value reported for each variable for a given subject and activity is the mean of all measurements observed for that variable for the given subject and activity.

`tBodyAcc.mean...X`  
`tBodyAcc.mean...Y`   
`tBodyAcc.mean...Z`             
`tBodyAcc.std...X`  
`tBodyAcc.std...Y`            
`tBodyAcc.std...Z`            
`tGravityAcc.mean...X`   
`tGravityAcc.mean...Y`  
`tGravityAcc.mean...Z`   
`tGravityAcc.std...X`  
`tGravityAcc.std...Y`   
`tGravityAcc.std...Z`  
`tBodyAccJerk.mean...X`  
`tBodyAccJerk.mean...Y`  
`tBodyAccJerk.mean...Z`  
`tBodyAccJerk.std...X`    
`tBodyAccJerk.std...Y`    
`tBodyAccJerk.std...Z`   
`tBodyGyro.mean...X`  
`tBodyGyro.mean...Y`     
`tBodyGyro.mean...Z`  
`tBodyGyro.std...X`  
`tBodyGyro.std...Y`  
`tBodyGyro.std...Z`  
`tBodyGyroJerk.mean...X`  
`tBodyGyroJerk.mean...Y`  
`tBodyGyroJerk.mean...Z`  
`tBodyGyroJerk.std...X`  
`tBodyGyroJerk.std...Y`         
`tBodyGyroJerk.std...Z`  
`tBodyAccMag.mean..`          
`tBodyAccMag.std..`          
`tGravityAccMag.mean..`       
`tGravityAccMag.std..`       
`tBodyAccJerkMag.mean..`     
`tBodyAccJerkMag.std..`      
`tBodyGyroMag.mean..`        
`tBodyGyroMag.std..`         
`tBodyGyroJerkMag.mean..`     
`tBodyGyroJerkMag.std..`     
`fBodyAcc.mean...X`         
`fBodyAcc.mean...Y`          
`fBodyAcc.mean...Z`          
`fBodyAcc.std...X`           
`fBodyAcc.std...Y`            
`fBodyAcc.std...Z`           
`fBodyAccJerk.mean...X`      
`fBodyAccJerk.mean...Y`       
`fBodyAccJerk.mean...Z`      
`fBodyAccJerk.std...X`        
`fBodyAccJerk.std...Y`        
`fBodyAccJerk.std...Z`       
`fBodyGyro.mean...X`          
`fBodyGyro.mean...Y`          
`fBodyGyro.mean...Z`         
`fBodyGyro.std...X`          
`fBodyGyro.std...Y`          
`fBodyGyro.std...Z`          
`fBodyAccMag.mean..`         
`fBodyAccMag.std..`           
`fBodyBodyAccJerkMag.mean..`  
`fBodyBodyAccJerkMag.std..`   
`fBodyBodyGyroMag.mean..`      
`fBodyBodyGyroMag.std..`     
`fBodyBodyGyroJerkMag.mean..`  
`fBodyBodyGyroJerkMag.std..` 

#### From the features_info.txt file:
>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

>The set of variables that were estimated from these signals are: 

>mean(): Mean value
>std(): Standard deviation

### Variables used in `run_analysis.R` script
`data_directory` - name of subdirectory in which UCI HAR Dataset files are stored  
`activities` - activity labels, table read from `activity_labels.txt` file  
`features` - feature names, table read from `features.txt` file  
`train_subject` - subject IDs, training data set, table read from `train/subject_train.txt` file  
`train_y` - activity, training data set, table read from `train/y_train.txt` file  
`train` - assembled training data set  
`train_x` - measurement data, training data set, table read from `train/X_train.txt` file  
`test_subject` - subject IDs, testing data set, table read from `test/subject_test.txt` file  
`test_y` - activity, testing data set, table read from `test/y_test.txt` file  
`test_x` - measurement data, testing data set, table read from `test/X_test.txt` file  
`test` - assembled testing data set  
`train_test` - combined training & testing data set  
`filter` - logical filter selecting columns with "mean()" or "std()" in their header  
`train_test_tidy` - downselected training & testing data set, filtered using `filter` (see above)  
`melted` - molten `train_test_tidy` dataframe, using subject & activity as id variables  
`reshaped` - recast dataframe, by subject + activity, function = mean

### Acknowledgments and references:
#### Source Data Set Authors
>Human Activity Recognition Using Smartphones Dataset  
>Version 1.0  
>Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
>Smartlab - Non Linear Complex Systems Laboratory  
>DITEN - Universit? degli Studi di Genova.  
>Via Opera Pia 11A, I-16145, Genoa, Italy.  
>activityrecognition@smartlab.ws  
>www.smartlab.ws

#### Coursera: Getting and Cleaning Data
Course website: https://class.coursera.org/getdata-004/  
Course discussion forum: https://class.coursera.org/getdata-004/forum/list?forum_id=10009  
Instructors: Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD

#### Reference Papers
Hadley Wickham: [Tidy Data, Journal of Statistical Software](http://vita.had.co.nz/papers/tidy-data.pdf)