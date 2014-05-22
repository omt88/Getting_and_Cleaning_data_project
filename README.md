Getting_and_Cleaning_data_project
=================================
run_analysis.R

The cleanup script (run_analysis.R) does the following:

    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement.
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive activity names.
    Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Running the script:

Unzip the source ( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )

into a folder on your local drive, say C:\Users\yourname\Documents\R\

Put run_analysis.R to C:\Users\yourname\Documents\R\UCI HAR Dataset\

in RStudio: setwd("C:\\Users\\yourname\\Documents\\R\\UCI HAR Dataset\\")

and then: source("run_analysis.R")
The latter will run the R script, it will read the dataset and write these files:

dataset2.csv
