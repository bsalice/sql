-- fonction prédéfinie (déjà inscrite au langage, le développeur ne fait que l'exécuter. )
-- pas d'espace entre le nom de la fonctin et les parenthèses

SELECT DATABASE(); -- montre la base de donnée qui est utilisée
SELECT CURDATE(); -- date actuelle format YYY-MM-DD
SELECT NOW(); -- date et heure actuelle YYYY-MM-DD-HH:II:SS
SELECT CURTIME(); -- heure HH:II:SS

-- pour gérer le formlat des dates : DATE_FORMAT()

SELECT DATE_FORMAT (CURDATE(), '%d/%m/%y');
+-------------------------------------+
| DATE_FORMAT (CURDATE(), '%d/%m/%y') |
+-------------------------------------+
| 05/04/23                            |
+-------------------------------------+


SELECT DATE_FORMAT (NOW(), '%d/%m/%Y %H:%i:%s');
+------------------------------------------+
| DATE_FORMAT (NOW(), '%d/%m/%Y %H:%i:%s') |
+------------------------------------------+
| 05/04/2023 14:35:55                      |
+------------------------------------------+

-- afficher les dates de sortie au format français

SELECT DATE_FORMAT (date_sortie, '%d/%m/%y') AS date_fr
FROM emprunt;
+----------+
| date_fr  |
+----------+
| 07/12/16 |
| 07/12/16 |
| 11/12/16 |
| 12/12/16 |
| 15/12/16 |
| 02/01/17 |
| 15/02/17 |
| 20/02/17 |
+----------+

SELECT DAYNAME('1994-10-06'); -- nom du jour

SELECT DAYOFYEAR('2023-04-05'); -- nombre de jour de l'année passé à la date recherchée

SELECT DATE_ADD(CURDATE(), INTERVAL 2 MONTH); -- ajouter une valeur à une date
+---------------------------------------+
| DATE_ADD(CURDATE(), INTERVAL 2 MONTH) |
+---------------------------------------+
| 2023-06-05                            |
+---------------------------------------+
SELECT DATE_ADD(CURDATE(), INTERVAL 60 DAY); -- ajouter une valeur à une date
+--------------------------------------+
| DATE_ADD(CURDATE(), INTERVAL 60 DAY) |
+--------------------------------------+
| 2023-06-04                           |
+--------------------------------------+

-- pour voir les intervalles disponibles : w3schools.com/sql/func_mysql_date_add.asp

INSERT INTO abonne VALUES (NULL, 'Celine');
SELECT LAST_INSERT_ID();

SELECT CONCAT('a', 'b', 'c', 'd');
+-----------------------------+
| CONCAT ('a', 'b', 'c', 'd') |
+-----------------------------+
| abcd                        |
+-----------------------------+

USE entreprise;
SELECT CONCAT(nom,' ', prenom, ' salaire : ',salaire) FROM employes;

-- CONCAT() pour concatener tous les arguments fournis à la fonction
-- CONCAT_WS() pour concaténer avec les séparateurs 

SELECT CONCAT_WS(' | ', nom, prenom, service, date_embauche) FROM employes;
+-------------------------------------------------------+
| CONCAT_WS(' | ', nom, prenom, service, date_embauche) |
+-------------------------------------------------------+
| Laborde | Jean-pierre | direction | 2010-12-09        |
| Gallet | Clement | commercial | 2010-12-15            |
| Winter | Thomas | commercial | 2011-05-03             |
| Dubar | Chloe | production | 2011-09-05               |
| Grand | Fabrice | comptabilite | 2011-12-30           |
| Collier | Melanie | commercial | 2012-01-08           |
| Blanchet | Laura | direction | 2012-05-09             |
| Miller | Guillaume | commercial | 2012-07-02          |
| Perrin | Celine | commercial | 2012-09-10             |
| Vignal | Mathieu | informatique | 2013-04-03          |
| Thoyer | Amandine | communication | 2014-01-23        |
| Durand | Damien | informatique | 2014-07-05           |
| Chevel | Daniel | informatique | 2015-09-28           |
| Martin | Nathalie | juridique | 2016-01-12            |
| Lagarde | Benoit | production | 2016-06-03            |
| Sennard | Emilie | commercial | 2017-01-11            |
| Lafaye | Stephanie | assistant | 2017-03-01           |
+-------------------------------------------------------+

USE bibliotheque;
SELECT CONCAT_WS(' - ', prenom, auteur, titre, date_sortie, date_rendu) AS infos 
FROM abonne, emprunt, livre 
WHERE abonne.id_abonne = emprunt.id_abonne 
AND emprunt.id_livre = livre.id_livre;
+------------------------------------------------------------------------------+
| infos                                                                        |
+------------------------------------------------------------------------------+
| Guillaume - GUY DE MAUPASSANT - Une vie - 2016-12-07 - 2016-12-11            |
| Benoit - GUY DE MAUPASSANT - Bel-Ami  - 2016-12-07 - 2016-12-18              |
| Chloe - GUY DE MAUPASSANT - Une vie - 2016-12-11 - 2016-12-19                |
| Laura - ALPHONSE DAUDET - Le Petit chose - 2016-12-12 - 2016-12-22           |
| Guillaume - ALEXANDRE DUMAS - La Reine Margot - 2016-12-15 - 2016-12-30      |
| Benoit - ALEXANDRE DUMAS - Les Trois Mousquetaires - 2017-01-02 - 2017-01-15 |
| Chloe - ALEXANDRE DUMAS - Les Trois Mousquetaires - 2017-02-15               |
| Benoit - GUY DE MAUPASSANT - Une vie - 2017-02-20                            |
+------------------------------------------------------------------------------+

SELECT LENGTH('HELLO'); -- pour compter le nombre de caractère
+-----------------+
| LENGTH('HELLO') |
+-----------------+
|               5 |
+-----------------+



SELECT TRIM('                        Bonjour à tous                    ') AS INFO; -- pour enlever les espaces en début et fin de chaine de caractère
+----------------+
| INFO           |
+----------------+
| Bonjour à tous |
+----------------+

SELECT LOWER('HELLO');
SELECT UPPER('bonjour');

SELECT PASSWORD('hello');
SELECT MD5('hello');