
#__Lasso Method__

```{r}
#Fit a lasso model; for this we use the default `alpha=1`
fit.lasso=glmnet(x,y)
plot(fit.lasso,xvar="lambda",label=TRUE)
cv.lasso=cv.glmnet(x,y)
plot(cv.lasso)
coef(cv.lasso)

#Suppose we want to use our earlier train/validation division to 
#select the `lambda` for the lasso.
lasso.tr=glmnet(x[train,],y[train])
lasso.tr
pred=predict(lasso.tr,x[-train,])
dim(pred)
rmse= sqrt(apply((y[-train]-pred)^2,2,mean))
plot(lasso.tr$lambda,rmse,type="b",xlab="lambda")
plot(log(lasso.tr$lambda),rmse,type="b",xlab="Log(lambda)")
lam.best=lasso.tr$lambda[order(rmse)[1]]
lam.best
#Coefficients of lasso Model
coef(lasso.tr,s=lam.best)
```

