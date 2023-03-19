library(glmnet)
library(dplyr)
source("Function.R")
beta_vector <- rep(1, 21)
beta <- setNames(beta_vector, paste0("b", 0:20))
n <- 500; p <- 50; tra.idx <- 1:400; R <- 20



# main1: beta_method_dgp_model
set.seed(1234)
container <- matrix(nrow=R, ncol=24)
params <- expand.grid(b_hat=c(1, 21), 
                      met=c("OLS", "Ridge", "LASSO"), dt=1:2, md=1:2)
colnames(container) <- apply(params, 1, paste0, collapse="_")
container[] <- mapply(function(b_hat, met, dt, md) {
    sapply(1:R, function(...) 
        draw_and_get(method=met, beta=b_hat, model=md, dgp=dt))
}, params$b_hat,params$met,params$dt,params$md)




# main2: method_dgp_model
set.seed(1234)
params2 <- expand.grid(met=c("OLS", "Ridge", "LASSO"), dt=1:2, md=1:2)
matrix_list <- lapply(1:12, function(x) matrix(nrow = 100, ncol = R))
matrix_list <- lapply(seq_along(matrix_list), function(i) {
    sapply(1:R, function(r){
        draw_and_pred_minus_test(met=params2[i,"met"], 
                                 model=params2[i,"md"], 
                                 dgp=params2[i,"dt"])
    })
})
names(matrix_list) <- apply(params2, 1, paste0, collapse="_")




##a
mean.for.b1 <- apply(container[,seq(1,24,2)], 2, mean)
sd.for.b1 <- apply(container[,seq(1,24,2)], 2, var) %>% sqrt()
rmses.for.b1 <- apply(container[,seq(1,24,2)], 2, 
                      function(col) sqrt((1/length(col)) * sum((col - 1)^2)))

##b
mean.for.b21 <- apply(container[,seq(2,24,2)], 2, mean)
sd.for.b21 <- apply(container[,seq(2,24,2)], 2, var) %>% sqrt()
rmses.for.b21 <- apply(container[,seq(2,24,2)], 2, 
                       function(col) sqrt((1/length(col)) * sum((col - 0)^2)))

##c
MSPE_method_dgp_model <- numeric(12)
for (i in 1:12){
    sum <- 0
    for (col in 1:R){
        sum <- sum + 0.01*t(matrix_list[[i]][,col]) %*% matrix_list[[i]][,col]
    }
    result <- R^-1 * sum
    print(result)
    MSPE_method_dgp_model[i] <- result
}
names(MSPE_method_dgp_model) <- apply(params2, 1, paste0, collapse="_")
MSPE_method_dgp_model