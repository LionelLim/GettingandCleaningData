#CodeBook for run_analysis.R script that generates tidy_data dataset


##Data Source
The data is Human Activity Recognition Using Smartphones Dataset	

The data obtained from the link provided below:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The dataset includes :
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training dataset.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test dataset.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


##Variables
describes the variables, the data, and any transformations or work that you performed to clean up the data 


##Transformation


##Output
The output for the scipt is a space delimited text file with " text quotes


##Additional Notes 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws