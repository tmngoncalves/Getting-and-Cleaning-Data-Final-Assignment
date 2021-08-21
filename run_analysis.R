## Here the data is downloaded and unpacked.
fileUrl3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl3,destfile = "./data/HumanActivityRecognitionDS.zip")
unzip(zipfile="./data/HumanActivityRecognitionDS.zip",exdir="./data")

## Here the package dplyr is loaded as many of the functions of this package are
## required.
library(dplyr)

## Here the test data is loaded.
testData <- read.table("./data/UCI_HAR_Dataset/test/X_test.txt")

## Here the training data is loaded.
trainData <- read.table("./data/UCI_HAR_Dataset/train/X_train.txt")

## Here the text file with the names of the variables is loaded and altered
## in order to remove special characters that can cause problems when renaming
## the variables. Furthermore, changes are done here so that certain columns 
## can be extracted correctly later. Actually, featuresNames consists 
## only of the names of the variables; the first column has been discarded. The 
## reason this was done here is because gsub only accepts a vector as an 
## argument.
featuresNames <- gsub("Inds\\-","Inds",gsub("gravityMean","gravitymean",
                 gsub("Mean_","mean_",gsub("MeanFreq","meanFreq",gsub("\\(","",
                 gsub("\\)","",gsub("\\(t","BetweenT",gsub("\\,","_",
                 gsub("\\(\\)","",gsub("\\(\\)\\-","",gsub("\\-c","C",
                 gsub("\\-a","A",gsub("\\-i","I",gsub("\\-e","E",
                 gsub("\\-s","S",gsub("\\-m","M",gsub("\\-k","K",
                 gsub("\\-b","B",
                (read.table("./data/UCI_HAR_Dataset/features.txt"))[,2])
                )))))))))))))))))

## Here the text files with the subject identifiers, for both groups - test and 
## training groups - are loaded.
subjectTest <- read.table("./data/UCI_HAR_Dataset/test/subject_test.txt")
subjectTrain <- read.table("./data/UCI_HAR_Dataset/train/subject_train.txt")

## Here the file with the activities and its labels is loaded and altered so 
## that the activities are all lowercase, except for the activities composed of
## two words (where the first letter of the second word is uppercase). 
## Note that gsub only takes vectors as arguments.
activityLabels <- gsub("_d","D",gsub("_u","U",
                  (read.table("./data/UCI_HAR_Dataset/activity_labels.txt") %>% 
                  mutate(V2=tolower(V2)))[,2]))

## Here the activities performed by the subjects, for both the test and training
## groups are loaded.
subjectTestActivity <- read.table("./data/UCI_HAR_Dataset/test/y_test.txt")
subjectTrainActivity <- read.table("./data/UCI_HAR_Dataset/train/y_train.txt")

## Here the column names of the test data and the training data are altered, 
## since these had generic names instead of the variables names.
colnames(testData) <- featuresNames
colnames(trainData) <- featuresNames

## Here the test data and the training data are merged.
testTrainDataVersion1 <- bind_rows(testData,trainData)

## Here the data regarding the subjects for both the test and 
## training groups are merged; also a column name is given to the only 
## variable of the subject data frame. Note that the dplyr commands only accept
## data frames as arguments.
subject <- as.data.frame((rbind(subjectTest,subjectTrain))[,1])
colnames(subject) <- c("subjectIdentifier")

## Here the data regarding the activities performed by the subjects for both
## the test and training groups are merged; also a column name is given to the
## only variable of the subjectActivity data frame.
subjectActivity <- as.data.frame(gsub(6,activityLabels[6],
                   gsub(5,activityLabels[5],gsub(4,activityLabels[4],
                   gsub(3,activityLabels[3],gsub(2,activityLabels[2],
                   gsub(1,activityLabels[1],
                   (rbind(subjectTestActivity,subjectTrainActivity))[,1])))))))
colnames(subjectActivity) <- c("activity")

## Here the data frames subject, subjectActivity and testTrainDataVersion1 are
## merged together.
testTrainDataVersion2 <- bind_cols(bind_cols(subject,subjectActivity),
                                                testTrainDataVersion1)

## Here the testTrainDataVersion2 is organized in numerical ascending order with
## respect to the subjectIdentifier and when this column has identical entries, 
## then the testTrainDataVersion2 is further organized in alphabetical order 
## with respect to the activity.
testTrainDataComplete <- testTrainDataVersion2[order
                         (testTrainDataVersion2$subjectIdentifier,
                                 testTrainDataVersion2$activity),]

## Here certain variables names are selected from the variables vector, 
## featuresNames, specifically the ones corresponding to the mean of certain 
## variables. The same is done for the standard deviation. Note that grep only 
## accepts a vector as the input argument.
variablesMeanExtracted <- grep("Mean",featuresNames, value = TRUE)
variablesStdExtracted <- grep("Std",featuresNames, value = TRUE)

## Here we select the columns subjectIdentifier, activity, and all the columns 
## that correspond to the mean value and standard deviation of certain 
## variables. 
subsetMeanStdVersion1 <- select(testTrainDataComplete,subjectIdentifier,activity,
                 all_of(variablesMeanExtracted),all_of(variablesStdExtracted))

## Here the variables names are renamed in order to make these a little bit
## clearer.
subsetMeanStd <- subsetMeanStdVersion1 %>% rename(meanBodyAccX=tBodyAccMeanX,
                 meanBodyAccY=tBodyAccMeanY,
                 meanBodyAccZ=tBodyAccMeanZ,
                 meanGravityAccX=tGravityAccMeanX,
                 meanGravityAccY=tGravityAccMeanY,
                 meanGravityAccZ=tGravityAccMeanZ,
                 meanBodyAccJerkX=tBodyAccJerkMeanX,
                 meanBodyAccJerkY=tBodyAccJerkMeanY,
                 meanBodyAccJerkZ=tBodyAccJerkMeanZ,
                 meanBodyAngVelocityX=tBodyGyroMeanX,
                 meanBodyAngVelocityY=tBodyGyroMeanY,
                 meanBodyAngVelocityZ=tBodyGyroMeanZ,
                 meanBodyAngVelocityJerkX=tBodyGyroJerkMeanX,
                 meanBodyAngVelocityJerkY=tBodyGyroJerkMeanY,
                 meanBodyAngVelocityJerkZ=tBodyGyroJerkMeanZ,
                 meanBodyAccMagnitude=tBodyAccMagMean,
                 meanGravityAccMagnitude=tGravityAccMagMean,       
                 meanBodyAccJerkMagnitude=tBodyAccJerkMagMean,
                 meanBodyAngVelocityMagnitude=tBodyGyroMagMean,
                 meanBodyAngVelocityJerkMagnitude=tBodyGyroJerkMagMean,
                 meanFTBodyAccX=fBodyAccMeanX,
                 meanFTBodyAccY=fBodyAccMeanY,
                 meanFTBodyAccZ=fBodyAccMeanZ,
                 meanFTBodyAccJerkX=fBodyAccJerkMeanX,
                 meanFTBodyAccJerkY=fBodyAccJerkMeanY,
                 meanFTBodyAccJerkZ=fBodyAccJerkMeanZ,
                 meanFTBodyAngVelocityX=fBodyGyroMeanX,
                 meanFTBodyAngVelocityY=fBodyGyroMeanY,
                 meanFTBodyAngVelocityZ=fBodyGyroMeanZ,
                 meanFTBodyAccMagnitude=fBodyAccMagMean,
                 meanFTBodyAccJerkMagnitude=fBodyBodyAccJerkMagMean,
                 meanFTBodyAngVelocityMagnitude=fBodyBodyGyroMagMean,
                 meanFTBodyAngVelocityJerkMagnitude=fBodyBodyGyroJerkMagMean,
                 SdBodyAccX=tBodyAccStdX,
                 SdBodyAccY=tBodyAccStdY,
                 SdBodyAccZ=tBodyAccStdZ,
                 SdGravityAccX=tGravityAccStdX,
                 SdGravityAccY=tGravityAccStdY,
                 SdGravityAccZ=tGravityAccStdZ,
                 SdBodyAccJerkX=tBodyAccJerkStdX,
                 SdBodyAccJerkY=tBodyAccJerkStdY,
                 SdBodyAccJerkZ=tBodyAccJerkStdZ,
                 SdBodyAngVelocityX=tBodyGyroStdX,
                 SdBodyAngVelocityY=tBodyGyroStdY,
                 SdBodyAngVelocityZ=tBodyGyroStdZ,
                 SdBodyAngVelocityJerkX=tBodyGyroJerkStdX,
                 SdBodyAngVelocityJerkY=tBodyGyroJerkStdY,
                 SdBodyAngVelocityJerkZ=tBodyGyroJerkStdZ,
                 SdBodyAccMagnitude=tBodyAccMagStd,          
                 SdGravityAccMagnitude=tGravityAccMagStd,
                 SdBodyAccJerkMagnitude=tBodyAccJerkMagStd,      
                 SdBodyAngVelocityMagnitude=tBodyGyroMagStd,
                 SdBodyAngVelocityJerkMagnitude=tBodyGyroJerkMagStd,
                 SdFTBodyAccX=fBodyAccStdX,
                 SdFTBodyAccY=fBodyAccStdY,
                 SdFTBodyAccZ=fBodyAccStdZ,
                 SdFTBodyAccJerkX=fBodyAccJerkStdX,
                 SdFTBodyAccJerkY=fBodyAccJerkStdY,
                 SdFTBodyAccJerkZ=fBodyAccJerkStdZ,
                 SdFTBodyAngVelocityX=fBodyGyroStdX,
                 SdFTBodyAngVelocityY=fBodyGyroStdY,
                 SdFTBodyAngVelocityZ=fBodyGyroStdZ,
                 SdFTBodyAccMagnitude=fBodyAccMagStd,
                 SdFTBodyAccJerkMagnitude=fBodyBodyAccJerkMagStd,
                 SdFTBodyAngVelocityMagnitude=fBodyBodyGyroMagStd,
                 SdFTBodyAngVelocityJerkMagnitude=fBodyBodyGyroJerkMagStd)

## Here a txt file is created with 68 variables, which are named at the top 
## and with 10299 rows of data.
write.table(subsetMeanStd,
            file="./data/MeanStandardDeviationKinematicVariables.txt",
            row.names=FALSE,col.names=TRUE)

## Here the average of each variable is calculated and given for each subject 
## and each activity.
group_cols <- c("subjectIdentifier","activity")
meanPerSubjectPerActivity <- subsetMeanStd %>% 
                             group_by(across(all_of(group_cols))) %>%
                             summarize_if(is.numeric,mean,na.rm=TRUE)

## Here a txt file is created with 68 variables, which are named at the top and 
## with 180 rows of data.
write.table(meanPerSubjectPerActivity,
            file="./data/SummaryKinematicVariables.txt",
            row.names=FALSE, col.names = TRUE)

