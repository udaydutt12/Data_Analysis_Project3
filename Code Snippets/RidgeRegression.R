
#__Ridge Regression__
```{r}
#----------------------------------------------------------

#Ridge Regression and the Lasso
# package `glmnet`, which does not use the 
#model formula language, so we will set up an `x` and `y`.
library(glmnet)
x=model.matrix(phd~.-1,data=hdata) 
y=hdata$phd
set.seed (101)
train=sample (1: nrow(x), nrow(x)/2)
str(train)
# fit a ridge-regression model. This is achieved by 
#calling `glmnet` with `alpha=0`. 
#There is also a `cv.glmnet` function which will do 
#the cross-validation for us.
fit.ridge=glmnet(x,y,alpha=0)
plot(fit.ridge,xvar="lambda",label=TRUE)
# Use Cross Validation to determine the tuning parameter ?? (bestlam)
cv.ridge=cv.glmnet(x[train ,],y[train],alpha =0)
plot(cv.ridge)
bestlam =cv.ridge$lambda.min
bestlam
#test MSE associated with the best `lambda` value
ridge.mod =glmnet (x[train ,],y[train],alpha =0)
ridge.pred=predict (ridge.mod ,s=bestlam ,newx=x[-train ,])
mean(( ridge.pred -y[-train])^2)
# Refit our ridge regression model on the full data set,
# using `lambda` = bestlam chosen by cross-validation and examine 
# the coefficient estimates.
fit.ridge=glmnet(x,y,alpha=0)
predict (fit.ridge ,type="coefficients",s=bestlam )[1:14 ,]
```
