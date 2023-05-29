clear all
set more off

cd "/Users/bychen/Documents/MLaE/project"

use sleeptime_clear.dta, clear

// Set X, D
global X i.statefip age female hh_child i.occ2 earnweek i.race i.fullpart

global D distance_work

global Y wbladder

pdslasso wbladder $D ($X), rob
qddml wbladder $D ($X), kfolds(5) model(partial) cmd(rlasso) reps(5)
xpopoisson $Y $D, controls($X)
psmatch2 $D $X, out($Y) logit n(2)
reg $Y $D $X, r


set seed 42

// pdslasso
foreach Y in painmed wbladder bls_leis_sport bls_leis_soccom rested bls_pcare_sleep bls_pcare_health bls_work_working{
	pdslasso `Y' $D ($X1), rob
}

// DDML
foreach Y in painmed wbladder bls_leis_sport bls_leis_soccom rested bls_pcare_sleep bls_pcare_health bls_work_working{
	qddml `Y' $D ($X), kfolds(2) model(partial) cmd(rlasso) reps(5)
}


// matching
foreach Y in painmed wbladder bls_leis_sport bls_leis_soccom rested bls_pcare_sleep bls_pcare_health bls_work_working{
	psmatch2 $D $X, out(`Y') logit n(2)
}

// xpopoisson 
foreach Y in painmed wbladder bls_leis_sport bls_leis_soccom rested bls_pcare_sleep  bls_work_working{
	xpopoisson `Y' $D, controls($X)
}
