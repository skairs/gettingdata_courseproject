gettingdata_courseproject
=========================

_16 June 2014 -- SNK  
Coursera: Getting and Cleaning Data  
Course Project_  

Coursera: Getting and Cleaning Data -- Course Project
-----------------------------------------------------

### Reference Links:
Course website: https://class.coursera.org/getdata-004/

Data sourced from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

Hadley Wickham paper: [Tidy Data, Journal of Statistical Software](http://vita.had.co.nz/papers/tidy-data.pdf)

### Files in repo:
* `README.md` - This readme file
* `Codebook.md` - Data Directory for source and summarized data sets
* `run_analysis.R` - R script describing data cleaning process
* `submission_data.txt` - Tidy data set submitted for grading through Coursera website. Reproduced here for reference and completeness of project folder

Note: An additional readme file is available within the unzipped data directory. This readme describes the file structure of the source data.

### Manual Processing:
The downloaded zip file was placed in the working directory and unzipped to sub-directory "UCI HAR Dataset".  The name of this sub-directory is saved in the `data_directory` variable in the analysis R script.

### run_analysis.R script:
The run_analysis.R script is broken into 4 sections, each addressing a subset of the tasks required by the Course Project prompt.  

1. Section 1 
    * Merge the training and the test sets to create one data set.
    * Use descriptive activity names to name the activities in the data set.
    * Appropriately label the data set with descriptive variable names.
2. Section 2
    * Extract only the measurements on the mean and standard deviation for each measurement.
3. Section 3 
    * Creates a second, independent, tidy data set with the average of each variable for each activity and each subject
4. Section 4 
    * Writes reshaped table to txt file for submission
    
#### Section 1  
The data directory is specified as "UCI HAR Dataset", a sub-directory of the working directory as described above.

The descriptive activity names are read, as character, from `activity_labels.txt` into the `activities` variable.  Column 2 will be used to assign the factor level names for the train & test sets.

The descriptive feature names are read, as character, from `feature.txt` into the `features` variable.  Column 1 will be used to assign the column names for the train & test sets.

The train and test data sets are each broken into three files--one each for subject, y and x where subject is the test subject ID, y is the activity label and x are the measurements for each feature.  To import and assemble each data set, the following steps must be taken:  

1. Import the subject IDs, as numeric  
2. Import the activity label, as factor  
    * Replace the numeric activity label with the corresponding descriptive label from activities by renaming the factor levels  
3. Import the measurement data, as numeric, using the feature names as column names 
4. `cbind` the subject, activity and measurement data into one dataframe

The resulting `train` and `test` data sets are combined into the `train_test` data set using `rbind`.

#### Section 2  
A logical filter, `filter`, is created using `grepl()` to search the `features` vector for names including the text "mean()" or "std()".  The `features` vector is used instead of `names(train_test)` because the features names are altered in coercing them to column names (e.g. spaces and special characters are replaced with periods).  

*Note: Searching for "mean()" and "std()" is important to avoid the inclusion of features with the text "meanFreq", which do not meet the project criterion for Section 2.*

The `train_test_tidy` data set is a downselection of the `train_test` set, retaining the columns for subject, activity and each features that meets the `filter` criteria as described above.

#### Section 3  
Reshaping the data set through `melt` and `dcast` requires the `reshape2` library.

Using `melt()`, the `train_test_tidy` data frame is converted to a molten data frame for easy recasting.  `subject` and `activity` are specified as id variables, while all other columns (features) are assumed as measurement variables.

Using `dcast()`, the data frame is reshaped by `subject + activity` to give the `mean()` of each variable.  The resulting data frame, `reshaped`, is 180 rows by 68 columns.

*Note: This data set conforms with the structure of tidy datasets as described in the Hadley Wickham paper linked above.  Specifically: "Each variable forms a column.  Each observation forms a row."*

#### Section 4  
The `reshaped` data frame is written to a text file, `submission_data.txt` for submission via the course project page.  