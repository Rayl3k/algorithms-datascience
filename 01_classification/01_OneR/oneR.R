# Install & load required packages
## Cran project: https://cran.r-project.org/web/packages/OneR/index.html
install.packages('OneR', dependencies = TRUE)
install.packages('gridExtra')

####################################
# START EXAMPLE: Iris data         #
####################################

# Load Library
library(OneR)

# Create model with formula
model <- OneR(iris, formula = Species ~ ., verbose = TRUE)
summary(model)
plot(model)
prediction <- predict(model, iris)
eval_model(prediction, iris$Species)

# Confusion matrix with table
table(predict(model, iris), iris$Species)

# Modifying how we discretize the numerical variables
str(iris)
iris2 <- bin(iris, method='length')
model2 <- OneR(iris2, formula = Species ~ ., verbose = TRUE)
table(predict(model2, iris2), iris2$Species)

iris3 <- bin(iris, nbins = 3, method='content')
model3 <- OneR(iris3, formula = Species ~ ., verbose = TRUE)
table(predict(model3, iris3), iris3$Species)

iris4 <- bin(iris, nbins=3, method='clusters')
model4 <- OneR(iris4, formula = Species ~ ., verbose = TRUE)
table(predict(model4, iris4), iris4$Species)


####################################
# START EXAMPLE: Breast Cancer     #
####################################
# https://cran.r-project.org/web/packages/OneR/vignettes/OneR.html

# Load Library
library(OneR)

