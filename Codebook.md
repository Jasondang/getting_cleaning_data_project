# Codebook
This documentbook that describes the variables, 
the data, and any data transformations that were performed on
the provided dataset from wearable smartphone device(Samsung Galaxy S II). 

## Raw Data
The data collected originated from a conducted experiment with 30 volunteers between the ages of 19-48 years old. Each participant (subject) performed 6 activities(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone(Samsung Galaxy S II) on the waist.

Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data


The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Variables
There are three main variables in the provided raw data set: Features, Acivity and Subject. 
* Subject: Volunteer IDs
* Activity: A label to indicate which subjects were part of the Test or Train group
* Features: 561-feature vector with time and frequency domain variables that measures the Triaxial acceleration from the accelerometer (total acceleration), the estimated body acceleration and the Triaxial Angular velocity from the gyroscope. 

## Data Transformation

### List of Raw Data Files:
* "activity_labels.txt"                         
* "features.txt"  
* "test/subject_test.txt"                       
* "test/X_test.txt"                             
* "test/y_test.txt"    
* "train/subject_train.txt"                     
* "train/X_train.txt"                           
* "train/y_train.txt"


### Included libraries
The following libraries were included in the analysis code in order for the required transformations 
to occur. 
* httr: Package for working with HTTP
* dplyr: Powerful package to transform and summarize tabular data with rows and columns
* reshape2: Package to restructure and aggregate data

### List of Transformations: 
Step 1: Merge the training and the test sets to create one data set.

Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.

Step 3: Uses descriptive activity names to name the activities in the data set

Step 4: Appropriately labels the data set with descriptive variable names.

Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
