
# Linear Discriminant Analysis

require(MASS)
set.seed(1678)
train=sample(seq(297),212,replace=FALSE)
test_data=hdata$phd[-train]
length(test_data)

# Fit LDA Model
lda.fit=lda(phd~age+ sex+cp+trestbps+chol+fbs+
              restecg+thalach+exang+oldpeak+slope+
              ca+thal, data=hdata, subset=train)
lda.fit
plot(lda.fit)

# Make Predictions Using Test Data
lda.pred=predict(lda.fit,newdata=hdata[-train,])
str(lda.pred)
data.frame(lda.pred)[1:5,]
table(lda.pred$class,test_data)
mean(lda.pred$class==test_data)

# Using ROC Curve for determining 'threshold'
library(ROCR)
pred_roc <- prediction(lda.pred$posterior [ ,2], test_data)
perf <- performance(pred_roc,"tpr","fpr")
plot(perf)
plot(perf,colorize=TRUE)
perf_spec <- performance(pred_roc, "sens", "spec")
plot(perf_spec)

# List threshold cutoff values alongwith fpr and tpr
cutoffs <- data.frame(cut=perf@alpha.values[[1]], fpr=perf@x.values[[1]],tpr=perf@y.values[[1]])
cutoffs <- cutoffs[order(cutoffs$tpr, decreasing=TRUE),]
#head(subset(cutoffs, fpr < 0.2))

# Calculate best threshold
best_threshold <- function(predict, response) {
  perf <- ROCR::performance(ROCR::prediction(predict, response), "sens", "spec")
  df <- data.frame(cut = perf@alpha.values[[1]], sens = perf@x.values[[1]], spec = perf@y.values[[1]])
  df[which.max(df$sens + df$spec), "cut"]}
predict<-pred_roc@predictions[[1]]
response<-pred_roc@labels[[1]]
best_cutoff<-best_threshold(predict, response)

# False Positive Rate (fpr) and True Positive Rate(tpr) corresponding to best Cutoff
subset(cutoffs, cut == best_cutoff)
