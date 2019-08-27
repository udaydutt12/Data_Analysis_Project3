
#__Backward Stepwise Selection__
```{r}
#---------------------------------------------------------------
#Backward Stepwise Selection
#`regsubsets`function but specify the `method="forward" option
regfit.bwd=regsubsets(phd~.,data=hdata,nvmax=13,method="backward")
summary(regfit.bwd)
plot(regfit.bwd,scale="Cp")


#Training and validation set for choosig a good subset model.
set.seed(1234)

#about 71% data was selected as training data
#Generate a random sequence of 212 observations from data 
train=sample(seq(297),212,replace=FALSE)
regfit.bwd=regsubsets(phd~.,data=hdata[train,],nvmax=13,method="backward")
```

 The same process were performed in forward stepwise selection was used for backward stepwise selection. They both had the same result as best subset selection. 
