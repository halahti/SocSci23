*This is a code that produces analyses for article: 
*Lahtinen, H., Martikainen, P., Korhonen, K., Morris, T. T., & Myrskylä, M. Educational tracking and the polygenic prediction of education
*To be published in  Sociological Science
*Software used: Stata 16.1, PLINK 1.9, PLINK 2.0, GCTB 2.03
*Hannu Lahtinen 13 October 2023


*************************
*Genetic variables 		*
*************************
*following commands should be copied & run in the Unix command line, not Stata 
*(I nevertheless have put everything into one file for file managemnent convenience)

#pruning
/plink-1.9/plink --bfile fr_ft_h2000_autosome --maf 0.01 \
--indep-pairwise 50 5 0.2 --exclude high_ld_fr.set  --out fr_ft_h2000_pruned

#--exclude includes long-renge linkage disequilibrum variants. The list is dowmloaded from:
https://github.com/meyer-lab-cshl/plinkQC/blob/master/inst/extdata/high-LD-regions-hg38-GRCh38.txt

#principal components
/plink-1.9/plink --bfile  fr_ft_h2000_autosome  \
--pca 20   --extract fr_ft_h2000_pruned.prune.in --out fr_ft_h2000_pca

#relatedness estimate
/plink-1.9/plink --bfile  fr_ft_h2000_autosome  \
--genome --min 0.05   --extract fr_ft_h2000_pruned.prune.in --out fr_ft_h2000_pihat_0.05

#SbayesR -adjustement
# Summary scores that exclude overlapping samples kindly provided by Ausy Okbay. 
#Banded LD-matrix from downloaded here:  https://cnsgenomics.com/software/gctb/#LDmatrices

zcat EA4_excl_23andMe_FINRISK_H2000_2022_05_03.meta.gz | awk '{print $3 " " $5 " " $6  " " $7 " " $17 " " $18 " " $13 " " $11}' > ea4finex.ma

/gctb_2.03beta_Linux/gctb --sbayes R --mldm  ukb10k_pathedt.mldm \
 --pi 0.95,0.02,0.02,0.01 --gamma 0.0,0.01,0.1,1 --seed 1604 --gwas-summary ea4finex.ma \
 --chain-length 21000 --burn-in 1000 --out-freq 200 --exclude-mhc  --out ea4

#and then scoring individuals. 
#--bfile includes hapmap3 variants only. Variant lists downloaded From Finngen green sandbox, R8
/plink-2-080621/plink2 --bfile hm3_autosome_R8rs \
 --double-id --rm-dup force-first --score  ea4.snpRes 2 5 8 --maf 0.01 --hwe 1e-8 --out /ea4


*****************Unix commands end ***************************************

*****************All the following lines should be run in Stata *****************

 use "D:\e45\custom-made\u1543_tk\u1543_folk_perus_laaja_s.dta", 
 
 destring ututku_aste sukup , replace
 
 gen koul=ututku_aste
 replace koul=1 if koul==.
 
 bysort thl_id: egen korkeinkoul=max(koul)

keep thl_id    sukup syntyv    korkeinkoul

duplicates drop

gen koulv=.
replace koulv=0 if korkeinkoul==1
replace koulv=3 if korkeinkoul==3
replace koulv=4 if korkeinkoul==4
replace koulv=5 if korkeinkoul==5
replace koulv=6 if korkeinkoul==6
replace koulv=8 if korkeinkoul==7
replace koulv=12 if korkeinkoul==8

  duplicates drop
 compress
 
 frame create homed 
 frame homed {
 use "D:\e45\custom-made\u1543_tk\u1543_folk_vl_laaja_s_v2.dta"
 

 drop if thl_id==""
*there was one id with seriously conflicting information 
drop if thl_id=="BB2020880607" 
 keep thl_id vuosi   max_ak_ktutk

 destring *, replace
 
 gen ak_korkeinkoul=floor(max_ak_ktutk/1e5)
 replace ak_korkeinkoul=1 if ak_korkeinkoul==.
  
 gen ak_koulv=0  if ak_korkeinkoul==1
 replace ak_koulv=3 if ak_korkeinkoul==3 
  replace ak_koulv=5 if ak_korkeinkoul==5 
 replace ak_koulv=6 if ak_korkeinkoul ==6  
 replace ak_koulv=8 if ak_korkeinkoul==7 
  replace ak_koulv=12 if ak_korkeinkoul==8
 drop  max_ak_ktutk
 
 reshape wide  ak_koulv ak_korkeinkoul, i(thl_id) j(vuosi)
 
gen kotikoulu=ak_koulv1970
replace kotikoulu=ak_koulv1975 if kotikoulu==.

keep thl_id kotikoulu
duplicates drop
 }
 
*the year when individuals experienced school reform: 
frame create refyr

frame refyr {
use "D:\e45\custom-made\u1543_tk\u1543_asuinkunta_laaja_1971_86.dta"
destring kunta, gen(nro)
merge m:1 nro using "D:\e45\external\u1543_biopankki_osa2\tutkpalv_u1543_peruskoulukunnat.dta", keepusing(peruskoulu)
*tutkpalv_u1543_peruskoulukunnat.dta includes manually coded school refrom implementation years (base on the letter by the Finnish national acengy of education, dated 30 May 1972)

drop if thl_id==""

*some need to be still added manually
replace peruskoulu=	1974	if nro==	1
replace peruskoulu=	1972	if nro==	17
replace peruskoulu=	.		if nro==	35
replace peruskoulu=	.		if nro==	43
replace peruskoulu=	.		if nro==	60
replace peruskoulu=	1974	if nro==	143
replace peruskoulu=	.		if nro==	170
replace peruskoulu=	1976	if nro==	283
replace peruskoulu=	.		if nro==	295
replace peruskoulu=	.		if nro==	417
replace peruskoulu=	1972	if nro==	423
replace peruskoulu=	.		if nro==	478
replace peruskoulu=	1973	if nro==	541
replace peruskoulu=	1976	if nro==	622
replace peruskoulu=	1975	if nro==	695
replace peruskoulu=	1976	if nro==	779
replace peruskoulu=	1976	if nro==	788
replace peruskoulu=	1976	if nro==	840

drop _merge nro
keep if vuosi<=1980

reshape wide kunta peruskoulu, i(thl_id) j(vuosi)
}

frlink 1:1 thl_id, frame(homed)
frget kotikoulu, from(homed)

frlink 1:1 thl_id, frame(refyr)
frget peruskoulu*, from(refyr)

gen perus=.
replace perus=0 if peruskoulu1972-syntyv>11 & peruskoulu1972!=.
replace perus=1 if peruskoulu1972-syntyv<=11 & peruskoulu1972!=.


forvalues i=1972/1977 {
	gen perusdum`i'=0 if peruskoulu`i'-syntyv>11 & peruskoulu`i'!=.
	replace  perusdum`i'=1  if peruskoulu`i'-syntyv<=11 & peruskoulu`i'!=.
}

*drop those who changed moved between municipalities with differennt reform implementation years
egen perussd=rowsd(perusdum1972 perusdum1973 perusdum1974 perusdum1975 perusdum1976 perusdum1977)
replace perus=. if perussd!=0

*birth cohort selection (+- 4 to year of reform)
keep if peruskoulu1972-syntyv>=8 & peruskoulu1972-syntyv<=15

gen sp=sukup-1

gen kotieiperus=1 if kotikoulu>0 & kotikoulu!=.
replace kotieiperus=0 if kotikoulu==0

drop if perus==.

gen pv=1 if peruskoulu1972-syntyv==11	  
replace pv=0 if pv==.	

gen pv2=pv
replace pv2=2 if perus==1 & pv2==0

lab def pv2 0 "Pre-reform" 1 "Refomr year" 2 "Post-reform"

gen yearsaftref= (peruskoulu1972-syntyv-11)*-1
*factor variables may not contain negative values
gen yearsaftref2= yearsaftref+5
lab def yearsaftref2 1 "-4" 2 "-3" 3 "-2" 4 "-1" 5 "0" 6 "1" 7 "2" 8 "3" 9 "4", replace
lab val  yearsaftref2 yearsaftref2

**PGS of ea
merge 1:1 thl_id using "D:\e45\external\tutkpalv_U1543_pgs_update_may22.dta", keepusing(pgs_ea4) gen(_merge4) keep(3)

drop if  pgs_ea4==.

gen bbid=thl_id

*principal components
merge 1:1 bbid using "D:\e45\external\biopankki_11_11_2021\tutkpalv_U1543_pca_combined.dta", keepusing(pc1-pc10) nogenerate keep(3)

*genotyping batch & data round
merge 1:1 bbid using "W:\Hannu\batchdata.dta", keepusing(batch2 aineisto) nogenerate keep(3)

*drop of close relatives
gen iid1=thl_id
gen iid2=thl_id

frame create dropl
cwf dropl
use "D:\e45\external\biopankki_11_11_2021\tutkpalv_U1543_fr_ft_h2000_pi_hat.dta"

keep if pi_hat>=0.178
frlink m:1   iid1, frame(default)
frlink m:1 iid2, frame(default) gen(default2)
drop if default==. | default2==.

set seed 0825
gen thl_id=iid1 if runiform()<0.5
replace thl_id=iid2 if thl_id==""

keep thl_id
duplicates drop

cwf default

frlink 1:1 thl_id, frame(dropl)
keep if dropl==.

*lets standardize the PGS within study sample
rename pgs_ea4 pgs_ea4orig
egen pgs_ea4=std(pgs_ea4orig)



*****************************
*Now we get into analysis!  *
*****************************

*To summarize, varaibles we use:
*koulv: years of education
*pgs_ea: polygenic score
*perus: reform exposure
*pv2 reform exposure (aölternative measurement)
*sp: female dummy
*syntyv: year of birth
*peruskoulu1972: reform region (=implementation year)
*kotieiperus: fmaily had higher than basic educaiton
*batch2: genotyping batch2
*aineisto: data collection reound (=year)
*pc1-pc10: ten first principal components of the genome
*yearsaftref2: years to reform (0=implelentaiton year, for Figure A6)


*********
*Table 1*
*********

sum pgs_ea4 
 sum koulv
 corr pgs_ea4 koulv 
 
tab perus , 
tab pv2 ,
tab sp ,
tab syntyv , 
tab peruskoulu1972 ,
tab  kotieiperus  ,

mean pgs_ea4  , over(perus)
mat l e(sd)
mean pgs_ea4  , over(pv2)
mat l e(sd)
mean pgs_ea4  , over(sp)
mat l e(sd)
mean pgs_ea4  , over(syntyv)
mat l e(sd)
mean pgs_ea4  , over(peruskoulu1972)
mat l e(sd)
mean pgs_ea4  , over(kotieiperus)
mat l e(sd)

mean koulv  , over(perus)
mat l e(sd)
mean koulv  , over(pv2)
mat l e(sd)
mean koulv  , over(sp)
mat l e(sd)
mean koulv  , over(syntyv)
mat l e(sd)
mean koulv  , over(peruskoulu1972)
mat l e(sd)
mean koulv  , over(kotieiperus)
mat l e(sd)


***********
*Figure 2 *
***********

table peruskoulu1972 syntyv


*******************************
*Table 2 &					  *
*Tables A1-A3 in the appendix *
*******************************

forvalues i=1972/1977 {
reg koulv c.pgs_ea4##perus syntyv sp i.batch2    i.aineisto pc1-pc10 if peruskoulu1972==`i'   , r
mat pre=_b[pgs_ea4], _se[pgs_ea4]
mat diff= _b[1.perus#c.pgs_ea4], _se[1.perus#c.pgs_ea4]
nlcom _b[pgs_ea4]+_b[1.perus#c.pgs_ea4],post
mat post=_b[ _nl_1],_se[_nl_1]
mat m`i'=`i',pre,post,diff,r(N)
}

mat meta=m1972\m1973\m1974\m1975\m1976\m1977
mat colnames meta=imp_year b_pre se_se b_post se_post b_diff se_diff n


forvalues i=1972/1977 {
reg koulv c.pgs_ea4##perus syntyv  i.batch2    i.aineisto pc1-pc10 if peruskoulu1972==`i'  & sp==0  , r
mat pre=_b[pgs_ea4], _se[pgs_ea4]
mat diff= _b[1.perus#c.pgs_ea4], _se[1.perus#c.pgs_ea4]
nlcom _b[pgs_ea4]+_b[1.perus#c.pgs_ea4],post
mat post=_b[ _nl_1],_se[_nl_1]
mat m`i'=`i',pre,post,diff,r(N)
}

mat metam=m1972\m1973\m1974\m1975\m1976\m1977
mat colnames metam=imp_year b_pre se_se b_post se_post b_diff se_diff n



forvalues i=1972/1977 {
reg koulv c.pgs_ea4##perus syntyv  i.batch2    i.aineisto pc1-pc10 if peruskoulu1972==`i'  & sp==1  , r
mat pre=_b[pgs_ea4], _se[pgs_ea4]
mat diff= _b[1.perus#c.pgs_ea4], _se[1.perus#c.pgs_ea4]
nlcom _b[pgs_ea4]+_b[1.perus#c.pgs_ea4],post
mat post=_b[ _nl_1],_se[_nl_1]
mat m`i'=`i',pre,post,diff,r(N)
}

mat metan=m1972\m1973\m1974\m1975\m1976\m1977
mat colnames metan=imp_year b_pre se_se b_post se_post b_diff se_diff n


forvalues i=1972/1977 {
reg koulv c.pgs_ea4##perus syntyv  i.batch2 sp   i.aineisto pc1-pc10 if peruskoulu1972==`i'  & kotieiperus==0 , r
mat pre=_b[pgs_ea4], _se[pgs_ea4]
mat diff= _b[1.perus#c.pgs_ea4], _se[1.perus#c.pgs_ea4]
nlcom _b[pgs_ea4]+_b[1.perus#c.pgs_ea4],post
mat post=_b[ _nl_1],_se[_nl_1]
mat m`i'=`i',pre,post,diff,r(N)
}

mat metalow=m1972\m1973\m1974\m1975\m1976\m1977
mat colnames metalow=imp_year b_pre se_se b_post se_post b_diff se_diff n


forvalues i=1972/1977 {
reg koulv c.pgs_ea4##perus syntyv  i.batch2 sp   i.aineisto pc1-pc10 if peruskoulu1972==`i'  & kotieiperus==1  , r
mat pre=_b[pgs_ea4], _se[pgs_ea4]
mat diff= _b[1.perus#c.pgs_ea4], _se[1.perus#c.pgs_ea4]
nlcom _b[pgs_ea4]+_b[1.perus#c.pgs_ea4],post
mat post=_b[ _nl_1],_se[_nl_1]
mat m`i'=`i',pre,post,diff,r(N)
}


mat metahigh=m1972\m1973\m1974\m1975\m1976\m1977
mat colnames metahigh=imp_year b_pre se_se b_post se_post b_diff se_diff n


 frame create metaan
 cwf metaan

 *whole sample
 clear
svmat meta, names( col )

 meta set b_pre se_se, fixed
 meta summarize
  di normal(-r(z))*2
 *<- p-value reported in the text
 
  meta set b_post se_post, fixed
 meta summarize
  di normal(-r(z))*2
 *<- p-value reported in the text

  
   meta set b_diff se_diff, fixed
 meta summarize
  di normal(-r(z))*2
  *<- p-value reported in the text

 *men
 clear
 svmat metam, names( col )

 meta set b_pre se_se, fixed
 meta summarize
 
  meta set b_post se_post, fixed
 meta summarize

   meta set b_diff se_diff, fixed
 meta summarize
  di normal(-r(z))*2
  *<- p-value reported in the text

 
 *women
 clear
 svmat metan, names( col )

 meta set b_pre se_se, fixed
 meta summarize
 
  meta set b_post se_post, fixed
 meta summarize

   meta set b_diff se_diff, fixed
 meta summarize
 

 *low family education
 clear
 svmat metalow, names( col )

 meta set b_pre se_se, fixed
 meta summarize
 
 scalar lowpreb=r(theta)
  scalar lowprese=r(se)

 
  meta set b_post se_post, fixed
 meta summarize

  scalar lowpostb=r(theta)
  scalar lowpostse=r(se)
 
   meta set b_diff se_diff, fixed
 meta summarize
  di normal(-r(z))*2
  *<- p-value reported in the text

  
  *high family education
 clear
 svmat metahigh, names( col )

 meta set b_pre se_se, fixed
 meta summarize
 
 
 scalar highpreb=r(theta)
  scalar  highprese=r(se)

 
  meta set b_post se_post, fixed
 meta summarize

  scalar  highpostb=r(theta)
  scalar  highpostse=r(se)
 

   meta set b_diff se_diff, fixed
 meta summarize
 
 *difference in pre-reform estiamtes between educational bacgrounds(reported in the text)
 *estimate:
 di highpreb-lowpreb  
 *95% LCI:
 di   highpreb-lowpreb +  sqrt(highprese^2+lowprese^2)*invnormal(0.025)  
 *95% UCI:
 di   highpreb-lowpreb +  sqrt(highprese^2+lowprese^2)*invnormal(0.975)  
 *p-value
  di  normal(- (highpreb-lowpreb) /  sqrt(highprese^2+lowprese^2) ) *2

   
 *difference in post-reform estiamtes between educational bacgrounds(reported in the text)
 *estimate:
 di highpostb-lowpostb  
 *95% LCI:
 di   highpostb-lowpostb +  sqrt(highpostse^2+lowpostse^2)*invnormal(0.025)  
 *95% UCI:
 di   highpostb-lowpostb +  sqrt(highpostse^2+lowpostse^2)*invnormal(0.975)  
 *p-value
  di  normal(- (highpostb-lowpostb) /  sqrt(highpostse^2+lowpostse^2) ) *2

 
*******************************
*Table 3 &					  *
*Tables A3-A5 in the appendix *
******************************* 
cwf default
forvalues i=1972/1977 {
reg koulv c.pgs_ea4##i.pv2 syntyv sp i.batch2    i.aineisto pc1-pc10 if peruskoulu1972==`i'   , r
mat pre=_b[pgs_ea4], _se[pgs_ea4]
mat diff= _b[1.pv2#c.pgs_ea4], _se[1.pv2#c.pgs_ea4] ,   _b[2.pv2#c.pgs_ea4], _se[2.pv2#c.pgs_ea4]
nlcom (_b[pgs_ea4]+_b[1.pv#c.pgs_ea4]) (_b[pgs_ea4]+_b[2.pv#c.pgs_ea4]) ,post
mat post=_b[ _nl_1],_se[_nl_1],_b[ _nl_2],_se[_nl_2]
tab pv2 if peruskoulu1972==`i'   , matcell(n)
mat m`i'=`i',pre,post,diff,(n')
}

mat meta2=m1972\m1973\m1974\m1975\m1976\m1977
mat colnames meta2=imp_year b_pre se_se b_dur se_dur b_post se_post b_diffdur se_diffdur b_diffpost se_diffpost n_pre n_dur n_post


forvalues i=1972/1977 {
reg koulv c.pgs_ea4##i.pv2 syntyv   i.batch2    i.aineisto pc1-pc10 if peruskoulu1972==`i'  & sp==0 , r
mat pre=_b[pgs_ea4], _se[pgs_ea4]
mat diff= _b[1.pv2#c.pgs_ea4], _se[1.pv2#c.pgs_ea4] ,   _b[2.pv2#c.pgs_ea4], _se[2.pv2#c.pgs_ea4]
nlcom (_b[pgs_ea4]+_b[1.pv#c.pgs_ea4]) (_b[pgs_ea4]+_b[2.pv#c.pgs_ea4]) ,post
mat post=_b[ _nl_1],_se[_nl_1],_b[ _nl_2],_se[_nl_2]
tab pv2 if peruskoulu1972==`i'   & sp==0, matcell(n)
mat m`i'=`i',pre,post,diff,(n')
}

mat metam2=m1972\m1973\m1974\m1975\m1976\m1977
mat colnames metam2=imp_year b_pre se_se b_dur se_dur b_post se_post b_diffdur se_diffdur b_diffpost se_diffpost n_pre n_dur n_post


forvalues i=1972/1977 {
reg koulv c.pgs_ea4##i.pv2 syntyv   i.batch2    i.aineisto pc1-pc10 if peruskoulu1972==`i'    & sp==1 , r
mat pre=_b[pgs_ea4], _se[pgs_ea4]
mat diff= _b[1.pv2#c.pgs_ea4], _se[1.pv2#c.pgs_ea4] ,   _b[2.pv2#c.pgs_ea4], _se[2.pv2#c.pgs_ea4]
nlcom (_b[pgs_ea4]+_b[1.pv#c.pgs_ea4]) (_b[pgs_ea4]+_b[2.pv#c.pgs_ea4]) ,post
mat post=_b[ _nl_1],_se[_nl_1],_b[ _nl_2],_se[_nl_2]
tab pv2 if peruskoulu1972==`i'   &  sp==1, matcell(n)
mat m`i'=`i',pre,post,diff,(n')
}

mat metan2=m1972\m1973\m1974\m1975\m1976\m1977
mat colnames metan2=imp_year b_pre se_se b_dur se_dur b_post se_post b_diffdur se_diffdur b_diffpost se_diffpost n_pre n_dur n_post



forvalues i=1972/1977 {
reg koulv c.pgs_ea4##i.pv2 syntyv sp i.batch2    i.aineisto pc1-pc10 if peruskoulu1972==`i'    & kotieiperus==0 , r
mat pre=_b[pgs_ea4], _se[pgs_ea4]
mat diff= _b[1.pv2#c.pgs_ea4], _se[1.pv2#c.pgs_ea4] ,   _b[2.pv2#c.pgs_ea4], _se[2.pv2#c.pgs_ea4]
nlcom (_b[pgs_ea4]+_b[1.pv#c.pgs_ea4]) (_b[pgs_ea4]+_b[2.pv#c.pgs_ea4]) ,post
mat post=_b[ _nl_1],_se[_nl_1],_b[ _nl_2],_se[_nl_2]
tab pv2 if peruskoulu1972==`i'   & kotieiperus==0, matcell(n)

mat m`i'=`i',pre,post,diff,(n')
}

mat metalow2=m1972\m1973\m1974\m1975\m1976\m1977
mat colnames metalow2=imp_year b_pre se_se b_dur se_dur b_post se_post b_diffdur se_diffdur b_diffpost se_diffpost n_pre n_dur n_post


forvalues i=1972/1977 {
reg koulv c.pgs_ea4##i.pv2 syntyv sp i.batch2    i.aineisto pc1-pc10 if peruskoulu1972==`i'    & kotieiperus==1 , r
mat pre=_b[pgs_ea4], _se[pgs_ea4]
mat diff= _b[1.pv2#c.pgs_ea4], _se[1.pv2#c.pgs_ea4] ,   _b[2.pv2#c.pgs_ea4], _se[2.pv2#c.pgs_ea4]
nlcom (_b[pgs_ea4]+_b[1.pv#c.pgs_ea4]) (_b[pgs_ea4]+_b[2.pv#c.pgs_ea4]) ,post
mat post=_b[ _nl_1],_se[_nl_1],_b[ _nl_2],_se[_nl_2]
tab pv2 if peruskoulu1972==`i'   & kotieiperus==1, matcell(n)

mat m`i'=`i',pre,post,diff,(n')
}

mat metahigh2=m1972\m1973\m1974\m1975\m1976\m1977
mat colnames metahigh2=imp_year b_pre se_se b_dur se_dur b_post se_post b_diffdur se_diffdur b_diffpost se_diffpost n_pre n_dur n_post


 cwf metaan

 *whole sample
 clear
svmat meta2, names( col )

 meta set b_pre se_se, fixed
 meta summarize
  di normal(-r(z))*2
 *<- p-value reported in the text
 
  meta set b_dur se_dur, fixed
   meta summarize
  di normal(-r(z))*2
 *<- p-value reported in the text
  
  meta set b_post se_post, fixed
 meta summarize
  di normal(-r(z))*2
 *<- p-value reported in the text

  
   meta set b_diffdur se_diffdur, fixed
 meta summarize
  di normal(-r(z))*2
  *<- p-value reported in the text

     meta set b_diffpost se_diffpost, fixed
 meta summarize
  
 *men
 clear
 svmat metam2, names( col )

 
 meta set b_pre se_se, fixed
 meta summarize

  meta set b_dur se_dur, fixed
   meta summarize

  meta set b_post se_post, fixed
 meta summarize

  
   meta set b_diffdur se_diffdur, fixed
 meta summarize
  di normal(-r(z))*2
  *<- p-value reported in the text

     meta set b_diffpost se_diffpost, fixed
 meta summarize
  

 
 *women
 clear
 svmat metan2, names( col )

 meta set b_pre se_se, fixed
 meta summarize

  meta set b_dur se_dur, fixed
   meta summarize

  meta set b_post se_post, fixed
 meta summarize

  
   meta set b_diffdur se_diffdur, fixed
 meta summarize

     meta set b_diffpost se_diffpost, fixed
 meta summarize
  
 

 
 *low family education
 clear
 svmat metalow2, names( col )


 meta set b_pre se_se, fixed
 meta summarize

  meta set b_dur se_dur, fixed
   meta summarize

  meta set b_post se_post, fixed
 meta summarize

  
   meta set b_diffdur se_diffdur, fixed
 meta summarize
  di normal(-r(z))*2
  *<- p-value reported in the text

     meta set b_diffpost se_diffpost, fixed
 meta summarize
  
  
  *high family education
 clear
 svmat metahigh2, names( col )


 meta set b_pre se_se, fixed
 meta summarize

  meta set b_dur se_dur, fixed
   meta summarize

  meta set b_post se_post, fixed
 meta summarize

  
   meta set b_diffdur se_diffdur, fixed
 meta summarize
 
     meta set b_diffpost se_diffpost, fixed
 meta summarize
  

*****
*Numbers used in Figure A6
****

cwf default


reg koulv c.pgs_ea4##ib5.yearsaftref2  sp i.batch2  i.aineisto  pc1-pc10, r
margins, dydx(pgs_ea4) at(yearsaftref=(1/8)) post
mat def ob=J(8,1, r(N))
mat full=(r(table)[1..2,1...])',ob

reg koulv c.pgs_ea4##ib5.yearsaftref2   i.batch2  i.aineisto  pc1-pc10 if sp==0, r 
margins, dydx(pgs_ea4) at(yearsaftref=(1/8)) post
mat def ob=J(8,1, r(N))
mat fullm=(r(table)[1..2,1...])',ob

reg koulv c.pgs_ea4##ib5.yearsaftref2   i.batch2  i.aineisto  pc1-pc10 if sp==1,  r
margins, dydx(pgs_ea4) at(yearsaftref=(1/8)) post
mat def ob=J(8,1, r(N))
mat fulln=(r(table)[1..2,1...])',ob

reg koulv c.pgs_ea4##ib5.yearsaftref2  sp i.batch2  i.aineisto  pc1-pc10 if kotieiperus==0, r
margins, dydx(pgs_ea4) at(yearsaftref=(1/8)) post
mat def ob=J(8,1, r(N))
mat fulllow=(r(table)[1..2,1...])',ob

reg koulv c.pgs_ea4##ib5.yearsaftref2  sp i.batch2  i.aineisto  pc1-pc10 if kotieiperus==1, r 
margins, dydx(pgs_ea4) at(yearsaftref=(1/8)) post
mat def ob=J(8,1, r(N))
mat fullhigh=(r(table)[1..2,1...])',ob

