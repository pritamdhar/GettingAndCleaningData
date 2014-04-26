This file describes the variables, the data, and any transformations or work that was performed inside the accompanying "run_analysis.R" file.
To understand the working of the script please refer the "README.md" file.

x.test, x.train, y.test, y.train: These are the variables used to store the respective "test" and "train" datasets as provided by "X_test.txt", "X_train.txt","Y_test.txt" and "Y_train.txt" respectively.

s.test, s.train: These are the variables used to store the respective "test" and "train" datasets as provided by "subject_test.txt", "subject_train.txt" respectively

Y,S: Combined "test" and "train" datasets for "y" and "Subject" respectively.

features: Read amd store the feature values as provided by "features.txt" file.

myData: The primary dataset which we keep adding/manipulating as per the instructions provided in the assignment.
The code under section 1.1 of the code comments, stores the combination of the "test"and "train" data sets for "X" in myData.
The code under section 1.3 of the code comments, adds the combination of the "test"and "train" data sets for "Y" to myData as a column "ActivityID".
The code under section 1.4 of the code comments, adds the combination of the "test"and "train" data sets for "Subject" to myData as a column "SubjectID".
The code under section 2.2 of the code comments, stores only the measurements on the mean and standard deviation for each measurement in myData.
The code under section 2.2 of the code comments,Uses descriptive activity names to name the activities in the data set and appropriately labels the data set with descriptive activity names.

toMatch: variable to store regular expression with the key words "mean()" and "std()"

matches: finds the unique column names for "myData" from the "features" dataset using the regular expression "toMatch"

activity.labels: Read and store the activity values as provided by "activity_labels.txt" file.

idCols: Stores the column names "ActivityID", "ActivityName", "SubjectID" from myData

xCols: Stores all the column names from myData besides the ones in "idCols"

myDataMelt: Melts myData using "idCols" and "xCols".

tidyData: Dcasts "myDataMelt" to to find the variable and mean as per the columns "ActivityName" and "SubjectID"