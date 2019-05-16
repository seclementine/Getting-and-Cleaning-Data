dir<-getwd()
urlziparchive<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(urlziparchive ,destfile = "zippedfile.zip")
unzip("zippedfile.zip")


train<- read.table("../UCI HAR Dataset/train/X_train.txt")
trainlabels<- read.table("../UCI HAR Dataset/train/y_train.txt")
strain<- read.table("../UCI HAR Dataset/train/subject_train.txt")

xtest<- read.table("../UCI HAR Dataset/test/X_test.txt")
testlabels<- read.table("../UCI HAR Dataset/test/y_test.txt")
stest<- read.table("../UCI HAR Dataset/test/subject_test.txt")

features<- read.table("../UCI HAR Dataset/features.txt")
trainingdata<-cbind(datatype = "Training", activity = trainlabels$V1, subject = strain$V1, train)
testdata<-cbind(datatype = "Testing", activity = testlabels$V1, subject = stest$V1, xtest)

##Merges the training and the test sets to create one data set.
together<- merge(trainingdata, testdata, all = TRUE)
featchar<-as.character(features$V2)
names(together)<-c("datatype", "activity", "subject", featchar)

##Extracts only the measurements on the mean and standard deviation for each measurement.
newcol<-grep("std()|mean()", names(together))
new<-together[,c(1:3,newcol)]

##Uses descriptive activity names to name the activities in the data set
prop<-function(x){
        act<-c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying")
        x<-act[x]
}
new$activity<-sapply(new$activity, prop)

##Appropriately labels the data set with descriptive variable names.
names(new)<-gsub("-","",names(new))
names(new)<-gsub("\\()","",names(new))

##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
finalproject<-aggregate(.~activity+subject, new, mean)
write.table(finalproject, file = "mysub.txt", row.names = FALSE)