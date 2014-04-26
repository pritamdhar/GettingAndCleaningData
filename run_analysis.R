## Code to merge the X, Y and Subject data into one Data Frame
## Presuming the code is being run from the folder which contains
## the "test" and "train" folders

## 1. Steps to merge training and test Data Sets

# 1.1 Read test and train data sets for X
#     and bind them to a Data Frame "myData"
x.test <- read.table("./test/X_test.txt", header=F)
x.train <- read.table("./train/X_train.txt", header=F)
myData <- rbind(x.test, x.train)

# 1.2 Provide the names to the X columns 
#     as provided from "features.txt"
features <- read.table("features.txt")
colnames(myData) <- features$V2

# 1.3 Read test and train data sets for Y
#     and bind them to "myData"
#     with a column name "ActivityID"
y.test <- read.table("./test/Y_test.txt", header=F)
y.train <- read.table("./train/Y_train.txt", header=F)
Y <- rbind(y.test, y.train)
myData$ActivityID <- Y$V1

# 1.4 Read test and train data sets for Subject
#     and bind them to "myData"
#     with a column name "SubjectID"
s.test <- read.table("./test/subject_test.txt",header=F)
s.train <- read.table("./train/subject_train.txt",header=F)
S <- rbind(s.test,s.train)
myData$SubjectID <- S$V1

## 2. Steps to extract only the measurements on the mean 
##    and standard deviation for each measurement

# 2.1 create the match expression 
#     with the key words "mean()" and "std" to be looked out for
toMatch <- c(".*mean\\(\\).*$", ".*std\\(\\).*$")

# 2.2 Run the expression on features set to find the column matches
#     and store it in myData
matches <- unique (grep(paste(toMatch,collapse="|"), features$V2, value=TRUE))
myData <- myData[,c(matches,"ActivityID","SubjectID")]

## 3. Steps to use descriptive activity names 
##    to name the activities in the dataset
## 4. Steps to label the data set with descriptive activity names

# 3.1 Read data from "activity_labels.txt" to data frame "activity.labels"
# 3.2 Merge "activity.labels" and "myData" on Activity ID
# 4.1 Use factor to do the labeling to the dataset
activity.labels <- read.table("activity_labels.txt", header=F,col.names=c("ActivityID", "ActivityName"))
activity.labels$ActivityName <- as.factor(activity.labels$ActivityName)
myData <- merge(myData, activity.labels, by.x = "ActivityID", by.y = "ActivityID")

## 5. Create a independent tidy data set "tidyData"
##    with the average of each variable for each activity and each subject

# 5.1 Melt the dataset
# 5.1.1 the id columns would be all the columns which were in the x variable
#       we can find this by just removing the columns "ActivityID", "ActivityName"
#       and "SubjectID"
library(reshape2)
idCols <- c("ActivityID", "ActivityName", "SubjectID")
xCols <- colnames(myData[,!is.element(colnames(myData), idCols)])
myDataMelt <- melt(myData, id=idCols, measure.vars=xCols)

# 5.2 Dcast the dataset to find the variable and mean
#     as per the columns "ActivityName" and "SubjectID"
tidyData <- dcast(myDataMelt, ActivityName + SubjectID ~ variable, mean)

#5.3 Writing the "tidyData.txt" file
write.table(tidyData, "tidyData.txt")