# Forward Stepwise Selection
# Regsubsets function with the method="forward" option
regfit.fwd=regsubsets(phd~.,data=hdata,nvmax=13,method="forward")
summary(regfit.fwd)
plot(regfit.fwd,scale="Cp")

# Training and Validation Set for choosing a good subset model.
set.seed(1234)

# About 71% data was selected as training data.
# Generate a random sequence of 212 observations from data. 
train=sample(seq(297),212,replace=FALSE)
regfit.fwd=regsubsets(phd~.,data=hdata[train,],nvmax=13,method="forward")
```
