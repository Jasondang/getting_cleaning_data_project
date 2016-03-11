# Codebook
This documentbook that describes the variables, 
the data, and any data transformations that were performed on
the provided dataset from wearable smartphone device(Samsung Galaxy S II). 

## Raw Data
The data collected originated from a conducted experiment with 30 volunteers between the ages of 19-48 years old. Each participant (subject) performed 6 activities(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone(Samsung Galaxy S II) on the waist.

Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data


The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Variables
There are three main variables in the provided raw data set. 

## Data Transformation

### Included libraries
The following libraries were included in the analysis code in order for the required transformations 
to occur. 
* httr: Package for working with HTTP
* dplyr: Powerful package to transform and summarize tabular data with rows and columns
* reshape2: Package to restructure and aggregate data

### Step 1

### Step 2
