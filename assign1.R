library(glmnet)
library(dplyr)
set.seed(123)
#DGP 1 
beta_vector <- c(0, rep(1, 20))
beta <- setNames(beta_vector, paste0("b", 0:20))
n <- 500; p <- 50

lambdas <- seq(0,2, length.out = 100)
get_coef <- function(method="OLS", y, x, beta, model){
    if (model == 1){
        x <- x[,1:26]
    }
    else if (model == 2){
        x <- x
    }
    else{
        stop("The model can only be either 1 or 2.")
    }
    
    if(method == "OLS"){
        return(lm(y ~ x)$coefficients[i+1])
    }
    else if (method == "Ridge"){
        ridge_model <- cv.glmnet(x[1:400, ],y[1:400, ],
                                 alpha = 0,
                                 lambda = lambdas,
                                 nfolds =10)
        ridge_best <- glmnet(x, y, alpha = 0,lambda = ridge_model$lambda.min)
        return(coef(ridge_best)[i+1])
    }
    else if(method == "LASSO"){
        ridge_model <- cv.glmnet(x[1:400, ],y[1:400, ],
                                 alpha = 0,
                                 lambda = lambdas,
                                 nfolds =10)
        ridge_best <- glmnet(x, y, alpha = 1,lambda = ridge_model$lambda.min)
        return(coef(ridge_best)[i+1])
    }
}

R <- 2000
ols_b1.hat_dgp1_model1 <- rep(NA,R); ols_b21.hat_dgp1_model1 <- rep(NA, R)
ols_b1.hat_dgp1_model2 <- rep(NA, R); ols_b21.hat_dgp1_model2 <- rep(NA, R)
ols_b1.hat_dgp2_model1 <- rep(NA, R); ols_b21.hat_dgp2_model1 <- rep(NA, R)
ols_b1.hat_dgp2_model2 <- rep(NA, R); ols_b21.hat_dgp2_model2 <- rep(NA, R)

ridge_b1.hat_dgp1_model1 <- rep(NA, R); ridge_b21.hat_dgp1_model1 <- rep(NA, R)
ridge_b1.hat_dgp1_model2 <- rep(NA, R); ridge_b21.hat_dgp1_model2 <- rep(NA, R)
ridge_b1.hat_dgp2_model1 <- rep(NA, R); ridge_b21.hat_dgp2_model1 <- rep(NA, R)
ridge_b1.hat_dgp2_model2 <- rep(NA, R); ridge_b21.hat_dgp2_model2 <- rep(NA, R)

Lasso_b1.hat_dgp1_model1 <- rep(NA, R); Lasso_b21.hat_dgp1_model1 <- rep(NA, R)
Lasso_b1.hat_dgp1_model2 <- rep(NA, R); Lasso_b21.hat_dgp1_model2 <- rep(NA, R)
Lasso_b1.hat_dgp2_model1 <- rep(NA, R); Lasso_b21.hat_dgp2_model1 <- rep(NA, R)
Lasso_b1.hat_dgp2_model2 <- rep(NA, R); Lasso_b21.hat_dgp2_model2 <- rep(NA, R)

for(i in 1:R){
    print(i)
    X <- matrix(rnorm(n * p), nrow = n, ncol = p)
    X <- cbind(1, X)
    u <- rnorm(n)
    y_dgp1 <- X[,1:3] %*% beta[1:3]+u
    y_dgp2 <- X[,1:21] %*% beta + u
    X <- X[,2:51]
    ols_b1.hat_dgp1_model1[i] <- get_coef("OLS", y_dgp1, X, beta=1, model=1)
    ols_b1.hat_dgp1_model2[i] <- get_coef("OLS", y_dgp1, X, beta=1, model=2)
    ols_b1.hat_dgp2_model1[i] <- get_coef("OLS", y_dgp2, X, beta=1, model=1)
    ols_b1.hat_dgp2_model2[i] <- get_coef("OLS", y_dgp2, X, beta=1, model=2)
    
    ridge_b1.hat_dgp1_model1[i] <- get_coef("Ridge", y_dgp1, X, beta=1, model=1)
    ridge_b1.hat_dgp1_model2[i] <- get_coef("Ridge", y_dgp1, X, beta=1, model=2)
    ridge_b1.hat_dgp2_model1[i] <- get_coef("Ridge", y_dgp2, X, beta=1, model=1)
    ridge_b1.hat_dgp2_model2[i] <- get_coef("Ridge", y_dgp2, X, beta=1, model=2)
    
    Lasso_b1.hat_dgp1_model1[i] <- get_coef("LASSO", y_dgp1, X, beta=1, model=1)
    Lasso_b1.hat_dgp1_model2[i] <- get_coef("LASSO", y_dgp1, X, beta=1, model=2)
    Lasso_b1.hat_dgp2_model1[i] <- get_coef("LASSO", y_dgp2, X, beta=1, model=1)
    Lasso_b1.hat_dgp2_model2[i] <- get_coef("LASSO", y_dgp2, X, beta=1, model=2)
    
    ############################
    ols_b21.hat_dgp1_model1[i] <- get_coef("OLS", y_dgp1, X, beta=21, model=1)
    ols_b21.hat_dgp1_model2[i] <- get_coef("OLS", y_dgp1, X, beta=21, model=2)
    ols_b21.hat_dgp2_model1[i] <- get_coef("OLS", y_dgp2, X, beta=21, model=1)
    ols_b21.hat_dgp2_model2[i] <- get_coef("OLS", y_dgp2, X, beta=21, model=2)
    
    ridge_b21.hat_dgp1_model1[i] <- get_coef("Ridge", y_dgp1, X, beta=21, model=1)
    ridge_b21.hat_dgp1_model2[i] <- get_coef("Ridge", y_dgp1, X, beta=21, model=2)
    ridge_b21.hat_dgp2_model1[i] <- get_coef("Ridge", y_dgp2, X, beta=21, model=1)
    ridge_b21.hat_dgp2_model2[i] <- get_coef("Ridge", y_dgp2, X, beta=21, model=2)
    
    Lasso_b21.hat_dgp1_model1[i] <- get_coef("LASSO", y_dgp1, X, beta=21, model=1)
    Lasso_b21.hat_dgp1_model2[i] <- get_coef("LASSO", y_dgp1, X, beta=21, model=2)
    Lasso_b21.hat_dgp2_model1[i] <- get_coef("LASSO", y_dgp2, X, beta=21, model=1)
    Lasso_b21.hat_dgp2_model2[i] <- get_coef("LASSO", y_dgp2, X, beta=21, model=2)
}




c(mean(ols_b1.hat_dgp1_model1), mean(ols_b1.hat_dgp1_model2), mean(ols_b1.hat_dgp2_model1),mean(ols_b1.hat_dgp2_model2))

rmse <- function(x){
    return(sqrt((R)^-1 * sum(x - 1)^2))
}

c(rmse(ols_b1.hat_dgp1), rmse(ols_b1.hat_dgp2), rmse(ridge_b1.hat_dgp1),
  rmse(ridge_b1.hat_dgp2), rmse(Lasso_b1.hat_dgp1), rmse(Lasso_b1.hat_dgp2))


sd <- function(x){
    return(sqrt(R^-1 * sum(x - mean(x))^2))
}
c(sd(ols_b1.hat_dgp1), sd(ols_b1.hat_dgp2), sd(ridge_b1.hat_dgp1),
  sd(ridge_b1.hat_dgp2), sd(Lasso_b1.hat_dgp1), sd(Lasso_b1.hat_dgp2))
