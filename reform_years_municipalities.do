*This creates data with comprehensive school implementation years,
* i.e. one behind  "D:\e45\external\u1543_biopankki_osa2\tutkpalv_u1543_peruskoulukunnat.dta"
* in https://github.com/halahti/SocSci23/blob/main/Lahtinen2023_SocSci_replication_code.do
*Many thanks for the anonymous civil servant from  Finnish national agency of education sending the letter including municipal scecific implenetation years, titlesd:
*"Peruskoulujärjesetelmään siirtymisen ajoitus valtioneuvoston 23.3.1972 tekemän päätöksen mukaan". Kouluhallitus, kouluosasto, suunnittelutoimisto, 30.5.1972
*These implementation years are manually codes based on that document.

*Hannu Lahtinen
*Stata 18.1
*13 October 2023 (English-annotated version, original April 2021)

*Municipal codes. Source:
* https://fi.wikipedia.org/wiki/Luettelo_Suomen_kunnista_perustamisvuoden_mukaan#cite_note-vaakunakirja-1	9.4.2021
*Anjalankoski and Sippola are both 754! And the yha am erge in 1975! . 
*Same Nummi/Nummi-Pusula
*Lahdenpohja, Pertteli, Teuva ja Utsjoki were for some reason twice in Wikipeedia. I removed them manually. 


input Kuntnro str25	Kunta 
001	Ahlainen 
002	Aitolahti 
003	Akaa 
020	Akaa 
004	Alahärmä 
005	Alajärvi 
006	Alastaro 
007	Alatornio 
008	Alaveteli 
009	Alavieska 
010	Alavus 
011	Angelniemi 
012	Anjala 
013	Antrea 
014	Anttola 
015	Artjärvi 
016	Asikkala 
017	Askainen 
018	Askola 
019	Aura 
032	Bergö 
033	Björköby 
034	Bromarv 
035	Brändö 
039	Degerby 
040	Dragsfjärd 
043	Eckerö 
044	Elimäki 
045	Eno 
046	Enonkoski 
047	Enontekiö 
048	Eräjärvi 
049	Espoo 
050	Eura 
051	Eurajoki 
052	Evijärvi 
060	Finström 
061	Forssa 
062	Föglö 
065	Geta 
068	Haaga 
069	Haapajärvi 
070	Haapasaari 
071	Haapavesi 
072	Hailuoto 
073	Halikko 
074	Halsua 
075	Hamina 
076	Hammarland 
077	Hankasalmi 
078	Hanko 
079	Harjavalta 
080	Harlu 
081	Hartola 
082	Hattula 
083	Hauho 
084	Haukipudas 
085	Haukivuori 
086	Hausjärvi 
087	Heinjoki 
088	Heinola 
089	Heinolan maalaiskunta 
090	Heinävesi 
091	Helsinki 
093	Hiitola 
094	Hiittinen 
095	Himanka 
096	Hinnerjoki 
097	Hirvensalmi 
098	Hollola 
099	Honkajoki 
100	Honkilahti 
101	Houtskari 
102	Huittinen 
103	Humppila 
104	Huopalahti 
105	Hyrynsalmi 
106	Hyvinkää 
107	Hyvinkään maalaiskunta 
283	Hämeenkoski 
108	Hämeenkyrö 
109	Hämeenlinna 
110	Hämeenlinnan maalaiskunta 
139	Ii 
141	Iisalmen maalaiskunta 
140	Iisalmi 
142	Iitti 
144	Ikaalinen 
143	Ikaalisten epäitsenäinen kauppala 
145	Ilmajoki 
146	Ilomantsi 
153	Imatra 
147	Impilahti 
148	Inari 
150	Iniö 
149	Inkoo 
151	Isojoki 
152	Isokyrö 
162	Jaakkima 
163	Jaala 
164	Jalasjärvi 
165	Janakkala 
166	Jepua 
167	Joensuu 
168	Johannes 
169	Jokioinen 
170	Jomala 
171	Joroinen 
172	Joutsa 
173	Joutseno 
174	Juankoski 
175	Jurva 
176	Juuka 
177	Juupajoki 
178	Juva 
179	Jyväskylä 
180	Jyväskylän maalaiskunta 
181	Jämijärvi 
182	Jämsä 
183	Jämsänkoski 
184	Jäppilä 
186	Järvenpää 
185	Jääski 
202	Kaarina 
203	Kaarlela 
204	Kaavi 
205	Kajaani 
206	Kajaanin maalaiskunta 
207	Kakskerta 
208	Kalajoki 
209	Kalanti 
210	Kalvola 
211	Kangasala 
212	Kangaslampi 
213	Kangasniemi 
214	Kankaanpää 
215	Kanneljärvi 
216	Kannonkoski 
217	Kannus 
201	Karhula 
218	Karijoki 
219	Karinainen 
220	Karjaa 
221	Karjaan maalaiskunta 
222	Karjala 
223	Karjalohja 
224	Karkkila 
225	Karkku 
226	Karstula 
227	Karttula 
228	Karuna 
229	Karunki 
230	Karvia 
231	Kaskinen 
232	Kauhajoki 
233	Kauhava 
234	Kaukola 
235	Kauniainen 
236	Kaustinen 
237	Kauvatsa 
238	Keikyä 
239	Keitele 
240	Kemi 
242	Kemijärven maalaiskunta 
320	Kemijärvi 
241	Keminmaa 
243	Kemiö 
322	Kemiönsaari 
244	Kempele 
245	Kerava 
246	Kerimäki 
247	Kestilä 
248	Kesälahti 
249	Keuruu 
250	Kihniö 
251	Kiihtelysvaara 
252	Kiikala 
253	Kiikka 
254	Kiikoinen 
255	Kiiminki 
256	Kinnula 
257	Kirkkonummi 
258	Kirvu 
259	Kisko 
260	Kitee 
261	Kittilä 
262	Kiukainen 
263	Kiuruvesi 
264	Kivennapa 
265	Kivijärvi 
266	Kodisjoki 
267	Koijärvi 
268	Koivisto 
269	Koiviston maalaiskunta 
270	Koivulahti 
271	Kokemäki 
272	Kokkola 
273	Kolari 
274	Konginkangas 
275	Konnevesi 
276	Kontiolahti 
277	Korpilahti 
278	Korpiselkä 
279	Korppoo 
280	Korsnäs 
281	Kortesjärvi 
282	Koskenpää 
284	Koski Tl 
285	Kotka 
286	Kouvola 
287	Kristiinankaupunki 
288	Kruunupyy 
289	Kuhmalahti 
290	Kuhmo 
291	Kuhmoinen 
292	Kuivaniemi 
293	Kullaa 
294	Kulosaari 
295	Kumlinge 
296	Kuolemajärvi 
297	Kuopio 
298	Kuopion maalaiskunta 
299	Kuorevesi 
300	Kuortane 
301	Kurikka 
302	Kurkijoki 
303	Kuru 
304	Kustavi 
305	Kuusamo 
306	Kuusankoski 
307	Kuusisto 
308	Kuusjoki 
310	Kylmäkoski 
311	Kymi 
312	Kyyjärvi 
321	Kyyrölä 
314	Käkisalmen maalaiskunta 
313	Käkisalmi 
315	Kälviä 
316	Kärkölä 
317	Kärsämäki 
318	Kökar 
319	Köyliö 
397	Lahdenpohja 
398	Lahti 
399	Laihia 
400	Laitila 
401	Lammi 
407	Lapinjärvi 
402	Lapinlahti 
403	Lappajärvi 
404	Lappee 
405	Lappeenranta 
406	Lappi 
408	Lapua 
409	Lapväärtti 
410	Laukaa 
411	Lauritsala 
412	Lavansaari 
413	Lavia 
414	Lehtimäki 
415	Leivonmäki 
416	Lemi 
417	Lemland 
418	Lempäälä 
419	Lemu 
420	Leppävirta 
421	Lestijärvi 
422 Lieksa  /// For some reason, LIeksa was missing in original source
423	Lieto 
424	Liljendal 
425	Liminka 
426	Liperi 
427	Lohja 
428	Lohjan kunta 
429	Lohtaja 
430	Loimaa 
431	Loimaan kunta 
432	Lokalahti 
433	Loppi 
434	Loviisa 
435	Luhanka 
436	Lumijoki 
437	Lumivaara 
438	Lumparland 
439	Luopioinen 
440	Luoto 
441	Luumäki 
442	Luvia 
443	Längelmäki 
475	Maalahti 
476	Maaninka 
477	Maaria 
478	Maarianhamina 
479	Maksamaa 
480	Marttila 
481	Masku 
482	Mellilä 
483	Merijärvi 
484	Merikarvia 
485	Merimasku 
486	Messukylä 
487	Metsämaa 
488	Metsäpirtti 
489	Miehikkälä 
490	Mietoinen 
491	Mikkeli 
492	Mikkelin maalaiskunta 
493	Mouhijärvi 
494	Muhos 
495	Multia 
496	Munsala 
497	Muolaa 
498	Muonio 
499	Mustasaari 
500	Muurame 
501	Muurla 
502	Muuruvesi 
503	Mynämäki 
504	Myrskylä 
505	Mäntsälä 
506	Mänttä 
508	Mänttä-Vilppula 
507	Mäntyharju 
529	Naantali 
530	Naantalin maalaiskunta 
531	Nakkila 
532	Nastola 
533	Nauvo 
534	Nilsiä 
535	Nivala 
536	Nokia 
537	Noormarkku 
538	Nousiainen 
539	Nuijamaa 
540	Nummi/Nummi-Pusula 
542	Nurmeksen maalaiskunta 
541	Nurmes 
543	Nurmijärvi 
544	Nurmo 
545	Närpiö 
559	Oravainen 
560	Orimattila 
561	Oripää 
562	Orivesi 
563	Oulainen 
564	Oulu 
565	Oulujoki 
566	Oulunkylä 
567	Oulunsalo 
309	Outokumpu 
574	Paattinen 
575	Paavola 
576	Padasjoki 
577	Paimio 
578	Paltamo 
445	Parainen 
573	Parainen 
*Two Parainen!
579	Paraisten maalaiskunta 
580	Parikkala 
581	Parkano 
582	Pattijoki 
599	Pedersören kunta 
583	Pelkosenniemi 
854	Pello 
584	Perho 
585	Pernaja 
586	Perniö 
587	Pertteli 
588	Pertunmaa 
589	Peräseinäjoki 
590	Petolahti 
591	Petsamo 
592	Petäjävesi 
594	Pieksämäen maalaiskunta 
593	Pieksämäki 
640	Pieksänmaa 
595	Pielavesi 
596	Pielisensuu 
597	Pielisjärvi 
598	Pietarsaari 
600	Pihlajavesi 
601	Pihtipudas 
602	Piikkiö 
603	Piippola 
604	Pirkkala 
994	Pirkkala 
605	Pirttikylä 
606	Pohja 
637	Pohjaslahti 
607	Polvijärvi 
608	Pomarkku 
609	Pori 
610	Porin maalaiskunta 
611	Pornainen 
612	Porvoo 
613	Porvoon maalaiskunta 
614	Posio 
615	Pudasjärvi 
616	Pukkila 
617	Pulkkila 
618	Punkaharju 
619	Punkalaidun 
620	Puolanka 
621	Purmo 
622	Pusula 
623	Puumala 
624	Pyhtää 
625	Pyhäjoki 
626	Pyhäjärvi 
627	Pyhäjärvi Ul 
628	Pyhäjärvi Vpl 
*Lots of Pyhäjärvis
629	Pyhämaa 
630	Pyhäntä 
631	Pyhäranta 
632	Pyhäselkä 
633	Pylkönmäki 
634	Pälkjärvi 
635	Pälkäne 
636	Pöytyä 
678	Raahe 
710	Raasepori 
679	Raippaluoto 
680	Raisio 
681	Rantasalmi 
682	Rantsila 
683	Ranua 
684	Rauma 
685	Rauman maalaiskunta 
686	Rautalampi 
687	Rautavaara 
688	Rautio 
689	Rautjärvi 
690	Rautu 
691	Reisjärvi 
692	Renko 
693	Revonlahti 
694	Riihimäki 
695	Riistavesi 
696	Ristiina 
697	Ristijärvi 
699	Rovaniemen maalaiskunta 
698	Rovaniemi 
700	Ruokolahti 
701	Ruotsinpyhtää 
702	Ruovesi 
703	Ruskeala 
704	Rusko 
708	Ruukki 
705	Rymättylä 
706	Räisälä 
707	Rääkkylä 
728	Saari 
729	Saarijärvi 
730	Sahalahti 
731	Sakkola 
732	Salla 
733	Salmi 
734	Salo 
735	Saloinen 
736	Saltvik 
737	Sammatti 
790	Sastamala 
738	Sauvo 
739	Savitaipale 
740	Savonlinna 
741	Savonranta 
742	Savukoski 
744	Seinäjoen maalaiskunta 
743	Seinäjoki 
745	Seiskari 
746	Sievi 
747	Siikainen 
748	Siikajoki 
791	Siikalatva 
749	Siilinjärvi 
750	Siipyy 
751	Simo 
752	Simpele 
753	Sipoo 
754	Sippola/Anjanankoski
755	Siuntio 
756	Snappertuna 
757	Soanlahti 
758	Sodankylä 
759	Soini 
760	Somerniemi 
761	Somero 
762	Sonkajärvi 
763	Sortavala 
764	Sortavalan maalaiskunta 
765	Sotkamo 
766	Sottunga 
767	Suistamo 
768	Sulkava 
769	Sulva 
770	Sumiainen 
771	Sund 
772	Suodenniemi 
773	Suojärvi 
774	Suolahti 
775	Suomenniemi 
776	Suomusjärvi 
777	Suomussalmi 
778	Suonenjoki 
779	Suoniemi 
780	Suursaari 
781	Sysmä 
782	Säkkijärvi 
783	Säkylä 
784	Särkisalo 
786	Säyneinen 
787	Säynätsalo 
788	Sääksmäki 
789	Sääminki 
831	Taipalsaari 
832	Taivalkoski 
833	Taivassalo 
834	Tammela 
836	Tammisaaren maalaiskunta 
835	Tammisaari 
837	Tampere 
838	Tarvasjoki 
839	Teerijärvi 
840	Teisko 
841	Temmes 
842	Tenhola 
843	Terijoki 
844	Tervo 
845	Tervola 
846	Teuva 
847	Tiukka 
848	Tohmajärvi 
849	Toholampi 
864	Toijala 
850	Toivakka 
851	Tornio 
852	Tottijärvi 
853	Turku 
855	Tuulos 
856	Tuupovaara 
857	Tuusniemi 
858	Tuusula 
859	Tyrnävä 
860	Tyrväntö 
861	Tyrvää 
862	Tytärsaari 
863	Töysä 
885	Ullava 
886	Ulvila 
887	Urjala 
888	Uskela 
889	Utajärvi 
890	Utsjoki 
894	Uudenkaarlepyyn maalaiskunta 
896	Uudenkaupungin maalaiskunta 
891	Uukuniemi 
892	Uurainen 
893	Uusikaarlepyy 
895	Uusikaupunki 
897	Uusikirkko 
785	Vaala 
905	Vaasa 
906	Vahto 
907	Vahviala 
908	Valkeakoski 
909	Valkeala 
910	Valkjärvi 
911	Valtimo 
912	Vammala 
913	Vampula 
914	Vanaja 
092	Vantaa 
915	Varkaus 
916	Varpaisjärvi 
917	Vehkalahti 
918	Vehmaa 
919	Vehmersalmi 
920	Velkua 
921	Vesanto 
922	Vesilahti 
924	Veteli 
925	Vieremä 
926	Vihanti 
927	Vihti 
928	Viiala 
929	Viipuri 
930	Viipurin maalaiskunta 
931	Viitasaari 
932	Viljakkala 
933	Vilppula 
934	Vimpeli 
935	Virolahti 
936	Virrat 
937	Virtasalmi 
938	Vuoksela 
939	Vuoksenranta 
940	Vuolijoki 
941	Vårdö 
942	Vähäkyrö 
943	Värtsilä 
923	Västanfjärd 
944	Vöyri 
946	Vöyri 
945	Vöyri-Maksamaa 
971	Ylihärmä 
972	Yli-Ii 
973	Ylikiiminki 
974	Ylimarkku 
975	Ylistaro 
976	Ylitornio 
977	Ylivieska 
978	Ylämaa 
979	Yläne 
980	Ylöjärvi 
981	Ypäjä 
988	Äetsä 
989	Ähtäri 
990	Ähtävä 
991	Äyräpää 
993	Äänekosken maalaiskunta 
992	Äänekoski 
997	Öja 
end

frame create f2 
cwf f2
input Liitosvuosi str26	kunta	Kuntnro
1934	Kyyrölä 	321
1946	Haaga 	068
1946	Huopalahti 	104
1946	Kulosaari 	294
1946	Oulunkylä 	566
1946	Degerby 	039
1946	Kuusisto 	307
1946	Akaa 	003
1947	Messukylä 	486
1948	Hämeenlinnan mlk 	110
1954	Pielisensuu 	596
1959	Seinäjoen mlk 	744
1964	Naantalin mlk 	530
1965	Oulujoki 	565
1966	Aitolahti 	002
1967	Angelniemi 	011
1967	Vanaja 	914
1967	Lappee 	404
1967	Lauritsala 	411
1967	Paraisten mlk 	579
1967	Porin mlk 	610
1967	Uskela 	888
1967	Maaria 	477
1968	Kakskerta 	207
1969	Hiittinen 	094
1969	Koijärvi 	267
1969	Hyvinkään mlk 	107
1969	Koskenpää 	282
1969	Öja 	997
1969	Karjaan mlk 	221
1969	Pyhäjärvi Ul 	627
1969	Pihlajavesi 	600
1969	Kauvatsa 	237
1969	Alaveteli 	008
1969	Teerijärvi 	839
1969	Kuopion mlk 	298
1969	Karuna 	228
1969	Uudenkaupungin mlk 	896
1969	Äänekosken mlk 	993
1970	Hinnerjoki 	096
1970	Honkilahti 	100
1970	Iisalmen mlk 	141
1971	Tyrväntö 	860
1971	Muuruvesi 	502
1971	Säyneinen 	786
1972	Ikaalisten mlk 	144
1972	Ahlainen 	001
1972	Teisko 	840
1973	Rautio 	688
1973	Kemijärven mlk 	242
1973	Lapväärtti 	409
1973	Siipyy 	750
1973	Tiukka 	847
1973	Riistavesi 	695
1973	Pielisjärvi 	597
1973	Bergö 	032
1973	Petolahti 	590
1973	Björköby 	033
1973	Koivulahti 	270
1973	Raippaluoto 	679
1973	Sulva 	769
1973	Suoniemi 	779
1973	Nurmeksen mlk 	542
1973	Pirttikylä 	605
1973	Ylimarkku 	974
1973	Eräjärvi 	048
1973	Saloinen 	735
1973	Simpele 	752
1973	Paavola 	575
1973	Revonlahti 	693
1973	Sääminki 	789
1973	Alatornio 	007
1973	Karunki 	229
1973	Paattinen 	574
1973	Sääksmäki 	788
1973	Karkku 	225
1973	Tyrvää 	861
1973	Pohjaslahti 	637
1974	Haapasaari 	070
1974	Pyhämaa 	629
1975	Anjala 	012
1975	Sippola/Anjalankoski 	754
1975	Jepua 	166
1975	Munsala 	496
1975	Uudenkaarlepyyn mlk 	894
1976	Metsämaa 	487
1976	Tottijärvi 	852
1977	Kajaanin mlk 	206
1977	Kaarlela 	203
1977	Karhula 	201
1977	Kymi 	311
1977	Karjala 	222
1977	Purmo 	621
1977	Ähtävä 	990
1977	Somerniemi 	760
1977	Snappertuna 	756
1977	Tammisaaren mlk 	836
1977	Bromarv 	034
1981	Nummi/Nummi-Pusula 	540
1981	Pusula 	622
1981	Lokalahti 	432
1981	Keikyä 	238
1981	Kiikka 	253
1989	Nuijamaa 	539
1993	Säynätsalo 	787
1993	Rauman mlk 	685
1993	Tenhola 	842
1993	Kalanti 	209
1993	Konginkangas 	274
1997	Heinolan mlk 	089
1997	Lohjan kunta 	428
1997	Porvoon mlk 	613
2001	Kuorevesi 	299
2001	Anttola 	014
2001	Mikkelin mlk 	492
2001	Temmes 	841
2003	Vehkalahti 	917
2003	Pattijoki 	582
2004	Jäppilä 	184
2004	Pieksämäen mlk 	594
2004	Virtasalmi 	937
2005	Kiihtelysvaara 	251
2005	Tuupovaara 	856
2005	Sahalahti 	730
2005	Vehmersalmi 	919
2005	Loimaan kunta 	431
2005	Saari 	728
2005	Uukuniemi 	891
2005	Karinainen 	219
2005	Peräseinäjoki 	589
2005	Värtsilä 	943
2005	Kullaa 	293
2005	Kangaslampi 	212
2006	Rovaniemen mlk 	699
2007	Toijala 	864
2007	Viiala 	928
2007	Kuivaniemi 	292
2007	Längelmäki 	443
2007	Vuolijoki 	940
2007	Haukivuori 	85
2007	Mietoinen 	490
2007	Pieksänmaa 	640
2007	Luopioinen 	439
2007	Kodisjoki 	266
2007	Ruukki 	708
2007	Suodenniemi 	772
2007	Maksamaa 	479
2007	Vöyri 	944
2007	Viljakkala 	932
2007	Sumiainen 	770
2007	Suolahti 	774
2008	Leivonmäki 	415
2009	Lehtimäki 	414
2009	Kiukainen 	262
2009	Vampula 	913
2009	Hauho 	083
2009	Kalvola 	210
2009	Lammi 	401
2009	Renko 	692
2009	Tuulos 	855
2009	Eno 	045
2009	Pyhäselkä 	632
2009	Jyväskylän mlk 	180
2009	Korpilahti 	277
2009	Jämsänkoski 	183
2009	Piikkiö 	602
2009	Alahärmä 	004
2009	Kortesjärvi 	281
2009	Ylihärmä 	971
2009	Dragsfjärd 	040
2009	Kemiö 	243
2009	Västanfjärd 	923
2009	Kälviä 	315
2009	Lohtaja 	429
2009	Ullava 	885
*2009	Sippola/Anjalankoski  	754
2009	Elimäki 	044
2009	Jaala 	163
2009	Kuusankoski 	306
2009	Valkeala 	909
2009	Jurva 	175
2009	Joutseno 	173
2009	Sammatti 	737
2009	Alastaro 	006
2009	Mellilä 	482
2009	Houtskari 	101
2009	Iniö 	150
2009	Korppoo 	279
2009	Nauvo 	533
2009	Parainen 	573
2009	Askainen 	017
2009	Lemu 	419
2009	Mänttä 	506
2009	Vilppula 	933
2009	Merimasku 	485
2009	Rymättylä 	705
2009	Velkua 	920
2009	Ylikiiminki 	973
2009	Yläne 	979
2009	Karjaa 	220
2009	Pohja 	606
2009	Tammisaari 	835
2009	Lappi 	406
2009	Vahto 	906
2009	Pylkönmäki 	633
2009	Halikko 	073
2009	Kiikala 	252
2009	Kisko 	259
2009	Kuusjoki 	308
2009	Muurla 	501
2009	Perniö 	586
2009	Pertteli 	587
2009	Suomusjärvi 	776
2009	Särkisalo 	784
2009	Mouhijärvi 	493
2009	Vammala 	912
2009	Äetsä 	988
2009	Savonranta 	741
2009	Nurmo 	544
2009	Ylistaro 	975
2009	Kestilä 	247
2009	Piippola 	603
2009	Pulkkila 	617
2009	Rantsila 	682
2009	Kuru 	303
2010	Himanka 	095
2010	Ylämaa 	978
2010	Liljendal 	424
2010	Pernaja 	585
2010	Ruotsinpyhtää 	701
2010	Noormarkku 	537
2011	Kylmäkoski 	310
2011	Kuhmalahti 	289
2011	Karttula 	227
2011	Varpaisjärvi 	916
2011	Artjärvi 	015
2011	Oravainen 	559
2011	Vöyri-Maksamaa 	945
2013	Töysä 	863
2013	Kesälahti 	248
2013	Nilsiä 	534
2013	Karjalohja 	223
*2013	Nummi/Nummi-Pusula 	540
2013	Ristiina 	696
2013	Suomenniemi 	775
2013	Haukipudas 	084
2013	Kiiminki 	255
2013	Oulunsalo 	567
2013	Yli-Ii 	972
2013	Vihanti 	926
2013	Kiikoinen 	254
2013	Kerimäki 	246
2013	Punkaharju 	618
2013	Vähäkyrö 	942
2015	Maaninka 	476
2015	Tarvasjoki 	838
2015	Lavia 	413
2016	Hämeenkoski 	283
2016	Jalasjärvi 	164
2016	Nastola 	532
2016	Köyliö 	319
2017	Luvia 	442
2017	Juankoski 	174
2020	Valtimo 	911
2021	Honkajoki 	099
end
*Source https://fi.wikipedia.org/wiki/Kuntaliitos_Suomessa 9.3.2021
*I took only first merger from nummi/pusula and sippola/anjaankoski  (as our interest liews in 1970s)

cwf default		
frlink 1:1	Kuntnro, frame(f2)	
		
		
		
frget *, 		from(f2) 
		
		
*We do not need municiplatities that did not exist in 1972
*Akaa on has two numbers (possible eralier and latter reincarnation)
drop if Liitosvuosi<1972		
keep Kuntnro Kunta Liitosvuosi
		
		
		
		
		
gen peruskoulu=.	
		
replace peruskoulu=	1972	if Kunta=="Alatornio"
replace peruskoulu=	1972	if Kunta=="Enontekiö"
replace peruskoulu=	1972	if Kunta=="Inari"
replace peruskoulu=	1972	if Kunta=="Karunki"
replace peruskoulu=	1972	if Kunta=="Kemi"
*replace peruskoulu=	1972	if Kunta=="Kemin"
*it seems that Kemin mmaalaiskunta is here under new "Keminmaa-name" 
replace peruskoulu=	1972	if Kunta=="Keminmaa"
replace peruskoulu=	1972	if Kunta=="Kemijärvi"
replace peruskoulu=	1972	if Kunta=="Kemijärven"
replace peruskoulu=	1972	if Kunta=="Kittilä"
replace peruskoulu=	1972	if Kunta=="Kolari"
replace peruskoulu=	1972	if Kunta=="Kuivaniemi"
replace peruskoulu=	1972	if Kunta=="Muonio"
replace peruskoulu=	1972	if Kunta=="Pelkosenniemi"
replace peruskoulu=	1972	if Kunta=="Pello"
replace peruskoulu=	1972	if Kunta=="Posio"
replace peruskoulu=	1972	if Kunta=="Ranua"
replace peruskoulu=	1972	if Kunta=="Rovaniemi"
replace peruskoulu=	1972	if Kunta=="Rovaniemen"
replace peruskoulu=	1972	if Kunta=="Salla"
replace peruskoulu=	1972	if Kunta=="Savukoski"
replace peruskoulu=	1972	if Kunta=="Simo"
replace peruskoulu=	1972	if Kunta=="Sodankylä"
replace peruskoulu=	1972	if Kunta=="Tervola"
replace peruskoulu=	1972	if Kunta=="Tornio"
replace peruskoulu=	1972	if Kunta=="Utsjoki"
replace peruskoulu=	1972	if Kunta=="Ylitornio"
replace peruskoulu=	1972	if Kunta=="Kuusamo"
replace peruskoulu=	1972	if Kunta=="Pudasjärvi"
replace peruskoulu=	1972	if Kunta=="Taivalkoski"
replace peruskoulu=	1972	if Kunta=="Kaarina"
replace peruskoulu=	1972	if Kunta=="Lieto"
replace peruskoulu=	1972	if Kunta=="Tarvasjoki"
replace peruskoulu=	1972	if Kunta=="Nousiainen"
replace peruskoulu=	1972	if Kunta=="Asikainen"
replace peruskoulu=	1972	if Kunta=="Masku"
replace peruskoulu=	1972	if Kunta=="Lemu"
replace peruskoulu=	1972	if Kunta=="Vahto"
replace peruskoulu=	1972	if Kunta=="Velkua"
replace peruskoulu=	1972	if Kunta=="Raisio"
replace peruskoulu=	1972	if Kunta=="Köyliö"
replace peruskoulu=	1972	if Kunta=="Dragsfjärd"
replace peruskoulu=	1972	if Kunta=="Västanfjärd"
replace peruskoulu=	1972	if Kunta=="Kemiö"
replace peruskoulu=	1972	if Kunta=="Kuru"
replace peruskoulu=	1972	if Kunta=="Pirkkala"
replace peruskoulu=	1972	if Kunta=="Ruokolahti"
replace peruskoulu=	1972	if Kunta=="Puumala"
replace peruskoulu=	1972	if Kunta=="Jämsä"
replace peruskoulu=	1972	if Kunta=="Multia"
replace peruskoulu=	1972	if Kunta=="Toivakka"
replace peruskoulu=	1972	if Kunta=="Leivonmäki"
replace peruskoulu=	1972	if Kunta=="Hankasalmi"
replace peruskoulu=	1972	if Kunta=="Töysä"
replace peruskoulu=	1972	if Kunta=="Haukipudas"
replace peruskoulu=	1972	if Kunta=="Rantsila"
replace peruskoulu=	1972	if Kunta=="Temmes"
replace peruskoulu=	1972	if Kunta=="Varpaisjärvi"
				
replace peruskoulu=	1973	if Kunta=="Kangasala"
replace peruskoulu=	1973	if Kunta=="Kuhmalahti"
replace peruskoulu=	1973	if Kunta=="Luopioinen"
replace peruskoulu=	1973	if Kunta=="Pälkäne"
replace peruskoulu=	1973	if Kunta=="Sahalahti"
replace peruskoulu=	1973	if Kunta=="Juuka"
replace peruskoulu=	1973	if Kunta=="Lieksa"
replace peruskoulu=	1973	if Kunta=="Nurmeksen"
replace peruskoulu=	1973	if Kunta=="Pielisjärvi"
replace peruskoulu=	1973	if Kunta=="Valtimo"
replace peruskoulu=	1973	if Kunta=="Kesälahti"
replace peruskoulu=	1973	if Kunta=="Kitee"
replace peruskoulu=	1973	if Kunta=="Rääkkylä"
replace peruskoulu=	1973	if Kunta=="Tohmajärvi"
replace peruskoulu=	1973	if Kunta=="Uukuniemi"
replace peruskoulu=	1973	if Kunta=="Värtsilä"
replace peruskoulu=	1973	if Kunta=="Alavus"
replace peruskoulu=	1973	if Kunta=="Kuortane"
replace peruskoulu=	1973	if Kunta=="Lehtimäki"
replace peruskoulu=	1973	if Kunta=="Soini"
replace peruskoulu=	1973	if Kunta=="Ähtäri"
replace peruskoulu=	1973	if Kunta=="Kannonkoski"
replace peruskoulu=	1973	if Kunta=="Karstula"
replace peruskoulu=	1973	if Kunta=="Kinnula"
replace peruskoulu=	1973	if Kunta=="Kivijärvi"
replace peruskoulu=	1973	if Kunta=="Konginkangas"
replace peruskoulu=	1973	if Kunta=="Konnevesi"
replace peruskoulu=	1973	if Kunta=="Kyyjärvi"
replace peruskoulu=	1973	if Kunta=="Pihtipudas"
replace peruskoulu=	1973	if Kunta=="Pylkönmäki"
replace peruskoulu=	1973	if Kunta=="Saarijärvi"
replace peruskoulu=	1973	if Kunta=="Sumiainen"
replace peruskoulu=	1973	if Kunta=="Suolahti"
replace peruskoulu=	1973	if Kunta=="Viitasaari"
replace peruskoulu=	1973	if Kunta=="Äänekoski"
replace peruskoulu=	1973	if Kunta=="Juankoski"
replace peruskoulu=	1973	if Kunta=="Kaavi"
replace peruskoulu=	1973	if Kunta=="Nilsiä"
replace peruskoulu=	1973	if Kunta=="Rautavaara"
replace peruskoulu=	1973	if Kunta=="Tuusniemi"
replace peruskoulu=	1973	if Kunta=="Vehmersalmi"
replace peruskoulu=	1973	if Kunta=="Hyrynsalmi"
replace peruskoulu=	1973	if Kunta=="Kajaani"
replace peruskoulu=	1973	if Kunta=="Kajaanin"
replace peruskoulu=	1973	if Kunta=="Kuhmo"
replace peruskoulu=	1973	if Kunta=="Paltamo"
replace peruskoulu=	1973	if Kunta=="Puolanka"
replace peruskoulu=	1973	if Kunta=="Ristijärvi"
replace peruskoulu=	1973	if Kunta=="Sotkamo"
replace peruskoulu=	1973	if Kunta=="Suomussalmi"
replace peruskoulu=	1973	if Kunta=="Vaala"
replace peruskoulu=	1973	if Kunta=="Vuolijoki"
replace peruskoulu=	1973	if Kunta=="Haapavesi"
replace peruskoulu=	1973	if Kunta=="Kestilä"
replace peruskoulu=	1973	if Kunta=="Kärsämäki"
replace peruskoulu=	1973	if Kunta=="Piippola"
replace peruskoulu=	1973	if Kunta=="Pulkkila"
replace peruskoulu=	1973	if Kunta=="Pyhäjärvi"
replace peruskoulu=	1973	if Kunta=="Pyhäntä"
replace peruskoulu=	1973	if Kunta=="Sipoo"
replace peruskoulu=	1973	if Kunta=="Pornainen"
replace peruskoulu=	1973	if Kunta=="Karkku"
replace peruskoulu=	1973	if Kunta=="Tyrvää"
replace peruskoulu=	1973	if Kunta=="Vammala"
replace peruskoulu=	1973	if Kunta=="Parainen"
replace peruskoulu=	1973	if Kunta=="Houtskari"
replace peruskoulu=	1973	if Kunta=="Iniö"
replace peruskoulu=	1973	if Kunta=="Korppoo"
replace peruskoulu=	1973	if Kunta=="Nauvo"
replace peruskoulu=	1973	if Kunta=="Jyväskylä"
replace peruskoulu=	1973	if Kunta=="Jyväskylän"
replace peruskoulu=	1973	if Kunta=="Muurame"
replace peruskoulu=	1973	if Kunta=="Säynätsalo"
replace peruskoulu=	1973	if Kunta=="Uurainen"
replace peruskoulu=	1973	if Kunta=="Uusikaarlepyy"
replace peruskoulu=	1973	if Kunta=="Uudenkaarlepyyn"
replace peruskoulu=	1973	if Kunta=="Munsala"
replace peruskoulu=	1973	if Kunta=="Luoto"
replace peruskoulu=	1973	if Kunta=="Pietarsaari"
replace peruskoulu=	1973	if Kunta=="Pietarsaaren" 
* also known as Pedersöre
replace peruskoulu=	1973	if Kunta=="Pedersören" 
replace peruskoulu=	1973	if Kunta=="Oravainen"
replace peruskoulu=	1973	if Kunta=="Purmo"
replace peruskoulu=	1973	if Kunta=="Ähtävä"
replace peruskoulu=	1973	if Kunta=="Jepua"
replace peruskoulu=	1973	if Kunta=="Vöyri" 
* and there is also vöyri-maksamaa
replace peruskoulu=	1973	if Kunta=="Vöyri-Maksamaa" 
replace peruskoulu=	1973	if Kunta=="Maksamaa"
replace peruskoulu=	1973	if Kunta=="Alahärmä"
replace peruskoulu=	1973	if Kunta=="Ylihärmä"
replace peruskoulu=	1973	if Kunta=="Kristiinankaupunki"
replace peruskoulu=	1973	if Kunta=="Karijoki"
replace peruskoulu=	1973	if Kunta=="Siipyy"
replace peruskoulu=	1973	if Kunta=="Tiukka"
replace peruskoulu=	1973	if Kunta=="Lapväärtti"
replace peruskoulu=	1973	if Kunta=="Valkeala"
replace peruskoulu=	1973	if Kunta=="Luumäki"
replace peruskoulu=	1973	if Kunta=="Lemi"
replace peruskoulu=	1973	if Kunta=="Suomenniemi"
replace peruskoulu=	1973	if Kunta=="Savitaipale"
replace peruskoulu=	1973	if Kunta=="Lestijärvi"
				
replace peruskoulu=	1974	if Kunta=="Honkajoki"
replace peruskoulu=	1974	if Kunta=="Jämijärvi"
replace peruskoulu=	1974	if Kunta=="Kankaanpää"
replace peruskoulu=	1974	if Kunta=="Karvia"
replace peruskoulu=	1974	if Kunta=="Kiikoinen"
replace peruskoulu=	1974	if Kunta=="Lavia"
replace peruskoulu=	1974	if Kunta=="Suodenniemi"
replace peruskoulu=	1974	if Kunta=="Hämeenkyrö"
replace peruskoulu=	1974	if Kunta=="Ikaalinen"
replace peruskoulu=	1974	if Kunta=="Kihniö"
replace peruskoulu=	1974	if Kunta=="Mouhijärvi"
replace peruskoulu=	1974	if Kunta=="Parkano"
replace peruskoulu=	1974	if Kunta=="Viljakkala"
replace peruskoulu=	1974	if Kunta=="Joutsa"
replace peruskoulu=	1974	if Kunta=="Jämsänkoski"
replace peruskoulu=	1974	if Kunta=="Keuruu"
replace peruskoulu=	1974	if Kunta=="Korpilahti"
replace peruskoulu=	1974	if Kunta=="Laukaa"
replace peruskoulu=	1974	if Kunta=="Luhanka"
replace peruskoulu=	1974	if Kunta=="Petäjävesi"
replace peruskoulu=	1974	if Kunta=="Iisalmi"
replace peruskoulu=	1974	if Kunta=="Keitele"
replace peruskoulu=	1974	if Kunta=="Kiuruvesi"
replace peruskoulu=	1974	if Kunta=="Lapinlahti"
replace peruskoulu=	1974	if Kunta=="Pielavesi"
replace peruskoulu=	1974	if Kunta=="Sonkajärvi"
replace peruskoulu=	1974	if Kunta=="Vieremä"
replace peruskoulu=	1974	if Kunta=="Haukivuori"
replace peruskoulu=	1974	if Kunta=="Jäppilä"
replace peruskoulu=	1974	if Kunta=="Pieksämäen"
replace peruskoulu=	1974	if Kunta=="Pieksämäki"
replace peruskoulu=	1974	if Kunta=="Virtasalmi"
replace peruskoulu=	1974	if Kunta=="Anttola"
replace peruskoulu=	1974	if Kunta=="Hirvensalmi"
replace peruskoulu=	1974	if Kunta=="Juva"
replace peruskoulu=	1974	if Kunta=="Kangasniemi"
replace peruskoulu=	1974	if Kunta=="Mikkeli"
replace peruskoulu=	1974	if Kunta=="Mikkelin"
replace peruskoulu=	1974	if Kunta=="Mäntyharju"
replace peruskoulu=	1974	if Kunta=="Pertunmaa"
replace peruskoulu=	1974	if Kunta=="Ristiina"
replace peruskoulu=	1974	if Kunta=="Haapasaari"
replace peruskoulu=	1974	if Kunta=="Karhula"
replace peruskoulu=	1974	if Kunta=="Kotka"
replace peruskoulu=	1974	if Kunta=="Kymi"
replace peruskoulu=	1974	if Kunta=="Pyhtää"
replace peruskoulu=	1974	if Kunta=="Eno"
replace peruskoulu=	1974	if Kunta=="Ilomantsi"
replace peruskoulu=	1974	if Kunta=="Joensuu"
replace peruskoulu=	1974	if Kunta=="Kiihtelysvaara"
replace peruskoulu=	1974	if Kunta=="Kontiolahti"
replace peruskoulu=	1974	if Kunta=="Liperi"
replace peruskoulu=	1974	if Kunta=="Outokumpu"
replace peruskoulu=	1974	if Kunta=="Polvijärvi"
replace peruskoulu=	1974	if Kunta=="Pyhäselkä"
replace peruskoulu=	1974	if Kunta=="Tuupovaara"
replace peruskoulu=	1974	if Kunta=="Halsua"
replace peruskoulu=	1974	if Kunta=="Himanka"
replace peruskoulu=	1974	if Kunta=="Kaarlela"
replace peruskoulu=	1974	if Kunta=="Kannus"
replace peruskoulu=	1974	if Kunta=="Kaustinen"
replace peruskoulu=	1974	if Kunta=="Kokkola"
replace peruskoulu=	1974	if Kunta=="Kruunupyy"
replace peruskoulu=	1974	if Kunta=="Kälviä"
replace peruskoulu=	1974	if Kunta=="Lohtaja"
replace peruskoulu=	1974	if Kunta=="Perho"
replace peruskoulu=	1974	if Kunta=="Toholampi"
replace peruskoulu=	1974	if Kunta=="Ullava"
replace peruskoulu=	1974	if Kunta=="Veteli"
replace peruskoulu=	1974	if Kunta=="Alajärvi"
replace peruskoulu=	1974	if Kunta=="Evijärvi"
replace peruskoulu=	1974	if Kunta=="Kauhava"
replace peruskoulu=	1974	if Kunta=="Kortesjärvi"
replace peruskoulu=	1974	if Kunta=="Lappajärvi"
replace peruskoulu=	1974	if Kunta=="Lapua"
replace peruskoulu=	1974	if Kunta=="Vimpeli"
replace peruskoulu=	1974	if Kunta=="Hailuoto"
replace peruskoulu=	1974	if Kunta=="Ii"
replace peruskoulu=	1974	if Kunta=="Kempele"
replace peruskoulu=	1974	if Kunta=="Kiiminki"
replace peruskoulu=	1974	if Kunta=="Liminka"
replace peruskoulu=	1974	if Kunta=="Lumijoki"
replace peruskoulu=	1974	if Kunta=="Muhos"
replace peruskoulu=	1974	if Kunta=="Oulu"
replace peruskoulu=	1974	if Kunta=="Oulunsalo"
replace peruskoulu=	1974	if Kunta=="Tyrnävä"
replace peruskoulu=	1974	if Kunta=="Utajärvi"
replace peruskoulu=	1974	if Kunta=="Yli-Ii"
replace peruskoulu=	1974	if Kunta=="Ylikiiminki"
replace peruskoulu=	1974	if Kunta=="Merijärvi"
replace peruskoulu=	1974	if Kunta=="Oulainen"
replace peruskoulu=	1974	if Kunta=="Paavola"
replace peruskoulu=	1974	if Kunta=="Pattijoki"
replace peruskoulu=	1974	if Kunta=="Pyhäjoki"
replace peruskoulu=	1974	if Kunta=="Raahe"
replace peruskoulu=	1974	if Kunta=="Revonlahti"
replace peruskoulu=	1974	if Kunta=="Saloinen"
replace peruskoulu=	1974	if Kunta=="Siikajoki"
replace peruskoulu=	1974	if Kunta=="Vihanti"
replace peruskoulu=	1974	if Kunta=="Alavieska"
replace peruskoulu=	1974	if Kunta=="Haapajärvi"
replace peruskoulu=	1974	if Kunta=="Kalajoki"
replace peruskoulu=	1974	if Kunta=="Nivala"
replace peruskoulu=	1974	if Kunta=="Rautio"
replace peruskoulu=	1974	if Kunta=="Reisjärvi"
replace peruskoulu=	1974	if Kunta=="Sievi"
replace peruskoulu=	1974	if Kunta=="Ylivieska"
replace peruskoulu=	1974	if Kunta=="Pori"
replace peruskoulu=	1974	if Kunta=="Luvia"
replace peruskoulu=	1974	if Kunta=="Vehmaa"
replace peruskoulu=	1974	if Kunta=="Hausjärvi"
				
replace peruskoulu=	1975	if Kunta=="Artjärvi"
replace peruskoulu=	1975	if Kunta=="Askola"
replace peruskoulu=	1975	if Kunta=="Lapinjärvi"
replace peruskoulu=	1975	if Kunta=="Liljendal"
replace peruskoulu=	1975	if Kunta=="Loviisa"
replace peruskoulu=	1975	if Kunta=="Myrskylä"
replace peruskoulu=	1975	if Kunta=="Orimattila"
replace peruskoulu=	1975	if Kunta=="Pernaja"
replace peruskoulu=	1975	if Kunta=="Porvoo"
replace peruskoulu=	1975	if Kunta=="Porvoon"
replace peruskoulu=	1975	if Kunta=="Pukkila"
replace peruskoulu=	1975	if Kunta=="Ruotsinpyhtää"
replace peruskoulu=	1975	if Kunta=="Eräjärvi"
replace peruskoulu=	1975	if Kunta=="Juupajoki"
replace peruskoulu=	1975	if Kunta=="Kuorevesi"
replace peruskoulu=	1975	if Kunta=="Längelmäki"
replace peruskoulu=	1975	if Kunta=="Mänttä"
replace peruskoulu=	1975	if Kunta=="Orivesi"
replace peruskoulu=	1975	if Kunta=="Pohjaslahti"
replace peruskoulu=	1975	if Kunta=="Ruovesi"
replace peruskoulu=	1975	if Kunta=="Vilppula"
replace peruskoulu=	1975	if Kunta=="Virrat"
replace peruskoulu=	1975	if Kunta=="Asikkala"
replace peruskoulu=	1975	if Kunta=="Hollola"
replace peruskoulu=	1975	if Kunta=="Kuhmoinen"
replace peruskoulu=	1975	if Kunta=="Kärkölä"
replace peruskoulu=	1975	if Kunta=="Lahti"
replace peruskoulu=	1975	if Kunta=="Nastola"
replace peruskoulu=	1975	if Kunta=="Padasjoki"
replace peruskoulu=	1975	if Kunta=="Imatra"
replace peruskoulu=	1975	if Kunta=="Joutseno"
replace peruskoulu=	1975	if Kunta=="Nuijamaa"
replace peruskoulu=	1975	if Kunta=="Parikkala"
replace peruskoulu=	1975	if Kunta=="Rautjärvi"
replace peruskoulu=	1975	if Kunta=="Saari"
replace peruskoulu=	1975	if Kunta=="Simpele"
replace peruskoulu=	1975	if Kunta=="Lappeenranta"
replace peruskoulu=	1975	if Kunta=="Taipalsaari"
replace peruskoulu=	1975	if Kunta=="Ylämaa"
replace peruskoulu=	1975	if Kunta=="Anjala"
replace peruskoulu=	1975	if Kunta=="Elimäki"
replace peruskoulu=	1975	if Kunta=="Iitti"
replace peruskoulu=	1975	if Kunta=="Jaala"
replace peruskoulu=	1975	if Kunta=="Kouvola"
replace peruskoulu=	1975	if Kunta=="Kuusankoski"
replace peruskoulu=	1975	if Kunta=="Sippola"
replace peruskoulu=	1975	if Kunta=="Hamina"
replace peruskoulu=	1975	if Kunta=="Miehikkälä"
replace peruskoulu=	1975	if Kunta=="Vehkalahti"
replace peruskoulu=	1975	if Kunta=="Virolahti"
replace peruskoulu=	1975	if Kunta=="Hartola"
replace peruskoulu=	1975	if Kunta=="Heinola"
replace peruskoulu=	1975	if Kunta=="Heinolan"
replace peruskoulu=	1975	if Kunta=="Sysmä"
replace peruskoulu=	1975	if Kunta=="Enonkoski"
replace peruskoulu=	1975	if Kunta=="Heinävesi"
replace peruskoulu=	1975	if Kunta=="Kerimäki"
replace peruskoulu=	1975	if Kunta=="Punkaharju"
replace peruskoulu=	1975	if Kunta=="Rantasalmi"
replace peruskoulu=	1975	if Kunta=="Savonlinna"
replace peruskoulu=	1975	if Kunta=="Savonranta"
replace peruskoulu=	1975	if Kunta=="Sulkava"
replace peruskoulu=	1975	if Kunta=="Sääminki"
replace peruskoulu=	1975	if Kunta=="Karttula"
replace peruskoulu=	1975	if Kunta=="Kuopio"
replace peruskoulu=	1975	if Kunta=="Maaninka"
replace peruskoulu=	1975	if Kunta=="Rautalampi"
replace peruskoulu=	1975	if Kunta=="Siilinjärvi"
replace peruskoulu=	1975	if Kunta=="Suonenjoki"
replace peruskoulu=	1975	if Kunta=="Tervo"
replace peruskoulu=	1975	if Kunta=="Vesanto"
replace peruskoulu=	1975	if Kunta=="Joroinen"
replace peruskoulu=	1975	if Kunta=="Kangaslampi"
replace peruskoulu=	1975	if Kunta=="Leppävirta"
replace peruskoulu=	1975	if Kunta=="Varkaus"
replace peruskoulu=	1975	if Kunta=="Bergö"
replace peruskoulu=	1975	if Kunta=="Björköby"
replace peruskoulu=	1975	if Kunta=="Kaskinen"
replace peruskoulu=	1975	if Kunta=="Koivulahti"
replace peruskoulu=	1975	if Kunta=="Korsnäs"
replace peruskoulu=	1975	if Kunta=="Maalahti"
replace peruskoulu=	1975	if Kunta=="Mustasaari"
replace peruskoulu=	1975	if Kunta=="Närpiö"
replace peruskoulu=	1975	if Kunta=="Petolahti"
replace peruskoulu=	1975	if Kunta=="Pirttikylä"
replace peruskoulu=	1975	if Kunta=="Raippaluoto"
replace peruskoulu=	1975	if Kunta=="Sulva"
replace peruskoulu=	1975	if Kunta=="Vaasa"
replace peruskoulu=	1975	if Kunta=="Ylimarkku"
replace peruskoulu=	1975	if Kunta=="Isokyrö"
replace peruskoulu=	1975	if Kunta=="Jurva"
replace peruskoulu=	1975	if Kunta=="Laihia"
replace peruskoulu=	1975	if Kunta=="Vähäkyrö"
replace peruskoulu=	1975	if Kunta=="Ilmajoki"
replace peruskoulu=	1975	if Kunta=="Jalasjärvi"
replace peruskoulu=	1975	if Kunta=="Kurikka"
replace peruskoulu=	1975	if Kunta=="Nurmo"
replace peruskoulu=	1975	if Kunta=="Peräseinäjoki"
replace peruskoulu=	1975	if Kunta=="Seinäjoki"
replace peruskoulu=	1975	if Kunta=="Ylistaro"
replace peruskoulu=	1975	if Kunta=="Isojoki"
replace peruskoulu=	1975	if Kunta=="Kaskinen"
replace peruskoulu=	1975	if Kunta=="Kauhajoki"
replace peruskoulu=	1975	if Kunta=="Teuva"
				
replace peruskoulu=	1976	if Kunta=="Bromarv"
replace peruskoulu=	1976	if Kunta=="Hanko"
replace peruskoulu=	1976	if Kunta=="Inkoo"
replace peruskoulu=	1976	if Kunta=="Karjaa"
replace peruskoulu=	1976	if Kunta=="Kirkkonummi"
replace peruskoulu=	1976	if Kunta=="Pohja"
replace peruskoulu=	1976	if Kunta=="Siuntio"
replace peruskoulu=	1976	if Kunta=="Snappertuna"
replace peruskoulu=	1976	if Kunta=="Tammisaari"
replace peruskoulu=	1976	if Kunta=="Tammisaaren"
replace peruskoulu=	1976	if Kunta=="Tenhola"
replace peruskoulu=	1976	if Kunta=="Karjalohja"
replace peruskoulu=	1976	if Kunta=="Karkkila"
replace peruskoulu=	1976	if Kunta=="Lohja"
replace peruskoulu=	1976	if Kunta=="Lohjan"
replace peruskoulu=	1976	if Kunta=="Nummi"
replace peruskoulu=	1976	if Kunta=="Sammatti"
replace peruskoulu=	1976	if Kunta=="Suomusjärvi"
replace peruskoulu=	1976	if Kunta=="Vihti"
replace peruskoulu=	1976	if Kunta=="Hyvinkää"
replace peruskoulu=	1976	if Kunta=="Järvenpää"
replace peruskoulu=	1976	if Kunta=="Kerava"
replace peruskoulu=	1976	if Kunta=="Nurmijärvi"
replace peruskoulu=	1976	if Kunta=="Mäntsälä"
replace peruskoulu=	1976	if Kunta=="Tuusula"
replace peruskoulu=	1976	if Kunta=="Särkisalo"
replace peruskoulu=	1976	if Kunta=="Lempäälä"
replace peruskoulu=	1976	if Kunta=="Nokia"
replace peruskoulu=	1976	if Kunta=="Tampere"
replace peruskoulu=	1976	if Kunta=="Tottijärvi"
replace peruskoulu=	1976	if Kunta=="Vesilahti"
replace peruskoulu=	1976	if Kunta=="Ylöjärvi"
replace peruskoulu=	1976	if Kunta=="Kylmäkoski"
replace peruskoulu=	1976	if Kunta=="Toijala"
replace peruskoulu=	1976	if Kunta=="Urjala"
replace peruskoulu=	1976	if Kunta=="Valkeakoski"
replace peruskoulu=	1976	if Kunta=="Viiala"
replace peruskoulu=	1976	if Kunta=="Forssa"
replace peruskoulu=	1976	if Kunta=="Humppila"
replace peruskoulu=	1976	if Kunta=="Jokioinen"
replace peruskoulu=	1976	if Kunta=="Tammela"
replace peruskoulu=	1976	if Kunta=="Ypäjä"
replace peruskoulu=	1976	if Kunta=="Hattula"
replace peruskoulu=	1976	if Kunta=="Hauho"
replace peruskoulu=	1976	if Kunta=="Hämeenlinna"
replace peruskoulu=	1976	if Kunta=="Janakkala"
replace peruskoulu=	1976	if Kunta=="Kalvola"
replace peruskoulu=	1976	if Kunta=="Koski"
replace peruskoulu=	1976	if Kunta=="Lammi"
replace peruskoulu=	1976	if Kunta=="Renko"
replace peruskoulu=	1976	if Kunta=="Tuulos"
replace peruskoulu=	1976	if Kunta=="Loppi"
replace peruskoulu=	1976	if Kunta=="Riihimäki"
replace peruskoulu=	1976	if Kunta=="Kullaa"
replace peruskoulu=	1976	if Kunta=="Merikarvia"
replace peruskoulu=	1976	if Kunta=="Nakkila"
replace peruskoulu=	1976	if Kunta=="Noormarkku"
replace peruskoulu=	1976	if Kunta=="Pomarkku"
replace peruskoulu=	1976	if Kunta=="Siikainen"
replace peruskoulu=	1976	if Kunta=="Ulvila"
replace peruskoulu=	1976	if Kunta=="Eura"
replace peruskoulu=	1976	if Kunta=="Eurajoki"
replace peruskoulu=	1976	if Kunta=="Kodisjoki"
replace peruskoulu=	1976	if Kunta=="Lappi"
replace peruskoulu=	1976	if Kunta=="Rauma"
replace peruskoulu=	1976	if Kunta=="Rauman"
replace peruskoulu=	1976	if Kunta=="Kalanti"
replace peruskoulu=	1976	if Kunta=="Karjala"
replace peruskoulu=	1976	if Kunta=="Kustavi"
replace peruskoulu=	1976	if Kunta=="Laitila"
replace peruskoulu=	1976	if Kunta=="Lokalahti"
replace peruskoulu=	1976	if Kunta=="Mietoinen"
replace peruskoulu=	1976	if Kunta=="Mynämäki"
replace peruskoulu=	1976	if Kunta=="Pyhämaa"
replace peruskoulu=	1976	if Kunta=="Pyhäranta"
replace peruskoulu=	1976	if Kunta=="Taivassalo"
replace peruskoulu=	1976	if Kunta=="Uusikaupunki"
replace peruskoulu=	1976	if Kunta=="Harjavalta"
replace peruskoulu=	1976	if Kunta=="Huittinen"
replace peruskoulu=	1976	if Kunta=="Keikyä"
replace peruskoulu=	1976	if Kunta=="Kiikka"
replace peruskoulu=	1976	if Kunta=="Kiukainen"
replace peruskoulu=	1976	if Kunta=="Kokemäki"
replace peruskoulu=	1976	if Kunta=="Punkalaidun"
replace peruskoulu=	1976	if Kunta=="Säkylä"
replace peruskoulu=	1976	if Kunta=="Vampula"
replace peruskoulu=	1976	if Kunta=="Yläne"
replace peruskoulu=	1976	if Kunta=="Merimasku"
replace peruskoulu=	1976	if Kunta=="Naantali"
replace peruskoulu=	1976	if Kunta=="Paattinen"
replace peruskoulu=	1976	if Kunta=="Paimio"
replace peruskoulu=	1976	if Kunta=="Piikkiö"
replace peruskoulu=	1976	if Kunta=="Rusko"
replace peruskoulu=	1976	if Kunta=="Rymättylä"
replace peruskoulu=	1976	if Kunta=="Sauvo"
replace peruskoulu=	1976	if Kunta=="Turku"
replace peruskoulu=	1976	if Kunta=="Alastaro"
replace peruskoulu=	1976	if Kunta=="Aura"
replace peruskoulu=	1976	if Kunta=="Karinainen"
replace peruskoulu=	1976	if Kunta=="Loimaa"
replace peruskoulu=	1976	if Kunta=="Loimaan"
replace peruskoulu=	1976	if Kunta=="Marttila"
replace peruskoulu=	1976	if Kunta=="Mellilä"
replace peruskoulu=	1976	if Kunta=="Metsämaa"
replace peruskoulu=	1976	if Kunta=="Oripää"
replace peruskoulu=	1976	if Kunta=="Pöytyä"
replace peruskoulu=	1976	if Kunta=="Halikko"
replace peruskoulu=	1976	if Kunta=="Kiikala"
replace peruskoulu=	1976	if Kunta=="Kisko"
replace peruskoulu=	1976	if Kunta=="Kuusjoki"
replace peruskoulu=	1976	if Kunta=="Muurla"
replace peruskoulu=	1976	if Kunta=="Perniö"
replace peruskoulu=	1976	if Kunta=="Pertteli"
replace peruskoulu=	1976	if Kunta=="Salo"
replace peruskoulu=	1976	if Kunta=="Somerniemi"
replace peruskoulu=	1976	if Kunta=="Somero"
				
replace peruskoulu=	1977	if Kunta=="Espoo"
replace peruskoulu=	1977	if Kunta=="Helsinki"
replace peruskoulu=	1977	if Kunta=="Kauniainen"
replace peruskoulu=	1977	if Kunta=="Vantaa"

		

		
		********
		*Let's drop missing values
		* 
		********

drop if perus==.
replace Liitosvuosi=0000 if Liitosvuosi==.
gen str3 nro = string(Kuntnro,"%03.0f")

		
		
*We end up with follwoing variables:
*Kuntnro: number of the municiaplity https://www2.tilastokeskus.fi/en/luokitukset/kunta/	
*Kunta: Name of the municipality (in case of multiple word, only first used)		
*Liitosvuosi: year of potential merger		
*peruskoulu: school reform implementation year	
*nro number of municiplaiy in 3-character string format
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
