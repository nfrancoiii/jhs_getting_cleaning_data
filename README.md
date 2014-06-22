jhs_getting_cleaning_data
=========================

This repository is for work related to the Getting and Cleaning Data Coursera unit provided by Johns Hopkins University.

The file titled 'run_analysis.R' is the working document produced for the course project for this course. 

The file begins by loading in data from accelerometers in Samsung Galaxy X phones for analysis. 
The file reads in each of the data files (x_test,x_train, y_test, y_train, subject_test, and subject_train). The file then reads in the 'features' file which contains the names of the 561 columns for the x_test and x_train data sets. The y_train and y_test data sets contain an Activity ID and te subject_train and subject_test data sets contain Subject IDs. These columns are labeled as such. 

The data is then merged together to create a dataframe called 'merged_Data'.

The next task is to keep only the columns that pertain to standard deviations and means. The activity and subject IDs are obviously kept as well. The result is a dataframe labeled 'keepCols'.

The next task is to change the numeric activity ID values to descriptive ID values. The working document achieves this through a looping function, subsetting out each activity from the 'keepCols' dataframe and merging them back together as a dataframe 'labeled_Data'.

The final task is to create a tidy data set that includes an average for each activity, for each subject, for each activity.  This task is done using the melt and dcast commands to melt the data on the id values activity and subject. The result is a dataframe 'tidyData' with dimensions 180 68. 
