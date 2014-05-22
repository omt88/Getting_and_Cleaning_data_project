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

