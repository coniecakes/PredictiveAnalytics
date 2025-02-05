#
#
#
#
#
#
#
#
#
#
#
knitr::opts_chunk$set(echo=T, warning=FALSE, message=FALSE)
#
#
#
#
#
#
#
#
#
RNGkind(sample.kind="default")
#
#
#
#
#
#
#
#
#
#
#
set.seed(1) # set  the random seed for CV reproducability 
nrow(Boston) # get the number of rows in the Boston dataset
train <- sample(1:nrow(Boston), 0.7 * nrow(Boston)) # create training data vector
train # display the training vector

#
#
#
#
#
#
#
Boston.train <- Boston[train,] # subset the training data
nrow(Boston.train) # count rows of train subsample
Boston.test <- Boston[-train,] # subset the test data 
nrow(Boston.test) # count rows of test subsample
#
#
#
#
#
#
#
# fit a linear model
fit.train <- lm(medv ~ crim + chas + rm + age + tax + ptratio + lstat, Boston.train)
summary(fit.train) # view summary statistics of fit
#
#
#
#
#
#
#
#
#
#
#
test.mse.rs <- mean((Boston.test$medv - predict(fit.train, Boston.test))^2) # calculate RMSE
c("RSCV Test MSE" = test.mse.rs, "RSCV Test RMSE" = sqrt(test.mse.rs)) # concatenate results
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
# fit a glm model
glm.fit <- glm(medv ~ crim + chas + rm + age + tax + ptratio + lstat, data = Boston)
summary(glm.fit) # view summary statistics
#
#
#
#
#
#
#
test.mse.loo <- boot::cv.glm(Boston, glm.fit)$delta[1] # fit a CV glm
# display LOOCV test mse and rmse
c("LOOCV Test MSE" = test.mse.loo, "LOOCV Test RMSE" = sqrt(test.mse.loo))
#
#
#
#
#
#
#
#
#
#

test.mse.10f <- boot::cv.glm(Boston, glm.fit, K = 10$delta[1] # fit a CV glm
# display 10FCV test mse and rmse
c("10FCV Test MSE" = test.mse.10f, "10FCV Test RMSE" = sqrt(test.mse.10f))
)
#
#
#
#
#
#
#

#
#
#
#
#
#
#
#
#
#
