# Backward Stepwise Selection
# The same process that was used for forward stepwise selection was used for backward stepwise selection.
regfit.bwd=regsubsets(phd~.,data=hdata,nvmax=13,method="backward")
summary(regfit.bwd)
plot(regfit.bwd,scale="Cp") # The best subset was the same for both methods.

# Training and validation set for choosing a good subset model.
# About 71% data was selected as training data.
# Generate a random sequence of 212 observations from data 
set.seed(1234) 
train=sample(seq(297),212,replace=FALSE)
regfit.bwd=regsubsets(phd~.,data=hdata[train,],nvmax=13,method="backward")

