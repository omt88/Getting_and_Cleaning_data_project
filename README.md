Getting_and_Cleaning_data_project
=================================
OBJECTIVE
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. 

You will be required to submit: 
    1) a tidy data set as described below, 
    2) a link to a Github repository with your script for performing the analysis, and 
    3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
    
    You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

RUNNING THE SCRIPT
run_analysis.R

The script (run_analysis.R) does the following:

    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement.
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive activity names.
    Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Running the script:

Unzip the source ( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )

into a folder on your local drive, say C:\Users\yourname\Documents\R\

This should create a folder named "UCI HAR Dataset" which includes all the files needed to perform the analysis (2 subfolders and several txt files)

Put run_analysis.R to ~\R\UCI HAR Dataset\

in RStudio: setwd("C:\\Users\\yourname\\Documents\\R\\UCI HAR Dataset\\")

and then: source("run_analysis.R")
The latter will run the R script, it will read the dataset and create these file:

dataset2.csv

UNDERSTANDING "UCI HAR Dataset"

Before start working with R, it is very important to understand the structure of the study.
What the variables (Which will be our columns) are, are not as important as how the whole data set is structured.
If you want to know more about what the variables read the file "README.txt" and "features_info.txt"

What is important is:

1) The whole study consists in a universe of 10,299 entries.
2) The "universe" is created from a matrix of 6 files (3 for the sub-universe "Train" and 3 for the sub-universe "Test")
3) Each "sub-universe" contains the same "features" (or variables, or number of columnsm, if you like)
4) There should be a total of 563 "features" in each sub-universe.
5) Each of the sub-universe, are also composed by 3 files (X, Y, Subject)
5.1) You can imagine the hole universe as:

         |     1       |       2       |       3
Train          X               Y              Subject
Test           X               Y              Subject

6) X contains most of the features, with values extracted from the GPS information (for more info about this, read "README.txt)
7) Y contains the Activity done during the extractions of each "particle"
8) "Subject" contains the number of the subject from where the data was obtained.
9) Since the original data does not contains the names of the column, these should be replaced.

HOW IT WORKS:

The script performs the following steps:

1) Upload the 3 "train" txt files, into their correspondingn R variables
2) Renames the columns, 2 files only contains 1 columns, and 1 file (xtrain) the columns are replaced using a vector created from another txt file
3) Assign the levels to the "ytrain" file (this also responds to point 4).
4) Assign the levels to "subject"file
5) Put together the 3 files, in order to create one Data Sate for "Train"
6) Add and extra column named "Train" to the full DS, in order to identify the source (EXTRA POINTS ? =D) 
7) Repeat steps 1-6 but for "Test" files
8) Create one single file with the full data sets from "Train" and "Test"
9) Creates an internal variable named "Extract1" which includes only the columns that has a "mean" or "std" in the tittle.
10) Using temporal "melted" variables, create a csv file called "FinalTidyData", which contains all the means and Standard deviations for all the variables (columns) for each subject and activity.






