#Loading the necessary library
library(data.table)

#Download the files from Internet directly 
#Follow by unzipping the file within the working directory
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,"data.zip")
unzip("data.zip")

## Reading the activities label file into "activity_labels"
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)

## Reading the features file into "features"
features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)


#----------------------------------------------------------------#
#Creating a data loading function to load the data               #
#This function will only load the test data if arg is not defined#
#----------------------------------------------------------------#

loaddata_function <- function(type="test"){
  ###Reading the test data sets. 
  x <- read.table(paste0("./UCI HAR Dataset/", type, "/X_", type,".txt"), header=FALSE)
  
  ###Setting the name for the columns
  names(x) = features[,2]
  
  ###Determine which columns contains mean or std keywords
  meanstd_features <- grepl("mean|std", features[,2])
  
  ###Dropping all the columns where the keywords are false
  x = x[,meanstd_features]
  
  ###Reading the test labels
  y <- read.table(paste0("./UCI HAR Dataset/", type, "/y_", type,".txt"), header=FALSE)
  
  ###Appending the matching activities names into a new column and renaming the columns
  y[,2] = activity_labels[y[,1],2]
  names(y) = c("Activity_ID","Activity_Name")
  
  ###Reading the test subjects
  subject <- read.table(paste0("./UCI HAR Dataset/", type, "/subject_", type,".txt"), header=FALSE)
  names(subject) = 'Subject'
  
  ###merging the subject, activity and data into a single test data set
  loaded_data <- cbind(subject, y, x)
  return(loaded_data)
}

#----------------------------------------------------------------#


##Loading and merging the training and the test sets to create one full data set.
full_data <- rbind(loaddata_function("test"),loaddata_function("train"))

###Dropping unnecessary data and data sets after loading
rm(url)
rm(activity_labels)
rm(features)


#Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
summation <- aggregate(full_data[,4:82], by=list(full_data$Subject, full_data$Activity_ID, full_data$Activity_Name), FUN=mean)

#Inputting the column names back to the summation data
temp_colnames <- colnames(full_data)
names(summation) = temp_colnames

#Exporting the computed data into text file tidy_data.txt
write.table(summation, file = "tidy_data.txt", row.name=FALSE)
