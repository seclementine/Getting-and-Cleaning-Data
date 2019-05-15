# Getting-and-Cleaning-Data
Week 4 Final Project

This repository contains README.md Codebook.md and run_analytics.R. These are meant to go along with my table submitted called "mysub.txt"
mysub.txt is simplified data from an experiment from the "Human Activity Recognition Using Smartphones Dataset"

To see the dataset, you can print it in the console with 
read.table("mysub.txt", header = TRUE)

The original dataset contains information from an experiment with 30 volunteers aged 19-48 performing daily activities with a smartphone on the waist. The 3-axial linear acceleration and 3-axial angular velocity were recorded using the embedded accelerometer and gyroscope. 

mysub.txt is a dataset with 150 rows and 82 columns. Each row represents an activity done by a subject with information about the average measurements recorded from the original experiment

mysub.txt contains the averages of 79 of the 561 original dataset measurements. The average was taken of the 79 columns that contained mean or standard deviation information from the original measurements. This also includes meanFreq, which is a weighted average of the frequency components.

More information about the variables contained within mysub.txt can be found in the CodeBook.

Also submitted with this data set is run_analysis.R. This file contains the steps I took to go from the original dataset to my new new tidy dataset mysub.txt. This includes information on how I renamed the columns and removed the columns that didn't include information about the mean or the standard deviation.
