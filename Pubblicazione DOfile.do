/************************

Autore: Alessio Ena
Matricola: 11/77/65569

************************/




//	IMPORTAZIONE DATI EXCEL IN STATA

import excel "C:\Users\Alessio Ena\Desktop\Austria\HS_19_x.xlsx", sheet("Foglio1") firstrow 			//HS export 2019
save "C:\Users\Alessio Ena\Desktop\Austria\Stata\HS_19_x.dta"						//salvataggio del dataset in formato Stata (.dta)

import excel "C:\Users\Alessio Ena\Desktop\Austria\HS_19_M.xlsx", sheet("Foglio1") firstrow			//HS import 2019
save "C:\Users\Alessio Ena\Desktop\Austria\Stata\HS_19_M.dta"

import excel "C:\Users\Alessio Ena\Desktop\Austria\Exp_totali.xlsx", sheet("Foglio1") firstrow		//importazione delle esportazioni totali verso il mondo
save "C:\Users\Alessio Ena\Desktop\Austria\Stata\Exp_totali.dta"


import excel "C:\Users\Alessio Ena\Desktop\Austria\BEC_19_x.xlsx", sheet("Foglio1") firstrow			//BEC export 2019
save "C:\Users\Alessio Ena\Desktop\Austria\Stata\BEC_19_x.dta"

import excel "C:\Users\Alessio Ena\Desktop\Austria\BEC_19_M.xlsx", sheet("Foglio1") firstrow			//BEC import 2019
save "C:\Users\Alessio Ena\Desktop\Austria\Stata\BEC_19_M.dta"



//	IMPORTANZA DELL'AUSTRIA A LIVELLO GLOBALE (export)
	
	use "C:\Users\Alessio Ena\Desktop\Austria\Export_mondo.dta", clear
	egen value=sum(v)	//calcolo il totale delle esportazioni mondiali creando una nuova variabile, funzione di v (value)
	gen Quota_p=v/value		//calcolo le quote di export relative ai singoli paesi
	
	drop if i~=40	//mantengo solo l'Austria, eliminando gli altri record dal dataset
	label var Quota_p "Austria"
	gen quotamondo=1-Quota_p	//calcolo la quota del mondo in via deduttiva
	label var quotamondo "Resto del mondo"
	graph pie Quota_p quotamondo, legend(on)	//creo il grafico a torta
	
	
//	IMPORTANZA DELL'AUSTRIA A LIVELLO GLOBALE (import)
	
	use "C:\Users\Alessio Ena\Desktop\Austria\Import_mondo.dta", clear
	egen value=sum(v)	//calcolo il totale delle esportazioni mondiali 
	gen Quota_p=v/value		//calcolo le quote di import relative ai singoli paesi
	
	drop if j~=40	//mantengo solo l'Austria
	label var Quota_p "Austria"
	gen quotamondo=1-Quota_p
	label var quotamondo "Resto del mondo"
	graph pie Quota_p quotamondo, legend(on)	//creo il grafico a torta

	
//	CALCOLO DELLE QUOTE SETTORIALI (export)

	//Primo metodo - 
	
	use "C:\Users\Alessio Ena\Desktop\Austria\Stata\HS_19_x.dta", clear
	
	keep if j==0 //tengo solo le informazioni riferite al mondo (indicizzate con j pari a 0)
	sort i j Year //riordino i dati per i,j e Year
	merge m:1 i j Year using "C:\Users\Alessio Ena\Desktop\Austria\Stata\Exp_totali.dta" /*attraverso il comando merge unisco i due dataset(il primo su cui sto lavorando e il secondo attinente al totale delle esportazioni')*/
	
	gen Quota_s = v/value //a questo punto calcolo le quote settoriali (ho ottenuto la colonna 'value' grazie al merge)
	label var Quota_s "Quota settoriale"
	
	egen rankquota =rank(Quota_s), field by (i)	//indicizzo la quota in modo tale da visualizzare i dati con piu' facilita'
	sort i rankquota //riordino le quote in ordine crescente
	by i, sort: gen cum=sum(Quota_s) //genero una funzione di distribuzione cumulata per selezionare i settori che compongono il 70% del totale export
	by i,sort: keep if cum <= 0.70
	graph bar Quota_s,over(Commodity_code) by(Year) title(Principali settori dell'export austriaco)
	
	//Secondo metodo
	
	use "C:\Users\Alessio Ena\Desktop\Austria\Stata\HS_19_x.dta", clear
	
	keep if j==0
	collapse(sum) v,by(j Year) //calcolo la quota totale di export verso il mondo
	rename v Tot_exp_wld
		/*una volta calcolato l'export totale verso il mondo salvo il file e ripeto la stessa procedura di prima utilizzando il merge (dal terzo passaggio in poi),
		senza avere quindi il bisogno di scaricare il file dei totali da Comtrade.																				*/
	
	//Terzo metodo
	
	use "C:\Users\Alessio Ena\Desktop\Austria\Stata\HS_19_x.dta", clear
	
	egen value= sum(v), by(j)	//creo una nuova variabile (value) che rappresenta le esportazioni totali
	keep if j==0	//tengo solo le informazioni riferite al mondo (indicizzate con j pari a 0)
	gen Quota_s = v/value //calcolo le quote settoriali
	label var Quota_s "Quota settoriale"
	
	egen rankquota =rank(Quota_s), field by (i)	//indicizzo la quota in modo tale da visualizzare i dati con piu' facilita'
	sort i rankquota //riordino le quote in ordine crescente
	by i, sort: gen paesecum=sum(Quota_s) //genero una funzione di distribuzione cumulata per selezionare i settori che compongono il 70% del totale export
	by i,sort: keep if paesecum <= 0.70 //elimino i settori meno significativi
	graph bar Quota_s,over(Commodity_code) by(Year) title(Principali settori dell'export austriaco) //creo un grafico a barre
	
	
//	CALCOLO DELLE QUOTE SETTORIALI (import)
//
//	Ho continuato a usare il terzo metodo

	use "C:\Users\Alessio Ena\Desktop\Austria\Stata\HS_19_M.dta", clear
	
	egen value= sum(v), by(i)
	keep if i==0
	gen Quota_s = v/value
	label var Quota_s "Quota settoriale"
	
	egen rankquota =rank(Quota_s), field by (j)	
	sort j rankquota 
	by j, sort: gen paesecum=sum(Quota_s)
	by j,sort: keep if paesecum <= 0.70
	graph bar Quota_s,over(Commodity_code) by(Year) title(Principali settori dell'import austriaco)
	
	
//	QUOTE SETTORIALI (export) a livello mondiale
	
	use "C:\Users\Alessio Ena\Desktop\Austria\settori_x.dta", clear
	collapse(sum) v,by(CommodityCode)	//ottengo i totali dei settori a livello mondiale utilizzando il comando collapse
	rename v tots
	
	rename CommodityCode Commodity_code
	merge m:m Commodity_code using "C:\Users\Alessio Ena\Desktop\Austria\export_quoteset.dta"	//unisco i 2 dateset associandoli attraverso il Commodity_code

	gen quote_mond =v/tots	//genero le quote settore dell'Austria sul totale mondiale del settore 
	
	
	graph bar quote_mond,over(Commodity_code) by(Year) title(Posizionamento mondiale dei settori dell'export austriaco)


//	QUOTE SETTORIALI (import) a livello mondiale	

	use "C:\Users\Alessio Ena\Desktop\Austria\settori_M.dta", clear
	collapse(sum) v,by(CommodityCode)	//ottengo i totali dei settori a livello mondiale utilizzando il comando collapse
	rename v tots
	
	rename CommodityCode Commodity_code
	merge m:m Commodity_code using "C:\Users\Alessio Ena\Desktop\Austria\import_quoteset.dta"	//unisco i 2 dateset associandoli attraverso il Commodity_code

	gen quote_mond =v/tots	//genero le quote settore dell'Austria sul totale mondiale del settore 
	
	
	graph bar quote_mond,over(Commodity_code) by(Year) title(Posizionamento mondiale dei settori dell'import austriaco)




//	CALCOLO DELLE QUOTE PAESE (export)

	use "C:\Users\Alessio Ena\Desktop\Austria\Stata\HS_19_x.dta", clear
	
	drop if j==0
	collapse(sum) v, by(Year j i iso_j iso_i) //raggruppo v per i paesi
	egen value= sum(v)
	gen Quota_p = v/value //genero la quota paese facendo il rapporto tra v e value
	
	egen rankquota =rank(Quota_p), field by (i)
	sort i rankquota //riordino le quote in ordine crescente
	by i, sort: gen paesecum=sum(Quota_p) //genero una funzione di distribuzione cumulata per selezionare i paesi che compongono il 70% del totale exp
	by i,sort: keep if paesecum <= 0.70
	graph bar Quota_p,over(iso_j) by(Year) title(Principali paesi con i quali l'Austria esporta beni)
	
	
	
//	CALCOLO DELLE QUOTE PAESE (import)
//
//	Note: per gli import guardando le quote su Atlas appaiono diverse, ma quei dati sono riferiti al 2018

	use "C:\Users\Alessio Ena\Desktop\Austria\Stata\HS_19_M.dta", clear
	
	drop if i==0
	collapse(sum) v, by(Year j i iso_j iso_i) //raggruppo v per i paesi
	egen value= sum(v)
	gen Quota_p = v/value //genero la quota paese facendo il rapporto tra v e value
	
	egen rankquota =rank(Quota_p), field by (j)
	sort j rankquota //riordino le quote in ordine crescente
	by j, sort: gen paesecum=sum(Quota_p) //genero una funzione di ripartizione (cumulata) per selezionare i paesi che compongono il 70% del totale exp
	by j,sort: keep if paesecum <= 0.70
	graph bar Quota_p,over(iso_i) by(Year)  title(Principali paesi dai quali l'Austria importa beni)

	
	

	
//	CALCOLO DISTANZE 

//-----PULIZIA DATASET---------------------------------------------------------------	
	//per export
	use "C:\Users\Alessio Ena\Desktop\Austria\dist_cepii.dta" 
	rename iso3_i iso_i
	rename iso3_j iso_j
	
	keep if iso_i=="AUT"
	save "C:\Users\Alessio Ena\Desktop\Austria\Stata\distanze.dta"
	
	//per import
	use "C:\Users\Alessio Ena\Desktop\Austria\dist_cepii.dta" 
	rename iso3_i iso_i
	rename iso3_j iso_j
	
	keep if iso_j=="AUT"
	save "C:\Users\Alessio Ena\Desktop\Austria\Stata\distanze_.dta"
//-----------------------------------------------------------------------------------
	
	//export
	
	use "C:\Users\Alessio Ena\Desktop\Austria\Stata\Quote_paese_x.dta", clear
	sort iso_i iso_j
	
	merge m:m iso_i iso_j using "C:\Users\Alessio Ena\Desktop\Austria\Stata\distanze.dta"	//unisco il dataset delle quote paese con il dataset delle distanze
	gsort Quota_p
	
	gen logdist= ln(dist)	//genero una nuova variabile convertendo in logaritmo la distanza misurata in km
	
	twoway scatter Quota_p logdist,sort mcolor(blue) mlabel(iso_j) mlabcolor(black)	//creo uno scatter plot
	
	//|| lfit Quota_p dist ----> comando per inserire la linea di tendenza nello scatter plot (ho deciso di non inserirla)
	

	
	
//	CALCOLO DISTANZE IMPORT

	use "C:\Users\Alessio Ena\Desktop\Austria\Stata\Quote_paese_M.dta", clear
	sort iso_j iso_i
	
	merge m:m iso_j iso_i using "C:\Users\Alessio Ena\Desktop\Austria\Stata\distanze_.dta"
	gsort Quota_p
	
	gen logdist= ln(dist)
	
	twoway scatter Quota_p logdist,sort mcolor(blue) mlabel(iso_i) mlabcolor(black)
	
	
//	PESO DEI BENI INTERMEDI SUI BENI FINALI (export)
	
	use "C:\Users\Alessio Ena\Desktop\Austria\Stata\BEC_19_x.dta", clear
	
	egen tot= max(v)	//creo il totale export in una colonna separata avvalendomi della riga dei totali contenuta nel dataset
	label var tot "Totale export"
	drop if v>= 170000000000	//cancello la riga dei totali
	gen q = v/tot
	label var q "Quota categoria"
	keep if Commodity_code=="111" | Commodity_code=="121" | Commodity_code=="2" | Commodity_code=="42" | Commodity_code=="53"	//mantengo solo i beni intermedi
	
	egen sum_q_int = sum(q)	//calcolo la quota dei beni intermedi sul totale
	label var sum_q_int "Quota beni intermedi"
	
	
	gen sum_q_fin=1-sum_q_int	//calcolo la quota dei beni finali sul totale
	label var sum_q_fin "Quota beni finali"

	graph pie sum_q_int sum_q_fin, legend(on)


	
//	PESO DEI BENI INTERMEDI SUI BENI FINALI (import)
	
	use "C:\Users\Alessio Ena\Desktop\Austria\Stata\BEC_19_M.dta", clear
	
	egen tot= max(v)	//creo il totale import in una colonna separata 
	label var tot "Totale import"
	drop if v>= 170000000000	//cancello la riga dei totali
	gen q = v/tot
	label var q "Quota categoria"
	keep if Commodity_code=="111" | Commodity_code=="121" | Commodity_code=="2" | Commodity_code=="42" | Commodity_code=="53"	//mantengo solo i beni intermedi
	
	egen sum_q_int = sum(q)	//calcolo la quota dei beni intermedi sul totale
	label var sum_q_int "Quota beni intermedi"
	
	
	gen sum_q_fin=1-sum_q_int	//calcolo la quota dei beni finali sul totale
	label var sum_q_fin "Quota beni finali"

	graph pie sum_q_int sum_q_fin, legend(on)







