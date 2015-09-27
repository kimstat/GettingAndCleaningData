## Codebook ##

Input Data Description:  
URL - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip   
Original Source - These data were collected from the accelerometers from the Samsung Galaxy S smartphone.  
More information on original data can be found here:   http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  
  
The Zip file contains 2 folders of interest called 'test' and 'train'.   
Subfolders titled 'Inertial Signals' are not used in this project.  
    
Subject_[...].txt files contain single subject ID number vectors for test/train groups.  
y_[...].txt files contain single activity code vectors for test/train groups.  
x_[...].txt files contain 561 variables related to 'features' for test/train groups.  
  
Activity codes are defined in the activity_labels.txt file as follows:  
1 = WALKING;   
2 = WALKING_UPSTAIRS;   
3 = WALKING_DOWNSTAIRS;   
4 = SITTING;   
5 = STANDING;  
6 = LAYING  
  
The 561 feature variables are defined in the features.txt file  
The features are measurements collected from the Samsung Galaxy S.  
  
  
  
Methods:  
Data were downloaded onto local machine using R, then loaded into R for modification.   
Subject IDs, Activities, and Features were combined into a single data frame.  
Feature variables were renamed for clarity.  
Feature variables were summarized for each subject and activity, with the final tidy data set including 1 mean value for every feature by subject and activity. Only variables reporting mean and standard deviations were included in the final data set.  
  
  
  
Output Summary:  
  
Variable Description:  
subject - subject idenitifier ranging from 1 - 30  
Activity - activity identifier ranging from 1 - 6 (defined above)  
Other Variables - measurements related to time and frequency as measured by the phone accelerometer or gyroscope. X,Y, and Z variables relate to different dimensions of movement.  
  
Output Structure:  
  
Final Tidy Data Frame:  
'data.frame':	180 obs. of  68 variables:  
$	subject	int	  
$	activity	Factor	  
$	time_Body_Accelerometer_mean()_X	num	  
$	time_Body_Accelerometer_mean()_Y	num	  
$	time_Body_Accelerometer_mean()_Z	num	  
$	time_Body_Accelerometer_std()_X	num	  
$	time_Body_Accelerometer_std()_Y	num	  
$	time_Body_Accelerometer_std()_Z	num	  
$	time_Gravity_Accelerometer_mean()_X	num	  
$	time_Gravity_Accelerometer_mean()_Y	num	  
$	time_Gravity_Accelerometer_mean()_Z	num	  
$	time_Gravity_Accelerometer_std()_X	num	  
$	time_Gravity_Accelerometer_std()_Y	num	  
$	time_Gravity_Accelerometer_std()_Z	num	  
$	time_Body_Accelerometer_Jerk_mean()_X	num	  
$	time_Body_Accelerometer_Jerk_mean()_Y	num	  
$	time_Body_Accelerometer_Jerk_mean()_Z	num	  
$	time_Body_Accelerometer_Jerk_std()_X	num	  
$	time_Body_Accelerometer_Jerk_std()_Y	num	  
$	time_Body_Accelerometer_Jerk_std()_Z	num	  
$	time_Body_Gyroscope_mean()_X	num	  
$	time_Body_Gyroscope_mean()_Y	num	  
$	time_Body_Gyroscope_mean()_Z	num	  
$	time_Body_Gyroscope_std()_X	num	  
$	time_Body_Gyroscope_std()_Y	num	  
$	time_Body_Gyroscope_std()_Z	num	  
$	time_Body_Gyroscope_Jerk_mean()_X	num	  
$	time_Body_Gyroscope_Jerk_mean()_Y	num	  
$	time_Body_Gyroscope_Jerk_mean()_Z	num	  
$	time_Body_Gyroscope_Jerk_std()_X	num	  
$	time_Body_Gyroscope_Jerk_std()_Y	num	  
$	time_Body_Gyroscope_Jerk_std()_Z	num	  
$	time_Body_Accelerometer_Magnitude_mean()	num	  
$	time_Body_Accelerometer_Magnitude_std()	num	  
$	time_Gravity_Accelerometer_Magnitude_mean()	num	  
$	time_Gravity_Accelerometer_Magnitude_std()	num	  
$	time_Body_Accelerometer_Jerk_Magnitude_mean():	num	  
$	time_Body_Accelerometer_Jerk_Magnitude_std()	num	  
$	time_Body_Gyroscope_Magnitude_mean()	num	  
$	time_Body_Gyroscope_Magnitude_std()	num	  
$	time_Body_Gyroscope_Jerk_Magnitude_mean()	num	  
$	time_Body_Gyroscope_Jerk_Magnitude_std()	num	  
$	freq_Body_Accelerometer_mean()_X	num	  
$	freq_Body_Accelerometer_mean()_Y	num	  
$	freq_Body_Accelerometer_mean()_Z	num	  
$	freq_Body_Accelerometer_std()_X	num	  
$	freq_Body_Accelerometer_std()_Y	num	  
$	freq_Body_Accelerometer_std()_Z	num	  
$	freq_Body_Accelerometer_Jerk_mean()_X	num	  
$	freq_Body_Accelerometer_Jerk_mean()_Y	num	  
$	freq_Body_Accelerometer_Jerk_mean()_Z	num	  
$	freq_Body_Accelerometer_Jerk_std()_X	num	  
$	freq_Body_Accelerometer_Jerk_std()_Y	num	  
$	freq_Body_Accelerometer_Jerk_std()_Z	num	  
$	freq_Body_Gyroscope_mean()_X	num	  
$	freq_Body_Gyroscope_mean()_Y	num	  
$	freq_Body_Gyroscope_mean()_Z	num	  
$	freq_Body_Gyroscope_std()_X	num	  
$	freq_Body_Gyroscope_std()_Y	num	  
$	freq_Body_Gyroscope_std()_Z	num	  
$	freq_Body_Accelerometer_Magnitude_mean()	num	  
$	freq_Body_Accelerometer_Magnitude_std()	num	  
$	freq_Body_Accelerometer_Jerk_Magnitude_mean():	num	  
$	freq_Body_Accelerometer_Jerk_Magnitude_std()	num	  
$	freq_Body_Gyroscope_Magnitude_mean()	num	  
$	freq_Body_Gyroscope_Magnitude_std()	num	  
$	freq_Body_Gyroscope_Jerk_Magnitude_mean()	num	  
$	freq_Body_Gyroscope_Jerk_Magnitude_std()	num	  
