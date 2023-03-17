library(glmnet)
library(dplyr)
source("Function.R")
beta_vector <- rep(1, 21)
beta <- setNames(beta_vector, paste0("b", 0:20))
n <- 500; p <- 50; tra.idx <- 1:400; R <- 2000
lambdas <- seq(0,2, length.out = 100)



# main1: beta_method_dgp_model
set.seed(1234)
container <- matrix(nrow=R, ncol=24)
params <- expand.grid(b_hat=c(1, 21), met=c("OLS", "Ridge", "LASSO"), dt=1:2, md=1:2)
colnames(container) <- apply(params, 1, paste0, collapse="_")
container[] <- mapply(function(b_hat, met, dt, md) {
    sapply(1:R, function(...) draw_and_get(method=met, beta=b_hat, model=md, dgp=dt))
}, params$b_hat,params$met,params$dt,params$md)



# main2: method_dgp_model
set.seed(1234)
R <- 10
params2 <- expand.grid(met=c("OLS", "Ridge", "LASSO"), dt=1:2, md=1:2)
names(matrix_list) <- apply(params2, 1, paste0, collapse="_")
matrix_list <- lapply(seq_along(matrix_list), function(i) {
    sapply(1:R, function(r) {
        draw_and_pred(met=params2[i,"met"], model=params2[i,"md"], dgp=params2[i,"dt"])
    })
})
matrix_list <- lapply(matrix_list, t)
names(matrix_list) <- apply(params2, 1, paste0, collapse="_")




col_means <- colMeans(container)
col_sds <- apply(container, 2, var) %>% sqrt()
col_rmses.for.b1 <- apply(container[,seq(1,24,2)], 2, function(col) sqrt((1/length(col)) * sum((col - 1)^2)))
col_rmses.for.b21 <- apply(container[,seq(2,24,2)], 2, function(col) sqrt((1/length(col)) * sum((col - 0)^2)))