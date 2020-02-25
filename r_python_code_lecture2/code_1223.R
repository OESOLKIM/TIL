## 1

install.packages("caret")
library(caret)
idx = createDataPartition(iris$Species, p=0.7, list=F)
iris_train = iris[idx,]
iris_test = iris[-idx,]
table(iris_train$Species)
table(iris_test$Species)

library(nnet) # multinom 함수 지원하는 라이브러리
model = multinom(Species~., data=iris_train)
summary(model)
# 이 후 exp를 사용하여 odds비로 전환한다

# 예측치
result = predict(model, iris_test) # new data인 iris_test를 넣는다
result

# 평가 매트릭스
confusionMatrix(result, iris_test$Species) # iris_test$Species는 실측치


## 2

library(caret)
idx = createDataPartition(iris$Species, p=0.7, list=F)
iris_train[idx,]
iris_test[-idx,]
library(rpart)
model = rpart(Species~., data=iris_train)
result = predict(model, iris_test, type="class")
head(result)
confusionMatrix(result, iris_test$Species)

## 3

library(rpart)
library(e1071)
library(randomForest)
library(caret)
idx = createDataPartition(iris$Species, p=0.7, list=F)
iris_train[idx,]
iris_test[-idx,]
rdf = randomForest(Species~., data=iris_train, importance=T)
rdf.pred = predict(rdf, newdata=iris_test, type="response")
rdf.pred
confusionMatrix(rdf.pred, iris_test$Species)


## KNN
install.packages("class")
library(rpart)
library(class)
library(caret)
idx = createDataPartition(iris$Species, p=0.7, list=F)
iris_train[idx,]
iris_test[-idx,]
set.seed(1234)

model = knn(train=iris_train[,-5],
            test=iris_test[,-5],
            cl=iris_train$Species,
            k=3)
summary(model)
confusionMatrix(model, iris_test$Species)


