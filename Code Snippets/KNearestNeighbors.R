
#__K Nearest Neighbors__

```{r}
## K-Nearest Neighbors
library(class)
# Data Prepration: select data that needs to be normalized 
Xval<-rdata[c(1,3:5,7,8,10:13)]
#Normalize input values as they differ in scale
Xval<-scale(Xval)
Xval<-cbind(Xval,hdata[c(2,6,9)])
set.seed(2998)
train=sample(seq(297),212,replace=FALSE)
corr_classification<-list()
mis_classification<-list()
K<-seq(1:20)
for(i in 1:20){
  k=K[i]
knn.pred=knn(Xval[train,],Xval[-train,],hdata$phd[train],k)
table(knn.pred,hdata$phd[-train])
corr_classification[k]<-mean(knn.pred==hdata$phd[-train])
mis_classification[k]<-mean(knn.pred!=hdata$phd[-train])
}
knnResult<-cbind(K,corr_classification,mis_classification)
knnResult

plot(K, corr_classification, main="KNN Classification Scatterplot", 
     xlab="k-value ", ylab="Correct Classification ", pch=19)
lines(lowess(K,corr_classification), col="blue") # lowess line (x,y)
#---------------------------------------------------------------
#Save R Data Files for further Analysis
phd<-hdata$phd
kdata<-cbind(Xval,phd)
```

Knn algorithm is very useful to predict some categorical data.
The logic is very easy to understand and also algorithm is also easy.
However, there is a thing we have to be careful. That is the number of k nearest points.
The result would be totally different depends on the number of k nearest points. 

That's why I thought this insight is meaningful. This insight is about the correlation between the number of k nearest points and the probability of correct classification.

Since we got the best probability when k = 17, so this insight was pretty successful and meaningful when we predict some categorical data.




