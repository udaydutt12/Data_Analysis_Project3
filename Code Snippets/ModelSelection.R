# Model Selection by Validation

# Make predictions on the observations not used for training. 
# We know there are 13 models, so we set up some vectors to 
# record the errors. 
val.errors=rep(NA,13)
x.test=model.matrix(phd~.,data=hdata[-train,])# notice the -index!
for(i in 1:13){
  coefi=coef(regfit.fwd,id=i)
  pred=x.test[,names(coefi)]%*%coefi
  val.errors[i]=mean((hdata$phd[-train]-pred)^2)
}
str(hdata$phd[-train])
sqrt(val.errors)
which.min (val.errors )
# Selected Model Coefficients based on Validation


coef(regfit.fwd ,9)
summary(sqrt(val.errors))
plot(sqrt(val.errors),ylab="Root MSE",ylim=c(0.3,0.5),pch=19,type="b")
points(sqrt(regfit.fwd$rss[-1]/212),col="blue",pch=19,type="b")
legend("topright",legend=c("Training","Validation"),col=c("blue","black"),pch=19)

# As we expect, the training error goes down monotonically as the model 
# gets bigger, but not so for the validation error.

# Predict method for `regsubsets`. 
predict.regsubsets=function(object,newdata,id,...){
  form=as.formula(object$call[[2]])
  mat=model.matrix(form,newdata)
  coefi=coef(object,id=id)
  mat[,names(coefi)]%*%coefi
}

# Mode Selection by Cross Validation

#We will do 10-fold cross-validation.
set.seed(3011)
folds=sample(rep(1:9,length=nrow(hdata)))
folds
str(folds)
dim(folds)
head(folds)
table(folds)
cv.errors=matrix(NA,9,13)
for(k in 1:9){
  best.fit=regsubsets(phd~.,data=hdata[folds!=k,],nvmax=13,method="forward")
  for(i in 1:13){
    pred=predict(best.fit,hdata[folds==k,],id=i)
    cv.errors[k,i]=mean( (hdata$phd[folds==k]-pred)^2)
  }   
}
str(pred)
hdata$phd[folds == k]
rmse.cv=sqrt(apply(cv.errors,2,mean))
which.min (rmse.cv )
coef(best.fit ,10)
plot(rmse.cv,pch=9,type="b")
