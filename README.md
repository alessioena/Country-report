# Country-report (2019)

This is an International Economics and Policy report of Austria made using STATA.</br>
[[PDF]](https://github.com/alessioena/Country-report/blob/main/65569_Alessio_Ena-Austria.pdf)
[[Full code]](https://github.com/alessioena/Country-report/blob/main/DOfile.do)

- Language of the report: Italiano
- Source of the data: [comtrade.un.org](https://comtrade.un.org/)

# Report di Economia e Politica internazionale: L’Austria

La Repubblica d’Austria è un Paese di 8,85 milioni di abitanti dell'Europa centrale, caratterizzato da un aspro territorio alpino e una vasta quantità di laghi e fiumi. Dal punto di vista economico, l'Austria è un paese ad alto reddito e si classifica come l'undicesima economia pro capite più ricca su 133 studiate. I suoi abitanti hanno un PIL pro capite di 51.499$, oggettivamente uno dei più alti d’Europa.
Nel 2019, l’Austria ha esportato beni per un totale di 172 miliardi di euro e si è posizionata nei mercati globali con una quota corrispondente allo 0,99% del totale delle esportazioni mondiali (occupando il 30° posto a livello mondiale). Sempre nello stesso anno, per quanto concerne le importazioni totali di beni, ha raggiunto 177 miliardi di euro, con una quota sulle importazioni globali del 1,01% (ha raggiunto il 27° posto a livello mondiale).

<img width="1031" alt="Screenshot 2022-03-28 at 01 04 22" src="https://user-images.githubusercontent.com/95365607/160305035-ba9d2109-3c54-4292-b066-16d8b62215b9.png">

### Composizione settoriale dell’import/export
Rielaborando con STATA i dati HS relativi ai beni forniti da Comtrade.org, qui di seguito sono state calcolate le quote settoriali dell’export e dell’import austriaco in modo tale da poter vedere quali sono i settori più rilevanti, che rappresentano il 70% dell’import/export austriaco.

<img width="809" alt="Screenshot 2022-03-28 at 01 37 36" src="https://user-images.githubusercontent.com/95365607/160306106-85bb5e03-dab3-43b5-9fbb-fa769e210868.png">

84 (18.00%): Macchinari e apparecchi meccanici, reattori nucleari, caldaie; componenti di essi </br>
87 (11.53%): Veicoli; macchine e automezzi, loro parti ed accessori</br>
85 (9.45%): Macchine e apparecchiature elettriche e loro parti; registratori e riproduttori di suoni; registratori e riproduttori di immagini e suoni televisivi, parti e accessori di tali articoli</br>
30 (6.56%): Prodotti farmaceutici</br>
39 (4.38%): Materie plastiche e articoli prodotti con la plastica</br>
72 (4.12%): Ferro e acciaio</br>
73 (3.34%): Articoli di ferro o acciaio</br>
90 (2.93%): Strumenti ed apparecchi ottici, fotografici, cinematografici, di misura, di controllo, medici o chirurgici; componenti e accessori a questi riferibili</br>
44 (2.89%): Legno e articoli di legno; carbone realizzato con il legno</br>
48(2.82%): Carta e cartone; oggetti di pasta di cellulosa, di carta o di cartone</br>
76(2.28%): Alluminio e articoli di alluminio</br>

<img width="811" alt="Screenshot 2022-03-28 at 01 38 44" src="https://user-images.githubusercontent.com/95365607/160306144-6fd1e688-de2d-432f-88e6-93d7ebe1c36e.png">

84 (13.34%): Macchinari e apparecchi meccanici, reattori nucleari, caldaie; componenti di essi</br>
87 (11.78%): Veicoli; macchine e automezzi, loro parti ed accessori</br>
85 (9.90%): Macchine e apparecchiature elettriche e loro parti; registratori e riproduttori di suoni; registratori e riproduttori di immagini e suoni televisivi, parti e accessori di tali articoli</br>
27 (7.79%): Combustibili minerali, oli minerali e prodotti della loro distillazione; sostanze bituminose; cere minerali</br>
30 (4.32%): Prodotti farmaceutici</br>
39 (4.23%): Materie plastiche e articoli prodotti con la plastica</br>
29 (2.99%): Prodotti chimici organici</br>
73 (2.93%): Articoli di ferro o acciaio</br>
90 (2.71%): Strumenti ed apparecchi ottici, fotografici, cinematografici, di misura, di controllo, medici o chirurgici; componenti e accessori a questi riferibili</br>
72 (2.34%): Ferro e acciaio</br>
94 (2.13%): Mobilia; biancheria da letto, materassi, supporti per materassi, cuscini e simili suppellettili imbottite; lampade e apparecchi di illuminazione; insegne luminose, targhette luminose e simili; edifici prefabbricati</br>
76 (2.11%): Alluminio e articoli di alluminio</br>
61 (1.90%): Abbigliamento e accessori di abbigliamento; a maglia o all'uncinetto</br>

<img width="773" alt="Screenshot 2022-03-28 at 01 40 27" src="https://user-images.githubusercontent.com/95365607/160306206-62288482-99ff-4489-b00a-8f34ae6eb29c.png">


### Quote paese dell’import/export austriaco
I paesi di destinazione dell’export austriaco più importanti, sono: la Germania(DEU), con una quota del 29,21%; gli Stati Uniti(USA), con una quota del 6,62%; l’Italia(ITA), con una quota del 6,30%; la Svizzera(CHE) con una quota del 5,01%; la Francia(FRA), con una quota del 4.37%; l’Ungheria(HUN), con una quota del 3.57%; la Repubblica Ceca(CZE), con una quota del 3.51%; la Polonia(POL), con una quota del 3.36%; la Cina(CHN), con una quota del 2.90%; la Gran Bretagna(GBR), con una quota del 2.88% e la Slovenia(SNV) con una quota del 2.06%. I quali rappresentano almeno il 70% delle esportazioni totali.

<img width="830" alt="Screenshot 2022-03-28 at 01 42 27" src="https://user-images.githubusercontent.com/95365607/160306288-eff190bd-f0b4-4b6b-99a7-961c8452aaf3.png">

Per quanto riguarda le importazioni invece, i paesi più rilevanti, che rappresentano il 70% delle importazioni totali, sono: la Germania(DEU), con una quota del 34.67%; l’Italia(ITA), con una quota del 6.56%; la Cina(CHN), con una quota del 6.22%; gli Stati Uniti(USA), con una quota del 4.44%; la Repubblica Ceca(CZE), con una quota del 4.19%; la Svizzera(CHE), con una quota del 4.11%; la Polonia(POL), con una quota del 2.95%; l’Ungheria(HUN), con una quota del 2.71% e i Paesi Bassi(NLD), con una quota del 2.67%.

<img width="733" alt="Screenshot 2022-03-28 at 01 42 58" src="https://user-images.githubusercontent.com/95365607/160306296-0b7f68bd-f892-46d8-af56-aad3a4fa70f1.png">

La dimensione di queste quote percentuali può essere in parte spiegata dalla distanza dei paesi partner con cui l’Austria commercia. La distanza generalmente ha un impatto negativo sul commercio internazionale, perché si riflette in un aumento dei costi di trasporto e quindi in un aumento del prezzo dei beni e dei servizi da importare o da esportare. Nel caso dell’Austria, infatti, i partner di commercio più importanti sono proprio i paesi limitrofi europei, con cui il paese è riuscito a intessere rapporti economici più stretti, anche grazie al mercato unico europeo e alle somiglianze culturali (si pensi ad esempio alla quota paese più alta dei due grafici, la Germania, che oltre a condividere molte somiglianze con l’Austria, parla anche la stessa lingua degli austriaci, il tedesco). Nei due scatter-plot seguenti si può visualizzare la relazione presente tra la grandezza delle quote paese e la distanza espressa in logaritmi di km ponderata per la numerosità di abitanti delle città dei paesi partner.

<img width="1071" alt="Screenshot 2022-03-28 at 01 44 14" src="https://user-images.githubusercontent.com/95365607/160306375-1c29ef60-bba8-4dbf-9406-8192cf1b2e94.png">


### Peso sul commercio dei beni intermedi sui beni finali

<img width="1061" alt="Screenshot 2022-03-28 at 01 44 49" src="https://user-images.githubusercontent.com/95365607/160306380-46845d3a-c598-4e70-a264-e5e4e1dec4fc.png">


I beni intermedi esportati sono il 47.3% del totale dei beni BEC, mentre i beni intermedi importati sono il 50.7% del totale dei beni BEC.
