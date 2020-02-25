setwd("C:/Rstudy/MLData")

# 1. 학원의 경우
academy = read.csv("academy.csv", stringsAsFactors = F, header = T)
academy = academy[-1]
head(academy)
dist_academy = dist(academy, method="euclidean")
dist_academy
two_coord = cmdscale(dist_academy) # 2차원 그래프로 변환
plot(two_coord, type="n")
text(two_coord, as.character(1:52))


# 2. 순대국집의 경우
food = read.csv("food.csv", stringsAsFactors = F, header = T)
food = food[-1]
head(food)
food[18,]
# 잘못된 방법
dist(t(food), method="euclidean")
# 옳은 방법
food.mult = t(as.matrix(food)) %*% as.matrix(food)
food.mult
dist.food = dist(food.mult)
dist.food
two_coord2 = cmdscale(dist.food)
plot(two_coord2, type="n")
text(two_coord2, rownames(food.mult))
