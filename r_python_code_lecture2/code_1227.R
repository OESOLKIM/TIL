## 1

rm(list=ls())
library(ggplot2)
data(diamonds)
head(diamonds)
str(diamonds)

t = sample(1:nrow(diamonds), 1000)
t # 인덱스가 랜덤하게 뽑힘
test = diamonds[t,]
dim(test) # (1000,10)
test

mydia = test[c("price", "carat", "depth", "table")]

result = hclust(dist(mydia), method="ave")
# hclust를 할 때 원본값을 넣으면 안 되고 매트릭스화 해서 넣어야 한다 (이를 위해 dist() 함수 사용)

plot(result, hang=-1)

## 2

result2 = kmeans(mydia, 3) # 군집 수 = 3
result2

# 군집별 통계
g1 = subset(mydia, result2$cluster==1)
summary(g1)
g2 = subset(mydia, result2$cluster==2)
g3 = subset(mydia, result2$cluster==3)
summary(g2)
summary(g3)
str(mydia)

# 비계층적 모델
mydia$cluster = result2$cluster
head(mydia)
cor(mydia[,-5], method="pearson")
plot(mydia[,-5])
plot(mydia$carat, mydia$price, col=mydia$cluster)

## 3 

iris = iris[,1:4] # 목표변수(Species) 제외
km.out.withness = c()
km.out.between = c()
for (i in 2:7) { # 군집수를 k=2~7까지 변화시켜가며 클러스터링 실행
  set.seed(1)
  km.out = kmeans(iris, centers=i)
  km.out.withness[i-1] = km.out$tot.withinss # 군집 내 제곱합의 합
  km.out.between[i-1] = km.out$betweenss # 군집 간 제곱합의 합
}
data.frame(km.out.withness, km.out.between)


## 4 연관성 규칙(장바구니 분석)

install.packages("arules")
install.packages("arulesViz")
library(arules)
library(arulesViz)
data(Groceries)
str(Groceries)
inspect(Groceries)
summary(Groceries)

sort(itemFrequency(Groceries, type="absolute"), decreasing=T)
itemFrequencyPlot(Groceries, topN=10, type="absolute")
itemFrequencyPlot(Groceries, topN=10, type="relative")

# 아프리오리 알고리즘
apriori(Groceries) # support = 0.1, confidence = 0.8
result_rules = apriori(Groceries, 
                       parameter=list(support=0.005, confidence=0.5, minlen=2))
result_rules
summary(result_rules) # {lhs} --> {rhs}
inspect(result_rules[1:10])
plot(result_rules, method="graph", control=list(type="items"))