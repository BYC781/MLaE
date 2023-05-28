* NOTE: You need to set the Stata working directory to the path
* where the data file is located.
cd "/Users/yihuai/Documents/yihuai/研究所/econometrics with machine learning"
set more off

clear
quietly infix                     ///
  long    year           1-5      ///
  double  caseid         6-19     ///
  byte    statefip       20-21    ///
  byte    pernum         22-23    ///
  int     lineno         24-26    ///
  double  wt06           27-43    ///
  int     age            44-46    ///
  byte    sex            47-48    ///
  int     race           49-52    ///
  int     hispan         53-56    ///
  int     asian          57-59    ///
  byte    marst          60-61    ///
  int     citizen        62-64    ///
  long    bpl            65-70    ///
  byte    genhealth      71-72    ///
  byte    vetstat        73-74    ///
  int     vetlast        75-77    ///
  byte    afnow          78-79    ///
  byte    empstat        80-81    ///
  int     occ2           82-85    ///
  long    occ            86-90    ///
  int     ind2           91-94    ///
  long    ind            95-99    ///
  byte    retired        100-101  ///
  byte    fullpart       102-103  ///
  int     uhrsworkt      104-107  ///
  double  earnweek       108-114  ///
  byte    spousepres     115-116  ///
  int     spage          117-119  ///
  int     spsex          120-122  ///
  int     sprace         123-126  ///
  byte    spempnot       127-128  ///
  byte    spempstat      129-130  ///
  int     spusualhrs     131-133  ///
  double  spearnweek     134-140  ///
  byte    hh_numownkids  141-142  ///
  long    scc_all        143-147  ///
  long    scc_own        148-152  ///
  long    scc_hh         153-157  ///
  byte    wb_resp        158-159  ///
  byte    rested         160-161  ///
  byte    highbp         162-163  ///
  byte    painmed        164-165  ///
  int     wbeligtime     166-169  ///
  double  wbwt           170-184  ///
  byte    wbtypical      185-186  ///
  int     wbladder       187-189  ///
  byte    aspouse        190-191  ///
  byte    covidtelew     192-193  ///
  byte    covidpaid      194-195  ///
  byte    covidunaw      196-197  ///
  byte    covidlook      198-199  ///
  int     act_carehh     200-203  ///
  int     act_carenhh    204-207  ///
  int     act_educ       208-211  ///
  int     act_food       212-215  ///
  int     act_govserv    216-219  ///
  int     act_hhact      220-223  ///
  int     act_hhserv     224-227  ///
  int     act_pcare      228-231  ///
  int     act_phone      232-235  ///
  int     act_profserv   236-239  ///
  int     act_purch      240-243  ///
  int     act_relig      244-247  ///
  int     act_social     248-251  ///
  int     act_sports     252-255  ///
  int     act_travel     256-259  ///
  int     act_vol        260-263  ///
  int     act_work       264-267  ///
  using `"atus_00004.dat"'

replace earnweek      = earnweek      / 100
replace spearnweek    = spearnweek    / 100
replace wbwt          = wbwt          / 1000000

format caseid        %14.0f
format wt06          %17.0g
format earnweek      %7.2f
format spearnweek    %7.2f
format wbwt          %15.6f

label var year          `"Survey year"'
label var caseid        `"ATUS Case ID"'
label var statefip      `"FIPS State Code"'
label var pernum        `"Person number (general)"'
label var lineno        `"Person line number"'
label var wt06          `"Person weight, 2006 methodology"'
label var age           `"Age"'
label var sex           `"Sex"'
label var race          `"Race"'
label var hispan        `"Hispanic origin"'
label var asian         `"Asian origin"'
label var marst         `"Marital status"'
label var citizen       `"Citizenship status"'
label var bpl           `"Birthplace"'
label var genhealth     `"General health"'
label var vetstat       `"Veteran status"'
label var vetlast       `"Last period of service in armed forces"'
label var afnow         `"Current serving in Armed Forces"'
label var empstat       `"Labor force status"'
label var occ2          `"General occupation category, main job"'
label var occ           `"Detailed occupation category, main job"'
label var ind2          `"General industry classification, main job"'
label var ind           `"Detailed industry classification, main job"'
label var retired       `"Retired"'
label var fullpart      `"Full time/part time employment status"'
label var uhrsworkt     `"Hours usually worked per week"'
label var earnweek      `"Weekly earnings"'
label var spousepres    `"Spouse or unmarried partner in household"'
label var spage         `"Age (spouse or partner)"'
label var spsex         `"Sex of respondent's spouse or unmarried partner"'
label var sprace        `"Race (spouse or partner)"'
label var spempnot      `"Employed (spouse or partner) "'
label var spempstat     `"Employment status (spouse or partner)"'
label var spusualhrs    `"Usual work hours (spouse or partner)"'
label var spearnweek    `"Weekly earnings (spouse or partner)"'
label var hh_numownkids `"Number of own children under 18 in household"'
label var scc_all       `"Total time spent on secondary childcare for all children"'
label var scc_own       `"Total time spent on secondary childcare of own children"'
label var scc_hh        `"Total time spent on secondary childcare for hh children"'
label var wb_resp       `"Well-Being Module Respondent"'
label var rested        `"Well-rested yesterday"'
label var highbp        `"High blood pressure in last five years"'
label var painmed       `"Pain medication yesterday"'
label var wbeligtime    `"Minutes spent in well-being module eligible activities"'
label var wbwt          `"Well-being Module final statistical weight, person-level"'
label var wbtypical     `"Yesterday was typical"'
label var wbladder      `"Life satisfaction ladder"'
label var aspouse       `"Spouse's line number (self-reported)"'
label var covidtelew    `"Worked remotely for pay due to COVID-19 pandemic (CPS)"'
label var covidpaid     `"Received pay for hours not worked due to the COVID-19 pandemic (CPS)"'
label var covidunaw     `"Unable to work due to COVID-19 pandemic (CPS)"'
label var covidlook     `"Prevented from looking for work due to COVID-19 pandemic (CPS)"'
label var act_carehh    `"ACT: Caring for and helping household members"'
label var act_carenhh   `"ACT: Caring for and helping non-household members"'
label var act_educ      `"ACT: Educational activities"'
label var act_food      `"ACT: Eat and drinking"'
label var act_govserv   `"ACT: Government services and civic obligations"'
label var act_hhact     `"ACT: Household activities"'
label var act_hhserv    `"ACT: Household services"'
label var act_pcare     `"ACT: Personal care"'
label var act_phone     `"ACT: Telephone calls"'
label var act_profserv  `"ACT: Professional and personal care services"'
label var act_purch     `"ACT: Consumer purchases"'
label var act_relig     `"ACT: Religious and spiritual activities"'
label var act_social    `"ACT: Socializing, relaxing, and leisure"'
label var act_sports    `"ACT: Sports, exercise, and recreation"'
label var act_travel    `"ACT: Traveling"'
label var act_vol       `"ACT: Volunteer activities"'
label var act_work      `"ACT: Working and Work-related Activities"'

label define statefip_lbl 01 `"Alabama"'
label define statefip_lbl 02 `"Alaska"', add
label define statefip_lbl 04 `"Arizona"', add
label define statefip_lbl 05 `"Arkansas"', add
label define statefip_lbl 06 `"California"', add
label define statefip_lbl 08 `"Colorado"', add
label define statefip_lbl 09 `"Connecticut"', add
label define statefip_lbl 10 `"Delaware"', add
label define statefip_lbl 11 `"District of Columbia"', add
label define statefip_lbl 12 `"Florida"', add
label define statefip_lbl 13 `"Georgia"', add
label define statefip_lbl 15 `"Hawaii"', add
label define statefip_lbl 16 `"Idaho"', add
label define statefip_lbl 17 `"Illinois"', add
label define statefip_lbl 18 `"Indiana"', add
label define statefip_lbl 19 `"Iowa"', add
label define statefip_lbl 20 `"Kansas"', add
label define statefip_lbl 21 `"Kentucky"', add
label define statefip_lbl 22 `"Louisiana"', add
label define statefip_lbl 23 `"Maine"', add
label define statefip_lbl 24 `"Maryland"', add
label define statefip_lbl 25 `"Massachusetts"', add
label define statefip_lbl 26 `"Michigan"', add
label define statefip_lbl 27 `"Minnesota"', add
label define statefip_lbl 28 `"Mississippi"', add
label define statefip_lbl 29 `"Missouri"', add
label define statefip_lbl 30 `"Montana"', add
label define statefip_lbl 31 `"Nebraska"', add
label define statefip_lbl 32 `"Nevada"', add
label define statefip_lbl 33 `"New Hampshire"', add
label define statefip_lbl 34 `"New Jersey"', add
label define statefip_lbl 35 `"New Mexico"', add
label define statefip_lbl 36 `"New York"', add
label define statefip_lbl 37 `"North Carolina"', add
label define statefip_lbl 38 `"North Dakota"', add
label define statefip_lbl 39 `"Ohio"', add
label define statefip_lbl 40 `"Oklahoma"', add
label define statefip_lbl 41 `"Oregon"', add
label define statefip_lbl 42 `"Pennsylvania"', add
label define statefip_lbl 44 `"Rhode Island"', add
label define statefip_lbl 45 `"South Carolina"', add
label define statefip_lbl 46 `"South Dakota"', add
label define statefip_lbl 47 `"Tennessee"', add
label define statefip_lbl 48 `"Texas"', add
label define statefip_lbl 49 `"Utah"', add
label define statefip_lbl 50 `"Vermont"', add
label define statefip_lbl 51 `"Virginia"', add
label define statefip_lbl 53 `"Washington"', add
label define statefip_lbl 54 `"West Virginia"', add
label define statefip_lbl 55 `"Wisconsin"', add
label define statefip_lbl 56 `"Wyoming"', add
label values statefip statefip_lbl

label define pernum_lbl 01 `"1"'
label define pernum_lbl 02 `"2"', add
label define pernum_lbl 03 `"3"', add
label define pernum_lbl 04 `"4"', add
label define pernum_lbl 05 `"5"', add
label define pernum_lbl 06 `"6"', add
label define pernum_lbl 07 `"7"', add
label define pernum_lbl 08 `"8"', add
label define pernum_lbl 09 `"9"', add
label define pernum_lbl 10 `"10"', add
label define pernum_lbl 11 `"11"', add
label define pernum_lbl 12 `"12"', add
label define pernum_lbl 13 `"13"', add
label define pernum_lbl 14 `"14"', add
label define pernum_lbl 15 `"15"', add
label define pernum_lbl 16 `"16"', add
label values pernum pernum_lbl

label define lineno_lbl 001 `"1"'
label define lineno_lbl 002 `"2"', add
label define lineno_lbl 003 `"3"', add
label define lineno_lbl 004 `"4"', add
label define lineno_lbl 005 `"5"', add
label define lineno_lbl 006 `"6"', add
label define lineno_lbl 007 `"7"', add
label define lineno_lbl 008 `"8"', add
label define lineno_lbl 009 `"9"', add
label define lineno_lbl 010 `"10"', add
label define lineno_lbl 011 `"11"', add
label define lineno_lbl 012 `"12"', add
label define lineno_lbl 013 `"13"', add
label define lineno_lbl 014 `"14"', add
label define lineno_lbl 015 `"15"', add
label define lineno_lbl 016 `"16"', add
label define lineno_lbl 017 `"17"', add
label define lineno_lbl 018 `"18"', add
label define lineno_lbl 019 `"19"', add
label define lineno_lbl 999 `"NIU (Not in universe)"', add
label values lineno lineno_lbl

label define sex_lbl 01 `"Male"'
label define sex_lbl 02 `"Female"', add
label define sex_lbl 99 `"NIU (Not in universe)"', add
label values sex sex_lbl

label define race_lbl 0100 `"White only"'
label define race_lbl 0110 `"Black only"', add
label define race_lbl 0120 `"American Indian, Alaskan Native"', add
label define race_lbl 0130 `"Asian or Pacific Islander"', add
label define race_lbl 0131 `"Asian only"', add
label define race_lbl 0132 `"Hawaiian Pacific Islander only"', add
label define race_lbl 0200 `"White-Black"', add
label define race_lbl 0201 `"White-American Indian"', add
label define race_lbl 0202 `"White-Asian"', add
label define race_lbl 0203 `"White-Hawaiian"', add
label define race_lbl 0210 `"Black-American Indian"', add
label define race_lbl 0211 `"Black-Asian"', add
label define race_lbl 0212 `"Black-Hawaiian"', add
label define race_lbl 0220 `"American Indian-Asian"', add
label define race_lbl 0221 `"American Indian-Hawaiian"', add
label define race_lbl 0230 `"Asian-Hawaiian"', add
label define race_lbl 0300 `"White-Black-American Indian"', add
label define race_lbl 0301 `"White-Black-Asian"', add
label define race_lbl 0302 `"White-Black-Hawaiian"', add
label define race_lbl 0310 `"White-American Indian-Asian"', add
label define race_lbl 0311 `"White-American Indian-Hawaiian"', add
label define race_lbl 0320 `"White-Asian-Hawaiian"', add
label define race_lbl 0330 `"Black-American Indian-Asian"', add
label define race_lbl 0331 `"Black-American Indian-Hawaiian"', add
label define race_lbl 0340 `"Black-Asian-Hawaiian"', add
label define race_lbl 0350 `"American Indian-Asian-Hawaiian"', add
label define race_lbl 0398 `"Other 3 race combinations"', add
label define race_lbl 0399 `"2 or 3 races, unspecified"', add
label define race_lbl 0400 `"White-Black-American Indian-Asian"', add
label define race_lbl 0401 `"White-Black-American Indian-Hawaiian"', add
label define race_lbl 0402 `"White-Black-Asian-Hawaiian"', add
label define race_lbl 0403 `"Black-American Indian-Asian-Hawaiian"', add
label define race_lbl 0404 `"White-American Indian-Asian-Hawaiian"', add
label define race_lbl 0500 `"White-Black-American Indian-Asian-Hawaiian"', add
label define race_lbl 0599 `"4 or 5 races, unspecified"', add
label define race_lbl 9999 `"NIU (Not in universe)"', add
label values race race_lbl

label define hispan_lbl 0100 `"Not Hispanic"'
label define hispan_lbl 0210 `"Mexican"', add
label define hispan_lbl 0211 `"Mexican American"', add
label define hispan_lbl 0212 `"Chicano"', add
label define hispan_lbl 0213 `"Mexican (Mexicano)"', add
label define hispan_lbl 0220 `"Puerto Rican"', add
label define hispan_lbl 0230 `"Cuban"', add
label define hispan_lbl 0240 `"Central-South American"', add
label define hispan_lbl 0241 `"Dominican"', add
label define hispan_lbl 0242 `"Salvadoran"', add
label define hispan_lbl 0243 `"Other Central American"', add
label define hispan_lbl 0244 `"South American"', add
label define hispan_lbl 0250 `"Other Spanish"', add
label define hispan_lbl 9999 `"NIU (Not in universe)"', add
label values hispan hispan_lbl

label define asian_lbl 010 `"Asian Indian"'
label define asian_lbl 020 `"Chinese"', add
label define asian_lbl 030 `"Filipino"', add
label define asian_lbl 040 `"Japanese"', add
label define asian_lbl 050 `"Korean"', add
label define asian_lbl 060 `"Vietnamese"', add
label define asian_lbl 070 `"Other Asian"', add
label define asian_lbl 999 `"NIU"', add
label values asian asian_lbl

label define marst_lbl 01 `"Married - spouse present"'
label define marst_lbl 02 `"Married - spouse absent"', add
label define marst_lbl 03 `"Widowed"', add
label define marst_lbl 04 `"Divorced"', add
label define marst_lbl 05 `"Separated"', add
label define marst_lbl 06 `"Never married"', add
label define marst_lbl 99 `"NIU (Not in universe)"', add
label values marst marst_lbl

label define citizen_lbl 001 `"Native, born in United States"'
label define citizen_lbl 002 `"Native, born in Puerto Rico or U.S. Outlying Area"', add
label define citizen_lbl 003 `"Native, born abroad of American parent or parents"', add
label define citizen_lbl 004 `"Foreign born, U.S. citizen by naturalization"', add
label define citizen_lbl 005 `"Foreign born, not a U.S. citizen"', add
label define citizen_lbl 999 `"NIU (Not in universe)"', add
label values citizen citizen_lbl

label define bpl_lbl 009900 `"U.S., n.s."'
label define bpl_lbl 010000 `"American Samoa"', add
label define bpl_lbl 010500 `"Guam"', add
label define bpl_lbl 010750 `"Nothern Marianas"', add
label define bpl_lbl 011000 `"Puerto Rico"', add
label define bpl_lbl 011500 `"U.S. Virgin Islands"', add
label define bpl_lbl 012090 `"U.S. outlying areas, n.s."', add
label define bpl_lbl 015000 `"Canada"', add
label define bpl_lbl 016010 `"Bermuda"', add
label define bpl_lbl 019900 `"North America, n.s."', add
label define bpl_lbl 020000 `"Mexico"', add
label define bpl_lbl 021010 `"Belize/British Honduras"', add
label define bpl_lbl 021020 `"Costa Rica"', add
label define bpl_lbl 021030 `"El Salvador"', add
label define bpl_lbl 021040 `"Guatemala"', add
label define bpl_lbl 021050 `"Honduras"', add
label define bpl_lbl 021060 `"Nicaragua"', add
label define bpl_lbl 021070 `"Panama"', add
label define bpl_lbl 021090 `"Central America, n.s."', add
label define bpl_lbl 025000 `"Cuba"', add
label define bpl_lbl 026000 `"West Indies"', add
label define bpl_lbl 026010 `"Dominican Republic"', add
label define bpl_lbl 026020 `"Haiti"', add
label define bpl_lbl 026030 `"Jamaica"', add
label define bpl_lbl 026043 `"Bahamas"', add
label define bpl_lbl 026044 `"Barbados"', add
label define bpl_lbl 026054 `"Dominica"', add
label define bpl_lbl 026055 `"Grenada"', add
label define bpl_lbl 026060 `"Trinidad and Tobago"', add
label define bpl_lbl 026065 `"Antigua and Barbuda"', add
label define bpl_lbl 026070 `"St. Kitts--Nevis"', add
label define bpl_lbl 026075 `"St. Lucia"', add
label define bpl_lbl 026080 `"St. Vincent and the Grenadi"', add
label define bpl_lbl 026091 `"Caribbean, n.s."', add
label define bpl_lbl 030005 `"Argentina"', add
label define bpl_lbl 030010 `"Bolivia"', add
label define bpl_lbl 030015 `"Brazil"', add
label define bpl_lbl 030020 `"Chile"', add
label define bpl_lbl 030025 `"Colombia"', add
label define bpl_lbl 030030 `"Ecuador"', add
label define bpl_lbl 030040 `"Guyana/British Guiana"', add
label define bpl_lbl 030050 `"Peru"', add
label define bpl_lbl 030060 `"Uruguay"', add
label define bpl_lbl 030065 `"Venezuala"', add
label define bpl_lbl 030070 `"Paraguay"', add
label define bpl_lbl 030090 `"South America, n.s."', add
label define bpl_lbl 031000 `"Americas, n.s."', add
label define bpl_lbl 040000 `"Denmark"', add
label define bpl_lbl 040100 `"Finland"', add
label define bpl_lbl 040200 `"Iceland"', add
label define bpl_lbl 040400 `"Norway"', add
label define bpl_lbl 040500 `"Sweden"', add
label define bpl_lbl 041000 `"England"', add
label define bpl_lbl 041100 `"Scotland"', add
label define bpl_lbl 041200 `"Wales"', add
label define bpl_lbl 041300 `"United Kingdom, n.s."', add
label define bpl_lbl 041400 `"Ireland"', add
label define bpl_lbl 041410 `"Northern Ireland"', add
label define bpl_lbl 042000 `"Belgium"', add
label define bpl_lbl 042100 `"France"', add
label define bpl_lbl 042500 `"Netherlands"', add
label define bpl_lbl 042600 `"Switzerland"', add
label define bpl_lbl 043300 `"Greece"', add
label define bpl_lbl 043400 `"Italy"', add
label define bpl_lbl 043600 `"Portugal"', add
label define bpl_lbl 043610 `"Azores"', add
label define bpl_lbl 043800 `"Spain"', add
label define bpl_lbl 045000 `"Austria"', add
label define bpl_lbl 045200 `"Czechoslavakia"', add
label define bpl_lbl 045212 `"Slovakia"', add
label define bpl_lbl 045213 `"Czech Republic"', add
label define bpl_lbl 045300 `"Germany"', add
label define bpl_lbl 045400 `"Hungary"', add
label define bpl_lbl 045500 `"Poland"', add
label define bpl_lbl 045600 `"Romania"', add
label define bpl_lbl 045650 `"Bulgaria"', add
label define bpl_lbl 045675 `"Albania"', add
label define bpl_lbl 045700 `"Yugoslavia"', add
label define bpl_lbl 045720 `"Bosnia and Herzegovina"', add
label define bpl_lbl 045730 `"Croatia"', add
label define bpl_lbl 045740 `"Macedonia"', add
label define bpl_lbl 045750 `"Serbia"', add
label define bpl_lbl 045760 `"Kosovo"', add
label define bpl_lbl 045770 `"Montenegro"', add
label define bpl_lbl 046100 `"Estonia"', add
label define bpl_lbl 046200 `"Latvia"', add
label define bpl_lbl 046300 `"Lithuania"', add
label define bpl_lbl 046500 `"Other USSR/Russia"', add
label define bpl_lbl 046530 `"Ukraine"', add
label define bpl_lbl 046535 `"Belarus"', add
label define bpl_lbl 046540 `"Moldova"', add
label define bpl_lbl 046590 `"USSR, n.s."', add
label define bpl_lbl 049900 `"Europe, n.s."', add
label define bpl_lbl 050000 `"China"', add
label define bpl_lbl 050010 `"Hong Kong"', add
label define bpl_lbl 050040 `"Taiwan"', add
label define bpl_lbl 050100 `"Japan"', add
label define bpl_lbl 050200 `"Korea"', add
label define bpl_lbl 050220 `"South Korea"', add
label define bpl_lbl 050300 `"Mongolia"', add
label define bpl_lbl 051100 `"Cambodia"', add
label define bpl_lbl 051200 `"Indonesia"', add
label define bpl_lbl 051300 `"Laos"', add
label define bpl_lbl 051400 `"Malaysia"', add
label define bpl_lbl 051500 `"Philippines"', add
label define bpl_lbl 051600 `"Singapore"', add
label define bpl_lbl 051700 `"Thailand"', add
label define bpl_lbl 051800 `"Vietnam"', add
label define bpl_lbl 052000 `"Afghanistan"', add
label define bpl_lbl 052100 `"India"', add
label define bpl_lbl 052110 `"Bangladesh"', add
label define bpl_lbl 052120 `"Bhutan"', add
label define bpl_lbl 052130 `"Burma (Myanmar)"', add
label define bpl_lbl 052140 `"Pakistan"', add
label define bpl_lbl 052150 `"Sri Lanka"', add
label define bpl_lbl 052200 `"Nepal"', add
label define bpl_lbl 055100 `"Armenia"', add
label define bpl_lbl 055200 `"Azerbaijan"', add
label define bpl_lbl 055300 `"Georgia"', add
label define bpl_lbl 055400 `"Uzbekistan"', add
label define bpl_lbl 055500 `"Kazakhstan"', add
label define bpl_lbl 053000 `"Iran"', add
label define bpl_lbl 053200 `"Iraq"', add
label define bpl_lbl 053400 `"Isreal/Palestine"', add
label define bpl_lbl 053420 `"Palestine"', add
label define bpl_lbl 053500 `"Jordan"', add
label define bpl_lbl 053700 `"Lebanon"', add
label define bpl_lbl 054000 `"Saudi Arabia"', add
label define bpl_lbl 054100 `"Syria"', add
label define bpl_lbl 054200 `"Turkey"', add
label define bpl_lbl 054300 `"Cyprus"', add
label define bpl_lbl 054350 `"Kuwait"', add
label define bpl_lbl 054400 `"Yemen"', add
label define bpl_lbl 054500 `"United Arab Emirates"', add
label define bpl_lbl 054700 `"Middle East, n.s."', add
label define bpl_lbl 059900 `"Asia, n.e.c. or n.s."', add
label define bpl_lbl 060010 `"Northern Africa"', add
label define bpl_lbl 060012 `"Egypt/United Arab Rep."', add
label define bpl_lbl 060014 `"Morocco"', add
label define bpl_lbl 060016 `"Algeria"', add
label define bpl_lbl 060018 `"Sudan"', add
label define bpl_lbl 060019 `"Libya"', add
label define bpl_lbl 060023 `"Ghana"', add
label define bpl_lbl 060031 `"Nigeria"', add
label define bpl_lbl 060032 `"Cameroon"', add
label define bpl_lbl 060033 `"Cape Verde"', add
label define bpl_lbl 060034 `"Liberia"', add
label define bpl_lbl 060035 `"Senegal"', add
label define bpl_lbl 060036 `"Sierra Leone"', add
label define bpl_lbl 060037 `"Guinea"', add
label define bpl_lbl 060038 `"Ivory Coast"', add
label define bpl_lbl 060039 `"Togo"', add
label define bpl_lbl 060040 `"Eritrea"', add
label define bpl_lbl 060044 `"Ethiopia"', add
label define bpl_lbl 060045 `"Kenya"', add
label define bpl_lbl 060050 `"Somalia"', add
label define bpl_lbl 060060 `"Tanzania"', add
label define bpl_lbl 060065 `"Uganda"', add
label define bpl_lbl 060070 `"Zimbabwe"', add
label define bpl_lbl 060094 `"South Africa (Union of)"', add
label define bpl_lbl 060095 `"Zaire"', add
label define bpl_lbl 060096 `"Congo"', add
label define bpl_lbl 060097 `"Zambia"', add
label define bpl_lbl 060099 `"Africa, n.s."', add
label define bpl_lbl 070010 `"Australia"', add
label define bpl_lbl 070020 `"New Zealand"', add
label define bpl_lbl 071000 `"Pacific Islands"', add
label define bpl_lbl 071021 `"Fiji"', add
label define bpl_lbl 071022 `"Tonga"', add
label define bpl_lbl 071023 `"Samoa"', add
label define bpl_lbl 071024 `"Marshall Islands"', add
label define bpl_lbl 072000 `"Micronesia"', add
label define bpl_lbl 071090 `"Oceania, n.s."', add
label define bpl_lbl 096000 `"Other, n.e.c. and unknown"', add
label define bpl_lbl 999999 `"NIU (Not in universe)"', add
label values bpl bpl_lbl

label define genhealth_lbl 01 `"Excellent"'
label define genhealth_lbl 02 `"Very good"', add
label define genhealth_lbl 03 `"Good"', add
label define genhealth_lbl 04 `"Fair"', add
label define genhealth_lbl 05 `"Poor"', add
label define genhealth_lbl 96 `"Refused"', add
label define genhealth_lbl 97 `"Don't know"', add
label define genhealth_lbl 99 `"NIU (Not in universe)"', add
label values genhealth genhealth_lbl

label define vetstat_lbl 01 `"Veteran"'
label define vetstat_lbl 02 `"Non-veteran"', add
label define vetstat_lbl 96 `"Refused"', add
label define vetstat_lbl 97 `"Don't know"', add
label define vetstat_lbl 99 `"NIU (Not in universe)"', add
label values vetstat vetstat_lbl

label define vetlast_lbl 001 `"No service"'
label define vetlast_lbl 002 `"November 1941 or earlier"', add
label define vetlast_lbl 003 `"World War II"', add
label define vetlast_lbl 004 `"Peacetime Period B (1/47-6/50)"', add
label define vetlast_lbl 005 `"Korean War"', add
label define vetlast_lbl 006 `"Peacetime Period A (2/55-7/64)"', add
label define vetlast_lbl 007 `"Vietnam Era"', add
label define vetlast_lbl 008 `"Other service"', add
label define vetlast_lbl 009 `"May 1975-July 1990"', add
label define vetlast_lbl 010 `"August 1990-August 2001"', add
label define vetlast_lbl 011 `"September 2001 and later"', add
label define vetlast_lbl 999 `"NIU (Not in universe)"', add
label values vetlast vetlast_lbl

label define afnow_lbl 01 `"Yes"'
label define afnow_lbl 02 `"No"', add
label define afnow_lbl 99 `"NIU (Not in universe)"', add
label values afnow afnow_lbl

label define empstat_lbl 01 `"Employed - at work"'
label define empstat_lbl 02 `"Employed - absent"', add
label define empstat_lbl 03 `"Unemployed - on layoff"', add
label define empstat_lbl 04 `"Unemployed - looking"', add
label define empstat_lbl 05 `"Not in labor force"', add
label define empstat_lbl 99 `"NIU (Not in universe)"', add
label values empstat empstat_lbl

label define occ2_lbl 0110 `"Management occupations"'
label define occ2_lbl 0111 `"Business and financial operations occupations"', add
label define occ2_lbl 0120 `"Computer and mathematical science occupations"', add
label define occ2_lbl 0121 `"Architecture and engineering occupations"', add
label define occ2_lbl 0122 `"Life, physical, and social science occupations"', add
label define occ2_lbl 0123 `"Community and social service occupations"', add
label define occ2_lbl 0124 `"Legal occupations"', add
label define occ2_lbl 0125 `"Education, training, and library occupations"', add
label define occ2_lbl 0126 `"Arts, design, entertainment, sports, and media occupations"', add
label define occ2_lbl 0127 `"Healthcare practitioner and technical occupations"', add
label define occ2_lbl 0130 `"Healthcare support occupations"', add
label define occ2_lbl 0131 `"Protective service occupations"', add
label define occ2_lbl 0132 `"Food preparation and serving related occupations"', add
label define occ2_lbl 0133 `"Building and grounds cleaning and maintenance occupations"', add
label define occ2_lbl 0134 `"Personal care and service occupations"', add
label define occ2_lbl 0140 `"Sales and related occupations"', add
label define occ2_lbl 0150 `"Office and administrative support occupations"', add
label define occ2_lbl 0160 `"Farming, fishing, and forestry occupations"', add
label define occ2_lbl 0170 `"Construction and extraction occupations"', add
label define occ2_lbl 0180 `"Installation, maintenance, and repair occupations"', add
label define occ2_lbl 0190 `"Production occupations"', add
label define occ2_lbl 0200 `"Transportation and material moving occupations"', add
label define occ2_lbl 9999 `"NIU (Not in universe)"', add
label values occ2 occ2_lbl

label define ind2_lbl 0100 `"Agriculture"'
label define ind2_lbl 0101 `"Forestry, logging, fishing, hunting, and trapping"', add
label define ind2_lbl 0110 `"Mining"', add
label define ind2_lbl 0120 `"Construction"', add
label define ind2_lbl 0130 `"Nonmetallic mineral product manufacturing"', add
label define ind2_lbl 0131 `"Primary metals and fabricated metal products"', add
label define ind2_lbl 0132 `"Machinery manufacturing"', add
label define ind2_lbl 0133 `"Computer and electronic product mfg"', add
label define ind2_lbl 0134 `"Electrical equipment, appliance mfg"', add
label define ind2_lbl 0135 `"Transportation equipment manufacturing"', add
label define ind2_lbl 0136 `"Wood product manufacturing"', add
label define ind2_lbl 0137 `"Furniture and fixtures manufacturing"', add
label define ind2_lbl 0138 `"Miscellaneous and not specified mfg"', add
label define ind2_lbl 0140 `"Food manufacturing"', add
label define ind2_lbl 0141 `"Beverage and tobacco product mfg"', add
label define ind2_lbl 0142 `"Textile, apparel, and leather manufacturing"', add
label define ind2_lbl 0143 `"Paper manufacturing and printing"', add
label define ind2_lbl 0144 `"Petroleum and coal products manufacturing"', add
label define ind2_lbl 0145 `"Chemical manufacturing"', add
label define ind2_lbl 0146 `"Plastics and rubber products manufacturing"', add
label define ind2_lbl 0150 `"Wholesale trade"', add
label define ind2_lbl 0160 `"Retail trade"', add
label define ind2_lbl 0170 `"Transportation and warehousing"', add
label define ind2_lbl 0180 `"Utilities"', add
label define ind2_lbl 0190 `"Publishing industries (except internet)"', add
label define ind2_lbl 0191 `"Motion picture and sound recording industries"', add
label define ind2_lbl 0192 `"Broadcasting (except internet)"', add
label define ind2_lbl 0193 `"Internet publishing and broadcasting"', add
label define ind2_lbl 0194 `"Telecommunications"', add
label define ind2_lbl 0195 `"Internet svc providers and data processing svcs"', add
label define ind2_lbl 0196 `"Other information services"', add
label define ind2_lbl 0200 `"Finance"', add
label define ind2_lbl 0201 `"Insurance"', add
label define ind2_lbl 0210 `"Real estate"', add
label define ind2_lbl 0211 `"Rental and leasing services"', add
label define ind2_lbl 0220 `"Professional, scientific, and technical services"', add
label define ind2_lbl 0230 `"Management of companies and enterprises"', add
label define ind2_lbl 0231 `"Administrative and support services"', add
label define ind2_lbl 0232 `"Waste management and remediation services"', add
label define ind2_lbl 0240 `"Educational services"', add
label define ind2_lbl 0250 `"Hospitals"', add
label define ind2_lbl 0251 `"Health care services, except hospitals"', add
label define ind2_lbl 0252 `"Social assistance"', add
label define ind2_lbl 0260 `"Arts, entertainment, and recreation"', add
label define ind2_lbl 0270 `"Traveler accommodation"', add
label define ind2_lbl 0271 `"Food services and drinking places"', add
label define ind2_lbl 0280 `"Private households"', add
label define ind2_lbl 0290 `"Repair and maintenance"', add
label define ind2_lbl 0291 `"Personal and laundry services"', add
label define ind2_lbl 0292 `"Membership associations and organizations"', add
label define ind2_lbl 0300 `"Public administration"', add
label define ind2_lbl 9999 `"NIU (Not in universe)"', add
label values ind2 ind2_lbl

label define retired_lbl 01 `"Yes"'
label define retired_lbl 02 `"No"', add
label define retired_lbl 03 `"Was not retired last time"', add
label define retired_lbl 98 `"Blank"', add
label define retired_lbl 99 `"NIU (Not in universe)"', add
label values retired retired_lbl

label define fullpart_lbl 01 `"Full time"'
label define fullpart_lbl 02 `"Part time"', add
label define fullpart_lbl 99 `"NIU (Not in universe)"', add
label values fullpart fullpart_lbl

label define spousepres_lbl 01 `"Spouse present"'
label define spousepres_lbl 02 `"Unmarried partner present"', add
label define spousepres_lbl 03 `"No spouse or unmarried partner present"', add
label define spousepres_lbl 99 `"NIU (Not in universe)"', add
label values spousepres spousepres_lbl

label define spsex_lbl 001 `"Male"'
label define spsex_lbl 002 `"Female"', add
label define spsex_lbl 099 `"NIU (Not in universe)"', add
label values spsex spsex_lbl

label define sprace_lbl 0100 `"White only"'
label define sprace_lbl 0110 `"Black only"', add
label define sprace_lbl 0120 `"American Indian, Alaskan Native"', add
label define sprace_lbl 0130 `"Asian or Pacific Islander"', add
label define sprace_lbl 0131 `"Asian only"', add
label define sprace_lbl 0132 `"Hawaiian Pacific Islander only"', add
label define sprace_lbl 0200 `"White-Black"', add
label define sprace_lbl 0201 `"White-American Indian"', add
label define sprace_lbl 0202 `"White-Asian"', add
label define sprace_lbl 0203 `"White-Hawaiian"', add
label define sprace_lbl 0210 `"Black-American Indian"', add
label define sprace_lbl 0211 `"Black-Asian"', add
label define sprace_lbl 0212 `"Black-Hawaiian"', add
label define sprace_lbl 0220 `"American Indian-Asian"', add
label define sprace_lbl 0221 `"American Indian-Hawaiian"', add
label define sprace_lbl 0230 `"Asian-Hawaiian"', add
label define sprace_lbl 0300 `"White-Black-American Indian"', add
label define sprace_lbl 0301 `"White-Black-Asian"', add
label define sprace_lbl 0302 `"White-Black-Hawaiian"', add
label define sprace_lbl 0310 `"White-American Indian-Asian"', add
label define sprace_lbl 0311 `"White-American Indian-Hawaiian"', add
label define sprace_lbl 0320 `"White-Asian-Hawaiian"', add
label define sprace_lbl 0330 `"Black-American Indian-Asian"', add
label define sprace_lbl 0331 `"Black-American Indian-Hawaiian"', add
label define sprace_lbl 0340 `"Black-Asian-Hawaiian"', add
label define sprace_lbl 0350 `"American Indian-Asian-Hawaiian"', add
label define sprace_lbl 0398 `"Other 3 race combinations"', add
label define sprace_lbl 0399 `"2 or 3 races, unspecified"', add
label define sprace_lbl 0400 `"White-Black-American Indian-Asian"', add
label define sprace_lbl 0401 `"White-Black-American Indian-Hawaiian"', add
label define sprace_lbl 0402 `"White-Black-Asian-Hawaiian"', add
label define sprace_lbl 0403 `"Black-American Indian-Asian-Hawaiian"', add
label define sprace_lbl 0500 `"White-Black-American Indian-Asian-Hawaiian"', add
label define sprace_lbl 0599 `"4 or 5 races, unspecified"', add
label define sprace_lbl 9998 `"Not Available (see description)"', add
label define sprace_lbl 9999 `"NIU (Not in universe)"', add
label values sprace sprace_lbl

label define spempnot_lbl 00 `"Not employed"'
label define spempnot_lbl 01 `"Employed"', add
label define spempnot_lbl 99 `"NIU (Not in universe)"', add
label values spempnot spempnot_lbl

label define spempstat_lbl 01 `"Employed - at work"'
label define spempstat_lbl 02 `"Employed - not at work"', add
label define spempstat_lbl 03 `"Not employed"', add
label define spempstat_lbl 04 `"Retired"', add
label define spempstat_lbl 05 `"Disabled"', add
label define spempstat_lbl 06 `"Unable to work"', add
label define spempstat_lbl 96 `"Refused"', add
label define spempstat_lbl 97 `"Don't know"', add
label define spempstat_lbl 98 `"Blank"', add
label define spempstat_lbl 99 `"NIU (Not in universe)"', add
label values spempstat spempstat_lbl

label define spusualhrs_lbl 000 `"0"'
label define spusualhrs_lbl 001 `"1"', add
label define spusualhrs_lbl 002 `"2"', add
label define spusualhrs_lbl 003 `"3"', add
label define spusualhrs_lbl 004 `"4"', add
label define spusualhrs_lbl 005 `"5"', add
label define spusualhrs_lbl 006 `"6"', add
label define spusualhrs_lbl 007 `"7"', add
label define spusualhrs_lbl 008 `"8"', add
label define spusualhrs_lbl 009 `"9"', add
label define spusualhrs_lbl 010 `"10"', add
label define spusualhrs_lbl 011 `"11"', add
label define spusualhrs_lbl 012 `"12"', add
label define spusualhrs_lbl 013 `"13"', add
label define spusualhrs_lbl 014 `"14"', add
label define spusualhrs_lbl 015 `"15"', add
label define spusualhrs_lbl 016 `"16"', add
label define spusualhrs_lbl 017 `"17"', add
label define spusualhrs_lbl 018 `"18"', add
label define spusualhrs_lbl 019 `"19"', add
label define spusualhrs_lbl 020 `"20"', add
label define spusualhrs_lbl 021 `"21"', add
label define spusualhrs_lbl 022 `"22"', add
label define spusualhrs_lbl 023 `"23"', add
label define spusualhrs_lbl 024 `"24"', add
label define spusualhrs_lbl 025 `"25"', add
label define spusualhrs_lbl 026 `"26"', add
label define spusualhrs_lbl 027 `"27"', add
label define spusualhrs_lbl 028 `"28"', add
label define spusualhrs_lbl 029 `"29"', add
label define spusualhrs_lbl 030 `"30"', add
label define spusualhrs_lbl 031 `"31"', add
label define spusualhrs_lbl 032 `"32"', add
label define spusualhrs_lbl 033 `"33"', add
label define spusualhrs_lbl 034 `"34"', add
label define spusualhrs_lbl 035 `"35"', add
label define spusualhrs_lbl 036 `"36"', add
label define spusualhrs_lbl 037 `"37"', add
label define spusualhrs_lbl 038 `"38"', add
label define spusualhrs_lbl 039 `"39"', add
label define spusualhrs_lbl 040 `"40"', add
label define spusualhrs_lbl 041 `"41"', add
label define spusualhrs_lbl 042 `"42"', add
label define spusualhrs_lbl 043 `"43"', add
label define spusualhrs_lbl 044 `"44"', add
label define spusualhrs_lbl 045 `"45"', add
label define spusualhrs_lbl 046 `"46"', add
label define spusualhrs_lbl 047 `"47"', add
label define spusualhrs_lbl 048 `"48"', add
label define spusualhrs_lbl 049 `"49"', add
label define spusualhrs_lbl 050 `"50"', add
label define spusualhrs_lbl 051 `"51"', add
label define spusualhrs_lbl 052 `"52"', add
label define spusualhrs_lbl 053 `"53"', add
label define spusualhrs_lbl 054 `"54"', add
label define spusualhrs_lbl 055 `"55"', add
label define spusualhrs_lbl 056 `"56"', add
label define spusualhrs_lbl 057 `"57"', add
label define spusualhrs_lbl 058 `"58"', add
label define spusualhrs_lbl 059 `"59"', add
label define spusualhrs_lbl 060 `"60"', add
label define spusualhrs_lbl 061 `"61"', add
label define spusualhrs_lbl 062 `"62"', add
label define spusualhrs_lbl 063 `"63"', add
label define spusualhrs_lbl 064 `"64"', add
label define spusualhrs_lbl 065 `"65"', add
label define spusualhrs_lbl 066 `"66"', add
label define spusualhrs_lbl 067 `"67"', add
label define spusualhrs_lbl 068 `"68"', add
label define spusualhrs_lbl 069 `"69"', add
label define spusualhrs_lbl 070 `"70"', add
label define spusualhrs_lbl 071 `"71"', add
label define spusualhrs_lbl 072 `"72"', add
label define spusualhrs_lbl 073 `"73"', add
label define spusualhrs_lbl 074 `"74"', add
label define spusualhrs_lbl 075 `"75"', add
label define spusualhrs_lbl 076 `"76"', add
label define spusualhrs_lbl 077 `"77"', add
label define spusualhrs_lbl 078 `"78"', add
label define spusualhrs_lbl 079 `"79"', add
label define spusualhrs_lbl 080 `"80"', add
label define spusualhrs_lbl 081 `"81"', add
label define spusualhrs_lbl 082 `"82"', add
label define spusualhrs_lbl 083 `"83"', add
label define spusualhrs_lbl 084 `"84"', add
label define spusualhrs_lbl 085 `"85"', add
label define spusualhrs_lbl 086 `"86"', add
label define spusualhrs_lbl 087 `"87"', add
label define spusualhrs_lbl 088 `"88"', add
label define spusualhrs_lbl 089 `"89"', add
label define spusualhrs_lbl 090 `"90"', add
label define spusualhrs_lbl 091 `"91"', add
label define spusualhrs_lbl 092 `"92"', add
label define spusualhrs_lbl 093 `"93"', add
label define spusualhrs_lbl 094 `"94"', add
label define spusualhrs_lbl 095 `"95"', add
label define spusualhrs_lbl 096 `"96"', add
label define spusualhrs_lbl 097 `"97"', add
label define spusualhrs_lbl 098 `"98"', add
label define spusualhrs_lbl 099 `"99"', add
label define spusualhrs_lbl 995 `"Hours vary"', add
label define spusualhrs_lbl 999 `"NIU (Not in universe)"', add
label values spusualhrs spusualhrs_lbl

label define hh_numownkids_lbl 00 `"0"'
label define hh_numownkids_lbl 01 `"1"', add
label define hh_numownkids_lbl 02 `"2"', add
label define hh_numownkids_lbl 03 `"3"', add
label define hh_numownkids_lbl 04 `"4"', add
label define hh_numownkids_lbl 05 `"5"', add
label define hh_numownkids_lbl 06 `"6"', add
label define hh_numownkids_lbl 07 `"7"', add
label define hh_numownkids_lbl 08 `"8"', add
label define hh_numownkids_lbl 09 `"9"', add
label define hh_numownkids_lbl 10 `"10"', add
label define hh_numownkids_lbl 99 `"NIU (Not in universe)"', add
label values hh_numownkids hh_numownkids_lbl

label define wb_resp_lbl 00 `"No"'
label define wb_resp_lbl 01 `"Yes"', add
label define wb_resp_lbl 99 `"Not an ATUS respondent"', add
label values wb_resp wb_resp_lbl

label define rested_lbl 01 `"Very"'
label define rested_lbl 02 `"Somewhat"', add
label define rested_lbl 03 `"A Little"', add
label define rested_lbl 04 `"Not at all"', add
label define rested_lbl 99 `"NIU (Not in universe)"', add
label values rested rested_lbl

label define highbp_lbl 01 `"Yes"'
label define highbp_lbl 02 `"No"', add
label define highbp_lbl 99 `"NIU (Not in universe)"', add
label values highbp highbp_lbl

label define painmed_lbl 01 `"Yes"'
label define painmed_lbl 02 `"No"', add
label define painmed_lbl 99 `"NIU (Not in universe)"', add
label values painmed painmed_lbl

label define wbtypical_lbl 01 `"Better"'
label define wbtypical_lbl 02 `"The same"', add
label define wbtypical_lbl 03 `"Worse"', add
label define wbtypical_lbl 99 `"NIU (Not in universe)"', add
label values wbtypical wbtypical_lbl

label define wbladder_lbl 000 `"Worst Possible Life"'
label define wbladder_lbl 001 `"001"', add
label define wbladder_lbl 002 `"002"', add
label define wbladder_lbl 003 `"003"', add
label define wbladder_lbl 004 `"004"', add
label define wbladder_lbl 005 `"005"', add
label define wbladder_lbl 006 `"006"', add
label define wbladder_lbl 007 `"007"', add
label define wbladder_lbl 008 `"008"', add
label define wbladder_lbl 009 `"009"', add
label define wbladder_lbl 010 `"Best Possible Life"', add
label define wbladder_lbl 999 `"NIU (Not in universe)"', add
label values wbladder wbladder_lbl

label define covidtelew_lbl 01 `"No"'
label define covidtelew_lbl 02 `"Yes"', add
label define covidtelew_lbl 99 `"NIU"', add
label values covidtelew covidtelew_lbl

label define covidpaid_lbl 01 `"No"'
label define covidpaid_lbl 02 `"Yes"', add
label define covidpaid_lbl 99 `"NIU"', add
label values covidpaid covidpaid_lbl

label define covidunaw_lbl 01 `"No"'
label define covidunaw_lbl 02 `"Yes"', add
label define covidunaw_lbl 99 `"NIU"', add
label values covidunaw covidunaw_lbl

label define covidlook_lbl 01 `"No"'
label define covidlook_lbl 02 `"Yes"', add
label define covidlook_lbl 99 `"NIU"', add
label values covidlook covidlook_lbl

save sleeptime.dta, replace
