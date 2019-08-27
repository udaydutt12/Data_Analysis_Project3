#__Fitting a Classification Tree__
```{r}
#Decision Tree Regression & Classification
library (tree)
#Fit a classification tree model to predict phd' 
#using all variables except 'lprice'
tree.fit =tree(phd~. ,hdata )
summary (tree.fit)
plot(tree.fit )
text(tree.fit ,pretty =0)
tree.fit
# Selecting Training & Testing Data Sets for Decision Tree Randomly
# Training data set = 212
# Test data set = 297 - 212 = 85
set.seed (1923)
train=sample (1: nrow(hdata ), 212)
hdata.test=hdata [-train ,]
phd.test=hdata$phd[-train ]
#Fitting the tree model using training data
tree.fit =tree(phd~. ,hdata ,subset =train )
#Prediction using the fitted model and test data
tree.pred=predict (tree.fit ,hdata.test ,type ="class")
table(tree.pred ,phd.test)
#Improving Model through Purning using cross-validation 
# to determine the optimal level of tree complexity
set.seed (3199)
```

> cv.hdata =cv.tree(tree.fit ,FUN=prune.misclass )

> names(cv.hdata )

[1] "size"   "dev"    "k"      "method"
> cv.hdata

$size

[1] 16 11 10  8  5  4  2  1

$dev

[1] 50 50 45 46 47 52 68 99

$k

[1] -Inf  0.0  2.0  2.5  3.0  4.0  6.5 46.0

$method

[1] "misclass"

attr(,"class")

[1] "prune"         "tree.sequence"

> par(mfrow =c(1,2))

> plot(cv.hdata$size ,cv.hdata$dev ,type="b")

> plot(cv.hdata$k ,cv.hdata$dev ,type="b")


![](finalproj1.png)
