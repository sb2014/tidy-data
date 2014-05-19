tidy-data
=========

Repository to upload the documents for course assignment for Getting and Cleaning Data

The assignment utilizes data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project was obtained from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

For simplicity, all the required Training and Test data on the subjects and activities were downloaded to the same directory, where the R script is located.

The purpose of the R script - run_analysis.R is the following. 
1.	Loads and merges the training and the test datasets to create one data set. Note that the “Subject” data is loaded from y_train.txt and y_test.txt, while the corresponding activities data is loaded from x_train.txt and x_test.txt

2.	Cbind function is used to combine the columns from Subject data and Activities data sets

3.	Rbind function is used to combine the training and testing data 

4.	Loads the column headings from features.txt file provided with the assignment

5.	Extracts only the activities, which relate to mean and standard deviation measurements to a new data set – MeanStdData

6.	Make column headings of the above dataset more descriptive. Sub function is used to replace short headings with more descriptive headings. The descriptions are obtained through the information provided in features_info.txt and README.txt.

7.	 Finally, a new dataset is created with the average of each variable for each activity and each subject. Library “reshape2” is utilized for the melt and dcast functions. Final data set tidyData is written out to a text file tidyData.txt, which is uploaded the Github repository
