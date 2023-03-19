get_coef <- function(method, beta, model, dgp){
    if (model == 1) X <- X[,1:26]
    if (dgp == 1) y <- y_dgp1 else y <- y_dgp2
    if(method == "OLS"){
        return(lm(y[tra.idx,] ~ X[tra.idx,])$coefficients[beta+1])
    }
    else if (method == "Ridge"){
        ridge_model <- cv.glmnet(X[tra.idx, ],y[tra.idx, ],
                                 alpha = 0,
                                 nfolds =10)
        ridge_best <- glmnet(X, y, alpha = 0,lambda = ridge_model$lambda.min)
        return(coef(ridge_best)[beta+1])
    }
    else if(method == "LASSO"){
        lasso_model <- cv.glmnet(X[tra.idx, ],y[tra.idx, ],
                                 alpha = 1,
                                 nfolds =10)
        lasso_best <- glmnet(X, y, alpha = 1,lambda = lasso_model$lambda.min)
        return(coef(lasso_best)[beta+1])
    }
}

get_pred_minus_test <- function(method, model, dgp){
    if (model == 1) X <- X[,1:26]
    if (dgp == 1) y <- y_dgp1 else y <- y_dgp2
    if (method == "OLS"){
        train_df <- cbind(data.frame(Y=y[tra.idx,]), data.frame(X[tra.idx,]))
        new <- data.frame(X[-tra.idx,])
        my_lm <- lm(Y~., data=train_df)
        return(predict(my_lm, new) - y[-tra.idx,])
        
    }else if (method == "Ridge"){
        ridge_model <- cv.glmnet(X[tra.idx, ],y[tra.idx, ],
                           alpha = 0,
                           nfolds =10)
        
        ridge_best <- glmnet(X[tra.idx,], y[tra.idx,], alpha = 0,
                             lambda = ridge_model$lambda.min)
        
        return(predict.glmnet(ridge_best, X[-tra.idx,]) - y[-tra.idx,])
        
    }else if(method == "LASSO"){
        lasso_model <- cv.glmnet(X[tra.idx, ],y[tra.idx, ],
                           alpha = 1,
                           nfolds =10)
        
        lasso_best <- glmnet(X[tra.idx,], y[tra.idx,], alpha = 1,
                             lambda = lasso_model$lambda.min)
        
        return(predict.glmnet(lasso_best, X[-tra.idx,]) - y[-tra.idx,])
    }
}

drawn <- function(...){
    X <<- matrix(rnorm(n * p), nrow = n, ncol = p)
    X <<- cbind(1, X)
    u <<- rnorm(n)
    y_dgp1 <<- X[,1:3] %*% beta[1:3]+u
    y_dgp2 <<- X[,1:21] %*% beta + u
    X <<- X[,2:51]
}

draw_and_get <- function(method, beta, model, dgp){
    drawn()
    get_coef(method, beta, model, dgp)
}

draw_and_pred_minus_test <- function(method, model, dgp){
    drawn()
    get_pred_minus_test(method, model, dgp)
}