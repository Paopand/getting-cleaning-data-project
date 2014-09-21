## loads the package plyr, used to create the tidy set required by the project
if (!require("plyr")) {
  install.packages("plyr")
}
require(plyr)

## Loads the raw data
x_training = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
y_training <- read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
subject_training <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

x_test <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
y_test <- read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
subject_test <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

features <- read.table("UCI HAR Dataset/features.txt", sep = "", stringsAsFactors=FALSE)

activity_labels <- read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

## merges raw data and apply them the labels
training_data <- cbind(cbind(x_training, subject_training), y_training)
test_data <- cbind(cbind(x_test, subject_test), y_test)
all_data <- rbind(training_data, test_data)

labels <- rbind(rbind(features, c(562, "Subject")), c(563, "ActivityId"))
names(all_data) <- labels[,2]

## Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_std_data <- all_data[,grepl("mean|std|Subject|ActivityId", names(all_data))]

## Uses descriptive activity names to name the activities in the data set mean_std_data
currentActivity = 1
for (currentActivityLabel in activity_labels$V2) {
  mean_std_data$ActivityId <- gsub(currentActivity, currentActivityLabel, mean_std_data$ActivityId)
  currentActivity <- currentActivity + 1
}

## Appropriately labels the data set with descriptive variable names.
# Removes parentheses
names(mean_std_data) <- gsub('\\(|\\)',"",names(mean_std_data))
# Capitalizes Mean and converts std in StandardDeviation 
names(mean_std_data) <- gsub('\\-mean',"-Mean",names(mean_std_data))
names(mean_std_data) <- gsub('\\-std',"-StandardDeviation",names(mean_std_data))
# Makes syntacticaly valid names of variable names
names(mean_std_data) <- make.names(names(mean_std_data))

## creates a second, independent tidy data set with the average of each variable for each activity 
## and each subjec
avg_mean_std_by_activity_and_subject = ddply(mean_std_data, c("Subject","ActivityId"), numcolwise(mean))

## writes the tidy data set in the working directory
write.table(avg_mean_std_by_activity_and_subject, file = "avg_mean_std_by_activity_and_subject.txt")
