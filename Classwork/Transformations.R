# Log Transformations
summary(lm(price ~ carat, data = diamonds))

summary(lm((log(price)) ~ carat, data = diamonds))

summary(lm(price ~ log(carat), data = diamonds))

summary(lm(log(price) ~ log(carat), data = diamonds))

# centering
library(MASS)
Boston.centered <- data.frame(scale(Boston, center = TRUE, scale = FALSE))
summary(lm(medv ~ lstat + age, data = Boston))
summary(lm(medv ~ lstat + age - 1, data = Boston.centered))
plot(lm(medv ~ lstat + age - 1, data = Boston.centered))
plot(lm(medv ~ lstat + age, data = Boston))

# Standardization using z-score
