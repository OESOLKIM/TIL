## 1

# 데이터 분할(훈련, 테스트)
data(iris)
library(caret)

# 150건 --> 70% (105건==>3)
idx = createDataPartition(iris$Species, p=0.7, list=F)

iris_train = iris[idx, ] # 생성된 인덱스를 이용, 70%의 비율로 학습용 데이터 세트 추출
iris_test = iris[-idx, ] # 생성된 인덱스를 이용, 30%의 비율로 평가용 데이터 세트 추출

table(iris_train$Species)
table(iris_test$Species)

library(e1071)
naive.result = naiveBayes(iris_train, iris_train$Species, laplace = 1)

# 나이브 베이지 적합
naive.pred = predict(naive.result, iris_test, type="class") # 테스트 데이터 평가
table(naive.pred, iris_test$Species) # 분류 결과 도출

confusionMatrix(naive.pred, iris_test$Species)

## 2
setwd("C:/Rstudy/MLData")
library(e1071)
mail = read.csv("spam.csv", header=T)
mail[is.na(mail)] = 0
head(mail)

nm2 = naiveBayes(mail[2:13], mail$메일종류, laplace=0)
result2 = predict(nm2, mail[2:13])
sum(mail$메일종류 != result2)
result2

nm2

## 3 인공 신경망
library(caret)
idx = createDataPartition(iris$Species, p=0.7, list=F)

iris_train = iris[idx, ] # 생성된 인덱스를 이용, 70%의 비율로 학습용 데이터 세트 추출
iris_test = iris[-idx, ] # 생성된 인덱스를 이용, 30%의 비율로 평가용 데이터 세트 추출

table(iris_train$Species)

library(nnet) # 인공 신경망 기법을 사용하기 위한 nnet 패키지 로딩
iris_train_scale = as.data.frame(sapply(iris_train[,-5], scale)) # 데이터 표준화
iris_test_scale = as.data.frame(sapply(iris_test[,-5], scale))
iris_train_scale$Species = iris_train$Species
iris_test_scale$Species = iris_test$Species

nnet.result = nnet(Species~., iris_train_scale, size=3) # 훈련 데이터 통한 모형 적합

nnet.pred = predict(nnet.result, iris_test_scale, type="class") # 테스트 데이터 평가

table(nnet.pred, iris_test$Species) # 분류 결과 도출
