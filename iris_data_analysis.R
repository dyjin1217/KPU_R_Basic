# iris data
library(rpart.plot)
head(iris)
str(iris)

# 각 열에 대한 분포도 확인
par(mfrow = c(2, 2)) # 그래프 프레임 나누기

boxplot(Sepal.Length~Species, data = iris, 
        main = "Sepal.Length") 
boxplot(Sepal.Width~Species, data = iris,
        main = "Sepal.Width") 
boxplot(Petal.Length~Species, data = iris, 
        main = "Petal.Length") 
boxplot(Petal.Length~Species, data = iris, 
        main = "Petal.Width")

point <- as.numeric(iris$Species) # 각 모양 고르기 위해 선언
color <- c("red","green","blue") # 각 컬러 고르기 위해 선언
pairs(iris[,-5],      # 상관 분석을 위해 각 열 데이터 입력
      pch=c(point),   # 가시화를 위해 모양 설정
      col=color[iris[,5]]  # 가시화를 위해 색깔 설정
)

# 기술통계량
summary(iris)
summary(iris$Petal.Width)
unique(iris[,5]) # 종의 종류 보기 (중복 제거)
table(iris[,"Species"]) # 종의 종류별 instance count


# Decision Tree
iris_rtree<-rpart(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, data=iris, method="class");
print(iris_rtree);
rpart.plot(iris_rtree)

# K-means

iris2 <- iris
iris2$Species <- NULL

kmeans_result <- kmeans(iris2, 3)

# xlab, pch, type
plot(iris2$Sepal.Length,iris2$Sepal.width, col = kmeans_result$cluster)
