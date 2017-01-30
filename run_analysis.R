install.packages("reshape2")
library(reshape2) 

## First set your working directory or be sure that you are your working directory
setwd("C:/Pinar/MY/Coursera/R Programming/data")
getwd()


fileset <- "getdata_dataset.zip" 

## Then you should download and unzip the datasets: 

install.packages("unzip")
if (!file.exists(fileset)){ 
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip " 
  download.file(fileURL, fileset, method="auto") 
}   
if (!file.exists("UCI HAR Dataset")) {  
  unzip(fileset, files = NULL, list = FALSE, overwrite = TRUE,
        junkpaths = FALSE, exdir = ".", unzip = "internal",
        setTimes = FALSE)
   } 


# As the datasets are ready now, you can load activity labels and features:
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt") 
activityLabels
activityLabels[,2] <- as.character(activityLabels[,2]) 
features <- read.table("UCI HAR Dataset/features.txt") 
features
features[,2] <- as.character(features[,2]) 

# Time to extract only the data on mean and standard deviation 
#You can use grep to search for "mean (mean)" and "standart deviation (std)".

featuresExpected <- grep(".*mean.*|.*std.*", features[,2]) 
featuresExpected.names <- features[featuresExpected,2] 
featuresExpected.names = gsub('-mean', 'Mean', featuresExpected.names) 
featuresExpected.names = gsub('-std', 'Std', featuresExpected.names) 
featuresExpected.names <- gsub('[-()]', '', featuresExpected.names) 


# You can load the datasets for traning and combine them with cbind as follows:
#"head" added to see what the data you load looks like
train <- read.table("UCI HAR Dataset/train/X_train.txt")[featuresExpected] 
head(train)
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt") 
head(trainActivities)
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt") 
head(trainSubjects)
train <- cbind(trainSubjects, trainActivities, train) 
head(train)

# You can load the datasets for test and combine them with cbind as follows:
#"head" added to see what the data you load looks like
test <- read.table("UCI HAR Dataset/test/X_test.txt")[featuresExpected] 
head(test)
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt") 
head(testActivities)
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt") 
head(testSubjects)
test <- cbind(testSubjects, testActivities, test) 
head(test)

# As both training and test combined datasets are ready,
# you can merge datasets and add labels:
Train_Test_Comb <- rbind(train, test) 
colnames(Train_Test_Comb) <- c("subject", "activity", featuresExpected.names) 
head(Train_Test_Comb)

# It is time to turn subjects and subjects into factors:
Train_Test_Comb$activity <- factor(Train_Test_Comb$activity, levels = activityLabels[,1], labels = activityLabels[,2]) 
Train_Test_Comb$subject <- as.factor(Train_Test_Comb$subject) 
head(Train_Test_Comb$activity)
head(Train_Test_Comb$subject)

#You form with "melt" into a suitable shape to reshape with "dcast.
Train_Test_Comb.melted <- melt(Train_Test_Comb, id = c("subject", "activity")) 
Train_Test_Comb.mean <- dcast(Train_Test_Comb.melted, subject + activity ~ variable, mean) 

head(Train_Test_Comb.melted)
head(Train_Test_Comb.mean)

## Finally you create the tidy data with "write.table" as tidy.txt.
write.table(Train_Test_Comb.mean, "tidy.txt", row.names = FALSE, quote = FALSE) 
head(Train_Test_Comb.mean)
