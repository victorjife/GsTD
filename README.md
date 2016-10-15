==================================================================
Week 4: Getting and Cleaning Data Course project
Version 1.0
==================================================================
Víctor Jiménez Fernández
==================================================================

Pre-requisites for running the run_analysis.R script:

User has extracted the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, and unzipped it.
User has set their working directory (using setwd) to the location of the unzipped directory.
User had installed the reshape2 package locally. This can be done by running install.packages('reshape2').
=====================================================================
This project consists in tidy data from differents files to merge it. 

In the script "run_analysis.R" we can found the instructions to be able to tidy the data.

This instructions folows this steps:

  - Loading original files and saveing it in the workspace
  
  - Assign names from file "features.txt"
  
  - Create a Subject and Activity column from files in X_set
  
  - Blind two datasets (train, test)
  
  - Changeing Activity numbers to this names
  
  - Separating the labels names for identify mean() and sd() measurements
  
  - Looking for and indentifying mean() and sd() measurement
  
  - Changeing Activity numbers for Activity names
  
  - Create a data.frame with the average of each measurement of each activity and each subject
  
  - Saveing the new data.frame in a txt file
  
  
