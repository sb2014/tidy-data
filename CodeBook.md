CodeBook.md
========================================================
### CodeBook to describe the data, variables and transformation for run_analysis.R
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md

All features describing the Mean or Standard Deviation of the activities were extracted from the main data set. These columns (variables) were then transformed to more descriptive names based on details provided in features_info.txt

The transformation of the names was done using the 'sub' function in R. For examples:
colnames(MeanStdData) <- sub("tBodyAcc", "TimeDomain-BodyAcceleration", colnames(MeanStdData), fixed=TRUE),
where MeanStdData dataframe has subset of features representing either Mean or Standard Deviation.

Following table lays out the original and revised names for each of the subset of features representing either MEAN or STD or activities captured in the test.


```r
read.table("colnames.txt", sep = "")
```

```
##                           Original
## 1                          Subject
## 2                tBodyAcc-mean()-X
## 3                tBodyAcc-mean()-Y
## 4                tBodyAcc-mean()-Z
## 5             tGravityAcc-mean()-X
## 6             tGravityAcc-mean()-Y
## 7             tGravityAcc-mean()-Z
## 8            tBodyAccJerk-mean()-X
## 9            tBodyAccJerk-mean()-Y
## 10           tBodyAccJerk-mean()-Z
## 11              tBodyGyro-mean()-X
## 12              tBodyGyro-mean()-Y
## 13              tBodyGyro-mean()-Z
## 14          tBodyGyroJerk-mean()-X
## 15          tBodyGyroJerk-mean()-Y
## 16          tBodyGyroJerk-mean()-Z
## 17              tBodyAccMag-mean()
## 18           tGravityAccMag-mean()
## 19          tBodyAccJerkMag-mean()
## 20             tBodyGyroMag-mean()
## 21         tBodyGyroJerkMag-mean()
## 22               fBodyAcc-mean()-X
## 23               fBodyAcc-mean()-Y
## 24               fBodyAcc-mean()-Z
## 25           fBodyAcc-meanFreq()-X
## 26           fBodyAcc-meanFreq()-Y
## 27           fBodyAcc-meanFreq()-Z
## 28           fBodyAccJerk-mean()-X
## 29           fBodyAccJerk-mean()-Y
## 30           fBodyAccJerk-mean()-Z
## 31       fBodyAccJerk-meanFreq()-X
## 32       fBodyAccJerk-meanFreq()-Y
## 33       fBodyAccJerk-meanFreq()-Z
## 34              fBodyGyro-mean()-X
## 35              fBodyGyro-mean()-Y
## 36              fBodyGyro-mean()-Z
## 37          fBodyGyro-meanFreq()-X
## 38          fBodyGyro-meanFreq()-Y
## 39          fBodyGyro-meanFreq()-Z
## 40              fBodyAccMag-mean()
## 41          fBodyAccMag-meanFreq()
## 42      fBodyBodyAccJerkMag-mean()
## 43  fBodyBodyAccJerkMag-meanFreq()
## 44         fBodyBodyGyroMag-mean()
## 45     fBodyBodyGyroMag-meanFreq()
## 46     fBodyBodyGyroJerkMag-mean()
## 47 fBodyBodyGyroJerkMag-meanFreq()
## 48                tBodyAcc-std()-X
## 49                tBodyAcc-std()-Y
## 50                tBodyAcc-std()-Z
## 51             tGravityAcc-std()-X
## 52             tGravityAcc-std()-Y
## 53             tGravityAcc-std()-Z
## 54            tBodyAccJerk-std()-X
## 55            tBodyAccJerk-std()-Y
## 56            tBodyAccJerk-std()-Z
## 57               tBodyGyro-std()-X
## 58               tBodyGyro-std()-Y
## 59               tBodyGyro-std()-Z
## 60           tBodyGyroJerk-std()-X
## 61           tBodyGyroJerk-std()-Y
## 62           tBodyGyroJerk-std()-Z
## 63               tBodyAccMag-std()
## 64            tGravityAccMag-std()
## 65           tBodyAccJerkMag-std()
## 66              tBodyGyroMag-std()
## 67          tBodyGyroJerkMag-std()
## 68                fBodyAcc-std()-X
## 69                fBodyAcc-std()-Y
## 70                fBodyAcc-std()-Z
## 71            fBodyAccJerk-std()-X
## 72            fBodyAccJerk-std()-Y
## 73            fBodyAccJerk-std()-Z
## 74               fBodyGyro-std()-X
## 75               fBodyGyro-std()-Y
## 76               fBodyGyro-std()-Z
## 77               fBodyAccMag-std()
## 78       fBodyBodyAccJerkMag-std()
## 79          fBodyBodyGyroMag-std()
## 80      fBodyBodyGyroJerkMag-std()
##                                                               Revised
## 1                                                             Subject
## 2                                  TimeDomain-BodyAcceleration-Mean-X
## 3                                  TimeDomain-BodyAcceleration-Mean-Y
## 4                                  TimeDomain-BodyAcceleration-Mean-Z
## 5                               TimeDomain-GravityAcceleration-Mean-X
## 6                               TimeDomain-GravityAcceleration-Mean-Y
## 7                               TimeDomain-GravityAcceleration-Mean-Z
## 8                              TimeDomain-BodyAccelerationJerk-Mean-X
## 9                              TimeDomain-BodyAccelerationJerk-Mean-Y
## 10                             TimeDomain-BodyAccelerationJerk-Mean-Z
## 11                              TimeDomain-BodyAngularVelocity-Mean-X
## 12                              TimeDomain-BodyAngularVelocity-Mean-Y
## 13                              TimeDomain-BodyAngularVelocity-Mean-Z
## 14                          TimeDomain-BodyAngularVelocityJerk-Mean-X
## 15                          TimeDomain-BodyAngularVelocityJerk-Mean-Y
## 16                          TimeDomain-BodyAngularVelocityJerk-Mean-Z
## 17                                TimeDomain-BodyAccelerationMag-Mean
## 18                             TimeDomain-GravityAccelerationMag-Mean
## 19                            TimeDomain-BodyAccelerationJerkMag-Mean
## 20                             TimeDomain-BodyAngularVelocityMag-Mean
## 21                         TimeDomain-BodyAngularVelocityJerkMag-Mean
## 22                            FrequencyDomain-BodyAcceleration-Mean-X
## 23                            FrequencyDomain-BodyAcceleration-Mean-Y
## 24                            FrequencyDomain-BodyAcceleration-Mean-Z
## 25                        FrequencyDomain-BodyAcceleration-MeanFreq-X
## 26                        FrequencyDomain-BodyAcceleration-MeanFreq-Y
## 27                        FrequencyDomain-BodyAcceleration-MeanFreq-Z
## 28                        FrequencyDomain-BodyAccelerationJerk-Mean-X
## 29                        FrequencyDomain-BodyAccelerationJerk-Mean-Y
## 30                        FrequencyDomain-BodyAccelerationJerk-Mean-Z
## 31                    FrequencyDomain-BodyAccelerationJerk-MeanFreq-X
## 32                    FrequencyDomain-BodyAccelerationJerk-MeanFreq-Y
## 33                    FrequencyDomain-BodyAccelerationJerk-MeanFreq-Z
## 34                         FrequencyDomain-BodyAngularVelocity-Mean-X
## 35                         FrequencyDomain-BodyAngularVelocity-Mean-Y
## 36                         FrequencyDomain-BodyAngularVelocity-Mean-Z
## 37                     FrequencyDomain-BodyAngularVelocity-MeanFreq-X
## 38                     FrequencyDomain-BodyAngularVelocity-MeanFreq-Y
## 39                     FrequencyDomain-BodyAngularVelocity-MeanFreq-Z
## 40                           FrequencyDomain-BodyAccelerationMag-Mean
## 41                       FrequencyDomain-BodyAccelerationMag-MeanFreq
## 42                  FrequencyDomain-BodyAcelerationJerkMagnitude-Mean
## 43              FrequencyDomain-BodyAcelerationJerkMagnitude-MeanFreq
## 44                  FrequencyDomain-BodyAngularVelocityMagnitude-Mean
## 45              FrequencyDomain-BodyAngularVelocityMagnitude-MeanFreq
## 46              FrequencyDomain-BodyAngularVelocityJerkMagnitude-Mean
## 47          FrequencyDomain-BodyAngularVelocityJerkMagnitude-MeanFreq
## 48                    TimeDomain-BodyAcceleration-StandardDeviation-X
## 49                    TimeDomain-BodyAcceleration-StandardDeviation-Y
## 50                    TimeDomain-BodyAcceleration-StandardDeviation-Z
## 51                 TimeDomain-GravityAcceleration-StandardDeviation-X
## 52                 TimeDomain-GravityAcceleration-StandardDeviation-Y
## 53                 TimeDomain-GravityAcceleration-StandardDeviation-Z
## 54                TimeDomain-BodyAccelerationJerk-StandardDeviation-X
## 55                TimeDomain-BodyAccelerationJerk-StandardDeviation-Y
## 56                TimeDomain-BodyAccelerationJerk-StandardDeviation-Z
## 57                 TimeDomain-BodyAngularVelocity-StandardDeviation-X
## 58                 TimeDomain-BodyAngularVelocity-StandardDeviation-Y
## 59                 TimeDomain-BodyAngularVelocity-StandardDeviation-Z
## 60             TimeDomain-BodyAngularVelocityJerk-StandardDeviation-X
## 61             TimeDomain-BodyAngularVelocityJerk-StandardDeviation-Y
## 62             TimeDomain-BodyAngularVelocityJerk-StandardDeviation-Z
## 63                   TimeDomain-BodyAccelerationMag-StandardDeviation
## 64                TimeDomain-GravityAccelerationMag-StandardDeviation
## 65               TimeDomain-BodyAccelerationJerkMag-StandardDeviation
## 66                TimeDomain-BodyAngularVelocityMag-StandardDeviation
## 67            TimeDomain-BodyAngularVelocityJerkMag-StandardDeviation
## 68               FrequencyDomain-BodyAcceleration-StandardDeviation-X
## 69               FrequencyDomain-BodyAcceleration-StandardDeviation-Y
## 70               FrequencyDomain-BodyAcceleration-StandardDeviation-Z
## 71           FrequencyDomain-BodyAccelerationJerk-StandardDeviation-X
## 72           FrequencyDomain-BodyAccelerationJerk-StandardDeviation-Y
## 73           FrequencyDomain-BodyAccelerationJerk-StandardDeviation-Z
## 74            FrequencyDomain-BodyAngularVelocity-StandardDeviation-X
## 75            FrequencyDomain-BodyAngularVelocity-StandardDeviation-Y
## 76            FrequencyDomain-BodyAngularVelocity-StandardDeviation-Z
## 77              FrequencyDomain-BodyAccelerationMag-StandardDeviation
## 78     FrequencyDomain-BodyAcelerationJerkMagnitude-StandardDeviation
## 79     FrequencyDomain-BodyAngularVelocityMagnitude-StandardDeviation
## 80 FrequencyDomain-BodyAngularVelocityJerkMagnitude-StandardDeviation
```




