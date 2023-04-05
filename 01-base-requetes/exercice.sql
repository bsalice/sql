-- 01 - Afficher la profession de l'employé 547
SELECT id_employes, service FROM employes WHERE id_employes = 547; 
+-------------+------------+
| id_employes | service    |
+-------------+------------+
|         547 | commercial |
+-------------+------------+
-- 02 - Afficher la date d'embauche d'Amandine
SELECT date_embauche, nom, prenom FROM employes WHERE prenom = "Amandine"; 
+---------------+--------+----------+
| date_embauche | nom    | prenom   |
+---------------+--------+----------+
| 2014-01-23    | Thoyer | Amandine |
+---------------+--------+----------+

-- 03 - Afficher le nom de famille de Guillaume
SELECT nom, prenom FROM employes WHERE prenom = "Guillaume"; 
+--------+-----------+
| nom    | prenom    |
+--------+-----------+
| Miller | Guillaume |
+--------+-----------+

-- 04 - Afficher le nombre d'employes ayant un id_employes commençant par le chiffre 5
SELECT COUNT(id_employes) AS id_commencant_par_5 FROM employes WHERE id_employes LIKE "5%"; 
+---------------------+
| id_commencant_par_5 |
+---------------------+
|                   3 |
+---------------------+
-- 05 - Afficher le nombre de commerciaux
SELECT COUNT(service) AS nombre_de_commerciaux FROM employes WHERE service = 'commercial';
+-----------------------+
| nombre_de_commerciaux |
+-----------------------+
|                     6 |
+-----------------------+ 
-- 06 - Afficher le salaire moyen des informaticiens
SELECT ROUND(AVG(salaire), 1) AS salaire_moyen_des_informaticiens FROM employes WHERE service = 'informatique';
+----------------------------------+
| salaire_moyen_des_informaticiens |
+----------------------------------+
|                           2616.7 |
+----------------------------------+

-- 07 - Afficher les 5 premiers employés après avoir classé leur nom de famille en ordre alphabétique
SELECT * FROM employes ORDER BY nom LIMIT 5;
+-------------+---------+----------+------+--------------+---------------+---------+
| id_employes | prenom  | nom      | sexe | service      | date_embauche | salaire |
+-------------+---------+----------+------+--------------+---------------+---------+
|         592 | Laura   | Blanchet | f    | direction    | 2012-05-09    |    4500 |
|         854 | Daniel  | Chevel   | m    | informatique | 2015-09-28    |    3100 |
|         547 | Melanie | Collier  | f    | commercial   | 2012-01-08    |    3100 |
|         699 | Julien  | Cottet   | m    | secretariat  | 2013-01-05    |    1390 |
|         739 | Thierry | Desprez  | m    | secretariat  | 2013-07-17    |    1500 |
+-------------+---------+----------+------+--------------+---------------+---------+

-- 08 - Afficher le coût des commerciaux sur une année
SELECT SUM(salaire * 12) AS cout_service_commercial FROM employes WHERE service = 'commercial';
+-------------------------+
| cout_service_commercial |
+-------------------------+
|                  184200 |
+-------------------------+

-- 09 - Afficher le salaire moyen par service
SELECT service, ROUND(AVG(salaire), 1) AS salaire_moyen_par_service FROM employes GROUP BY service;
+---------------+---------------------------+
| service       | salaire_moyen_par_service |
+---------------+---------------------------+
| assistant     |                    1775.0 |
| commercial    |                    2558.3 |
| communication |                    2100.0 |
| comptabilite  |                    2900.0 |
| direction     |                    4750.0 |
| informatique  |                    2616.7 |
| juridique     |                    3550.0 |
| production    |                    2225.0 |
| secretariat   |                    1496.7 |
+---------------+---------------------------+ 

-- 10 - Afficher le nombre de recrutement sur l'année 2015 (avec alias)
SELECT COUNT(date_embauche) AS recrutement_2015 FROM employes WHERE date_embauche LIKE '2015%';
+------------------+
| recrutement_2015 |
+------------------+
|                1 |
+------------------+

-- 11 - Afficher le salaire moyen appliqué lors des recrutements sur la période allant de 2012 à 2014
SELECT ROUND(AVG(salaire), 1) AS salaire_moyen_2012_2014 FROM employes WHERE date_embauche BETWEEN '2012-01-01' AND '2014-12-31';
SELECT ROUND(AVG(salaire), 1) AS salaire_moyen_2012_2014 FROM employes WHERE date_embauche >= '2012-01-01' AND date_embauche <= '2014-12-31';
SELECT ROUND(AVG(salaire), 1) AS salaire_moyen_2012_2014 FROM employes WHERE YEAR(date_embauche) IN (2012, 2013, 2014);
SELECT ROUND(AVG(salaire), 1) AS salaire_moyen_2012_2014 FROM employes WHERE date_embauche LIKE '2012%' OR date_embauche LIKE '2013%' OR date_embauche LIKE '2014%';
+-------------------------+
| salaire_moyen_2012_2014 |
+-------------------------+
|                  2437.8 |
+-------------------------+


-- 12 - Afficher le nombre de différent service
SELECT COUNT(DISTINCT service) AS nb_services FROM employes;
+-------------+
| nb_services |
+-------------+
|           9 |
+-------------+
-- 13 - Afficher tous les employés sauf ceux des services production et secrétariat
SELECT * FROM employes WHERE service NOT IN ('commercial', 'production');
+-------------+-------------+----------+------+---------------+---------------+---------+
| id_employes | prenom      | nom      | sexe | service       | date_embauche | salaire |
+-------------+-------------+----------+------+---------------+---------------+---------+
|         350 | Jean-pierre | Laborde  | m    | direction     | 2010-12-09    |    5000 |
|         491 | Elodie      | Fellier  | f    | secretariat   | 2011-11-22    |    1600 |
|         509 | Fabrice     | Grand    | m    | comptabilite  | 2011-12-30    |    2900 |
|         592 | Laura       | Blanchet | f    | direction     | 2012-05-09    |    4500 |
|         699 | Julien      | Cottet   | m    | secretariat   | 2013-01-05    |    1390 |
|         701 | Mathieu     | Vignal   | m    | informatique  | 2013-04-03    |    2500 |
|         739 | Thierry     | Desprez  | m    | secretariat   | 2013-07-17    |    1500 |
|         780 | Amandine    | Thoyer   | f    | communication | 2014-01-23    |    2100 |
|         802 | Damien      | Durand   | m    | informatique  | 2014-07-05    |    2250 |
|         854 | Daniel      | Chevel   | m    | informatique  | 2015-09-28    |    3100 |
|         876 | Nathalie    | Martin   | f    | juridique     | 2016-01-12    |    3550 |
|         990 | Stephanie   | Lafaye   | f    | assistant     | 2017-03-01    |    1775 |
+-------------+-------------+----------+------+---------------+---------------+---------+
-- 14 - Afficher conjointement le nombre d'homme et de femme dans l'entreprise
SELECT sexe, COUNT(*) FROM employes GROUP By sexe;
-----------------
| sexe | nombre |
-----------------
| m    | 11     |
| f    | 9      |
-----------------
-- 15 - Afficher les commerciaux ayant été recrutés avant 2015 de sexe masculin et gagnant un salaire supérieur à 2500
SELECT * FROM employes WHERE service = 'commercial' AND YEAR(date_embauche) < 2015 AND sexe IN('m') AND salaire > 2500;
+-------------+--------+--------+------+------------+---------------+---------+
| id_employes | prenom | nom    | sexe | service    | date_embauche | salaire |
+-------------+--------+--------+------+------------+---------------+---------+
|         415 | Thomas | Winter | m    | commercial | 2011-05-03    |    3550 |
+-------------+--------+--------+------+------------+---------------+---------+
-- 16 - Qui a été embauché en dernier
SELECT * FROM employes ORDER BY date_embauche DESC LIMIT 1;
+-------------+-----------+--------+------+-----------+---------------+---------+
| id_employes | prenom    | nom    | sexe | service   | date_embauche | salaire |
+-------------+-----------+--------+------+-----------+---------------+---------+
|         990 | Stephanie | Lafaye | f    | assistant | 2017-03-01    |    1775 |
+-------------+-----------+--------+------+-----------+---------------+---------+
-- 17 - Afficher les informations sur l'employé du service commercial gagnant le salaire le plus elevé
SELECT * FROM employes WHERE service = 'commercial' ORDER BY salaire DESC LIMIT 1;
+-------------+--------+--------+------+------------+---------------+---------+
| id_employes | prenom | nom    | sexe | service    | date_embauche | salaire |
+-------------+--------+--------+------+------------+---------------+---------+
|         415 | Thomas | Winter | m    | commercial | 2011-05-03    |    3550 |
+-------------+--------+--------+------+------------+---------------+---------+
-- 18 - Afficher le prénom du comptable gagnant le meilleur salaire
SELECT prenom FROM employes WHERE service = 'comptabilite' ORDER BY salaire DESC LIMIT 1;
+---------+
| prenom  |
+---------+
| Fabrice |
+---------+
-- 19 - Afficher le prénom de l'informaticien ayant été recruté en dernier
SELECT prenom FROM employes WHERE service = 'informatique' ORDER BY date_embauche DESC LIMIT 1;
+--------+
| prenom |
+--------+
| Daniel |
+--------+
-- 20 - Augmenter chaque salaire de 100 €
UPDATE employes SET salaire = salaire + 100;
SELECT * FROM employes;
+-------------+-------------+----------+------+---------------+---------------+---------+
| id_employes | prenom      | nom      | sexe | service       | date_embauche | salaire |
+-------------+-------------+----------+------+---------------+---------------+---------+
|         350 | Jean-pierre | Laborde  | m    | direction     | 2010-12-09    |    5100 |
|         388 | Clement     | Gallet   | m    | commercial    | 2010-12-15    |    2400 |
|         415 | Thomas      | Winter   | m    | commercial    | 2011-05-03    |    3650 |
|         417 | Chloe       | Dubar    | f    | production    | 2011-09-05    |    2000 |
|         491 | Elodie      | Fellier  | f    | secretariat   | 2011-11-22    |    1700 |
|         509 | Fabrice     | Grand    | m    | comptabilite  | 2011-12-30    |    3000 |
|         547 | Melanie     | Collier  | f    | commercial    | 2012-01-08    |    3200 |
|         592 | Laura       | Blanchet | f    | direction     | 2012-05-09    |    4600 |
|         627 | Guillaume   | Miller   | m    | commercial    | 2012-07-02    |    2000 |
|         655 | Celine      | Perrin   | f    | commercial    | 2012-09-10    |    2800 |
|         699 | Julien      | Cottet   | m    | secretariat   | 2013-01-05    |    1490 |
|         701 | Mathieu     | Vignal   | m    | informatique  | 2013-04-03    |    2600 |
|         739 | Thierry     | Desprez  | m    | secretariat   | 2013-07-17    |    1600 |
|         780 | Amandine    | Thoyer   | f    | communication | 2014-01-23    |    2200 |
|         802 | Damien      | Durand   | m    | informatique  | 2014-07-05    |    2350 |
|         854 | Daniel      | Chevel   | m    | informatique  | 2015-09-28    |    3200 |
|         876 | Nathalie    | Martin   | f    | juridique     | 2016-01-12    |    3650 |
|         900 | Benoit      | Lagarde  | m    | production    | 2016-06-03    |    2650 |
|         933 | Emilie      | Sennard  | f    | commercial    | 2017-01-11    |    1900 |
|         990 | Stephanie   | Lafaye   | f    | assistant     | 2017-03-01    |    1875 |
+-------------+-------------+----------+------+---------------+---------------+---------+

-- 21 - Supprimer les employés du service secretariat.
DELETE FROM employes WHERE service = 'secretariat';
SELECT * FROM employes;
+-------------+-------------+----------+------+---------------+---------------+---------+
| id_employes | prenom      | nom      | sexe | service       | date_embauche | salaire |
+-------------+-------------+----------+------+---------------+---------------+---------+
|         350 | Jean-pierre | Laborde  | m    | direction     | 2010-12-09    |    5100 |
|         388 | Clement     | Gallet   | m    | commercial    | 2010-12-15    |    2400 |
|         415 | Thomas      | Winter   | m    | commercial    | 2011-05-03    |    3650 |
|         417 | Chloe       | Dubar    | f    | production    | 2011-09-05    |    2000 |
|         509 | Fabrice     | Grand    | m    | comptabilite  | 2011-12-30    |    3000 |
|         547 | Melanie     | Collier  | f    | commercial    | 2012-01-08    |    3200 |
|         592 | Laura       | Blanchet | f    | direction     | 2012-05-09    |    4600 |
|         627 | Guillaume   | Miller   | m    | commercial    | 2012-07-02    |    2000 |
|         655 | Celine      | Perrin   | f    | commercial    | 2012-09-10    |    2800 |
|         701 | Mathieu     | Vignal   | m    | informatique  | 2013-04-03    |    2600 |
|         780 | Amandine    | Thoyer   | f    | communication | 2014-01-23    |    2200 |
|         802 | Damien      | Durand   | m    | informatique  | 2014-07-05    |    2350 |
|         854 | Daniel      | Chevel   | m    | informatique  | 2015-09-28    |    3200 |
|         876 | Nathalie    | Martin   | f    | juridique     | 2016-01-12    |    3650 |
|         900 | Benoit      | Lagarde  | m    | production    | 2016-06-03    |    2650 |
|         933 | Emilie      | Sennard  | f    | commercial    | 2017-01-11    |    1900 |
|         990 | Stephanie   | Lafaye   | f    | assistant     | 2017-03-01    |    1875 |
+-------------+-------------+----------+------+---------------+---------------+---------+
