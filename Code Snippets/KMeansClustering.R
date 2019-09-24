# K Means Clustering__

# Data without categorical
kmdat<-hdata[c(1,4,5,8,10)]

# Standardize/normalize the data 
kmdat <- scale(kmdat)
head(kmdat)
set.seed(101)
km.out<-kmeans (kmdat,2, nstart =50)
km.out
km.out$size
km.out$cluster

#Evaluation with respect to phd
table(hdata$phd,km.out$cluster)
plot(hdata[c("age","trestbps")], col=km.out$cluster)
plot(hdata[c("age","trestbps")], col=hdata$phd)
plot(hdata[c("age","chol")], col=km.out$cluster)
plot(hdata[c("age","chol")], col= hdata$phd)

#Evaluation with respect to Price
set.seed(10101)
km.out<-kmeans(kmdat,2,nstart=50)
table(hdata$phd,km.out$cluster)
plot(hdata[c("thalach","oldpeak")], col=km.out$cluster)
plot(hdata[c("thalach","oldpeak")], col=hdata$phd)

# In order to see if there is any pattern among the variables in the data, we removed categorical 
# variables in the dataset. From the confusion matrix, we see that the matched cluster values 
# are much less than mismatched cluster values. Some plots indicate there are few clusters 
# that visualize some potential subgroups among variables...but teh mismatch rates are so high 
# that this method is not appropriate for the data.
