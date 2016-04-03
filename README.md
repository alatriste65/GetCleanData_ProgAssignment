#README

Description of the R-file "run_analysis.R":
This file cleans, reshapes, and transforms the downloaded data in order to obtain an independent tidy data set with the average of each variable for each activity and each subject.
The necessary actions are splitted in 5 steps:

*Step 1: The downloaded data is read, and the different tables (x=measurements,y=activities,subject) are merged (appended) for the training and test sets.
*Step 2: measurements-names are loaded into R by reading the file "features.txt" and applied to the corresponding R-object ("x_dat"). Only the measurements containing "mean()" or "std()" in their names are kept (i.e. object "x_dat" is subsetted).
*Step 3: activity-names are loaded into R by reading the file "activity_labels.txt". The object "y_dat" is transformed into a factor variable correspondingly.
*Step 4: The objects "subject_dat", "y_dat" and "x_dat" (i.e. subject, activity and measurements tables) are all integrated into one tidy data.frame. Variables are named appropiately.
*Step 5: A second independent tidy data set containing the average of each selected measurement per activity and subject is created and exported into a Text-file "averaged_data.txt".


The file "Codebook.md" contains a description of all the variables created in the R-code "run_analysis.R", which result from executing in R the above mentioned steps.

The file "averaged_dat.txt" contains the second, independent tidy data set with the averages of each selected measurement per activity and subject.