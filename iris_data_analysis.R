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

point <- as.numeric(iris$Species) 
color <- c("red","green","blue")
pairs(iris[,-5],      # 상관 분석을 위해 각 열 데이터 입력
      pch=c(point),   # 가시화를 위해 모양 설정
      col=color[iris[,5]]  # 가시화를 위해 색깔 설정
)

# 기술통계량
summary(iris)
summary(iris$Petal.Width)
mean(iris$Petal.Width)
median(iris$Petal.Width)
sd(iris$Petal.Width)
unique(iris[,5]) 

# 값 카운트 
table(iris[,"Species"])
table(iris$Species)

# Linear Regression

iris2 <- iris
iris2 <- iris2[iris2$Species == "setosa",]
y <- iris2$Sepal.Length
x <- iris2$Sepal.Width
plot(x,y)

reg_result <- lm(y ~ x) #y = 0.6905x + 2.6390
abline(reg_result,col="red")


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
