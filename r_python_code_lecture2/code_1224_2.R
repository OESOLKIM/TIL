set1 = read.csv("set1.csv", header=T, stringsAsFactors=F)
set1

# scatter plot matrix
plot(set1)

library(MASS)
density = kde2d(set1$food, set1$book, n=400) # 커널밀도함수(kernel density): 밀도 체크하는 함수
image(density, xlab="food", ylab="book")

# svm
library(e1071)
m1 = svm(status ~ food + book + cul + cloth + travel, type="C-classification", data=set1)
m1

# 튜닝을 통해 적절한 파라미터 값을 찾는다
# tune.svm(status~., data=set1, gamma=2^(-1:1), cost=2^(2:4)) 

predict(m1, set1)
sum(set1$status != predict(m1, set1))

# (가우시안 함수를 쓰는) RBF커널 사용
library(kernlab)
m2 = ksvm(status~., kernel="rbfdot", data=set1)
m2
predict(m2, set1)
sum(as.numeric(predict(m2,set1)>0.5) != set1$status)

