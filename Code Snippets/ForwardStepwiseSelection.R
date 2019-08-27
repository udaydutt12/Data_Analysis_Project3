
#__Forward Stepwise Selection__
```{r}
#---------------------------------------------------------------
#Forward Stepwise Selection
#`regsubsets`function but specify the `method="forward" option
regfit.fwd=regsubsets(phd~.,data=hdata,nvmax=13,method="forward")
summary(regfit.fwd)
plot(regfit.fwd,scale="Cp")


#Training and validation set for choosig a good subset model.
set.seed(1234)

#about 71% data was selected as training data
#Generate a random sequence of 212 observations from data 
train=sample(seq(297),212,replace=FALSE)
regfit.fwd=regsubsets(phd~.,data=hdata[train,],nvmax=13,method="forward")
```
