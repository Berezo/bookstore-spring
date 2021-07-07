DROP SCHEMA IF EXISTS `jpa2021`;
CREATE SCHEMA `jpa2021`;
USE `jpa2021`;

DROP TABLE IF EXISTS `employee`;
DROP TABLE IF EXISTS `employee_address`;
DROP TABLE IF EXISTS `department`;
DROP TABLE IF EXISTS `titles`;
DROP TABLE IF EXISTS `ksiazki`;
DROP TABLE IF EXISTS `autorzy`;
DROP TABLE IF EXISTS `kategorie`;
DROP TABLE IF EXISTS `autorzy_to_ksiazki`;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `authorities`;
DROP TABLE IF EXISTS `zamowienia`;
DROP TABLE IF EXISTS `szczegoly_zamowienia`;

CREATE TABLE `kategorie` (
`id` mediumint(9) NOT NULL auto_increment,
`nazwa` varchar(40) NOT NULL,
PRIMARY KEY (`id`)
) ;

INSERT INTO `kategorie` VALUES (1, 'Brak');
INSERT INTO `kategorie` VALUES (2, 'Inne');
INSERT INTO `kategorie` VALUES (3, 'Audiobooki');
INSERT INTO `kategorie` VALUES (4, 'Beletrystyka i literatura piękna');
INSERT INTO `kategorie` VALUES (5, 'Fantastyka');
INSERT INTO `kategorie` VALUES (6, 'Kryminały i sensacja');
INSERT INTO `kategorie` VALUES (7, 'E-booki');

CREATE TABLE `ksiazki` (
`id` int(11) NOT NULL auto_increment,
`nazwa` varchar(100) NOT NULL,
`wydawnictwo` varchar(50) NOT NULL,
`cena` float NOT NULL default '0',
`kategorie_id` mediumint(9) NULL,
`ilosc` int(11) default '0',
`okladka` varchar(100) NULL,
`opis` varchar(1024) NULL,
PRIMARY KEY (`id`),
FOREIGN KEY (`kategorie_id`) REFERENCES `kategorie`(`id`)
) ;

INSERT INTO `ksiazki` VALUES (1, 'Czyste zło', 'Albatros', 39.90, 3, -1, 'czyste_zlo.jpg', 'W górach Georgii wykopano szkielet kobiety. Ale prawda o tej zbrodni nadal jest pogrzebana. Sprawa psychopatycznego porywacza Jacoba Nessa wciąż nie może zostać zamknięta, choć on sam od dawna nie żyje. Agentka specjalna FBI Kimberly Quincy i detektyw bostońskiej policji D.D. Warren nieustannie szukają śladów, które pozwolą ujawnić prawdziwą skalę jego zbrodni. Wydaje się, że makabryczne odkrycie w Appalachach ma związek z działalnością Nessa. Do małej mieściny w górach przyjeżdżają więc obie, Kimberly i D.D., i zabierają ze sobą jedyną osobę, która ma szansę poskładać nowe dowody w całość: Florę Dane, ocalałą ofiarę psychopaty. W miasteczku wydarzyło się coś naprawdę złego. To, co z początku przypominało gotycką tajemnicę, staje się jeszcze bardziej przerażające, kiedy okazuje się, że najgorsze sekrety Nessa wciąż pozostają ukryte.');
INSERT INTO `ksiazki` VALUES (2, 'Sługa krwi. Cykl Materia Secunda. Tom 1', 'Fabryka Słów', 44.90, 3, -1, 'sluga_krwi.jpg', 'W wojnie między bogami nie będzie zwycięzców, zostaną tylko zgliszcza ludzkiego świata. Świat leczy rany po wojnie z Przeklętymi, ludzie zaczynają zapominać o niebezpieczeństwie. Ale Szepczący – istoty, które niegdyś kroczyły po ziemi jako bogowie, nie zapomnieli o ludziach. I mają własne plany... W chwili nieuchronnej klęski Olaf Rudnicki zgadza się zapłacić własną wolnością z życie swojej rodziny. Dumny, potężny alchemik trafia do świata, w którym jest jedynie niewolnikiem. Bezlitosnym, posłusznym narzędziem w rękach nowego pana. Rozpoczyna się wojna, której zasad Rudnicki nie zna, ale wie jedno: od tego, jak wywiąże się ze swojej przysięgi zależy życie. Jego, jego rodziny, jego świata. Jeśli zawiedzie, choćby przeżył, nie będzie już miał gdzie wracać.');
INSERT INTO `ksiazki` VALUES (3, 'Sługa krwi. Cykl Materia Secunda. Tom 1', 'Fabryka Słów', 44.90, 5, 80, 'sluga_krwi_ksiazka.jpg', 'W wojnie między bogami nie będzie zwycięzców, zostaną tylko zgliszcza ludzkiego świata. Świat leczy rany po wojnie z Przeklętymi, ludzie zaczynają zapominać o niebezpieczeństwie. Ale Szepczący – istoty, które niegdyś kroczyły po ziemi jako bogowie, nie zapomnieli o ludziach. I mają własne plany... W chwili nieuchronnej klęski Olaf Rudnicki zgadza się zapłacić własną wolnością z życie swojej rodziny. Dumny, potężny alchemik trafia do świata, w którym jest jedynie niewolnikiem. Bezlitosnym, posłusznym narzędziem w rękach nowego pana. Rozpoczyna się wojna, której zasad Rudnicki nie zna, ale wie jedno: od tego, jak wywiąże się ze swojej przysięgi zależy życie. Jego, jego rodziny, jego świata. Jeśli zawiedzie, choćby przeżył, nie będzie już miał gdzie wracać.');
INSERT INTO `ksiazki` VALUES (4, 'Sługa krwi. Cykl Materia Secunda. Tom 1', 'Fabryka Słów', 33.68, 7, -1, 'sluga_krwi_ebook.jpg', 'W wojnie między bogami nie będzie zwycięzców, zostaną tylko zgliszcza ludzkiego świata. Świat leczy rany po wojnie z Przeklętymi, ludzie zaczynają zapominać o niebezpieczeństwie. Ale Szepczący – istoty, które niegdyś kroczyły po ziemi jako bogowie, nie zapomnieli o ludziach. I mają własne plany... W chwili nieuchronnej klęski Olaf Rudnicki zgadza się zapłacić własną wolnością z życie swojej rodziny. Dumny, potężny alchemik trafia do świata, w którym jest jedynie niewolnikiem. Bezlitosnym, posłusznym narzędziem w rękach nowego pana. Rozpoczyna się wojna, której zasad Rudnicki nie zna, ale wie jedno: od tego, jak wywiąże się ze swojej przysięgi zależy życie. Jego, jego rodziny, jego świata. Jeśli zawiedzie, choćby przeżył, nie będzie już miał gdzie wracać.');
INSERT INTO `ksiazki` VALUES (5, 'Amazonia', 'Albatros', 39.90, 3, -1, 'amazonia_audiobook.jpg', 'Serce amazońskiej dżungli skrywa przerażającą tajemnicę – dla jednych oznacza ona miliardy dolarów, dla innych strach, obłęd i… śmierć. Ekspedycja naukowa doktora Carla Randa przepada bez wieści w amazońskiej dżungli. Cztery lata później jeden z jej uczestników pojawia się wycieńczony w założonej przez misjonarzy osadzie. Okazuje się, że wszedł do dżungli z amputowaną przy barku ręką, a wyszedł z dwoma zdrowymi! Czy to efekt działania nieznanej rośliny, która umożliwia regenerację tkanek? Tropem pierwszej wyprawy rusza kolejna i odkrywa, że niedające się logicznie wytłumaczyć wydarzenia mogą mieć związek z bliżej niezbadanym plemieniem Krwawych Jaguarów, o którym jedynie szepcze się wśród tubylców. Jego członkowie potrafią znikać, przynosząc śmierć każdemu, kogo napotkają. Nawet dżungla poddaje się ich woli. Szlak ekspedycji będzie naszpikowany śmiertelnymi niebezpieczeństwami, a poznanie prawdy zamiast wybawienia może przynieść zgubę....');
INSERT INTO `ksiazki` VALUES (6, 'Amazonia', 'Albatros', 38.00, 6, 100, 'amazonia_ksiazka.jpg', 'Serce amazońskiej dżungli skrywa przerażającą tajemnicę – dla jednych oznacza ona miliardy dolarów, dla innych strach, obłęd i… śmierć. Ekspedycja naukowa doktora Carla Randa przepada bez wieści w amazońskiej dżungli. Cztery lata później jeden z jej uczestników pojawia się wycieńczony w założonej przez misjonarzy osadzie. Okazuje się, że wszedł do dżungli z amputowaną przy barku ręką, a wyszedł z dwoma zdrowymi! Czy to efekt działania nieznanej rośliny, która umożliwia regenerację tkanek? Tropem pierwszej wyprawy rusza kolejna i odkrywa, że niedające się logicznie wytłumaczyć wydarzenia mogą mieć związek z bliżej niezbadanym plemieniem Krwawych Jaguarów, o którym jedynie szepcze się wśród tubylców. Jego członkowie potrafią znikać, przynosząc śmierć każdemu, kogo napotkają. Nawet dżungla poddaje się ich woli. Szlak ekspedycji będzie naszpikowany śmiertelnymi niebezpieczeństwami, a poznanie prawdy zamiast wybawienia może przynieść zgubę....');
INSERT INTO `ksiazki` VALUES (7, 'Amazonia', 'Albatros', 39.90, 7, -1, 'amazonia_ebook.jpg', 'Serce amazońskiej dżungli skrywa przerażającą tajemnicę – dla jednych oznacza ona miliardy dolarów, dla innych strach, obłęd i… śmierć. Ekspedycja naukowa doktora Carla Randa przepada bez wieści w amazońskiej dżungli. Cztery lata później jeden z jej uczestników pojawia się wycieńczony w założonej przez misjonarzy osadzie. Okazuje się, że wszedł do dżungli z amputowaną przy barku ręką, a wyszedł z dwoma zdrowymi! Czy to efekt działania nieznanej rośliny, która umożliwia regenerację tkanek? Tropem pierwszej wyprawy rusza kolejna i odkrywa, że niedające się logicznie wytłumaczyć wydarzenia mogą mieć związek z bliżej niezbadanym plemieniem Krwawych Jaguarów, o którym jedynie szepcze się wśród tubylców. Jego członkowie potrafią znikać, przynosząc śmierć każdemu, kogo napotkają. Nawet dżungla poddaje się ich woli. Szlak ekspedycji będzie naszpikowany śmiertelnymi niebezpieczeństwami, a poznanie prawdy zamiast wybawienia może przynieść zgubę....');
INSERT INTO `ksiazki` VALUES (8, 'The Crown. Oficjalny przewodnik po serialu. Tom 1', 'Wydawnictwo Kobiece', 44.90, 2, 55, 'the_crown_tom_1.jpg', 'Pierwsza część oficjalnego przewodnika po serialu „The Crown”. Odkryj sekrety brytyjskiej korony za zamkniętymi drzwiami Pałacu Buckingham i 10 Downing Street. Nagła śmierć ojca sprawiła, że dwudziestopięcioletnia kobieta stojąca u progu zmagań z nowa rolą - matki i żony - musiała zostać monarchinią. To właśnie wtedy Elizabeth Mountbatten stała się królową Elżbietą II. Gdy Wielka Brytania wyszła z cienia wojny, Elżbieta II stanęła przed wielkimi wyzwaniami – nie tylko politycznymi, ale też osobistymi. Na przestrzeni lat wspięła się na wyżyny determinacji i wykazała niezwykłą siłą oraz niezłomnością, walcząc o dobre imię królestwa. Robert Lacey – konsultant historyczny twórców „The Crown” i biograf królewskiego dworu opisuje wczesne lata panowania Elżbiety II. Jego książka jest przepełniona fascynującymi historiami, które są rozwinięciem serialowych wątków oraz ekskluzywnymi fotografiami.');
INSERT INTO `ksiazki` VALUES (9, 'The Crown. Oficjalny przewodnik po serialu. Tom 2', 'Wydawnictwo Kobiece', 44.90, 2, 47, 'the_crown_tom_2.jpg', 'Afery polityczne, królewskie bolączki i rozkwit panowania Elżbiety II. Drugi tom księgi wiedzy o serialu „The Crown” i fascynującej historii królowej Elżbiety II. Tym razem Robert Lacey, konsultant historyczny hitu Netflixa, odpowiada na wszystkie pytania dotyczące wątków z drugiego i trzeciego sezonu. Przyjrzyj się dwóm burzliwym dekadom panowania królowej Elżbiety II: kluczowym momentom społecznym, politycznym i osobistym oraz ich skutkom – nie tylko dla rodziny królewskiej, ale również dla otaczającego ją świata. Od kryzysu sueskiego i radzieckiego wyścigu kosmicznego po spuściznę współpracy księcia Windsoru z Hitlerem, a także głośne tematy związane z królewskim małżeństwem, książka ta daje wgląd w historyczne dziesięciolecia i odsłania prawdę ukrytą za dramatem rozgrywającym się na ekranie. To fascynujące i wciągające spojrzenie na historię, która zainspirowała ten serialowy fenomen, oraz na lata, które okazały się kluczowym czasem kształtowania Królowej, jaką znamy.');
INSERT INTO `ksiazki` VALUES (10, 'Narrenturm. Trylogia husycka. Tom 1', 'superNOWA', 46.20, 5, 15, 'Narrentum_ksiazka.jpg', 'Koniec świata w Roku Pańskim 1420 nie nastąpił. Nie nastały Dni Kary i Pomsty poprzedzające nadejście Królestwa Bożego. Nie został, choć skończyło się lat tysiąc, z więzienia swego uwolniony Szatan i nie wyszedł, by omamić narody z czterech narożników Ziemi. Nie zginęli wszyscy grzesznicy świata i przeciwnicy Boga od miecza, ognia, głodu, gradu, od kłów bestii, od żądeł skorpionów i jadu węży. Świat nie zginął i nie spłonął. Przynajmniej niecały. Ale i tak było wesoło.');
INSERT INTO `ksiazki` VALUES (11, 'Narrenturm. Trylogia husycka. Tom 1', 'superNOWA', 33.33, 7, -1, 'Narrentum_ebook.jpg', 'Koniec świata w Roku Pańskim 1420 nie nastąpił. Nie nastały Dni Kary i Pomsty poprzedzające nadejście Królestwa Bożego. Nie został, choć skończyło się lat tysiąc, z więzienia swego uwolniony Szatan i nie wyszedł, by omamić narody z czterech narożników Ziemi. Nie zginęli wszyscy grzesznicy świata i przeciwnicy Boga od miecza, ognia, głodu, gradu, od kłów bestii, od żądeł skorpionów i jadu węży. Świat nie zginął i nie spłonął. Przynajmniej niecały. Ale i tak było wesoło.');
INSERT INTO `ksiazki` VALUES (12, 'Boży bojownicy. Trylogia husycka. Tom 2', 'superNOWA', 46.20, 5, 22, 'bozy_bojownicy_ksiazka.jpg', 'Rok nastał Pański 1427. Pamiętacie co przyniósł? Wiosną wonczas, ogłosił papież Marcin V bullę Salvatoris omnium, w której konieczność kolejnej krucjaty przeciw Czechom kacerzom proklamował. W miejsce Orsiniego, który leciwy był i haniebnie nieudolny, obwołał papa Marcin kardynałem i legatem Henryka Beauforta. Beaufort aktywnie bardzo sprawy się ujął. Wnet krucjatę postanowiono, która mieczem i ogniem husyckich apostatów pokarać miała. Gorące, skwarne było lato roku 1427. A co, pytacie na to Boży bojownicy? Cóż, kontynuują oni swoją misję. Po rejzach ich oddziałów pozostają jeno zgliszcza i trupy. Reynevan, medyk z wykształcenia i powołania, bierze udział w krwawych bitwach. Jest wielokrotnie brany w niewolę, ale ze wszystkich opresji wychodzi cało. Z zadziwiającą gorliwością nastają na niego wszyscy: i Inkwizycja, i złowrogi Pomurnik, i pospolici raubritterzy, których nikt nie przekona, że Reynevan nie miał nic wspólnego z napadem na wiozącego znaczną sumę pieniędzy poborcę podatków.');
INSERT INTO `ksiazki` VALUES (13, 'Boży bojownicy. Trylogia husycka. Tom 2', 'superNOWA', 33.33, 7, -1, 'bozy_bojownicy_ebook.jpg', 'Rok nastał Pański 1427. Pamiętacie co przyniósł? Wiosną wonczas, ogłosił papież Marcin V bullę Salvatoris omnium, w której konieczność kolejnej krucjaty przeciw Czechom kacerzom proklamował. W miejsce Orsiniego, który leciwy był i haniebnie nieudolny, obwołał papa Marcin kardynałem i legatem Henryka Beauforta. Beaufort aktywnie bardzo sprawy się ujął. Wnet krucjatę postanowiono, która mieczem i ogniem husyckich apostatów pokarać miała. Gorące, skwarne było lato roku 1427. A co, pytacie na to Boży bojownicy? Cóż, kontynuują oni swoją misję. Po rejzach ich oddziałów pozostają jeno zgliszcza i trupy. Reynevan, medyk z wykształcenia i powołania, bierze udział w krwawych bitwach. Jest wielokrotnie brany w niewolę, ale ze wszystkich opresji wychodzi cało. Z zadziwiającą gorliwością nastają na niego wszyscy: i Inkwizycja, i złowrogi Pomurnik, i pospolici raubritterzy, których nikt nie przekona, że Reynevan nie miał nic wspólnego z napadem na wiozącego znaczną sumę pieniędzy poborcę podatków.');
INSERT INTO `ksiazki` VALUES (14, 'Lux perpetua. Trylogia husycka. Tom 3', 'superNOWA', 46.20, 5, 31, 'lux_perpetua_ksiazka.jpg', 'Reynevan, główny bohater tomów NARRENTURM i BOŻY BOJOWNICY, nadal ma kłopoty, ciągle ktoś dybie na jego życie bądź przedstawia mu propozycję nie do odrzucenia. Prześladują go prozaiczni agenci wywiadu oraz siły nieczyste, wcale nie ukrywające swej diabelskiej proweniencji. Ale Reynevan żyje przecież w okrutnych i niebezpiecznych czasach. Na Śląsku i w Czechach, gdy przez ziemie te przetaczały się krucjaty i husyckie wyprawy odwetowe. Gdy nie znano słowa: "Litość" i z imieniem Boga na ustach wyrzynano tysiące niewinnych. Reinmar wierzy w religijną odnowę, staje po stronie zwolenników Husa, nawet gdy ci dokonują niewiarygodnych zbrodni. Cel uświęca środki. Reynevan chce pomścić śmierć brata. On, medyk i zielarz, idealista i bezinteresowny obrońca chorych i cierpiących, musi wcielić się w rolę husyckiego szpiega, dywersanta, zabójcy i bezlitosnego mściciela. Rozdarty pomiędzy obowiązkiem a głosem serca, stawia wszystko na jedną kartę, byle wyrwać ukochaną z rąk wrogów.');
INSERT INTO `ksiazki` VALUES (15, 'Lux perpetua. Trylogia husycka. Tom 3', 'superNOWA', 33.33, 7, -1, 'lex_perpetua_ebook.jpg', 'Reynevan, główny bohater tomów NARRENTURM i BOŻY BOJOWNICY, nadal ma kłopoty, ciągle ktoś dybie na jego życie bądź przedstawia mu propozycję nie do odrzucenia. Prześladują go prozaiczni agenci wywiadu oraz siły nieczyste, wcale nie ukrywające swej diabelskiej proweniencji. Ale Reynevan żyje przecież w okrutnych i niebezpiecznych czasach. Na Śląsku i w Czechach, gdy przez ziemie te przetaczały się krucjaty i husyckie wyprawy odwetowe. Gdy nie znano słowa: "Litość" i z imieniem Boga na ustach wyrzynano tysiące niewinnych. Reinmar wierzy w religijną odnowę, staje po stronie zwolenników Husa, nawet gdy ci dokonują niewiarygodnych zbrodni. Cel uświęca środki. Reynevan chce pomścić śmierć brata. On, medyk i zielarz, idealista i bezinteresowny obrońca chorych i cierpiących, musi wcielić się w rolę husyckiego szpiega, dywersanta, zabójcy i bezlitosnego mściciela. Rozdarty pomiędzy obowiązkiem a głosem serca, stawia wszystko na jedną kartę, byle wyrwać ukochaną z rąk wrogów.');
INSERT INTO `ksiazki` VALUES (16, 'Pakiet - Trylogia husycka: Narrenturm / Boży bojownicy / Lux perpetua', 'superNOWA', 192.50, 5, 12, 'trylogia_husycka_pakiet.jpg', 'rylogia husycka to cykl historyczno-fantastycznym o wojnach husyckich, akcja którego toczy się w piętnastym wieku na terenie Czech, Moraw, Śląska, Węgier, ówczesnej Polski i Niemiec. Sapkowski w niepowtarzalnym stylu opisuje okrucieństwo wojny, zwłaszcza bratobójczej, i piętnuje nietolerancję religijną. W swojej powieści stworzył szereg barwnych postaci, którym przyszło żyć i zachować przyzwoitość w czasach pogardy. Główny bohater, Reynevan z Bielawy, medyk, romantyczny kochanek i z konieczności husycki szpieg, określa sam siebie jako Ślązaka. Nie Czecha ani Niemca, ani tym bardziej Polaka, choć biegle posługuje się językami wszystkich tych nacji i dzieli ludzi według kryteriów moralnych, a nie narodowościowych. Studiował w Pradze, ale w trakcie swych rozlicznych peregrynacji odwiedził wiele czeskich i śląskich miast i miasteczek. Miejsca owe opisał Sapkowski z niezwykłym pietyzmem: średniowieczne Praga i Wrocław pod jego piórem wprost tętnią życiem.');
INSERT INTO `ksiazki` VALUES (17, 'Balladyna (lektura z opracowaniem)', 'IBIS', 15, 4, 67, 'balladyna_ksiazka_1.jpg', 'Dramat Juliusza Słowackiego, opublikowany w 1839 r., to opowieść o żądzy władzy i niepohamowanych ambicjach, które popychają do najokrutniejszych postępków; to historia wielkiej namiętności - nieoczekiwanej zdrady. Dwie siostry, Alina i Balladyna, rywalizują o miłość księcia Kirkora, jednak właśnie ta miłość doprowadza je do wielkiej tragedii. Balladyna przedstawia tragiczną walkę człowieka z przeznaczeniem, którego nie można zmienić i które wplątuje go w bezskuteczne zmagania z sobą samym i otaczającym światem. Dzieło Słowackiego to również opowieść o początkach państwa polskiego. Autor dokonał rekonstrukcji prehistorycznych dziejów Polski, tworząc baśniowy świat fantastycznych zjaw i postaci.');
INSERT INTO `ksiazki` VALUES (18, 'Balladyna (Ilustrowana klasyka)', 'IBIS', 13.90, 4, 21, 'balladyna_ksiazka_2.jpg', 'Dramat Juliusza Słowackiego, opublikowany w 1839 r., to opowieść o żądzy władzy i niepohamowanych ambicjach, które popychają do najokrutniejszych postępków; to historia wielkiej namiętności i nieoczekiwanej zdrady. Dwie siostry, Alina i Balladyna, rywalizują o miłość księcia Kirkora, jednak właśnie ta miłość doprowadza je do wielkiej tragedii. Balladyna przedstawia tragiczną walkę człowieka z przeznaczeniem, którego nie można zmienić i które wplątuje go w bezskuteczne zmagania z sobą samym i otaczającym światem. Dzieło Słowackiego to również opowieść o początkach państwa polskiego. Autor dokonał rekonstrukcji prehistorycznych dziejów Polski, tworząc baśniowy świat fantastycznych zjaw i postaci. Seria "Ilustrowana klasyka" to klasyczne publikacje kanonicznych twórców, wydane w oryginalnej szacie graficznej. Każda z książek wydanych w tej serii została wzbogacona ilustracjami, dzięki czemu lektura ksiżki staje się atrakcyjniejsza.');
INSERT INTO `ksiazki` VALUES (19, 'Balladyna', 'Arti', 16.90, 4, 19, 'balladyna_ksiazka_3.jpg', 'Balladyna powstała w połowie lat 30. XIX w. z inspiracji "Makbetem" i "Snem nocy letniej". Słowacki motyw zbrodni przeplótł wątkiem świata nadprzyrodzonego, a akcję umieścił w czasach prasłowiańskich. Marzyło mu się, że po 100 latach :chłop w cichym gdzieś domku pod Krakowem [...] czyta Balladynę - ten utwór bawi go jak baśń, a razem uczy jakiejś harmonii i dramatycznej formy.');
INSERT INTO `ksiazki` VALUES (20, 'Pan Tadeusz', 'Świat Książki', 59.90, 4, 83, 'pan_tadeusz_1.jpg', 'Pan Tadeusz czyli Ostatni zajazd na Litwie. Historya szlachecka z 1811 i 1812 r. Reprint wydania z 1882 roku we Lwowie, które ukazało się nakładem Księgarni Hermana Altenberga. Epopeja narodowa opowiadająca dzieje skonfliktowanych rodów szlacheckich Sopliców i Horeszków. Elegancka, unikatowa edycja w twardej oprawie z licznymi ilustracjami Michała Elwiro Andriollego. Materiały archiwalne wykorzystano dzięki uprzejmości Biblioteki Narodowej.');
INSERT INTO `ksiazki` VALUES (21, 'Pan Tadeusz', 'Agora SA', 39.99, 3, -1, 'pan_tadeusz_audiobook.jpg', 'Poezję powinno się czytać głośno. Sam czytałem „Pana Tadeusza” głośno, byłem wtedy małym dzieckiem, kiedy czytałem go po raz pierwszy. Właściwie chyba tak do dzisiaj czytam „Pana Tadeusza”: po cichu, dla siebie, próbując go usłyszeć. Wydaje mi się, że jest to lektura właściwsza, że poezję powinniśmy smakować, poniekąd słysząc. W przypadku „Pana Tadeusza” – dzieła w moim przypadku absolutnego – jest to prawda wyjątkowa. „Pan Tadeusz” brzmi. Jeśli – a mogę to powiedzieć z całą odpowiedzialnością – kocham ten tekst, to kocham go właśnie za język, za to, co w nim brzmi. Naturalne jest pragnienie, żeby móc usłyszeć język autora, ale nie mamy nagrań Mickiewicza. Czasem myślę sobie, że może po kilkuset latach naukowcy wymyślą coś takiego, co pozwoli nam odzyskać wszystkie brzmienia, które kiedyś zostały słyszane przez naszych przodków i wypowiadane. Chciałbym usłyszeć kiedyś „Pana Tadeusza” mówionego przez Mickiewicza, ale być może byłby to trochę inny tekst. – prof. Jerzy Bralczyk');
INSERT INTO `ksiazki` VALUES (22, 'Pan Tadeusz (Lektura z opracowaniem)', 'SBM', 13.90, 4, 13, 'pan_tadeusz_2.jpg', 'Lektura wraz opracowaniem to znakomita pomoc i inspiracja dla uczniów oraz nauczycieli. Tekst opatrzono wskazówkami interpretacyjnymi i hasłami ułatwiającymi nawigację po książce – dzięki nim łatwo znaleźć potrzebny w trakcie omawiania lektury fragment, zgromadzić materiały do wypracowań i ustnych wypowiedzi, zapamiętać najważniejsze informacje i utrwalić znajomość lektury. Zamieszczone na końcu książki opracowanie podporządkowano podstawie programowej. Zawiera ono ciekawy biogram autora, streszczenie, mapę mentalną, najważniejsze zagadnienia omawiane na lekcjach, a także wiele inspirujących informacji, podpowiedzi i zadań, dzięki którym czytanie lektury staje się twórczą przygodą. Opracowanie powstało pod kierunkiem Katarzyny Zioły-Zemczak, nauczycielki języka polskiego z bogatym doświadczeniem w pracy z dziećmi i młodzieżą, wieloletniej doradczyni metodycznej, a obecnie konsultantki ds. języka polskiego pracującej na co dzień z nauczycielami.');
INSERT INTO `ksiazki` VALUES (23, 'Makbet', 'SBM', 14, 4, 11, 'Makbet_1.jpg', 'Klasyka literatury polskiej i światowej w starannym wydaniu z przypisami – to książka, którą warto mieć w swojej domowej biblioteczce i do której warto wracać. Tekst opatrzono wskazówkami interpretacyjnymi i hasłami ułatwiającymi nawigację po książce – dzięki nim łatwo znaleźć potrzebny w trakcie omawiania lektury fragment, zgromadzić materiały do wypracowań i ustnych wypowiedzi, zapamiętać najważniejsze informacje i utrwalić znajomość lektury.');
INSERT INTO `ksiazki` VALUES (24, 'Makbet', 'Arspol', 42, 4, 3, 'makbet_2.jpg', 'Pan Ryszard Długołęcki jest autorem przekładów Hamleta oraz Sonetów Williama Shakespearea. Przekład Makbeta, podobnie jak przekłady poprzednie, jest przedsięwzięciem bardzo udanym. Tłumacz wnika bardzo starannie w tekst szekspirowski, rozumie zawiłości składniowe, wieloznaczność słownictwa, figury stylistyczne i metaforykę - ze wszystkim tym daje sobie radę sprawną i bogatą polszczyzną, proponując ciekawy, nowy tekst tej tragedii. A z pewnością nie było to zadanie łatwe, biorąc pod uwagę fakt, że Makbet cieszy się wielkim powodzeniem u tłumaczy. Wystarczy wspomnieć tylko o przekładach XXI wieku: w 2002 ukazał się przekład Antoniego Libery, a w 2011 przekład Piotra Kamińskiego. Cieszę się, ze powstał jeszcze jeden polski Makbet, i życzę Autorowi przekładu uznania czytelników i teatrów.  - prof. Marta Gibińska-Marzec.');
INSERT INTO `ksiazki` VALUES (25, 'Sen nocy letniej', 'CM', 28.50, 4, 9, 'sen_nocy_latniej.jpg', 'Starożytne Ateny. Trwają przygotowania do ślubu Tezeusza i Hipolity, w które zaangażowane jest całe miasto. Aktorzy przygotowują sztukę, by uświetnić uroczystość.Równolegle rozgrywają się inne miłosne perypetie — ojciec Hermii nie zgadza się na jej małżeństwo z Lizandrem. Młodzi postanawiają uciec do lasu, a wraz z nimi Demetriusz, adorator Hermii oraz Helena, nieszczęśliwie zakochana w Demetriuszu. Historie miłosne trochę się komplikują…Sen nocy letniej to najsłynniejsza komedia autorstwa Szekspira. Spotykają się w niej dwa światy — ludzki oraz baśniowy, reprezentowany przez leśne duchy i elfy, które nie pozostają obojętne wobec rozterek bohaterów. Sen nocy letniej to jednak nie tylko baśniowy humor, lecz także gorzkawy komentarz w kwestii dobrego wyboru partnerów oraz relacji młodych z rodzicami, kierującymi ich życiem. Komedia powstała pod koniec XVI wieku i była wielokrotnie wystawiana na scenie.');
INSERT INTO `ksiazki` VALUES (26, 'The Complete Works of William Shakespeare', 'Rock Point', 131.90, 4, 1, 'william_shakespear.jpg', 'The perfect gift for the Shakespeare fan, The Complete Works of William Shakespeare is an elegant edition boasting the entire credited catalog of William Shakespeare including 16 comedies, 10 histories, 12 tragedies as well as all of his poems and sonnets.');
INSERT INTO `ksiazki` VALUES (27, 'Miasto szpiegów', 'Znak', 42.99, 6, 64, 'miasto_szpiegow.jpg', 'W wolnym mieście Gdańsk wszystkie chwyty są dozwolone 1933. Edward „Łyssy” Popielski na zlecenie swych mocodawców trafia z Ritą i Leokadią ze Lwowa do targanego wojną wywiadów Gdańska. Szybko odkrywa ciemną stronę miasta — jak najdalszą od wyobrażeń o gotyckiej Perle Bałtyku. Portowe zaułki są pełne nędzy i przemocy, a wzburzone fale zimowego morza często zamykają się nad głowami kolejnych ofiar, które wiedziały zbyt dużo. Popielskiego czeka pierwsze, niemal śmiertelne starcie z Abwehrą. Kiedy na drodze Łyssego staje platynowowłosa piękność, wdowa Irena Arendarska, wszystko wydaje się jasne – ta cyniczna uwodzicielka zastawia nań sidła. Czy Popielski się z nich wyplącze? Czy łatwiej mu będzie zaufać najzacieklejszemu wrogowi, czy najbliższej osobie? MISTRZOWSKA POWIEŚĆ szpiegowska, w której Marek Krajewski odkrywa mniej znane karty z historii służb specjalnych II Rzeczypospolitej.');
INSERT INTO `ksiazki` VALUES (28, 'Wyspa Camino', 'Albatros', 42.50, 6, 23, 'wyspa_camino.jpg', 'Księgarnia, szelest przewracanych kartek, usypiająca atmosfera… Nudno, prawda? A co, jeżeli ten spokojny, pokryty kurzem świat ma drugie oblicze? Pełne złodziei, handlarzy trefnymi białymi krukami, romansów, zdrad i spisków..? Zaczyna się od skoku. Udanego – przestępcy kradną z biblioteki Uniwersytetu Princeton manuskrypty. Dziwna kradzież? Niekoniecznie. To skarb – zostały ubezpieczone na 25 milionów dolarów… Czy cokolwiek może łączyć ten brawurowy skok z niepozornym Bruce’em Cable’em, który prowadzi księgarnię w sennym miasteczku Santa Rosa na wyspie Camino? Niewielu ludzi wie, że Bruce prawdziwe pieniądze zarabia na handlu białymi krukami. Być może dowie się tego Mercer Mann, młoda pisarka z problemami finansowymi, która zostaje wynajęta przez tajemniczą kobietę zlecającą jej poznanie sekretów księgarza…');
INSERT INTO `ksiazki` VALUES (29, 'Ułaskawienie', 'Albatros', 39.90, 6, 10, 'ulaskawienie.jpg', 'Ułaskawienie, które jest równoznaczne z wyrokiem śmierci… W ostatnich godzinach urzędowania w Gabinecie Owalnym prezydent ułaskawia szarą eminencję Waszyngtonu, Joela Backmana – niegdyś potężnego lobbystę, pośredniczącego w zawieraniu międzynarodowych umów – skazanego za rzekomą zdradę stanu. Tylko nieliczni wiedzą, że na decyzję ustępującego prezydenta wpłynęły naciski ze strony CIA, która twierdzi, że Backman posiadł tajemnice mogące narazić na szwank ultranowoczesny system satelitów szpiegowskich. Jego wiedza jest równoznaczna z wyrokiem śmierci, dlatego też agenci po cichu wywożą go z kraju. Backman, pod fałszywym nazwiskiem, osiada we Włoszech. Kiedy wreszcie zaczyna się oswajać z nowym życiem i czuć bezpiecznie, CIA podsyła informację o jego miejscu pobytu Izraelowi, Rosjanom, Chińczykom i Saudyjczykom, po czym robi to, w czym jest niedościgniona – czeka. Nie na to, czy Backman przeżyje – takiej możliwości raczej Agencja nie bierze pod uwagę – lecz na to, kto go zabije.');
INSERT INTO `ksiazki` VALUES (30, 'Zatruty Ogród', 'Albatros', 39.90, 6, 13, 'zatruty_ogrod.jpg', 'BŁYSKOTLIWY THRILLER ZAINSPIROWANY DRAMATYCZNYMI DONIESIENIAMI Z PIERWSZYCH STRON GAZET! Zbiorowe samobójstwo stu członków odizolowanej od świata sekty czekającej na apokalipsę wstrząsa opinią publiczną. Nieliczni, którzy przetrwali masakrę, muszą nauczyć się żyć od nowa poza zamkniętą społecznością. TAM, GDZIE DORASTAŁA ROMY, JEŚLI KTOŚ UMARŁ, JUŻ NIGDY WIĘCEJ SIĘ O NIM NIE MÓWIŁO… Romy, ocalała z masakry, wciąż z przestrachem ogląda się za siebie. Wpojono jej, że zewnętrzny świat jest niebezpieczny, przerażający i godny pogardy. Jednak Romy szybko uczy się życia na zewnątrz, „między Martwymi”. Jest w ciąży, musi więc być czujna i ostrożna, próbując odszukać swoich krewnych. DELIKATNI. NIEBEZPIECZNI. ZABÓJCZY..');
INSERT INTO `ksiazki` VALUES (31, 'Mam na imię Hope', 'Świat Książki', 44.90, 6, 21, 'mam_na_imie_hope_ksiazka.jpg', 'Nazywam się Hope Arden. Jestem dziewczyną, którą wszyscy zapominają. Zaczęło się, kiedy miałam szesnaście lat. Ojciec zapomniał mnie podwieźć do szkoły. Matka zamiast dla czworga nakryła stół dla trojga. Przyjaciel nie poznał mnie na szkolnym korytarzu. Nieważne, co zrobię albo powiem, ani jakich zbrodni się dopuszczę – i tak nie będziecie mnie pamiętać. To mi trochę komplikuje życie. Ale ma też swoje plusy... „Mam na imię Hope” to opowieść o dziewczynie, której nikt nie pamięta, lecz jej historia zostanie z wami na zawsze. Claire North opublikowała swoją pierwszą powieść jako czternastolatka. Została nominowana do Medalu Carnegie.');
INSERT INTO `ksiazki` VALUES (32, 'Mam na imię Hope', 'Świat Książki', 37.90, 7, -1, 'mam_na_imie_hope_ebook.jpg', 'Nazywam się Hope Arden. Jestem dziewczyną, którą wszyscy zapominają. Zaczęło się, kiedy miałam szesnaście lat. Ojciec zapomniał mnie podwieźć do szkoły. Matka zamiast dla czworga nakryła stół dla trojga. Przyjaciel nie poznał mnie na szkolnym korytarzu. Nieważne, co zrobię albo powiem, ani jakich zbrodni się dopuszczę – i tak nie będziecie mnie pamiętać. To mi trochę komplikuje życie. Ale ma też swoje plusy... „Mam na imię Hope” to opowieść o dziewczynie, której nikt nie pamięta, lecz jej historia zostanie z wami na zawsze. Claire North opublikowała swoją pierwszą powieść jako czternastolatka. Została nominowana do Medalu Carnegie.');
INSERT INTO `ksiazki` VALUES (33, 'Mam na imię Hope', 'Świat Książki', 44.90, 3, -1, 'mam_na_imie_hope_audiobook.jpg', 'Nazywam się Hope Arden. Jestem dziewczyną, którą wszyscy zapominają. Zaczęło się, kiedy miałam szesnaście lat. Ojciec zapomniał mnie podwieźć do szkoły. Matka zamiast dla czworga nakryła stół dla trojga. Przyjaciel nie poznał mnie na szkolnym korytarzu. Nieważne, co zrobię albo powiem, ani jakich zbrodni się dopuszczę – i tak nie będziecie mnie pamiętać. To mi trochę komplikuje życie. Ale ma też swoje plusy... „Mam na imię Hope” to opowieść o dziewczynie, której nikt nie pamięta, lecz jej historia zostanie z wami na zawsze. Claire North opublikowała swoją pierwszą powieść jako czternastolatka. Została nominowana do Medalu Carnegie.');
INSERT INTO `ksiazki` VALUES (34, 'Chemia fizyczna', 'Wydawnictwo Naukowe PWN', 249.00, 2, 84, 'chemia_fizyczna_atkins.jpg', 'Chemia fizyczna to nowoczesny, stale uaktualniany podręcznik, od lat cieszący się niezwykłą popularnością na całym świecie. Tradycyjnie autorzy wskazują na służebną rolę oraz interdyscyplinarny charakter chemii fizycznej, która umożliwia zrozumienie i opisanie zjawisk chemicznych, przy czym jak zwykle uwzględniają nowe metody i odkrycia w dziedzinie chemii i fizyki. Dziesiąte wydanie oryginału dopracowano tak, aby jeszcze bardziej odpowiadało potrzebom zarówno studentów, jak i wykładowców. Całość w dalszym ciągu całość składa się z trzech części (TERMODYNAMIKA, STRUKTURA, PRZEMIANA), lecz każdy rozdział został podzielony na krótkie dedykowane podrozdziały, co sprawia, że tekst jest bardziej przystępny dla studentów i bardziej elastyczny dla wykładowców uniwersytetów, politechnik i innych szkół wyższych.');
INSERT INTO `ksiazki` VALUES (35, 'Polskie Logos a Ethos', 'Miles', 75.00, 2, 13, 'polskie_logoas_a_ethos.jpg', 'W 100. rocznicę pierwszego wydania dzieła Feliksa Konecznego „Polskie Logos a Ethos” Wydawnictwo Miles przypomina tę jedną z najważniejszych prac wybitnego historiozofa. Po raz pierwszy przedstawił w niej definicję cywilizacji, która stała się fundamentalnym założeniem jego myśli. W ujęciu tym cywilizacja to „metoda ustroju życia zbiorowego”, która określa w jaki sposób dane społeczności odnoszą się do pięciu kategorii bytu: dobra (moralności), prawd (przyrodzonej i nadprzyrodzonej), zdrowia, dobrobytu oraz piękna. Pierwsza i najważniejsza zasada prawa dziejowego mówi: „nikt nie może być cywilizowany na dwa sposoby”. Pomiędzy cywilizacjami nie może być syntez, a próby ich wprowadzenia kończą się zdominowaniem jednej cywilizacji przez drugą (najczęściej przez tę, która nakłada mniejsze obowiązki moralne), bądź też powstaniem cywilizacyjnej mieszanki niezdolnej do rozwoju. Cywilizacje różnią się w poglądach na wszystkie kategorie bytu – w odmienny sposób widzą dobro i zło, piękno i brzydotę, prawdę i fałsz.');
INSERT INTO `ksiazki` VALUES (36, 'Maradona. Ręka Boga', 'Albatros', 39.90, 2, 4, 'maradona_reka_boga.jpg', 'Kultowa, a jednocześnie kontrowersyjna biografia jednego z najsłynniejszych piłkarzy w historii światowego futbolu, Diego Armando Maradony. Świetnych piłkarzy było i jest wielu, ale bogiem był tylko jeden. Maradona to nie tylko genialny zawodnik, to przede wszystkim symbol i legenda. Oto strzał w samo okienko! Maradona. Ręka Boga to jedyna w swoim rodzaju, uznawana od wielu lat za kultową biografia Diego Armando Maradony - wirtuoza futbolu, Złotego Chłopaka, a jednocześnie człowieka z ogromnymi problemami. Od dzieciństwa w Villa Fiorito, poprzez zdobycie dla Argentyny Pucharu Świata w piłce nożnej i dwukrotnego zdobycia Scudetto z drużyną SSC Napoli, aż po niechlubny upadek. Choć Maradona na boisku był bogiem, to ze świętością nie miał nic wspólnego. Dokonywał cudów z piłką, ale na sumieniu miał wiele przewinień.');
INSERT INTO `ksiazki` VALUES (37, 'Ludzie ze złota', 'Ringier Axel Springer Polska', 34.90, 2, 56, 'ludzie_ze_zlota.jpg', 'O tym, jak grają najlepsi polscy siatkarze, wiemy bardzo wiele. Wystarczy oglądać mecze, śledzić ich w mistrzostwach świata, które po raz drugi w historii wygrali w 2014 roku w katowickim Spodku, by obronić tytuł cztery lata później w Turynie. Mało kto jednak zna ich jako ludzi i mało kto wie, jaką pokonywali drogę, by dojść na szczyt. "Ludzie ze złota" to zbiór 20 szczerych rozmów o siatkówce, ale też o życiu, z czołowymi zawodnikami, którzy stali się mistrzami, oraz z trenerami – Stephanem Antigą i Vitalem Heynenem – którzy ich do tego sukcesu prowadzili. Edyta Kowalczyk i Jakub Radomski, dziennikarze "Przeglądu Sportowego", porozmawiali też z dwójką ludzi, którzy wiedzą, jak, poza mistrzostwem świata, zdobywa się złoto igrzysk (Ryszard Bosek i Tomasz Wójtowicz) oraz Grzegorzem Wagnerem, synem ich trenera-kata. Znajdziecie też wywiad z Piotrem Gruszką - rekordowym, 450-krotnym reprezentantem Polski i mistrzem Europy.');
INSERT INTO `ksiazki` VALUES (38, 'Suarez. Nigdy nie będziesz sam', 'Egmont', 33, 2, 13, 'suarez.jpg', 'Kiedy trafił do Barcelony, powstał niesamowity atak MSN! Leo Messi, Luis Suárez i Neymar grają tak, jakby byli braćmi, jakby znali się od zawsze. Jednak droga Luisa na futbolowy szczyt była dłuższa i dużo trudniejsza niż jego kolegów. Zanim osiągnął swój cel, musiał przezwyciężyć wiele trudności. Tak jak bohater dobrego filmu akcji. A najtrudniejszym przeciwnikiem, którego musiał pokonać, aby spełnić marzenia, był... Luis Suárez. Suárez. Nigdy nie będziesz sam! to opowieść o chłopaku z Urugwaju, którego nazwali Pistoletem, i który był tak waleczny i niezdolny do pogodzenia się z porażką, że o mało nie przegrał sam ze sobą. Bestsellerowa seria Wydawnictwa Egmont o słynnych piłkarzach liczy sześć tytułów i jest wydawana już w ośmiu krajach świata!');

/*INSERT INTO `ksiazki` VALUES (, '', '', , , , '', '');*/

CREATE TABLE `autorzy` (
`id` SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
`imie` VARCHAR(30) NOT NULL,
`nazwisko` VARCHAR(40) NOT NULL
);
INSERT INTO `autorzy` (`imie` , `nazwisko`) VALUES
('Lisa', 'Gardner'),
('Adam', 'Przechrzta'),
('James', 'Rollins'),
('Robert', 'Lacey'),
('Andrzej', 'Sapkowski'),
('Julisz', 'Słowacki'),
('Adam', 'Mickiewicz'),
('William', 'Szekspir'),
('Marek', 'Krajewski'),
('John', 'Grisham'),
('Alex', 'Marwood'),
('Claire', 'North'),
('Peter', 'Atkins'),
('Julio','de Paula'),
('Feliks','Koneczny'),
('Jimmy','Burns'),
('Jakub',' Radomski'),
('Edyta','Kowalczyk');

CREATE TABLE `autorzy_to_ksiazki` (
`ksiazka_id` int(11) NOT NULL,
`autor_id` SMALLINT NOT NULL,
PRIMARY KEY (`autor_id`,`ksiazka_id`),
# KEY `FK_AUTOR_idx` (`autor_id`),
CONSTRAINT `FK_AUTOR` FOREIGN KEY (`autor_id`)
REFERENCES `autorzy` (`id`),
CONSTRAINT `FK_KSIAZKA` FOREIGN KEY (`ksiazka_id`)
REFERENCES `ksiazki` (`id`)
);

INSERT INTO `autorzy_to_ksiazki` VALUES (1, 1);
INSERT INTO `autorzy_to_ksiazki` VALUES (2, 2);
INSERT INTO `autorzy_to_ksiazki` VALUES (3, 2);
INSERT INTO `autorzy_to_ksiazki` VALUES (4, 2);
INSERT INTO `autorzy_to_ksiazki` VALUES (5, 3);
INSERT INTO `autorzy_to_ksiazki` VALUES (6, 3);
INSERT INTO `autorzy_to_ksiazki` VALUES (7, 3);
INSERT INTO `autorzy_to_ksiazki` VALUES (8, 4);
INSERT INTO `autorzy_to_ksiazki` VALUES (9, 4);
INSERT INTO `autorzy_to_ksiazki` VALUES (10, 5);
INSERT INTO `autorzy_to_ksiazki` VALUES (11, 5);
INSERT INTO `autorzy_to_ksiazki` VALUES (12, 5);
INSERT INTO `autorzy_to_ksiazki` VALUES (13, 5);
INSERT INTO `autorzy_to_ksiazki` VALUES (14, 5);
INSERT INTO `autorzy_to_ksiazki` VALUES (15, 5);
INSERT INTO `autorzy_to_ksiazki` VALUES (16, 5);
INSERT INTO `autorzy_to_ksiazki` VALUES (17, 6);
INSERT INTO `autorzy_to_ksiazki` VALUES (18, 6);
INSERT INTO `autorzy_to_ksiazki` VALUES (19, 6);
INSERT INTO `autorzy_to_ksiazki` VALUES (20, 7);
INSERT INTO `autorzy_to_ksiazki` VALUES (21, 7);
INSERT INTO `autorzy_to_ksiazki` VALUES (22, 7);
INSERT INTO `autorzy_to_ksiazki` VALUES (23, 8);
INSERT INTO `autorzy_to_ksiazki` VALUES (24, 8);
INSERT INTO `autorzy_to_ksiazki` VALUES (25, 8);
INSERT INTO `autorzy_to_ksiazki` VALUES (26, 8);
INSERT INTO `autorzy_to_ksiazki` VALUES (27, 9);
INSERT INTO `autorzy_to_ksiazki` VALUES (28, 10);
INSERT INTO `autorzy_to_ksiazki` VALUES (29, 10);
INSERT INTO `autorzy_to_ksiazki` VALUES (30, 11);
INSERT INTO `autorzy_to_ksiazki` VALUES (31, 12);
INSERT INTO `autorzy_to_ksiazki` VALUES (32, 12);
INSERT INTO `autorzy_to_ksiazki` VALUES (33, 12);
INSERT INTO `autorzy_to_ksiazki` VALUES (34, 13);
INSERT INTO `autorzy_to_ksiazki` VALUES (34, 14);
INSERT INTO `autorzy_to_ksiazki` VALUES (35, 15);
INSERT INTO `autorzy_to_ksiazki` VALUES (36, 16);
INSERT INTO `autorzy_to_ksiazki` VALUES (37, 17);
INSERT INTO `autorzy_to_ksiazki` VALUES (37, 18);
INSERT INTO `autorzy_to_ksiazki` VALUES (38, 18);

CREATE TABLE `users` (
`username` VARCHAR(25) NOT NULL,
`password` VARCHAR(60) NOT NULL,
`enabled` boolean NOT NULL DEFAULT TRUE,
`imie` varchar (255) NOT NULL,
`nazwisko` varchar(255) NOT NULL,
`adres` varchar (255) NOT NULL,
`email` varchar(128) NOT NULL,
`telefon` varchar(128) NOT NULL,
PRIMARY KEY (username)
);

INSERT INTO `users` (`username`,`password`,`enabled`,`imie`,`nazwisko`,`adres`,`email`,`telefon`) 
VALUES ('admin', '$2y$12$wkaecCLNqRfN7V73ZLIOJuNIMhzvMVX3vLZiCvuhisd11/j3Q5eNm', TRUE, 'Jan', 'Kowalski', 'Narutowicza 76/1, 20-013 Lublin', 'filipo1998.98@o2.pl', '123456789'); -- haslo: admin 
INSERT INTO `users` (`username`,`password`,`enabled`,`imie`,`nazwisko`,`adres`,`email`,`telefon`) 
VALUES ('user', '$2y$12$BjcsqyUG7v9c/hat479ylOdX9O8GrAcwvzxXzAYQf6AAQ7edylcle', TRUE, 'Piotr', 'Nowak', 'Malczewskiego 26, 71-612 Szczecin', 'filipberezowski1@gmail.com', '123456789'); -- haslo: user

CREATE TABLE `authorities` (
`username` varchar(50) NOT NULL,
`authority` varchar(50) NOT NULL,

UNIQUE KEY `authorieties_idx_1` (`username`, `authority`),
CONSTRAINT `authorities_ibfk_1`
foreign key (`username`)
REFERENCES `users` (`username`)
);

INSERT INTO `authorities` values ('admin','ROLE_ADMIN');
INSERT INTO `authorities` values ('admin','ROLE_USER');
INSERT INTO `authorities` values ('user','ROLE_USER');

CREATE TABLE `zamowienia`
(
`id` int(11) NOT NULL AUTO_INCREMENT,
`kwota` double precision NOT NULL,
`username` varchar(50) NOT NULL,
`data` timestamp NOT NULL,
`status` varchar(50) NOT NULL DEFAULT 'zlozono',
CONSTRAINT `FK_USER` FOREIGN KEY (`username`)
REFERENCES `users` (`username`),
primary key (id)
) ;

INSERT INTO `zamowienia` values (1, 300, 'admin', '2021-07-01 12:00:29', 'zlozono');
INSERT INTO `zamowienia` values (2, 110, 'admin', '2021-06-28 09:22:11', 'zlozono');
  
create table `szczegoly_zamowienia`
(
`id` int(11) NOT NULL AUTO_INCREMENT,
`kwota` double precision NOT NULL,
`cena`  double precision NOT NULL,
`ilosc` int(11) NOT NULL,
`zamowienie_id` int(11) NOT NULL,
`ksiazka_id` int(11) NOT NULL,
CONSTRAINT `FK_ZAMOWIENIE` FOREIGN KEY (`zamowienie_id`)
REFERENCES `zamowienia` (`id`),
CONSTRAINT `FK_KSIAZKA_ZAMOWIENIE` FOREIGN KEY (`ksiazka_id`)
REFERENCES `ksiazki` (`id`),
primary key (`id`)
) ;

INSERT INTO `szczegoly_zamowienia` values (1, 100, 25, 4, 1, 3);
INSERT INTO `szczegoly_zamowienia` values (2, 200, 50, 2, 1, 8);
INSERT INTO `szczegoly_zamowienia` values (3, 110, 55, 2, 2, 14);

-- SELECT * FROM autorzy_to_ksiazki JOIN autorzy ON autorzy_to_ksiazki.autor_id=autorzy.id JOIN ksiazki ON autorzy_to_ksiazki.ksiazka_id=ksiazki.id;
-- select * from `users`;
-- SELECT * FROM `ksiazki`;
-- SELECT * FROM `kategorie`;
-- SELECT * FROM `users`;
-- SELECT * FROM `authorities`;
-- SELECT * FROM `zamowienia`;
-- SELECT * FROM `szczegoly_zamowienia`;