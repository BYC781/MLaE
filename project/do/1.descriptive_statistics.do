clear all
set more off

cd "/Users/bychen/Documents/MLaE/project"

use sleeptime_clear.dta, clear

sort distance_work
by distance_work : sum wbladder
graph box wbladder, by(distance_work)
graph box wbladder, by(marst)
graph box wbladder, by(female)
