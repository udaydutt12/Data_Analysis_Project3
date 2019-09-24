
# Pruning based of Cross validation

# Based on obtained results, it appears that a tree with 
# 5-terminal node results in lowest cross-validation deviance
# Thus, prune the tree to obtain the 5-node tree
prune.hdata =prune.misclass (tree.fit ,best =5)
plot(prune.hdata )
text(prune.hdata ,pretty =0)
tree.pred=predict (prune.hdata , hdata.test ,type="class")
table(tree.pred,phd.test)
predEff<-mean(tree.pred==phd.test)
testErr<-1-predEff
predEff
testErr
# Prediction efficiency = (39+29)/85 = 80%