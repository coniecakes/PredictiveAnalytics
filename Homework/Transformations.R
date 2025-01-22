# Log Transformations
summary(lm(price ~ carat, data = diamonds))

summary(lm((log(price)) ~ carat, data = diamonds))

summary(lm(price ~ log(carat), data = diamonds))

summary(lm(log(price) ~ log(carat), data = diamonds))