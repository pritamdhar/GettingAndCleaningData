"run_analysis.R" contains code to merge the X, Y and Subject data into one Data Frame. To understand the description of the variables, the data, and any transformations or work that was performed inside the accompanying "run_analysis.R" file please refer the "CodeBook.md" file.

Presuming the code is being run from the folder which contains the "test" and "train" folders.

The sequence of steps carried out in the script are as follows:

1. Steps to merge training and test Data Sets
1.1 Read test and train data sets for X and bind them to a Data Frame "myData"
1.2 Provide the names to the X columns as provided from "features.txt"
1.3 Read test and train data sets for Y and bind them to "myData" with a column name "ActivityID"
1.4 Read test and train data sets for Subject and bind them to "myData" with a column name "SubjectID"

2. Steps to extract only the measurements on the mean and standard deviation for each measurement
2.1 create the match expression with the key words "mean()" and "std" to be looked out for
2.2 Run the expression on features set to find the column matches and store it in myData

3. Steps to use descriptive activity names to name the activities in the dataset
3.1 Read data from "activity_labels.txt" to data frame "activity.labels"
3.2 Merge "activity.labels" and "myData" on Activity ID

4. Steps to label the data set with descriptive activity names
4.1 Use factor to do the labeling to the dataset

5. Create a independent tidy data set "tidyData" with the average of each variable for each activity and each subject
5.1 Melt the dataset
5.1.1 the id columns would be all the columns which were in the x variable we can find this by just removing the columns "ActivityID", "ActivityName" and "SubjectID"
5.2 Dcast the dataset to find the variable and mean as per the columns "ActivityName" and "SubjectID"
5.3 Writing the "tidyData.txt" file