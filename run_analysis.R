features<-read.table("UCI HAR Dataset/features.txt")
activity<-read.table("UCI HAR Dataset/activity_labels.txt")

ytrain<-read.table("UCI HAR Dataset/train/y_train.txt",col.names = "activity")
xtrain<-read.table("UCI HAR Dataset/train/x_train.txt",col.names = features$V2)
subjecttrain<-read.table("UCI HAR Dataset/train/subject_train.txt",col.names = "subject")

ytest<-read.table("UCI HAR Dataset/test/y_test.txt",col.names = "activity")
xtest<-read.table("UCI HAR Dataset/test/x_test.txt",col.names = features$V2)
subjecttest<-read.table("UCI HAR Dataset/test/subject_test.txt",col.names = "subject")

#1. Merges the training and the test sets to create one data set.
mega<-rbind(cbind(subjecttrain,ytrain,xtrain),cbind(subjecttest,ytest,xtest))


#2. Extracts only the measurements on the mean and standard deviation for each measurement. 

name<- grep("mean\\.\\.|std\\.\\.",names(mega),value = TRUE)
mega.extract<-mega[,c("subject","activity",name)]


#3. Uses descriptive activity names to name the activities in the data set
colnames(activity)<-c("activity.code","activity.name")
mega.extract<-merge(activity,mega.extract,by.x = "activity.code",by.y = "activity")

#4.Appropriately labels the data set with descriptive variable names. 

#Note: not much to do here. Labels are already created when reading the dataset in. So I just removed some dots in the name
names(mega.extract)<-sub("\\.\\.","",names(mega.extract))

#5. From the data set in step 4, creates a second, independent tidy data set with the average 
#of each variable for each activity and each subject.
tidy<-aggregate(x=mega.extract[,c(-1,-2,-3)], by=list(mega.extract$activity.name,mega.extract$subject),mean)
names(tidy)[1:2]<-c("activity.name","subject")

write.table(tidy,file="tidy dataset.txt",row.names = FALSE)

