
##Coursera Getting and Cleaning Data Course Project Code Book

##The raw datasets
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

##Identifiers
- subject - The ID of the test subject
- activity - The type of activity performed when the corresponding measurements were taken

##Activity Labels
- WALKING (value 1): subject was walking during the test
- WALKING_UPSTAIRS (value 2): subject was walking up a staircase during the test
- WALKING_DOWNSTAIRS (value 3): subject was walking down a staircase during the test
- SITTING (value 4): subject was sitting during the test
- STANDING (value 5): subject was standing during the test
- LAYING (value 6): subject was laying down during the test

##Data Transformation

The raw datasets are processed with run_analisys.R script to create a tidy data set;

- Then you should download and unzip the datasets.
- As the datasets are ready now, you can load activity labels and features.
- Time to extract only the data on mean and standard deviation 
- You can use grep to search for "mean (mean)" and "standart deviation (std)".
- You can load the datasets for traning and combine them with cbind.
- You can load the datasets for test and combine them with cbind.
- As both training and test combined datasets are ready.
- You can merge datasets and add labels:
- Then you turn subjects and subjects into factors.
- You form with "melt" into a suitable shape to reshape with "dcast.
- Finally you create the tidy data with "write.table" as tidy.txt.
