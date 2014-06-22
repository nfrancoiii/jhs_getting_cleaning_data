#Getting and Cleaning Data
#Course Project

setwd("C:\\Users\\Owner\\Google Drive\\PROGRAMMING_SKILLS\\R\\Coursera\\GettingAndCleaningData\\Course_Project\\UCI HAR Dataset")

#1. Merges the training and the test sets to create one data set.

#1.1 Read in the test and train datasets
x_test <- read.table("C:\\Users\\Owner\\Google Drive\\PROGRAMMING_SKILLS\\R\\Coursera\\GettingAndCleaningData\\Course_Project\\UCI HAR Dataset\\test\\X_test.txt")
y_test <- read.table("C:\\Users\\Owner\\Google Drive\\PROGRAMMING_SKILLS\\R\\Coursera\\GettingAndCleaningData\\Course_Project\\UCI HAR Dataset\\test\\y_test.txt")
subject_test <- read.table("C:\\Users\\Owner\\Google Drive\\PROGRAMMING_SKILLS\\R\\Coursera\\GettingAndCleaningData\\Course_Project\\UCI HAR Dataset\\test\\subject_test.txt")
x_train <- read.table("C:\\Users\\Owner\\Google Drive\\PROGRAMMING_SKILLS\\R\\Coursera\\GettingAndCleaningData\\Course_Project\\UCI HAR Dataset\\train\\X_train.txt")
y_train <- read.table("C:\\Users\\Owner\\Google Drive\\PROGRAMMING_SKILLS\\R\\Coursera\\GettingAndCleaningData\\Course_Project\\UCI HAR Dataset\\train\\y_train.txt")
subject_train <- read.table("C:\\Users\\Owner\\Google Drive\\PROGRAMMING_SKILLS\\R\\Coursera\\GettingAndCleaningData\\Course_Project\\UCI HAR Dataset\\train\\subject_train.txt")

#1.2 Rename the columns to have readable labels
features <- read.table("C:\\Users\\Owner\\Google Drive\\PROGRAMMING_SKILLS\\R\\Coursera\\GettingAndCleaningData\\Course_Project\\UCI HAR Dataset\\features.txt") 
colnames(x_train) <- features[,2]
colnames(x_test) <- features[,2]
colnames(y_train) <- "Activity_ID"
colnames(y_test) <- "Activity_ID"
colnames(subject_train) <- "Subject_ID"
colnames(subject_test) <- "Subject_ID"

#1.3 Merge the test data sets together and merge the train data sets together
test_data <- cbind(x_test,y_test, subject_test)
train_data <- cbind(x_train, y_train, subject_train)

#1.4 Merge the test and train data sets together
merged_Data <- rbind(test_data, train_data)



#2. Extracts only the measurements on the mean and standard deviation for 
#   each measurement.

#2.1 Use the grepl() command to subset out all the columns containing 'mean' and 'std'
keepCols <- merged_Data[,grepl("mean|std|_ID", names(merged_Data))]

#2.2 The call in 2.1 leaves the data set containing "meanFreq" variable. Use the grepl
# command again to remove them.
keepCols <- keepCols[,!grepl("meanFreq", names(keepCols))]


#3. Uses descriptive activity names to name the activities in the data set.

#3.1 Read in the 'activity_labels' data set
activity_labels <- read.table("C:\\Users\\Owner\\Google Drive\\PROGRAMMING_SKILLS\\R\\Coursera\\GettingAndCleaningData\\Course_Project\\UCI HAR Dataset\\activity_labels.txt")

#3.2 Substitute the labels in the activity labels data set into the "Activity" column of the tidy data set.
# I do this by looping through Activities [1:6], subsetting each at a time and replacing 
# the value with the appropriate value in the activity_labels data set.

#create an empty data frame to save the subsetted data frames
labeled_Data <- data.frame()
for (i in 1:6){
        #create temporary df with a single activity type
        temp<- subset(keepCols, keepCols$Activity_ID == i) 
        #change the activity variable value to have the value from the activity_labels file
        temp$Activity_ID <- activity_labels[[i,2]]
        #set the 'labeled_data' equal to the current value merged with the 'i'th value
        labeled_Data <- rbind(labeled_Data, temp)
}

#4. Appropriately labels the data set with descriptive variable names.
#SEE SECTION 1.2

#5. Creates a second, independent tidy data set with the average of each 
#   variable for each activity and each subject.

#5.1 melt the data set with the id values for activity and subject
melty <- melt(labeled_Data, id = c("Activity_ID","Subject_ID"))

#5.2 dcast the data set for each measure variable performing a mean function
tidyData <- dcast(melty, Subject_ID + Activity_ID ~ variable, mean)

#5.3 Export the tidyData dataframe
write.table(tidyData,"C:\\Users\\Owner\\Google Drive\\PROGRAMMING_SKILLS\\R\\Coursera\\GettingAndCleaningData\\Course_Project\\tidyData.txt")




