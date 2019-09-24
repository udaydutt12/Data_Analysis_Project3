# Fitting a Classification Tree
# Decision Tree Regression & Classification

library (tree)

# Fit a classification tree model to predict phd' 
# using all variables except 'lprice'
tree.fit =tree(phd~. ,hdata)
summary (tree.fit)
plot(tree.fit)
text(tree.fit,pretty =0)
tree.fit

# Randomly Select Training & Testing Datasets for the Decision Tree
# Training Dataset = 212
# Test Dataset = 297 - 212 = 85
set.seed (1923)
train=sample (1: nrow(hdata ), 212)
hdata.test=hdata [-train ,]
phd.test=hdata$phd[-train]
tree.fit =tree(phd~. ,hdata ,subset =train ) # Fit the tree model using training data
tree.pred=predict (tree.fit ,hdata.test ,type ="class") # Prediction using the fitted model and test data
table(tree.pred ,phd.test)

# Improving the Model through Pruning using cross-validation. 
# Determine the optimal level of tree complexity.
set.seed (3199)
cv.hdata =cv.tree(tree.fit ,FUN=prune.misclass)
names(cv.hdata)
par(mfrow =c(1,2))
plot(cv.hdata$size ,cv.hdata$dev ,type="b")
plot(cv.hdata$k ,cv.hdata$dev ,type="b")
