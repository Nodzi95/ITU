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

	DROP TABLE IF EXISTS animal;
 	CREATE TABLE animal (
    	ID int(5) unsigned NOT NULL AUTO_INCREMENT,
    	PRIMARY KEY (ID), 
    	name VARCHAR(20),
	descriptionCZ VARCHAR(200),
	descriptionLA VARCHAR(200),
	picture VARCHAR(100),
	type VARCHAR(10)
  	)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;



	INSERT INTO animal (type, name, picture) VALUES 
	('selma', 'norek americký',  'https://upload.wikimedia.org/wikipedia/commons/0/04/MinkforWiki.jpg'),
	('selma', 'tchoř tmavý',  'https://upload.wikimedia.org/wikipedia/commons/2/2e/Mustela_putorius_01-cropped.jpg'),
	('selma', 'tchoř stepní',  'https://upload.wikimedia.org/wikipedia/commons/2/2c/Mustela_eversmannii_2.jpg'),
	('selma', 'kuna lesní',  'https://upload.wikimedia.org/wikipedia/commons/f/ff/Martes_martes_crop.jpg'),
	('selma', 'kuna skalní',  'https://media.novinky.cz/269/212699-gallery1-px7zk.jpg'),
	('selma', 'lasice kolčava',  'https://upload.wikimedia.org/wikipedia/commons/e/e3/Mustela_nivalis_-British_Wildlife_Centre-4.jpg'),
	('selma', 'lasice hranostaj',  'https://upload.wikimedia.org/wikipedia/commons/7/77/Mustela_Erminea_head.jpg'),
	('selma', 'jezevec lesní',  'https://upload.wikimedia.org/wikipedia/commons/9/9e/%27Honey%27_the_badger.jpg'),
	('selma', 'vydra říční', 'https://upload.wikimedia.org/wikipedia/commons/8/89/Loutre2.jpg'),
	('selma', 'medvěd hnědý',  'https://upload.wikimedia.org/wikipedia/commons/5/59/2_bears_and_salmon.JPG'),
	('selma', 'mýval severní',  'https://upload.wikimedia.org/wikipedia/commons/6/66/%2A_Raccoon.jpg'),
	('selma', 'psík mývalovitý',  'https://upload.wikimedia.org/wikipedia/commons/9/92/Nyctereutes_procyonoides_16072008.jpg'),
	('selma', 'liška obecná',  'https://upload.wikimedia.org/wikipedia/commons/0/01/Adult_fox.JPG'),
	('selma', 'vlk obecný',  'https://upload.wikimedia.org/wikipedia/commons/4/47/Canis_lupus_1_%28Martin_Mecnarowski%29.jpg'),
	('selma', 'rys ostrovid',  'https://upload.wikimedia.org/wikipedia/commons/3/36/Lodjur_fotograferad_pa_Polar_Zoo_Norge.jpg'),
	('selma', 'kočka divoká',  'http://www.priroda.cz/clanky/foto/bohdal_kocka-divoka-66680.jpg'),
	('sudo', 'prase divoké',  'https://upload.wikimedia.org/wikipedia/commons/c/c0/A_young_wild_boar_in_his_environment.jpg'),
	('sudo', 'jelen lesní',  'https://upload.wikimedia.org/wikipedia/commons/7/75/Cervus_elaphus_Luc_Viatour_3.jpg'),
	('sudo', 'daněk evropský',  'https://upload.wikimedia.org/wikipedia/commons/8/8c/Daino_maschio.JPG'),
	('sudo', 'jelen sika',  'https://upload.wikimedia.org/wikipedia/commons/f/f6/Cervus_nippon_002.jpg'),
	('sudo', 'jelenec běloocasý',  'http://calphotos.berkeley.edu/imgs/512x768/0000_0000/0708/0115.jpeg'),
	('sudo', 'srnec obecný',  'https://upload.wikimedia.org/wikipedia/commons/5/5d/Capreolus_capreolus_%28Marek_Szczepanek%29.jpg'),
	('sudo', 'los evropský',  'https://upload.wikimedia.org/wikipedia/commons/b/be/Moose_983_LAB.jpg'),
	('sudo', 'kamzík horský',  'https://upload.wikimedia.org/wikipedia/commons/e/eb/Gaemsen_nebelhorn_20081015.jpg'),
	('sudo', 'muflon',  'https://upload.wikimedia.org/wikipedia/commons/1/1c/Ovis_musimon_trebon_brewery.jpg'),
	('sudo', 'paovce hřivnatá',  'http://www.theonlinezoo.com/img/09/toz09164s.jpg'),
	('zajici', 'zajíc polní',  'https://upload.wikimedia.org/wikipedia/commons/e/ea/01-sfel-08-009a.jpg'),
	('zajici', 'králík divoký',  'https://upload.wikimedia.org/wikipedia/commons/f/fd/Katoenstaartkonijn_3.jpg'),
	('hlodavci', 'veverka obecná',  'https://upload.wikimedia.org/wikipedia/commons/0/0c/2013_-_Sciurus_vulgaris_-_01.jpg'),
	('hlodavci', 'sysel obecný',  'https://upload.wikimedia.org/wikipedia/commons/6/6e/Susel_moregowany2.jpg'),
	('hlodavci', 'bobr evropský',  'https://upload.wikimedia.org/wikipedia/commons/c/cc/Beaver_pho34.jpg'),
	('hlodavci', 'nutrie říční',  'https://upload.wikimedia.org/wikipedia/commons/c/cc/Beaver_pho34.jpg'),
	('hlodavci', 'křeček polní',  'https://upload.wikimedia.org/wikipedia/commons/3/35/Cricetus_cricetus_01.jpg'),
	('hlodavci', 'norník rudý',  'https://upload.wikimedia.org/wikipedia/commons/d/d2/Skogssorken_%28Myodes_glareolus%29.JPG'),
	('hlodavci', 'hryzec vodní',  'https://upload.wikimedia.org/wikipedia/commons/c/c2/Arvicola-terrestris.jpg'),
	('hlodavci', 'ondatra pižmová',  'https://upload.wikimedia.org/wikipedia/commons/0/00/Muskrat_swimming_Ottawa.jpg'),
	('hlodavci', 'hraboš polní',  'https://upload.wikimedia.org/wikipedia/commons/1/10/Feldmaus_Microtus_arvalis.jpg'),
	('hlodavci', 'hraboš mokřadní',  'http://www.hlasek.com/foto/microtus_agrestis_bt3363.jpg'),
	('hlodavci', 'hrabošík podzemní',  'http://www.biolib.cz/IMG/GAL/274586.jpg'),
	('hlodavci', 'krysa obecná',  'http://www.naturfoto.cz/fotografie/andera/krysa-obecna-3791.jpg'),
	('hlodavci', 'potkan',  'https://upload.wikimedia.org/wikipedia/commons/1/10/Co-swand-09-12.jpg'),
	('hlodavci', 'myš domácí',  'https://upload.wikimedia.org/wikipedia/commons/a/ab/House_mouse.jpg'),
	('hlodavci', 'myška drobná',  'https://upload.wikimedia.org/wikipedia/commons/a/a3/Harvest_mouse1.jpg'),
	('hlodavci', 'myšice temnopásá',  'https://upload.wikimedia.org/wikipedia/commons/0/01/Brandmaus.jpg'),
	('hlodavci', 'myšivka horská',  'https://upload.wikimedia.org/wikipedia/commons/8/8b/Sicista_betulina_02.JPG'),
	('hlodavci', 'myšice lesní',  'https://upload.wikimedia.org/wikipedia/commons/4/41/Apodemus_flavicollis_%28Ratiborice%29.jpg'),
	('hlodavci', 'myšice křovinná',  'https://upload.wikimedia.org/wikipedia/commons/b/bd/Apodemus_sylvaticus_bosmuis.jpg'),
	('hlodavci', 'myšice malooká',  'https://upload.wikimedia.org/wikipedia/commons/6/62/Apodemus_uralensis_3.jpg'),
	('hlodavci', 'plch velký',  'https://upload.wikimedia.org/wikipedia/commons/0/0b/Siebenschlaefer_glis_glis.jpg'),
	('hlodavci', 'plšík liskový', 'https://upload.wikimedia.org/wikipedia/commons/1/13/Haselmaus.JPG'),
	('hlodavci', 'plch zahradní',  'https://upload.wikimedia.org/wikipedia/commons/1/12/Eliomys_quercinus01.jpg'),
	('hlodavci', 'plch lesní',  'https://upload.wikimedia.org/wikipedia/commons/4/45/Dryomys_nitedula.jpg'),
	('hmyz', 'ježek východní',  'https://upload.wikimedia.org/wikipedia/commons/5/59/2008_Hedgehog_1020932.jpg'),
	('hmyz', 'ježek západní',  'https://upload.wikimedia.org/wikipedia/commons/c/cb/Erinaceus_europaeus_%28Linnaeus%2C_1758%29.jpg'),
	('hmyz', 'rejsec černý',  'https://upload.wikimedia.org/wikipedia/commons/3/32/Neomys_anomalus_01_by-dpc.jpg'),
	('hmyz', 'rejsec vodní',  'https://upload.wikimedia.org/wikipedia/commons/9/98/Neomys_fodiens_TF_090829.jpg'),
	('hmyz', 'rejsek obecný',  'https://upload.wikimedia.org/wikipedia/commons/c/cf/SorexAraneus_wwalas_02.JPG'),
	('hmyz', 'rejsek malý',  'https://upload.wikimedia.org/wikipedia/commons/a/ae/Sorex_minutus.jpg'),
	('hmyz', 'bělozubka bělobřichá',  'https://upload.wikimedia.org/wikipedia/commons/1/10/Crocidura_leucodon-1.jpg'),
	('hmyz', 'bělozubka šedá',  'https://upload.wikimedia.org/wikipedia/commons/9/95/Gartenspitzmaus.jpg'),
	('hmyz', 'krtek obecný',  'https://upload.wikimedia.org/wikipedia/commons/8/80/Close-up_of_mole.jpg'),
	('primat', 'člověk moudrý',  'http://www.gamepark.cz/pictures/00/17/24/172453.jpg')
	ON DUPLICATE KEY UPDATE name = VALUES( name);

























