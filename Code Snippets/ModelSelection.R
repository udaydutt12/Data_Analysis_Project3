
#__Model Selection by Validation__


```{r}
#Make predictions on the observations not used for training. 
#We know there are 13 models, so we set up some vectors to 
#record the errors. 
val.errors=rep(NA,13)
x.test=model.matrix(phd~.,data=hdata[-train,])# notice the -index!
for(i in 1:13){
  coefi=coef(regfit.fwd,id=i)
  pred=x.test[,names(coefi)]%*%coefi
  val.errors[i]=mean((hdata$phd[-train]-pred)^2)
}

```

```{r}
str(hdata$phd[-train])
sqrt(val.errors)
which.min (val.errors )
#Selected Model Coefficients based on Validation
coef(regfit.fwd ,9)
summary(sqrt(val.errors))
plot(sqrt(val.errors),ylab="Root MSE",ylim=c(0.3,0.5),pch=19,type="b")
points(sqrt(regfit.fwd$rss[-1]/212),col="blue",pch=19,type="b")
legend("topright",legend=c("Training","Validation"),col=c("blue","black"),pch=19)
#As we expect, the training error goes down monotonically as the model 
#gets bigger, but not so for the validation error.
#predict method for `regsubsets`. 
predict.regsubsets=function(object,newdata,id,...){
  form=as.formula(object$call[[2]])
  mat=model.matrix(form,newdata)
  coefi=coef(object,id=id)
  mat[,names(coefi)]%*%coefi
}
```



#__Mode Selection by Cross Validation__
```{r}
#Model Selection by Cross-Validation
#We will do 10-fold cross-validation. Its really easy!
set.seed(3011)
folds=sample(rep(1:9,length=nrow(hdata)))
folds
str(folds)
dim(folds)
head(folds)
table(folds)
cv.errors=matrix(NA,9,13)
```

```{r, include=FALSE}
for (k in 1:9)
{k}
```

>for(k in 1:9){

>  best.fit=regsubsets(phd~.,data=hdata[folds!=k,],nvmax=13,method="forward")
  
>  for(i in 1:13){
  
>    pred=predict(best.fit,hdata[folds==k,],id=i)
    
>    cv.errors[k,i]=mean( (hdata$phd[folds==k]-pred)^2)
    
>  }
  
>}

>str(pred)

 num [1:33, 1] 0.3242 -0.2103 0.6919 -0.0658 0.9028 ...
 
 - attr(*, "dimnames")=List of 2
 
  ..$ : chr [1:33] "18" "27" "34" "47" ...
  
  ..$ : NULL

>hdata$phd[folds == k]

 [1] 0 0 0 0 1 0 1 1 1 0 1 0 1 0 1 0 0 0 0 1 0 1 0 0 1 0 1 1 0 0 1 1 1

>rmse.cv=sqrt(apply(cv.errors,2,mean))

>which.min (rmse.cv )

[1] 9

(Selected Model Coefficients based on Cross-Validation:)

>coef(best.fit ,10)


 (Intercept)         sex1          cp4     trestbps       exang1      oldpeak       slope2          ca1 
 
-0.478462276  0.149991221  0.263423074  0.002737387  0.090927462  0.062566427  0.160938411  0.238090658 



         ca2          ca3        thal7 
         
 0.288187563  0.233378562  0.215875498 



>plot(rmse.cv,pch=9,type="b")

![](finalproj2.png)
