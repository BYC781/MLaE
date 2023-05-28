clear all
set more off

cd "/Users/bychen/Documents/MLaE/project"


use rdata/atus_00008.dta, clear

**************************clear data**************************
drop  covidunaw  pernum lineno
drop if covidtelew == 99 //first stage outcome:whether recipiant can worked remotely
drop if empstat~=1 & empstat~=2 //keep those who are employed
drop if earnweek == 99999.99
drop if uhrsworkt == 9995
drop if wb_resp == 0
drop if wbladder == 999
/*
**spouse related variables

foreach x in spage spsex sprace spempnot spempstat spusualhrs spearnweek{
replace `x' = . if spousepres == 3
}
*/
drop sp*  
//drop spouse related variables(a lot missing, maybe 之後再加入)

order year caseid statefip age sex race marst hh_numkids covidtelew bls_pcare_sleep painmed wbladder bls_leis_sport bls_leis_soc empstat  occ ind earnweek uhrsworkt
sort caseid 
format caseid %18.0g

gen female = sex == 2 
gen distance_work = 1 if covid == 2
replace distance_work = 0 if covid == 1

compress

save sleeptime_clear.dta, replace
