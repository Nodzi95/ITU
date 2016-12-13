  SET NAMES utf8;
  SET foreign_key_checks = 0;
  SET time_zone = 'SYSTEM';
  SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

	DROP TABLE IF EXISTS user;
 	CREATE TABLE user (
    	nick VARCHAR(20),
		password VARCHAR(20),
    	PRIMARY KEY (nick) 
  	)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
	
	INSERT INTO `xmolek00`.`user` (`nick`, `password`) VALUES ('martin', 'mm'), ('nodzi', 'nn');

	DROP TABLE IF EXISTS test;
 	CREATE TABLE test (
    	ID int(11) unsigned NOT NULL AUTO_INCREMENT,
		user_nick VARCHAR(20),
		body int(11),
		time datetime DEFAULT CURRENT_TIMESTAMP,
    	PRIMARY KEY (ID),
    	CONSTRAINT FOREIGN KEY (user_nick) REFERENCES user(nick) ON DELETE CASCADE ON UPDATE CASCADE
  	)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

 	INSERT INTO test (user_nick, body) VALUES ('nodzi', 15), ('martin', 16), ('nodzi', 12), ('martin', 11);

	DROP TABLE IF EXISTS animal;
 	CREATE TABLE animal (
    	ID int(5) unsigned NOT NULL AUTO_INCREMENT,
    	PRIMARY KEY (ID), 
    	name VARCHAR(20),
		descriptionCZ VARCHAR(1000),
		descriptionLA VARCHAR(200),
		picture VARCHAR(300),
		type VARCHAR(10)
  	)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;



	INSERT INTO animal (type, descriptionCZ, name, picture) VALUES 
	('selma', 'Norek americk� m� dlouh�, �t�hl� t�lo s kr�tk�mi nohami, co� mu umo��uje vl�zt do nory za ko�ist�. Tento tvar t�la tak� pom�h� sn�it odpor vody p�i plav�n�. Lebka norka americk�ho je podobn� lebce norka evropsk�ho, ale je masivn�j��, u��� a m�n� prot�hl�.', 'norek americk�',  'https://upload.wikimedia.org/wikipedia/commons/0/04/MinkforWiki.jpg'),
	('selma', 'Je velikost� �azen mezi kunu a lasici, tedy men�� �elma, dlouh� od 33 do 44 cm s ocasem 10�18 cm. V�� zhruba 1 kg. D�ky b�l� barv� na stran�ch hlavy oproti ostatn� hn�d� srsti je snadno odli�iteln� od podobn�ch tvor�', 'tcho� tmav�',  'https://upload.wikimedia.org/wikipedia/commons/2/2e/Mustela_putorius_01-cropped.jpg'),
	('selma', 'M� sv�tl�, p�ev�n� �lutav� zbarven�, kter� je patrn� zejm�na na h�bet� a boc�ch. Oproti tomu jsou kon�etiny zahaleny do tmav�ho z�voje ko�ichu. Asi dvan�cticentimetrov� ocas je nap�l sv�tl� a na konci p�ech�z� v tmavou barvu. Okraje boltc� a oblast kolem �enichu jsou b�lav�. D�lka ocasu je 12-17 cm. V�� necel� jeden kilogram.', 'tcho� stepn�',  'https://upload.wikimedia.org/wikipedia/commons/2/2c/Mustela_eversmannii_2.jpg'),
	('selma', 'Kuna lesn� je �t�hl�, na lasicovitou dlouhonoh� �elma s dlouh�m hu�at�m ocasem a sv�tle hn�d�, �okol�dov� a� �ern� zbarvenou srst�. P�edn� i zadn� kon�etiny m� vyzbrojeny ostr�mi dr�py, tlamu zase ostr�mi zoubky vhodn�mi k rychl�mu usmrcen� ko�isti.', 'kuna lesn�',  'https://upload.wikimedia.org/wikipedia/commons/f/ff/Martes_martes_crop.jpg'),
	('selma', 'Kuna skaln� m� dlouh� �t�hl� t�lo s hedv�bnou srst� a b�lou n�prsenkou. Dor�st� d�lky 30-50 cm, z toho ocas dosahuje d�lky a� 20 cm a v�hy a� 2,3 kg. Do��v� se 10 a� 12 let. Pol�t��ky na tlapk�ch nem� pokryt� srst�.', 'kuna skaln�',  'https://media.novinky.cz/269/212699-gallery1-px7zk.jpg'),
	('selma', 'Lasice kol�avy dosahuj� velikosti 155-260 mm a hmotnosti 30-160 g. Velikost t�la je velmi r�znorod�, samice jsou v�ak v�dy men��. Srst je zbarvena ml��n�hn�d� a� rezavohn�d� s b�lavou n�prsenkou a spodn� stranou t�la. Na ocase se (na rozd�l od hranostaje) nenach�z� �ern� �pi�ka. V �R se na zimu nep�ebarvuje, jen zesv�tl�.', 'lasice kol�ava',  'https://upload.wikimedia.org/wikipedia/commons/e/e3/Mustela_nivalis_-British_Wildlife_Centre-4.jpg'),
	('selma', 'Jedn� se o malou �elmu s prot�hl�m t�lem a kr�tk�mi kon�etinami. Dor�st� d�lky 24 a� 29 cm (d�lka ocasu okolo 9 cm) a dosahuje v�hy 140 a� 350 g. Samci jsou v�razn� v�t�� ne� samice. Zbarven� hranostaje je v l�t� hn�d� (zahrnuje pom�rn� rozs�hlou �k�lu od sv�tle a� po tmav� hn�dou barvu) s b�l�m b�ichem, kter� v zim� nahrazuje hust�� �ist� b�l� ko�ich.', 'lasice hranostaj',  'https://upload.wikimedia.org/wikipedia/commons/7/77/Mustela_Erminea_head.jpg'),
	('selma', 'Na �zem� �R je jezevec nejv�t�� lasicovitou �elmou, v�� 10 a� 20 kg, dlouh� je a� 85 cm a s ocasem m� metr. V porovn�n� s ostatn�mi lasicovit�mi �elmami m� jezevec zcela odli�n� tvar t�la, zavalitou postavu. M� t�m�� b�lou hlavu, jen p�es o�i m� �irok� �ern� pruhy. Srst je �luto�ed� s �ern�mi a b�l�mi konci, hrub� a �t�tinat�.', 'jezevec lesn�',  'https://upload.wikimedia.org/wikipedia/commons/9/9e/%27Honey%27_the_badger.jpg'),
	('selma', 'Vydra ���n� je velk� lasicovit� �elma s prot�hl�m, �t�hl�m t�lem, kr�tk�mi kon�etinami s plovac�mi bl�nami a svalnat�m, zu�uj�c�m se ocasem. M� kr�tkou sv�tle a� tmav� hn�dou srst s b�lou spodinou. P��tomnost vydry ���n� m��eme zaznamenat i podle trusu prot�hl�ho tvaru se zbytky ryb�ch �upin nebo k�stek.', 'vydra ���n�', 'https://upload.wikimedia.org/wikipedia/commons/8/89/Loutre2.jpg'),
	('selma', 'Medv�d hn�d� je mohutn� �elma se siln�mi kon�etinami s velk�mi, a� 15 cm dlouh�mi dr�py, dlouhou srst� a velkou kulatou hlavou. Zbarven� srsti se zna�n� li�� podle n�kolika poddruh�, ale v�eobecn� se pohybuje od �lutav� plav� a� po tmav� �ernou. Mnoz� jedinci maj� nav�c b�l� nebo st��b�it� odst�n srsti, co� m� za n�sledek pro�ediv�l� vzhled. Ani velikost nen� pevn� stanovena a kol�s� u jednotliv�ch populac� podle mno�stv� dostupn� potravy. Nejmen��m poddruhem je p�itom medv�d syrsk� a nejv�t��m medv�d kodiak.', 'medv�d hn�d�',  'https://upload.wikimedia.org/wikipedia/commons/5/59/2_bears_and_salmon.JPG'),
	('selma', 'S velikost� 41 � 72 cm a hmotnost� mezi 3,6 � 9 kg je m�val nejv�t��m z�stupcem �eledi medv�dkovit�. Cel� je porostl� hustou, �edou srst�, mezi jeho charakteristick� znaky pat�� v�razn� �ern� obli�ejov� maska a tmav� pruhovan� ocas. Pat�� mezi v�e�ravce a obvykle je aktivn� v noci; jeho strava je z 40 % tvo�ena bezobratl�mi, 33 % zauj�m� rostlinn� slo�ka a zb�vaj�c�ch 27 % obratlovci.', 'm�val severn�',  'https://upload.wikimedia.org/wikipedia/commons/6/66/%2A_Raccoon.jpg'),
	('selma', 'Ps�k m�valovit� je robustn�, n�zkonoh� zv��e, p�ipom�naj�c� sp� m�vala nebo jezevce ne� psovitou �elmu. D�lka t�la dosp�l�ch jedinc� dosahuje 50�70 cm, v��ka v kohoutku v�ak nep�esahuje 25 cm. Hmotnost se pohybuje v rozmez� 4�10 kg. Ocas je oproti jin�m psovit�m �elm�m kr�tk� (15�25 cm), ale velmi hu�at�. Jeho srst je dlouh�, hu�at�, hn�d� a� �ed� nazrzl�.', 'ps�k m�valovit�',  'https://upload.wikimedia.org/wikipedia/commons/9/92/Nyctereutes_procyonoides_16072008.jpg'),
	('selma', 'Li�ka je relativn� �t�hl� psovit� �elma s pom�rn� dlouh�ma �pi�at�ma u�ima a dlouh�m hu�at�m ocasem. Stavbou t�la a lebky se li�ka jen m�lo li�� od slab��ho psa. T�lo je 100 a� 140 cm dlouh� v�etn� oh��ky a v kohoutku 30 a� 40 cm vysok�. Oh��ka m��� 35 a� 45 cm. T�lesn� v�ha zna�n� kol�s�, ud�v� se rozp�t� 4 a� 10 kg, v�jime�n� m��e p�es�hnout i 12 kg.', 'li�ka obecn�',  'https://upload.wikimedia.org/wikipedia/commons/0/01/Adult_fox.JPG'),
	('selma', 'Vlci dosahuj� hmotnosti 16 a� 80 kg. �ij� ve sme�k�ch tvo�en�ch obvykle vedouc�m alfa p�rem a n�kolika jejich potomky. �iv� se r�znorodou ko�ist� od hmyzu a� po bizony a pi�mon�. Jejich nep��teli jsou krom� �lov�ka tak� tyg�i a medv�di.', 'vlk obecn�',  'https://upload.wikimedia.org/wikipedia/commons/4/47/Canis_lupus_1_%28Martin_Mecnarowski%29.jpg'),
	('selma', 'Rys ostrovid je nejv�t�� evropskou ko�kovitou �elmou, s d�lkou t�la a� 120 cm, d�lkou ocasu a� 25 cm, v��kou v kohoutku a� 70 cm a hmotnost� a� 35 kg (pouze samci, samice jsou men��). Charakteristick�m znakem v�ech rys� jsou troj�heln�kovit� u�i s �ern�mi chom��ky chlup� na konci (tzv. chvostky) a �ern� konec ocasu, mnoho jedinc� m� l�cn� chlupy prodlou�en� a utv��ej�c� licousy.', 'rys ostrovid',  'https://upload.wikimedia.org/wikipedia/commons/3/36/Lodjur_fotograferad_pa_Polar_Zoo_Norge.jpg'),
	('selma', 'Ko�ka divok� m��e v�it 1,2�11 kg a dos�hnout d�lky 47�80 cm. M� na prvn� pohled zavalit�j�� postavu ne� ko�ka dom�c�, zejm�na d�ky del�� a hust�j�� srsti; tento rozd�l je nejv�ce patrn� v zim�. Ko�ka divok� m� tak� v�t�� hlavu s dlouh�mi vousky a men��ma u�ima. Je zbarvena �edohn�d� a� �edo�lut�, s v�razn�m pruhov�n�m na h�betu, ocase a noh�ch. Na h�betu je v�razn� tmav� p�s, zat�mco b�icho b�v� kr�mov� �lut�.', 'ko�ka divok�',  'http://www.priroda.cz/clanky/foto/bohdal_kocka-divoka-66680.jpg'),
	('sudo', 'Prase divok� je velk� sudokopytn�k. Dosp�l� samci dor�staj� d�lky 120 � 180 cm a v kohoutku m��� 55 � 100 cm. Jejich hmotnost je zna�n� r�znorod� a v jednotliv�ch oblastech se viditeln� li��, v pr�m�ru v�ak �in� 50 � 90 kg.', 'prase divok�',  'https://upload.wikimedia.org/wikipedia/commons/c/c0/A_young_wild_boar_in_his_environment.jpg'),
	('sudo', 'Jelen evropsk� pat�� mezi nejv�t�� (nejmohutn�j��) z�stupce sv� �eledi. Samci dor�staj� 175�230 cm a jejich hmotnost se pohybuje mezi 160�240 kg. Samice jsou oproti samc�m zna�n� men��, dor�staj� 160�210 cm a dosahuj� hmotnosti mezi 120�170 kg. Ocas p�itom m��� 12�19 mm a v kohoutku dosahuj� v��ky 120 a� 150 cm.', 'jelen lesn�',  'https://upload.wikimedia.org/wikipedia/commons/7/75/Cervus_elaphus_Luc_Viatour_3.jpg'),
	('sudo', 'Kohoutkov� v��ka u samc� se pohybuje mezi 85 a� 110 cm, u samic 75 a� 90 cm. Bez kelky (ocasu) dosahuj� d�lky 130 a� 175 cm (samice 115 a� 140 cm), ocas pak m��� 18 � 27 cm. Hmotnost samc� je 40 a� 95 kg, samic 25 a� 50 kg.', 'dan�k evropsk�',  'https://upload.wikimedia.org/wikipedia/commons/8/8c/Daino_maschio.JPG'),
	('sudo', 'Oproti jelenu lesn�mu je sika v�razn� men�� a leh��. Dosp�l� samec v kohoutku dosahuje maxim�ln� v��ky 120 centimetr�, t�lesn� hmotnost se pohybuje podle poddruhu od 35 kg (sika vietnamsk�) do 140 kg (sika Dybowsk�ho). Letn� zbarven� sik� je pestr�, rezavohn�d� s b�l�mi skvrnami (podobn� jako u da�ka), zimn� srst je del��, dosti hrub�, �edohn�d� a� �okol�dov� hn�d�, s nev�razn�mi skvrnami.', 'jelen sika',  'https://upload.wikimedia.org/wikipedia/commons/f/f6/Cervus_nippon_002.jpg'),
	('sudo', 'Samci obvykle v�� 50-100 kg, ale vz�cn�, hlavn� v Americe byly zaznamen�ny kusy, kter� p�esahovaly 159 kg. Samice obvykle dosahuj� v�hy 40�90 kg, ale byly zdokumentov�ny kusy, kter� dosahovaly a� 105 kg. D�lka se pohybuje od 160 do 220 cm v�etn� ocasu a v��ka v kohoutku od 80 do 100 cm.', 'jelenec b�loocas�',  'http://calphotos.berkeley.edu/imgs/512x768/0000_0000/0708/0115.jpeg'),
	('sudo', 'Srnec obecn� je relativn� mal�m z�stupcem sv� �eledi. Dosahuje hmotnosti mezi 15�35 kg a v kohoutku m��� 65�75 cm. Ocas je velmi kr�tk� (2�3 cm) a sotva viditeln�. P�es l�to m� jeho srst a� m�rn� rezavo-�erven� odst�n, s koncem roku v�ak nar�st� nov� zimn� srst a jej� zbarven� znateln� tmavne (srn�� zv�� p�ebarvuje). Samci maj� relativn� kr�tk� par��ky, kter� mohou u jedinc� v dobr�ch podm�nk�ch dor�stat a� do d�lky 25 cm.', 'srnec obecn�',  'https://upload.wikimedia.org/wikipedia/commons/5/5d/Capreolus_capreolus_%28Marek_Szczepanek%29.jpg'),
	('sudo', 'Losi maj� �edohn�dou a� �ernou srst, na krku jim vyr�st� h��va. Velk� prot�hl� hlava je zakon�ena siln�m p�e�n�vaj�c�m horn�m pyskem. Losi jsou dob�e vybaveni pro pohyb v m�kk� p�d�. Jejich nohy vybaven� rozta�iteln�mi sp�rky maj� velkou na�lapovac� plochu. Mohou se pohybovat i rychlost� 50 km/h.', 'los evropsk�',  'https://upload.wikimedia.org/wikipedia/commons/b/be/Moose_983_LAB.jpg'),
	('sudo', 'Kamz�k horsk� je p�vabn� zv��, elegantn� a pln� energie a s�ly, co� jsou rysy pot�ebn� v horsk�m prost�ed�. Jeho v��ka v kohoutku �in� 0,70 - 0,85 m, d�lka t�la 1 - 1,30 m, v�ha 11 - 36 kg, ocas 3 - 8 cm a lebka 18,3 - 22 cm.', 'kamz�k horsk�',  'https://upload.wikimedia.org/wikipedia/commons/e/eb/Gaemsen_nebelhorn_20081015.jpg'),
	('sudo', 'Muflon m��e b�t dlouh� 100 a� 125cm, v kohoutku dosahuje v��ky a� 75 cm. Ocas m��� 10 cm. Star�� berani dosahuj� v�hy 50 kg, ovce kolem 35 kg. Muflon� zv�� m� na hlav� rohy, myslivecky ozna�ovan� jako toulce. Muflon� toulce se li�� od paro�� jelenovit�ch t�m, �e jsou dut�, nev�tven�, zv�� je neshazuje, a tak� sv�m p�vodem.', 'muflon',  'https://upload.wikimedia.org/wikipedia/commons/1/1c/Ovis_musimon_trebon_brewery.jpg'),
	('sudo', 'Paovce h�ivnat� m� v��ku, po ramena, 80 a� 100 cm a v�� 40 a� 140 kg. M� p�se�n� hn�dou barvu, kter� s v�kem tmavne, sv�tlej�� slabiny a tmav�� pruh na z�dech.', 'paovce h�ivnat�',  'http://www.theonlinezoo.com/img/09/toz09164s.jpg'),
	('zajici', 'Zaj�c poln� dor�st� d�lky 50 � 70 cm a dosahuje hmotnosti mezi 2,5 - 6,5 kg. Je velmi zdatn�m b�cem, b�h� b�n� 40 km/h a v nebezpe�� a� 74 km/h a dob�e kli�kuje. Proto�e m� p�edn� nohy oproti zadn�m pom�rn� kr�tk�, je rychlej�� p�i b�hu do kopce, ne� dol�. P�i prudk�m �prku z kopce dol� n�kdy klop�t� a dokonce d�l� kotrmelce! V�born� sk��e do v��ky p�es 1 m a do d�lky a� 6 m. ', 'zaj�c poln�',  'https://upload.wikimedia.org/wikipedia/commons/e/ea/01-sfel-08-009a.jpg'),
	('zajici', 'Kr�l�k divok� dosahuje d�lky t�la 40-50 cm, oc�sek m��� asi 6 cm, hmotnost se pohybuje od 1,3 do 2,5 kg. Postavou se podob� zaj�ci, je v�ak asi o polovinu men��, m� krat�� u�i i kon�etiny. Nepom�r mezi d�lkou p�edn�ch a zadn�ch kon�etin nen� tak v�razn� jako u zaj�ce a p�edn� kon�etiny jsou siln�j��. U�i kr�l�ka m��� 6-8 cm a pokud ucho p�ehneme, nep�esahuje �um�k kr�l�ka. ', 'kr�l�k divok�',  'https://upload.wikimedia.org/wikipedia/commons/f/fd/Katoenstaartkonijn_3.jpg'),
	('hlodavci', 'Veverka obecn� obvykle dor�st� 19 a� 23 cm a dosahuje hmotnosti mezi 250 a� 340 g. Hu�at� ocas, kter� napom�h� udr�ovat rovnov�hu p�i lezen� a skoc�ch na stromech a kter� veverka vyu��v� jako �pokr�vku� t�la p�i sp�nku, je 14,5 a� 20 cm dlouh�.', 'veverka obecn�',  'https://upload.wikimedia.org/wikipedia/commons/0/0c/2013_-_Sciurus_vulgaris_-_01.jpg'),
	('hlodavci', 'Sysel dor�st� d�lky okolo 20 centimetr� a dosahuje v�hy 200-400 gram�. M� hust�, hn�dav�, p�il�hav� ko�ich. Sysel m� velk� o�i, mal� u�n� boltce a kr�tk� ocas. �ty�prst� p�edn� kon�etiny jsou o hodn� krat�� ne� zadn�.', 'sysel obecn�',  'https://upload.wikimedia.org/wikipedia/commons/6/6e/Susel_moregowany2.jpg'),
	('hlodavci', 'Bobr evropsk� dosahuje hmotnosti a� 30 kg. Po jihoamerick� kapyba�e je druh�m nejv�t��m hlodavcem. T�lo je porostl� velmi hustou �ernohn�dou srst� o hustot� a� 300 chlup� na mm2. Je dokonale p�izp�soben �ivotu ve vod� d�ky plovac�m blan�m, kter� jsou na zadn�ch kon�etin�ch, a uzav�rateln�m nozdr�m. Uzav��t m��e tak� tlamu ihned za �ez�ky, co� umo��uje vyu�it� zub� jako n�stroj� i ve vod�.', 'bobr evropsk�',  'https://upload.wikimedia.org/wikipedia/commons/c/cc/Beaver_pho34.jpg'),
	('hlodavci', 'Velikostn� se nutrie nach�zej� p�ibli�n� mezi ondatrou a bobrem - t�lo dosp�l� nutrie je dlouh� 40-70 cm, ocas je dlouh� 30-45 cm. Dosp�l� nutrie v�� obvykle 5-6 kg, dob�e �iven� alfa samec m��e dos�hnout 10 kg, samec vykrmen� v zajet� a� 12 kg.', 'nutrie ���n�',  'http://www.chovzvirat.cz/images/zvirata/nutrie-ricni_ezs67ln.jpg'),
	('hlodavci', 'K�e�ek poln� je v�razn� v�t��, ne� k�e�ek zlat� chovan� jako dom�c� mazl��ek, jeho v�ha dosahuje 150�600 g, d�lka 215�340 mm. M� zavalit�j�� t�lo, kr�tk� kon�etiny a krati�k�, ��dce osrst�n� ocas. M� pestr� zbarven�. Na h�bet� m�v� �lutohn�d� a� rezav� hn�d� pruh s na�ernal�mi konci del��ch chlup�, na b�i�e b�v� naopak tmavohn�d� a� �ern�.', 'k�e�ek poln�',  'https://upload.wikimedia.org/wikipedia/commons/3/35/Cricetus_cricetus_01.jpg'),
	('hlodavci', 'M� typick� tup� �enich. Barva srsti na horn� ��sti t�la je velmi variabiln�, �lutohn�d�, rudohn�d� i hn�d�. Boky jsou �ed� a zadek �edob�l�, nohy maj� b�lou barvu. Na konci ocasu m� slab� chom��ek srsti. Dor�st� velikosti 7 � 13,5 cm a ocas m� dlouh� 7 � 11 cm. Jejich obvykl� hmotnost se pohybuje mezi 10 � 36 gramy.', 'norn�k rud�',  'https://upload.wikimedia.org/wikipedia/commons/d/d2/Skogssorken_%28Myodes_glareolus%29.JPG'),
	('hlodavci', 'Je a� 19 cm dlouh� a vzhledem p�ipom�n� potkana. M� zpravidla tmavohn�dou barvu srsti. D�lka t�la: 140 � 220 mm, d�lka ocasu: 95 � 140 mm, hmotnost: 150 - 300 g', 'hryzec vodn�',  'https://upload.wikimedia.org/wikipedia/commons/c/c2/Arvicola-terrestris.jpg'),
	('hlodavci', 'Je velk� p�ibli�n� 30 cm, m��e ale dor�stat mnohem v�t��ch rozm�r�. Na h�betu je hn�d�, zespoda �ed�. Ocas je dlouh� a zplo�t�l�, pou��van� p�i plov�n� jako kormidlo. Pobl� pohlavn�ch org�n� m� �l�zu, ze kter� vylu�uje pi�mo, proto se j� p�ezd�v� i pi�movka.', 'ondatra pi�mov�',  'https://upload.wikimedia.org/wikipedia/commons/0/00/Muskrat_swimming_Ottawa.jpg'),
	('hlodavci', 'Velikost je p�ibli�n� mezi 8 a� 12 centimetry, ocas je dlouh� a� 3 centimetry; samec b�v� v�t�� ne� samice a dosahuje v�hy a� 50 gram�. Od my�i se li�� hlavn� kr�tk�m ocasem, robustn�j�� stavbou t�la a zaoblen�m �enichem. Hrabo� m� mal� a pom�rn� skryt� u�n� boltce. Srst zbarvena od hn�d� a� po �edou, b�i�n� strana b�v� sv�tlej��.', 'hrabo� poln�',  'https://upload.wikimedia.org/wikipedia/commons/1/10/Feldmaus_Microtus_arvalis.jpg'),
	('hlodavci', 'Jeho t�lo je dlouh� 9 a� 14 cm a ocas 3 a� 5 cm, v�� 20 a� 30 g. Nejbl�e podobn�m tvorem, �ij�c�m v �esk� p��rod�, je hrabo� poln�, od kter�ho se odli�uje na prv� pohled m�lo z�eteln�mi znaky.', 'hrabo� mok�adn�',  'http://www.hlasek.com/foto/microtus_agrestis_bt3363.jpg'),
	('hlodavci', 'Nejmen�� z na�ich hrabo��. Vyzna�uje se kr�tk�m ocasem, drobn�ma o�ima velikosti �pendl�kov� hlavi�ky (v pr�m�ru 1-2 mm) a kr�tk�mi blanit�mi boltci (t�m�� se skr�vaj� v srsti), je� jsou ��dce ochlupen� jen p�i vn�j��m okraji. Dobr�m rozpozn�vac�m znakem je i d�lka zadn� tlapky pod 15,5 mm, na chodidlech nav�c najdeme obvykle 5 mozol� (u ostatn�ch na�ich hrabo�� vyjma hryzce jich b�v� 6).', 'hrabo��k podzemn�',  'http://www.biolib.cz/IMG/GAL/274586.jpg'),
	('hlodavci', 'Krysa obecn� je typick� my�ovit� hlodavec. Je dlouh� 160�235 mm, jej� ocas m��� 185�255 mm a je na n�m 220�290 okrouhl�ch rohovit�ch prstenc� (krou�k�). Velikost zadn�ch tlapek �in� 29�40 mm, u�i maj� 22�26,5 mm. V�� 130�250 g.', 'krysa obecn�',  'http://www.naturfoto.cz/fotografie/andera/krysa-obecna-3791.jpg'),
	('hlodavci', 'Potkan je st�edn� v�t�� my�ovit� hlodavec. D�lka t�la b�v� v rozmez� 160�270 mm, ocas je krat�� ne� t�lo a m��� 130�200 mm. Velikost zadn�ch tlapek �in� 30�45 mm, u�i maj� 18�22 mm. Dosahuje hmotnosti 140-500 g, v zajet� a� do 900 g. Samci jsou robustn�j��, samice b�vaj� a� o 1/3 men��.', 'potkan',  'https://upload.wikimedia.org/wikipedia/commons/1/10/Co-swand-09-12.jpg'),
	('hlodavci', 'My�i se od my�ic li�� men��mi u�n�mi boltci, krat��mi zadn�mi chodidly a rovn� zbarven�m. U my�i dom�c� p�eva�uje na h�bet� tmavo�ed�, �edohn�d� nebo �lut� odst�n, kter� pozvolna p�ech�z� v �ed� nebo �luto�ed� b�icho bez v�razn�j�� hranice na boc�ch. Ocas je dosti dlouh�, jednobarevn� a mnohem n�padn�ji �upinkat� ne� u my�ic, nav�c jeho poko�ku nejde snadno st�hnout. ', 'my� dom�c�',  'https://upload.wikimedia.org/wikipedia/commons/a/ab/House_mouse.jpg'),
	('hlodavci', 'My�ka drobn� m� �lutohn�dou barvu srsti, na b�i�e p�ech�z� v b�lou. N�kdy m� srst i rezavou. V zim� p�ech�z� barva srsti v tmav�� na�ervenal� odst�n. My�ka m� velmi mal� u�n� boltce a tup� zakon�en� �enich s �lut�m zbarven�m. D�le m� velmi ��dce ochlupen� a velmi pohybliv� ch�pav� ocas,', 'my�ka drobn�',  'https://upload.wikimedia.org/wikipedia/commons/a/a3/Harvest_mouse1.jpg'),
	('hlodavci', 'Svrchn� strana t�la my�ice temnop�s� je rezav� hn�d� a� �lutohn�d�. B�icho m� v�razn� sv�tl� � �edohn�d� a� do b�la. D�lka t�la je 70�125 mm, ocas m� o trochu krat�� ne� t�lo. V�� 15�40 g.', 'my�ice temnop�s�',  'https://upload.wikimedia.org/wikipedia/commons/0/01/Brandmaus.jpg'),
	('hlodavci', 'D�lka t�la dosahuje 5 a� 7 cm, hmotnost 5 a� 13 g. Oc�sek je t�m�� o polovinu del�� ne� t�l��ko. My�ivka je na prvn� pohled n�padn� tmav�m pod�ln�m pruhem od �pi�ky oc�sku a� po o�i. Srst je jinak zbarvena okrov�, na b��ku �edav�. Zadn� kon�etiny jsou mohutn�ji vyvinut� ne� p�edn� (ne v�ak tak v�razn� jako u tarb�k�) a maj� p�t prst�. Na p�edn�ch kon�etin�ch jsou prsty pouze �ty�i.', 'my�ivka horsk�',  'https://upload.wikimedia.org/wikipedia/commons/8/8b/Sicista_betulina_02.JPG'),
	('hlodavci', 'Tato statn�j�� my�ice je dlouh� 90�123 mm, ocas m� stejn� dlouh� jako t�lo. V�� 18�45 g. Zaujmou na n� v�razn� velk� o�i � p�ipad� na n� 0,52 % v�hy cel�ho t�la (u my�i dom�c� jen 0,13 %). Je dvoubarevn�, h�bet m� rezav� hn�d�, b�icho b�lav�. �asto m�v� v�razn� �lutou skvrnu na hrdle.', 'my�ice lesn�',  'https://upload.wikimedia.org/wikipedia/commons/4/41/Apodemus_flavicollis_%28Ratiborice%29.jpg'),
	('hlodavci', 'Tato my�ice v�� 13-38 g. Dosahuje d�lky t�la 75�110 mm; ocas je o n�co krat�� (70�105 mm). Je na n�m 150�180 rohovinov�ch krou�k�. M� velk� u�n� boltce, �edohn�d�, lehce nahn�dl� ko��ek, na b�i�e �pinav� b�l�, p�i�em� hranice p�echodu barev mezi boky a b�ichem nen� ostr�.', 'my�ice k�ovinn�',  'https://upload.wikimedia.org/wikipedia/commons/b/bd/Apodemus_sylvaticus_bosmuis.jpg'),
	('hlodavci', 'My�ice malook� je dlouh� 70�96 mm, star�� �daje ud�vaj� 75�100 mm. Ocas m� v�dy krat�� ne� t�lo (62�95 mm). Svrchu je �edohn�d� a� hn�d�, zespodu b�lav�, p�i�em� hranice barev na boc�ch je u dosp�l�ch jedinc� obvykle pom�rn� ostr�. Jedn� se o to nejmen�� my�ici �ij�c� v �esku, v�� 12�22 g. Velikost tlapek �in� 17�20,5 mm, u�i maj� 13�15 mm.', 'my�ice malook�',  'https://upload.wikimedia.org/wikipedia/commons/6/62/Apodemus_uralensis_3.jpg'),
	('hlodavci', 'Dosahuje tak�ka velikosti veverky. Svrchn� strana st��brn� leskl�, �edohn�d�, spodn� strana b�l�, ost�e odd�lena. U�i mal�, kulat� a velk� o�i, tmav� olemovan�. Ocas prot�hle hu�at�.', 'plch velk�',  'https://upload.wikimedia.org/wikipedia/commons/0/0b/Siebenschlaefer_glis_glis.jpg'),
	('hlodavci', 'Jde o mal�ho z�stupce plch�, dor�st� sotva 6 � 9 cm. Vzhledem k pom�ru t�la m� velmi dlouh� hu�at� ocas (5,7 - 7,5 cm), kter� se v p��pad� nebezpe�� (pl��ka chyt� pred�tor za ocas), m��e zt�hnout z k��e. V�� 17 - 20 g, t�sn� p�ed hibernac� se v�ak jeho hmotnost pohybuje mezi 30 - 40 g. V�born� lezec a skokan. Je oran�ovo�lut�ho zbarven� s pon�kud sv�tlej�� spodinou t�la. ', 'pl��k liskov�', 'https://upload.wikimedia.org/wikipedia/commons/1/13/Haselmaus.JPG'),
	('hlodavci', 'D�lka t�la 110-120 mm, d�lka ocasu 100 � 120 mm, celkov� d�lka t�la i s ocasem p�ibli�n� 26 cm, v�ha 60 - 140 g.', 'plch zahradn�',  'https://upload.wikimedia.org/wikipedia/commons/1/12/Eliomys_quercinus01.jpg'),
	('hlodavci', 'Plch lesn� je men�� ne� plch zahradn�, m��� 86 a� 120 mm, oc�sek je dlouh� 60 a� 113 mm. Je zbarven� �lutohn�d� �i hn�do�lut�, b�icho b�v� b�l� nebo �lutob�l�. Na hlav� m� p�es oko k u�n�mu boltci �ern� pruh. U�i jsou mal� a kulat�. V�ha 17-32 g, d�lka 77-112 mm.', 'plch lesn�',  'https://upload.wikimedia.org/wikipedia/commons/4/45/Dryomys_nitedula.jpg'),
	('hmyz', 'Hlava celkov� sv�tl�, u mlad�ch jedinc� naopak velmi tmav�. B�icho: tmavohn�d� s b�lou skvrnou na hrdle a na prsou, u star�ch jedinc� a� b�lav�. Bodliny: nepravideln� pruhovan� �i jednobarevn�, sm��uj�c� do stran (rozcuchan�), d�lka 17�22 mm. Po�et bodlin: 6000�7000. Rozmno�ov�n�: duben�z���. Zimn� sp�nek: ��jen/listopad�b�ezen. V�ha: 900g. D�lka: 19�22 cm', 'je�ek v�chodn�',  'https://upload.wikimedia.org/wikipedia/commons/5/59/2008_Hedgehog_1020932.jpg'),
	('hmyz', 'Je�ek z�padn� je se svou d�lkou 22�27 cm a hmotnost� mezi 0,9 a� 1 kg o n�co v�t�� ne� jeho p��buzn�, ji� v��e zm�n�n� je�ek v�chodn�. Na sv�tl� hlav� m� tmav� pruh t�hnouc� se od �enichu k o��m a tvarovan� do p�smena V. B�i�n� strana t�la je u dosp�l�ho jedince �edohn�d� a� �ed� s pod�lnou hn�dou skvrnou, u ml��at hn�d� bez skvrny. ', 'je�ek z�padn�',  'https://upload.wikimedia.org/wikipedia/commons/c/cb/Erinaceus_europaeus_%28Linnaeus%2C_1758%29.jpg'),
	('hmyz', 'Zat�mco u rejsce vodn�ho jsou zadn� tlapky t�m�� v�dy del�� ne� 17 mm (obvykle 18-19 mm), u rejsce �ern�ho m�vaj� nej�ast�ji 15-16 mm a zcela v�jime�n� se bl�� k 17 mm. Pokud jde o d�lku ocasu, u rejsce vodn�ho obvykle nam���me 50-75 mm a u rejsce �ern�ho 40 a� 52 mm.', 'rejsec �ern�',  'https://upload.wikimedia.org/wikipedia/commons/3/32/Neomys_anomalus_01_by-dpc.jpg'),
	('hmyz', 'Hlava s t�lem dosahuje velikosti 7,2 a� 9,6 centimetr�, ocas 4,7 a� 7,7 centimetr�, v��ka 1,6 a� 2 centimetry a hmotnost 9 a� 23 gram�. U�n� boltec je zcela skryt� v srsti. Tlama trochu �ir�� ne� u p��slu�n�k� rodu rejsk�. �pi�ky zub� tmav� �erven�. Pom�rn� velk�. Spodina ocasu lemov�na brvit�m, st��b�it� �ed�m k�lem, kter� funguje jako kormidlo.', 'rejsec vodn�',  'https://upload.wikimedia.org/wikipedia/commons/9/98/Neomys_fodiens_TF_090829.jpg'),
	('hmyz', 'Rejsek obecn� m��� pr�m�rn� 55�82 mm na d�lku (bez ocasu) a v�� p�ibli�n� 5�12 gram�. Rejsci jsou charakteristi�t� svou sametov� tmavohn�dou srst�, kter� je na boc�ch sv�tlej�� a na b�i�e �lutav�. Nedosp�l� rejsci maj� srst krat�� a� do doby, kdy za�nou l�nat a letn� srst nahrad� srst zimn�.', 'rejsek obecn�',  'https://upload.wikimedia.org/wikipedia/commons/c/cf/SorexAraneus_wwalas_02.JPG'),
	('hmyz', 'Celkov� d�lka hlavy s t�lem se pohybuje od 4,3 do 6,4 centimetr� a d�lka ocasu od 3,1 do 4,9 centimetr�. Je vysok� 0,9 a� 1,2 centimetr� a v�� 2,5 a� 7,5 gram�. Je velmi podobn� rejskovi obecn�mu, je v�ak men��, sv�tlej�� a �asto �ed� zbarven�. Ocas m�v� del�� a porostl� hust�� srst�.', 'rejsek mal�',  'https://upload.wikimedia.org/wikipedia/commons/a/ae/Sorex_minutus.jpg'),
	('hmyz', 'Od b�lozubky �ed� se li�� obvykle v�t�� velikost� a zbarven�m, nebo� mezi tmav��m, �edohn�d�m a� hn�d�m h�betem a sv�tlou, t�m�� b�lou spodn� stranou t�la, m� na boc�ch v�raznou a ostrou hranici.', 'b�lozubka b�lob�ich�',  'https://upload.wikimedia.org/wikipedia/commons/1/10/Crocidura_leucodon-1.jpg'),
	('hmyz', 'Od rejsk� a rejsc� se b�lozubky li�� hlavn� osrst�n�m ocasu, na kter�m jim krom� kr�tk� p�il�hav� srsti je�t� ��dce vyr�staj� del�� a odst�vaj�c� chlupy, dob�e patrn� zejm�na v proti sv�tle. Vedle toho maj� b�lozubky i v�t�� u�n� boltce. Jm�no dostaly podle zub�, kter� jsou na rozd�l od �erven� pigmentovan�ho chrupu rejsk� a rejsc� b�l�. T�lesnou velikost� se b�lozubka �ed� �ad� k men��m druh�m rejskovit�ch.', 'b�lozubka �ed�',  'https://upload.wikimedia.org/wikipedia/commons/9/95/Gartenspitzmaus.jpg'),
	('hmyz', 'Krtek m� v�lcovit� t�lo, okolo 12 cm dlouh�. Samice jsou obvykle men��. O�i m� mal� a skryt� za chlupy, zrak m� proto �patn�. Naopak sluch a �ich m� vyvinut�. U�i jsou jen mal�mi v�stupky v k��i. Srst m� obvykle tmav� hn�dou, ale proto�e d�ky �ivotu pod zem� nejsou ani jin� barvy znev�hodn�ny, vyskytuje se cel� �ada odst�n�.', 'krtek obecn�',  'https://upload.wikimedia.org/wikipedia/commons/8/80/Close-up_of_mole.jpg'),
	('primat', '�lov�k se (jako ostatn� sou�asn� hominini) �iv� rostlinnou i �ivo�i�nou potravou. Modern�j��m druh�m �lov�ka, v�etn� jedin�ho sou�asn� �ij�c�ho �lov�ka moudr�ho, je vlastn� u��v�n� od�v� jednak pro ochranu p�ed klimatick�mi vlivy a jin�mi mechanick�mi a tepeln�mi ��inky okoln�ho prost�ed� a jednak jako sou��st spole�ensk�ho chov�n� a jeho znak� a ur�en� role ve spole�nosti.', '�lov�k moudr�',  'https://cdn.pixabay.com/photo/2016/12/09/09/52/little-girl-1894125_960_720.jpg'),
	('primat', 'Jedn� se o dokonale no�n�ho tvora. Str�v� 80% noci hled�n�m potravy. Sv�tlo nem� v oblib�. �iv� se larvami hmyzu, nektarem, sladk�mi plody a pta��mi vejci. Nalezneme ho v de�tn�ch a opadav�ch les�ch.', 'ksukol ocasat�',  'https://upload.wikimedia.org/wikipedia/commons/9/9a/Aye-aye_%28Daubentonia_madagascariensis%29_4.jpg'),
	('primat', 'Pat�� mezi no�n� �ivo�ichy,p�es den sp� p�itisknut� k st�edn� siln�m v�tv�m strom�. Lovit a sb�rat potravu za��n� p�i z�padu slunce. Outlo� lov� drobn� obratlovce a hmyz,ale sp�e p�evl�daj� rostliny.', 'outlo� v�hav�',  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Nycticebus_coucang_001.jpg/800px-Nycticebus_coucang_001.jpg'),
	('primat', 'Je mal�, no�n� prim�t, �len rodu komba. �ije v Africe ji�n� od Sahary a na bl�zk�ch ostrovech v�etn� Zanzibaru. Maj� tendenci ��t v such�ch zalesn�n�ch oblastech a v savan�ch.', 'komba u�at�',  'https://s-media-cache-ak0.pinimg.com/736x/7b/b2/8f/7bb28f01b431e9c49b2e4f0ce8454b47.jpg'),
	('primat', 'V�t�ina druh� �ije ve skupin�ch od 6 do 15 zv��at. Na rozd�l od jin�ch opic, kdy po dosa�en� pohlavn� dosp�losti z�st�vaj� v tlup� samice. �iv� se listy, pupeny, o�echy, ovocem a kv�ty.', 'v�e��an',  'https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Alouatta_sara_%28Bolivian_red_howler%29.jpg/800px-Alouatta_sara_%28Bolivian_red_howler%29.jpg'),
	('primat', '�ije ve skupin�ch tvo�en�ch 2 a� 20 kusy, veden�mi jedn�m dominantn�m samcem a samic�. Jsou to denn� prim�ti,kte�� v�t�inu �asu tr�v� na stromech. Ziv� se zvl�t� listy,plody, kv�ty,stonky a bobulemi.', 'malpa kapuc�nsk�',  'https://upload.wikimedia.org/wikipedia/commons/1/15/Cebus_capucinus%2C_Costa_Rica.JPG'),
	('primat', 'P�i sh�n�n� potravy je nejaktivn�j�� r�no a v podve�er, p�es poledne odpo��v� ve st�nu. Je v�e�ravec, �iv� se plody, listy, travinami,oddenky,ko��nky,semeny,vejci,uloven�mi pt�ky i drobn�mi �ivo�ichy.', 'ko�kodan obecn�',  'https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/AwasaVervet.jpg/1024px-AwasaVervet.jpg'),
	('primat', 'U orangutan� je velk� rozd�l ve velikosti a hmotnosti podle pohlav�. V�t�inu �ivota tr�v� v korun�ch strom�.Ze strom� sl�zaj� jen v�jime�n� a neradi.Orangutani jsou velmi klidn� a m�rumilovn� zv��ata.', 'orangutan',  'https://cdn.pixabay.com/photo/2015/12/04/14/45/zoo-1076592_960_720.jpg'),
	('primat', 'Je rod nejv�t��ch �ij�c�ch prim�t�. �ij� na zemi a jsou p�ev�n� b�lo�rav�.Ob�vaj� lesy st�edn� Afriky. Jako�to b�lo�ravci se gorily �iv� hlavn� ovocem,listy a v�honky.Ob�as poz�ou i n�jak� mal� hmyz.', 'gorila',  'https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Female_gorilla_with_8_months_old_baby_boy_gorilla_in_SF_zoo.jpg/800px-Female_gorilla_with_8_months_old_baby_boy_gorilla_in_SF_zoo.jpg')
	ON DUPLICATE KEY UPDATE name = VALUES( name);























