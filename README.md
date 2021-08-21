## Summary of kinematic variables per subject and activity performed

The R code in the run_analysis.R file in the Github repository
*[Getting-and-Cleaning-Data-Final-Assignment](https://github.com/tmngoncalves/Getting-and-Cleaning-Data-Final-Assignment)*
allows to produce a summary of the mean value of the kinematic variables, presented in the CodeBook.md file, for each volunteer and each activity performed in the 
experiment carried out by Anguita et al. For details on this experiment and how
the data was collected and processed see the README.txt file in
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.
 
However, to try and make the explanation of this code self-contained, some 
explanations regarding the variables are given in the CodeBook.md (present in 
the above-mentioned repo), which should be read first. Next are listed, chronologically, the different steps that are taken in order to obtain the data 
set regarding the summary of the mean value of the kinematic variables per 
subject and activity. 

1. First, the data is downloaded and unpacked in the data folder of the working 
directory. Also, as many of the functions present in the *dplyr* package are 
necessary, this package is loaded;

2. Before loading the data, the files downloaded were examined and the following 
was observed: 
 * there are two groups of data to consider: the data from the group of 
 volunteers responsible for generating the training data (21 volunteers) and the 
 data from the group of volunteers responsible for generating the test data (9
 volunteers);
 * the X_test.txt and the X_train.txt both contain 561 columns, corresponding 
 to the variables present in the features.txt file, obviously organized in the 
 same order;
 * the number of rows in the X_test.txt, subject_test.txt and y_test.txt is the 
 same and this number corresponds to the number of window samples per subject 
 and activity performed for all volunteers in the group generating the test 
 data;
 * similarly, the number of rows in the X_train.txt, subject_train.txt and
 y_train.txt is the same and this number corresponds to the number of window 
 samples per subject and activity performed for all volunteers in the group
 generating the training data;
 * the volunteers are identified by a number between 1 and 30, and it is these
 values that show up in the subject_test.txt and subject_train.txt files;
 * the activities performed by the volunteers are identified by numbers and the
 correspondence between activities and those numbers is reported in the
 activity_labels.txt;
 * the activities performed by the two groups of volunteers are listed in the 
 files y_test.txt and y_train.txt;

3. The files X_test.txt, X_train.txt, subject_test.txt, subject_train.txt, y_test.txt and y_train.txt are loaded with the read.table command, as the files'
extension is txt, and renamed testData, trainData, subjectTest, subjectTrain, subjectTestActivity and subjectTrainActivity, respectively;

4. The file features.txt is loaded and renamed, featuresNames. Simultaneously, 
it is transformed so that all special characters are removed from the variables names and also to simplify the extraction of the variables of interest. The 
special characters have to be removed, otherwise they will cause errors when 
using the command rename (in *dplyr*);

5. The file activity_labels.txt is loaded and renamed activityLabels.  Simultaneously, this is transformed so that all the activities' names appear in lowercase, except for the activities named with two words, where the first 
letter of the second word comes in uppercase. Note that the new data frame 
obtained in this step only contains the column with the name of the activities;

6. After loading all the files, the column names of the testData and the 
trainData data frames are renamed with names present in the featuresNames. Subsequently, those two data frames are merged row-wise.

7. Similarly, the subjectTest and subjectTrain are merged row-wise and a name 
is attributed to its column;

8. The data frames subjectTestActivity and subjectTrainActivity are also merged, 
but with a difference: the activity labels are substituted by their respective 
names. A new name is also attributed to the variable of this merged data frame;

9. The data frames merged in the three previous steps are merged in one data 
frame. Following this, the new data frame is reordered so that the first column 
comes in numerical ascending order and when the elements of the first column are 
repeated, then the data frame is reordered so that the second column is ordered 
in alphabetical ascending order;

10. In order to extract the variables of interest from the data frame, testTrainDataComplete, two vectors were created, one to extract variables
regarding the mean of certain measurements and the other to extract the 
variables regarding the standard deviation of those same measurements;

11. Using the vectors created in the previous step, a new data frame is 
created, with the variables of interest only. The variables names of this new
data frame are altered in order to make these clearer. However, some 
simplification had to be kept, otherwise the names of the variables would be too long. This tidy data set is in the txt file named MeanStandardDeviationKinematicVariables.txt;

12. A summary of the data set in the previous step was generated: the data in 
this new data set corresponds to the mean of each variable for all window 
samples per subject and activity. This set is stored in the file named SummaryKinematicVariables.txt;

12. More specific informations can be found in the run_analysis.R file.






 
