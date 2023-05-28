library(DoubleML)
library(mlr3)
library(mlr3learners)
library(haven)
library(tidyverse)
library(sjmisc)
library(fastDummies)


# Load bonus data
sleep.dat = read_dta("/Users/bychen/Documents/MLaE/project/data/tu_clone.dta")
sleep.dat = as.data.table(sleep.dat)
y <- sleep.dat %>% select(starts_with("bls_"), wbladder)
x <- sleep.dat %>% select(-starts_with("bls_"), -wbladder)
cata <- c("statefip","race", "marst", "empstat", "occ2", "ind2", "famincome", 
          "citizen", "clwkr", "fullpart")
catagorical.data <- x %>% select(all_of(cata)) %>% to_label()
catdummy = dummy_cols(catagorical.data) %>% select(-(statefip:fullpart))
numeric.data <- x %>% select(-all_of(cata))
dat = bind_cols(y[, 18] ,numeric.data, catdummy) %>% drop_na() %>% as.data.table()
colnames(dat) <- make.names(colnames(dat))
labelled_cols <- names(dat)[sapply(dat, function(x) inherits(x, "haven_labelled"))]
dat[, (labelled_cols) := lapply(.SD, function(x) as.numeric(x)), .SDcols = labelled_cols]


# Specify the data and variables for the causal model
dml_data_bonus = DoubleMLData$new(dat,
                                  y_col = colnames(dat)[1],
                                  d_cols = colnames(dat)[9],
                                  x_cols = colnames(dat)[-c(1,9)])
print(dml_data_bonus)


# surpress messages from mlr3 package during fitting
lgr::get_logger("mlr3")$set_threshold("warn")

learner = lrn("regr.ranger", num.trees=500, max.depth=5, min.node.size=2)
ml_l_bonus = learner$clone()
ml_m_bonus = learner$clone()


set.seed(3141)
obj_dml_plr_bonus = DoubleMLPLR$new(dml_data_bonus, ml_l=ml_l_bonus, ml_m=ml_m_bonus)
obj_dml_plr_bonus$fit()
print(obj_dml_plr_bonus)
