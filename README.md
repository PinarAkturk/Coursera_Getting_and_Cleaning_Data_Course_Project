# Coursera_Getting_and_Cleaning_Data_Course_Project

##Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers 
on a series of yes/no questions related to the project. You will be required to submit: 
- 1) a tidy data set as described below, 
- 2) a link to a Github repository with your script for performing the analysis, and 
- 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up 
the data called CodeBook.md. You should also include a README.md in the repo with your scripts. 
This repo explains how all of the scripts work and how they are connected.

##The dataset to work on includes the following files:

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


##The R script, run_analysis.R, does the following activities:

- a) Downloads the dataset if it does not already exist in your working directory
- b) Loads the activity and feature info
- c) Loads both the training and test datasets, keeping only those columns which reflect a mean or standard deviation
- d) Loads the activity and subject data for each dataset, and merges those columns with the dataset
- e) Merges the two datasets
- f) Converts the activity and subject columns into factors
- g) Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.
- The end result is shown in the file tidy.txt as it can be seen at the repo.


Finally this repository includes:
- CodeBook.md: Info about raw and tidy datasets and all the activities to transform these datasets.
- LICENSE: license terms for text and code
- README.md: It is this file.
- run_analysis.R: R script to transform raw data set in a tidy dataset.
