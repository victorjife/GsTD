#
#   Script to tidy data from 4th week project 
#   Name: Víctor Jiménez FErnández
#   Date: 15/10/2016
#

#   Loading test files
X_test<-read.table("test/X_test.txt")
y_test<-read.table("test/y_test.txt")
subject_test<-read.table("test/subject_test.txt")

#   Loading train files
X_train<-read.table("train/X_train.txt")
y_train<-read.table("train/y_train.txt")
subject_train<-read.table("train/subject_train.txt")

#   Loading general files
features<-read.table("features.txt")
activity_labels<-read.table("activity_labels.txt")

#   Assign names from file features
names(X_test)<-features[,2]
names(X_train)<-features[,2]

#   Create a Subject and Activity column from files in X_test set
X_test$Subject<-subject_test$V1
X_test$Activity<-y_test$V1
X_test<-X_test[,c(562,563,1:561)]

#   Create a Subject and Activity column from files in X_train set
X_train$Subject<-subject_train$V1
X_train$Activity<-y_train$V1
X_train<-X_train[,c(562,563,1:561)]

#   Binding sets
set<-rbind(X_test,X_train)

#   Changeing Activity numbers for Activity names 
for(i in activity_labels$V1){
    set[set$Activity==i,"Activity"]<-as.character(activity_labels[i,2])
}

#   Separating the label names for identify mean() and sd() 
names_str<-strsplit(names(set),"\\-")
secondElement<-function(x){x[2]}
names_2<-sapply(names_str,secondElement)

#   Looking for a mean() and sd() measurements
mean_sd<-which(names_2=="mean()"|names_2=="sd()")
set<-set[,c(1,2,mean_sd)]

#   Changeing Activity numbers for Activity names 
g<-melt(set,id=c("Subject","Activity"))
set2<-dcast(g,Subject + Activity~variable, mean)

#   Saveing a tt file with the set2 data.frame  
write.table(set2, "set_2step5.txt", row.name=FALSE)