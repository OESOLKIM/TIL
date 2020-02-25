# CART 알고리즘 : 목적변수가 범주형(지니지수), 연속형(분산이용)

install.packages("rpart")
library(rpart)
help(rpart)

m = rpart(Species~., data=iris)
m
plot(m, mar=.2)
text(m, cex=0.8)

install.packages("rpart.plot")
library(rpart.plot)
prp(m, type=4, extra=2, digits=3)

install.packages("party")
library(party)
m2 = ctree(Species~., data=iris) 
# ctree: 속성(column 수)이 30개 이하일 때만 사용 가능
m2
plot(m2)
