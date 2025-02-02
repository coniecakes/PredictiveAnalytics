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
knitr::opts_chunk$set(echo=F, include=T, warning=F, message=F)
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
#
#
#
#
# Done for you, but please ensure your data set has the columns listed below
pizza <- read.table("/Users/coniecakes/Library/CloudStorage/OneDrive-Personal/001. Documents - Main/023. Programming Tools/R Studio/PredictiveAnalytics/R_Exercises/PizzaCal.csv", header=TRUE, sep=",")[,3:10]
#
#
#
#
#
#
#
fit.full <- lm(cal ~ ., pizza) # fit an OLS model
summary(fit.full) # view summary statistics
#
#
#
#
#
#
#
#
#
library(perturb)
library(car)

cond_indx <- colldiag(fit.full, scale = TRUE, center = TRUE)
cond_indx

vif(fit.full)
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
#
#
#
#
#
#
#
#
fit.null <- lm(cal ~ 1, pizza) # fit a null model
step(fit.full, scope = list(lower = fit.null, upper = fit.full), # stepwise regression
    direction = "both", test = "F") -> fit.step.15

summary(fit.step.15)
#
#
#
#
#
#
#
kval <- qchisq(0.05, 1, lower.tail = FALSE) # assign new chi square value to variable object
kval

fit.step.05 <- step(fit.full, scope = list(lower = fit.null, upper = fit.full),
                    direction = "both", test = "F", k = kval) # stepwise regression

summary(fit.step.05)
summary(fit.step.15)
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
col_indx_15 <- colldiag(fit.step.15, scale = TRUE, center = TRUE) # CI for reduced model 1
col_indx_15
vif(fit.step.15) # VIFs for reduced model 1

col_indx_05 <- colldiag(fit.step.05, scale = TRUE, center = TRUE) # CI for reduced model 2
col_indx_05
vif(fit.step.05) # VIFs for reduced model 2
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
