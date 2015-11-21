## Getting and Cleaning Data
### Course Project 

The R code does the following:    
1. Reads all data from test and training folder, including:   
  * features.txt    
  * activity_labels.txt    
  * x.txt (train and test)    
  * y.txt (train and test)   
  * subject.txt (train and test)   
2. Merges the training and the test sets to create one data set.   
3. Extracts only the measurements on the mean and standard deviation for each measurement.    
4. Uses descriptive activity names to name the activities in the data set.  
5. Appropriately labels the data set with descriptive variable names.    
6. From the data set in previous, creates a second, independent tidy data (tidy dataset.txt) set with the average of each variable for each activity and each subject.     