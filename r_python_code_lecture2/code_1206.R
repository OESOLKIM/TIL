data(cars)
head(cars)
m = lm(dist~speed, data=cars) # 선형 회귀분석
m
summary(m)

fitted(m)[1:4] # 예측치
#      1         2         3         4 
# -1.849460 -1.849460  9.947766  9.947766

residuals(m)[1:4]
#     1         2         3         4 
# 3.849460 11.849460 -5.947766 12.052234 

predict(m, newdata=data.frame(speed=3))
#     1 
# -5.781869 

install.packages("mlbench")
library(mlbench)
data(BostonHousing)
head(BostonHousing)

m2 = lm(medv~., data=BostonHousing)
summary(m2)

m3 = step(m2, direction = "both")

