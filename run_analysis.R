run_analysis.R <- function()
{
  ## QUESTION 1

## 1. LOAD THE 3 PARTS FOR TRAIN (X, Y, subject)

Xtrain = read.table("train/X_train.txt", sep = "")
Ytrain = read.table("train/y_train.txt", sep = "")
Names_train = read.table("train/subject_train.txt", sep = "")

## 1.1 Assign column names to the files

## This step also works for Step 4 (renaming the columns)

temp_train = read.table("features.txt", sep = "")
attributeNames = temp_train$V2

names(Xtrain) = attributeNames
names(Ytrain) = "Activity"
names(Names_train) = "subject"

## 1.2 ASSIGN THE LEVELS FOR Y TRAIN
##     THIS STEP ALSO WORK FOR STEP 3 (RENAMING ACTITIVIES)

  ## 1.2.1 LEVELS "Y" Part 1
Activities_temp = read.table("activity_labels.txt", sep = "")
Activities = as.character(Activities_temp$V2)

  ## 1.2.2 LEVELS "Y" Part 2
Ytrain$Activity = as.factor(Ytrain$Activity)
levels(Ytrain$Activity) = Activities

## 1.3 Assign the levels for subjects
Names_train$subject = as.factor(Names_train$subject)

## 1.4 bind all files
Train <- cbind(Xtrain, Ytrain, Names_train)

## 1.5 Assign the column "Source" to indicate where the data comes from
Train$Source = "Train"

## 2 Load the 3 parts for "Test" (X, Y, subject)
xtest <- read.table("test/X_test.txt", sep ="")
ytest <- read.table("test/y_test.txt", sep = "")
Names_test <- read.table("test/subject_test.txt", sep = "")

## 2.1 Assign column names
## This step also works for Step 4 (renaming the columns)

temp_test = read.table("features.txt", sep = "")
attributeNames_test = temp_test$V2

names(xtest) = attributeNames_test
names(ytest) = "Activity"
names(Names_test) = "subject"

## 2.2 Assign levels to "Y test"
##     THIS STEP ALSO WORK FOR STEP 3 (RENAMING ACTITIVIES)

ytest$Activity = as.factor(ytest$Activity)
levels(ytest$Activity) = Activities

## 2.3 ASSIGN LEVELS TO "SUBJECTS"
Names_test$subject = as.factor(Names_test$subject)

## 2.4 bind all files
Test <- cbind(xtest, ytest, Names_test)

## 2.5 Assign the column "Source" to indicate where the data comes from
Test$Source = "Test"

## 3. put "Train" and "Test" together
ONE_DS <- rbind(Train, Test)

## QUESTION 2: EXTRACT ONLY MEANS AND STD
Extract1<- subset(ONE_DS, select= c(grep("mean",colnames(ONE_DS)), grep("std", colnames(ONE_DS))))

## QUESTION 5: CREATE A SECOND TIDY DATA SET
library(reshape2)

  ## The following line creates a "melted" data frame, using the "melt" function
MeltedData <- melt(ONE_DS, id.vars = c("subject", "Activity"))

  ## The following line changes the attribute of the "value" column, in order to being able to perform calculations
MeltedData$value <- as.numeric(MeltedData$value, na.rm = TRUE)

  ## The following line creates a df for the mean of each variable, by subject and Activity
TidyData <- dcast(MeltedData, subject + Activity ~ variable, mean, na.rm = TRUE )

  ## Same as past lane, except this line is for the Standard Deviation
TidyData2 <- dcast(MeltedData, subject + Activity ~ variable, sd, na.rm = TRUE )

  ## Adding a text label to the columns, in order to differieting them
colnames(TidyData2)[-c(1:2)] <- paste(colnames(TidyData2)[-c(1:2)], "_std", sep="")

  ## This line removes the first two columns (subject and Activity)
  ## in order to not having repeated in the final Data Frame
TidyData3 <- subset(TidyData2, select = -c(1:2))

  ## Creates the final Tidy Data
FinalTidyData <- cbind(TidyData, TidyData3)

  ## Saves the final Tidy Data to a csv file
write.table(FinalTidyData, file = "dataset2.txt", sep=",")
}