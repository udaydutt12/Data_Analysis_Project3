# Linear Support Vector Machine

x<-kdata[c(1:13)]
y<-kdata$phd

#load the package `e1071` which contains the `svm` function
library(e1071)
dat<-data.frame(x,y)

# Select Training & Test Data Sets Randomly for SVM Classification
# Training data set = 71% of 297 = 212
# Test data set = 297 - 212 = 85
set.seed (1023)
itrain=sample (1: nrow(dat), 212)
traindat =dat[c(itrain),]
testdat =dat[c(-itrain),]
str(testdat)
svmfit=svm(y~.,data=traindat,kernel="linear",cost=0.01,scale=FALSE)
print(svmfit)
#plot(svmfit,traindat)

# Identifying observations that are Support Vectors
svmfit$index

#Basic information about the support vector classifier
summary (svmfit )

# What happens if a larger value of the cost parameter used?
svmfit=svm(y~.,data=dat,kernel="linear",cost=1,scale=FALSE)

#plot(svmfit , dat)
svmfit$index
summary (svmfit )

# Tuning SVMs with a linear kernel, using a range of values of the cost parameter.
set.seed (101)
tune.out=tune(svm,y~.,data=dat ,kernel ="linear",
              ranges =list(cost=c(0.001 , 0.01, 0.1, 1,5,10,100)))
summary(tune.out)

# Best model parameters based on CV (automatically stored into tune function)
bestmod =tune.out$best.model
summary (bestmod)

# Predict the class label on a set oftest observations
ypred = predict(bestmod,testdat)
table(predict =ypred,truth=testdat$y)

