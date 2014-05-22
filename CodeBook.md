HOW IT WORKS:

The script performs the following steps:

1) Upload the 3 "train" txt files, into their correspondingn R variables 
>2) Renames the columns, 2 files only contains 1 columns, and 1 file (xtrain) the columns are replaced using a vector created from another txt file 
>3) Assign the levels to the "ytrain" file (this also responds to point 4). 4) Assign the levels to "subject"file 5) Put together the 3 files, in order to create one Data Sate for "Train" 6) Add and extra column named "Train" to the full DS, in order to identify the source (EXTRA POINTS ? =D) 7) Repeat steps 1-6 but for "Test" files 8) Create one single file with the full data sets from "Train" and "Test" 9) Creates an internal variable named "Extract1" which includes only the columns that has a "mean" or "std" in the tittle. 10) Using temporal "melted" variables, create a csv file called "FinalTidyData", which contains all the means and Standard deviations for all the variables (columns) for each subject and activity.

The following variables are used in the script:

Xtrain = Variable where all data from "X_train.txt" is allocated
Ytrain = Variable where all data from "Y_train.txt" is allocated
Names_train = Variable where the subject_train values are allocated

Train = Variable created to put together all 3 files for "train"
Test = Variable created to put together all 3 files for "test"

ONE_DS = Variable containing ALL data

Extract1 = Data frame created selecting only variables with "mean" and "std"
MeltedData = Data frame created after using the "melt" method
TidyData = The mean for each variable by each subject and Activity
TidyData2 = Same as TidyData, except using "Standard deviation"
TidyData3 3 = To remove the first two columns from TidyData2
FinalTidyData = Final file

