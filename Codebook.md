#CODEBOOK

*x_train: contains the measurement values for the training set. It is the result of reading the downloaded files.

*y_train: contains the activity values for the training set. It is the result of reading the downloaded files.

*x_test: contains the measurement values for the test set. It is the result of reading the downloaded files.

*y_test: contains the activity values for the test set. It is the result of reading the downloaded files.

*subject_train: contains the subject values for the training set. It is the result of reading the downloaded files.

*subject_test: contains the subject values for the test set. It is the result of reading the downloaded files.


*features: contains the names of the measurements. It is the result of reading the downloaded file "features.txt".

*activities: contains the names of the activities. It is the result of reading the file "activity_labels.txt".


*m_s_feat: vector indicating the position of the measurements containing "mean()" or "std()" in their names.


*x_dat:  (1) It is the result of merging (or appending) the measurement values of the training and test set, that is, objects "x_test" and "x_train".

	 (2) It is the result of subsetting the original "x_dat" object by keeping only the mean and standard deviation measurements. Variables are labeled using the names available in "features".

*y_dat:  (1) It is the result of merging (or appending) the activity values of the training and test set, that is, objects "y_test" and "y_train".

	 (2) Update of variable y_dat. The original variable is turned into a factor variable; level and corresponding labels are specified using "activities".

*subject_dat: it is the result of merging (or appending) the subject values of the training and test set, that is, objects "subject_test" and "subject_train".

*dat: a tidy data.frame, which is the result of combining the objects "subject_dat","y_dat"(2) and "x_dat"(2). All variables are labeled appropiately.

*averaged_dat: a tidy data.frame with the average of each variable per activity and subject.