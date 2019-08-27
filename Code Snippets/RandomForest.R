
#__Fitting a Random Forest for Performing Classification__

```{r}
#Fit a random forest for performing classification
library (randomForest)
set.seed(17)
rf.hdata=randomForest(phd~.,data=hdata,subset=train)
rf.hdata
#The model reports that `mtry=3`, which is the number of variables 
#randomly chosen at each split. The mis-classification rate is about 17%
#Using the training data. Since $p=13$ here, we could try all 13 possible 
#values of `mtry`. We will do so, record the results, and make a plot.
oob.err=double(13)
test.err=double(13)
for(mtry in 1:13){
  fit=randomForest(phd~.,data=hdata,subset=train,mtry=mtry,ntree=400)
  oob.err[mtry]=fit$err.rate[400]
  pred=predict(fit,hdata[-train,],type="class")
  table(pred,phd.test)
  predEff<-mean(pred==phd.test)
  testErr<-1-predEff
  test.err[mtry]=testErr
  cat(mtry," ")
}

matplot(1:mtry,cbind(test.err,oob.err),pch=19,col=c("red","blue"),
        type="b",ylab="Out-of-bag Error Rate")
legend("topright",legend=c("OOB","Test"),pch=19,col=c("red","blue"))

#Note: mtry=13`corresponds to Bagging.
#Based on above results, it appears best mtry = 3
rf.hdata <- randomForest(phd ~ ., data = hdata,
                       mtry = 3, importance = TRUE,
                       do.trace = 100)
rf.hdata
#Based on above results mtry = 3 and ntree = 400
rf.hdata=randomForest(phd~.,data=hdata,subset=train,mtry=3,ntree=400)
pred=predict(rf.hdata,hdata[-train,],type="class")
table(pred,phd.test)
predEff<-mean(pred==phd.test)
testErr<-1-predEff
testErr
```