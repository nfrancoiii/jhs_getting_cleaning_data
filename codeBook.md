This is a codebook for the Course Project in the Getting and Cleaning Data course.
The corresponding project file is named 'run_analysis.R' and is located in this repository.
The data used for this project can be found at this url: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The variables used in this project include the following:

Activity_ID: this is created from merging the data sets y_test and y_train. It has been transformed from a numeric value to a descriptive variable using the key
located in the 'activity_labels.txt' file.

Subject_ID: this is created from merging the data sets subject_test and subject_train. It contains a numeric id number for the subjects in the sample.

*mean() + *std(): the measure variables included are a subset of the original data set. 
These variables are limited to variables containing the strings "mean()" and "std()". The assignment is only concerned with these
measure variables. 
The measure variable columns are the means by subject and by activity.
