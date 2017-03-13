# Wikipedia example: https://en.wikibooks.org/wiki/Data_Mining_Algorithms_In_R/Classification/Na%C3%AFve_Bayes

# Install & load required packages
## Cran project: https://cran.r-project.org/web/packages/e1071/index.html
install.packages('e1071', dependencies = TRUE)
install.packages('gridExtra')


####################################
# START EXAMPLE: Iris data         #
####################################
library(class)
library(e1071)
library(ggplot2)
library(gridExtra)

# Explore iris dataset
View(iris)
summary(iris)
str(iris)

# plot each atrribute against the others
pairs(iris[1:4], main = "Iris Data (red=setosa,green=versicolor,blue=virginica)",
      pch = 21, bg = c("red", "green3", "blue")[unclass(iris$Species)])

# plot Sepal.Length, Sepal.Width, Petal.Length, Petal.Width
p1 <- ggplot(iris, aes(x=Sepal.Length, y=..density.., fill = Species)) + geom_density(color="black") + ggtitle('Sepal Length')
p2 <- ggplot(iris, aes(x=Sepal.Width, y=..density.., fill = Species)) + geom_density(color="black") + ggtitle('Sepal Width')
p3 <- ggplot(iris, aes(x=Petal.Length, y=..density.., fill = Species)) + geom_density(color="black") + ggtitle('Petal Length')
p4 <- ggplot(iris, aes(x=Petal.Width, y=..density.., fill = Species)) + geom_density(color="black") + ggtitle('Petal Width')

grid.arrange(p1, p2, p3, p4, ncol=2, nrow=2)

# Compute Naïve Bayes
classifier <- naiveBayes(iris[,1:4], iris[, 5])
table(predict(classifier, iris), iris[, 5])

predict(classifier, iris, type="raw") # prints numeric probability for each outcome
table(predict(classifier, iris, type="class"), iris[, 5]) # prints class


####################################
# START EXAMPLE: Titanic           #
####################################
library(class)
library(e1071)
library(ggplot2)
library(gridExtra)

# Explore iris dataset
View(Titanic)
str(Titanic)
titanic <- as.data.frame(Titanic)
titanic <- data.frame(titanic[rep(seq_len(dim(titanic)[1]), titanic$Freq), 1:4, drop = FALSE], row.names = NULL)

# Compute naïve bayes
classifier2 <- naiveBayes(Survived ~ ., data = titanic, laplace=1)
table(predict(classifier2, titanic), titanic$Survived)
