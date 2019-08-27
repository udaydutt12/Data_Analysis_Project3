#__Scatterplot Matrices__
pairs(~pnum + age+ sex+cp+trestbps+chol+fbs+
        restecg+thalach+exang+oldpeak+slope+
        ca+thal, data=hdata, 
      main="Simple Scatterplot Matrix")

# Scatterplot Matrices from the car Package
scatterplot.matrix(~ age+ trestbps+chol+
              thalach+oldpeak+ca|pnum, data=hdata, 
              main="Scatter Plot Matrix on the pnum Factor")

scatterplot.matrix(~age+ trestbps+chol+
                     thalach+oldpeak+ca|phd, data=hdata, 
                   main="Scatter Plot Matrix on the phd Factor")
#----------------------------------------------------------------------
# Individual Scatter Plots
ggplot(hdata, aes(age, y = pnum, color = sex)) + 
  geom_point(size = 2)

ggplot(hdata, aes(trestbps, y = pnum, color = sex)) + 
  geom_point(size = 2)
ggplot(hdata, aes(chol, y = pnum, color = sex)) + 
  geom_point(size = 2)


ggplot(hdata, aes(thalach, y = pnum, color = sex)) + 
  geom_point(size = 2)

ggplot(hdata, aes(oldpeak, y = pnum, color = sex)) + 
  geom_point(size = 2)