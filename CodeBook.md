#CodeBook for run_analysis.R script that generates tidy_data dataset


##Data Source
The data used is collected using smartphones regarding Human Activity.

The data is obtained from the link provided below:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The dataset includes :
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training dataset.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test dataset.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

##Features
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 

These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 

Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

##Transformation
The features.txt was being used as the column names for the respective data sets

The y_train.txt and y_test.txt were used as the row labels and the activity_labels.txt was being use as a reference to resolve the activities ID in the respective label files (i.e. "y_").

The subject, activities and datasets (i.e. x files) were binded together as a complete set before the test and train datasets are merged.

##Output
The final output of the script merges the Training and Test data sets into a single dataset. 

The output file contains the average value of the features's mean and std information for each subject and each activity. The average features are as follows:
- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The output for the scipt is a space delimited text file with " text quotes. The name of file is tidy_data.txt.


##Additional Notes 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws