-- SELECT liste des colonnes séparées par une virgule 
-- FROM la table concernée 
-- WHERE la ou les conditions;
/*
SELECT ...
FROM ...
WHERE ...
AND ...
OR ...
GROUP BY ...
ORDER BY ...
LIMIT ...
*/
-- OUTILS DE BASE

    -- CREATION D'UNE BDD
        CREATE DATABASE nom_de_la_bdd;
        CREATE DATABASE entreprise;

    -- pour voir les bdd, les tables, les warnings
        SHOW DATABASES; 
        SHOW TABLES;
        SHOW WARNINGS,
    -- pour se positionner sur une bdd pour travailleer dessus :
        USE nom_de_la_bdd;
        USE entreprise;
    -- pour supprimer une bdd ou une table :
        DROP DATABASE nom_de_la_bdd;
        DROP TABLE nom_de_la_table;
    -- pour vider une table en gardant sa structure : 
        TRUNCATE nom_de_la_table;
    -- pour voir la structure d'une table :
        DESC nom_de_la_table

-- ouvrir la console MySQL puis copier-coller l'intégralité du fichier employes.sql


DESC employes
+---------------+---------------+------+-----+---------+----------------+
| Field         | Type          | Null | Key | Default | Extra          |
+---------------+---------------+------+-----+---------+----------------+
| id_employes   | int(3)        | NO   | PRI | NULL    | auto_increment |
| prenom        | varchar(20)   | YES  |     | NULL    |                |
| nom           | varchar(20)   | YES  |     | NULL    |                |
| sexe          | enum('m','f') | NO   |     | NULL    |                |
| service       | varchar(30)   | YES  |     | NULL    |                |
| date_embauche | date          | YES  |     | NULL    |                |
| salaire       | float         | YES  |     | NULL    |                |
+---------------+---------------+------+-----+---------+----------------+


-- 4 types de requetes : 1 question, 3 actions
    -- question
        -- SELECT pour récupérer des données

    -- action :
        -- INSERT INTO : pour créer une entrée dan sla bdd
        -- UPDATE : pour modifier une entrée
        -- DELETE : pour supprimer ue entrée dans la bdd

----------------------------------------------------------------------------------------------------------------------
-- REQUETES DE SELECTION 

    -- Affichage complet des données de la table employes en choisissant l'ordre de sortie des données
        SELECT id_employes, nom, prenom, sexe, service, date_embauche, salaire FROM employes; 
            +-------------+----------+-------------+------+---------------+---------------+---------+
            | id_employes | nom      | prenom      | sexe | service       | date_embauche | salaire |
            +-------------+----------+-------------+------+---------------+---------------+---------+
            |         350 | Laborde  | Jean-pierre | m    | direction     | 2010-12-09    |    5000 |
            |         388 | Gallet   | Clement     | m    | commercial    | 2010-12-15    |    2300 |
            |         415 | Winter   | Thomas      | m    | commercial    | 2011-05-03    |    3550 |
            |         417 | Dubar    | Chloe       | f    | production    | 2011-09-05    |    1900 |
            |         491 | Fellier  | Elodie      | f    | secretariat   | 2011-11-22    |    1600 |
            |         509 | Grand    | Fabrice     | m    | comptabilite  | 2011-12-30    |    2900 |
            |         547 | Collier  | Melanie     | f    | commercial    | 2012-01-08    |    3100 |
            |         592 | Blanchet | Laura       | f    | direction     | 2012-05-09    |    4500 |
            |         627 | Miller   | Guillaume   | m    | commercial    | 2012-07-02    |    1900 |
            |         655 | Perrin   | Celine      | f    | commercial    | 2012-09-10    |    2700 |
            |         699 | Cottet   | Julien      | m    | secretariat   | 2013-01-05    |    1390 |
            |         701 | Vignal   | Mathieu     | m    | informatique  | 2013-04-03    |    2500 |
            |         739 | Desprez  | Thierry     | m    | secretariat   | 2013-07-17    |    1500 |
            |         780 | Thoyer   | Amandine    | f    | communication | 2014-01-23    |    2100 |
            |         802 | Durand   | Damien      | m    | informatique  | 2014-07-05    |    2250 |
            |         854 | Chevel   | Daniel      | m    | informatique  | 2015-09-28    |    3100 |
            |         876 | Martin   | Nathalie    | f    | juridique     | 2016-01-12    |    3550 |
            |         900 | Lagarde  | Benoit      | m    | production    | 2016-06-03    |    2550 |
            |         933 | Sennard  | Emilie      | f    | commercial    | 2017-01-11    |    1800 |
            |         990 | Lafaye   | Stephanie   | f    | assistant     | 2017-03-01    |    1775 |
            +-------------+----------+-------------+------+---------------+---------------+---------+
    
    -- Affichage complet des données de la table employes avec un raccourcis (l'ordre de la colonnes sera le même que celui de la table) : *(ALL)
        SELECT * FROM employes;
            +-------------+-------------+----------+------+---------------+---------------+---------+
            | id_employes | prenom      | nom      | sexe | service       | date_embauche | salaire |
            +-------------+-------------+----------+------+---------------+---------------+---------+
            |         350 | Jean-pierre | Laborde  | m    | direction     | 2010-12-09    |    5000 |
            |         388 | Clement     | Gallet   | m    | commercial    | 2010-12-15    |    2300 |
            |         415 | Thomas      | Winter   | m    | commercial    | 2011-05-03    |    3550 |
            |         417 | Chloe       | Dubar    | f    | production    | 2011-09-05    |    1900 |
            |         491 | Elodie      | Fellier  | f    | secretariat   | 2011-11-22    |    1600 |
            |         509 | Fabrice     | Grand    | m    | comptabilite  | 2011-12-30    |    2900 |
            |         547 | Melanie     | Collier  | f    | commercial    | 2012-01-08    |    3100 |
            |         592 | Laura       | Blanchet | f    | direction     | 2012-05-09    |    4500 |
            |         627 | Guillaume   | Miller   | m    | commercial    | 2012-07-02    |    1900 |
            |         655 | Celine      | Perrin   | f    | commercial    | 2012-09-10    |    2700 |
            |         699 | Julien      | Cottet   | m    | secretariat   | 2013-01-05    |    1390 |
            |         701 | Mathieu     | Vignal   | m    | informatique  | 2013-04-03    |    2500 |
            |         739 | Thierry     | Desprez  | m    | secretariat   | 2013-07-17    |    1500 |
            |         780 | Amandine    | Thoyer   | f    | communication | 2014-01-23    |    2100 |
            |         802 | Damien      | Durand   | m    | informatique  | 2014-07-05    |    2250 |
            |         854 | Daniel      | Chevel   | m    | informatique  | 2015-09-28    |    3100 |
            |         876 | Nathalie    | Martin   | f    | juridique     | 2016-01-12    |    3550 |
            |         900 | Benoit      | Lagarde  | m    | production    | 2016-06-03    |    2550 |
            |         933 | Emilie      | Sennard  | f    | commercial    | 2017-01-11    |    1800 |
            |         990 | Stephanie   | Lafaye   | f    | assistant     | 2017-03-01    |    1775 |
            +-------------+-------------+----------+------+---------------+---------------+---------+
    
    -- Afficher les noms et prenoms de la table selectionnée
        SELECT nom,prenom FROM employes;
            +----------+-------------+
            | nom      | prenom      |
            +----------+-------------+
            | Laborde  | Jean-pierre |
            | Gallet   | Clement     |
            | Winter   | Thomas      |
            | Dubar    | Chloe       |
            | Fellier  | Elodie      |
            | Grand    | Fabrice     |
            | Collier  | Melanie     |
            | Blanchet | Laura       |
            | Miller   | Guillaume   |
            | Perrin   | Celine      |
            | Cottet   | Julien      |
            | Vignal   | Mathieu     |
            | Desprez  | Thierry     |
            | Thoyer   | Amandine    |
            | Durand   | Damien      |
            | Chevel   | Daniel      |
            | Martin   | Nathalie    |
            | Lagarde  | Benoit      |
            | Sennard  | Emilie      |
            | Lafaye   | Stephanie   |
            +----------+-------------+

    -- Afficher une seule colonne
         SELECT service FROM employes;
            +---------------+
            | service       |
            +---------------+
            | direction     |
            | commercial    |
            | commercial    |
            | production    |
            | secretariat   |
            | comptabilite  |
            | commercial    |
            | direction     |
            | commercial    |
            | commercial    |
            | secretariat   |
            | informatique  |
            | secretariat   |
            | communication |
            | informatique  |
            | informatique  |
            | juridique     |
            | production    |
            | commercial    |
            | assistant     |
            +---------------+
    
    -- Afficher les différents services : pour éviter les doublons DISTINCT
        SELECT DISTINCT service FROM employes;
            +---------------+
            | service       |
            +---------------+
            | direction     |
            | commercial    |
            | production    |
            | secretariat   |
            | comptabilite  |
            | informatique  |
            | communication |
            | juridique     |
            | assistant     |
            +---------------+
    -- CONDITION : WHERE
        -- affichage des employés du service informatique
            SELECT * FROM employes WHERE service = "informatique";
                +-------------+---------+--------+------+--------------+---------------+---------+
                | id_employes | prenom  | nom    | sexe | service      | date_embauche | salaire |
                +-------------+---------+--------+------+--------------+---------------+---------+
                |         701 | Mathieu | Vignal | m    | informatique | 2013-04-03    |    2500 |
                |         802 | Damien  | Durand | m    | informatique | 2014-07-05    |    2250 |
                |         854 | Daniel  | Chevel | m    | informatique | 2015-09-28    |    3100 |
                +-------------+---------+--------+------+--------------+---------------+---------+
        -- voir un élement d'une table correspondant à une ligne particulière, ex: je veux id de Clément
                SELECT id_employes FROM employes WHERE prenom LIKE "Clement";
                    +-------------+
                    | id_employes |
                    +-------------+
                    |         388 |
                    +-------------+
    
    -- entre deux valeurs : BETWEEN
        -- affichage des employés ayant été embauchés entre 01/01/2015 et aujourd'hui. ATTENTION le format des dates doit être obligatoirement au format ANGLAIS YYY-MM-DD
            SELECT * FROM employes WHERE date_embauche BETWEEN '2015-01-01' AND '2023-04-04';
            SELECT * FROM employes WHERE date_embauche BETWEEN '2015-01-01' AND CURDATE();
                +-------------+-----------+---------+------+--------------+---------------+---------+
                | id_employes | prenom    | nom     | sexe | service      | date_embauche | salaire |
                +-------------+-----------+---------+------+--------------+---------------+---------+
                |         854 | Daniel    | Chevel  | m    | informatique | 2015-09-28    |    3100 |
                |         876 | Nathalie  | Martin  | f    | juridique    | 2016-01-12    |    3550 |
                |         900 | Benoit    | Lagarde | m    | production   | 2016-06-03    |    2550 |
                |         933 | Emilie    | Sennard | f    | commercial   | 2017-01-11    |    1800 |
                |         990 | Stephanie | Lafaye  | f    | assistant    | 2017-03-01    |    1775 |
                +-------------+-----------+---------+------+--------------+---------------+---------+
            SELECT CURDATE(); --pour obtenir la date du jour
            SELECT NOW(); --pour obtenir date et heure
            SELECT CURTIME(); --pour obtenir l'heure actuelle
            SELECT TIME("date"); --pour obtenir l'heure d'une date précise
        -- Fonctionne aussi avec l'alphabet
            SELECT * FROM employes WHERE nom BETWEEN 'a' AND 'f';
                +-------------+---------+----------+------+--------------+---------------+---------+
                | id_employes | prenom  | nom      | sexe | service      | date_embauche | salaire |
                +-------------+---------+----------+------+--------------+---------------+---------+
                |         417 | Chloe   | Dubar    | f    | production   | 2011-09-05    |    1900 |
                |         547 | Melanie | Collier  | f    | commercial   | 2012-01-08    |    3100 |
                |         592 | Laura   | Blanchet | f    | direction    | 2012-05-09    |    4500 |
                |         699 | Julien  | Cottet   | m    | secretariat  | 2013-01-05    |    1390 |
                |         739 | Thierry | Desprez  | m    | secretariat  | 2013-07-17    |    1500 |
                |         802 | Damien  | Durand   | m    | informatique | 2014-07-05    |    2250 |
                |         854 | Daniel  | Chevel   | m    | informatique | 2015-09-28    |    3100 |
                +-------------+---------+----------+------+--------------+---------------+---------+
        
    -- Valeur approchante : LIKE. Permet de chercher une chaine dans une chaine. le pourcentage représente tout et n'importe quoi
        --Affichage des prénoms commençant par la lettre s
            SELECT * FROM employes WHERE prenom LIKE 's%';
                +-------------+-----------+--------+------+-----------+---------------+---------+
                | id_employes | prenom    | nom    | sexe | service   | date_embauche | salaire |
                +-------------+-----------+--------+------+-----------+---------------+---------+
                |         990 | Stephanie | Lafaye | f    | assistant | 2017-03-01    |    1775 |
                +-------------+-----------+--------+------+-----------+---------------+---------+

        -- les prénomes finissants par ie
            SELECT * FROM employes WHERE prenom LIKE '%ie';
                +-------------+-----------+---------+------+-------------+---------------+---------+
                | id_employes | prenom    | nom     | sexe | service     | date_embauche | salaire |
                +-------------+-----------+---------+------+-------------+---------------+---------+
                |         491 | Elodie    | Fellier | f    | secretariat | 2011-11-22    |    1600 |
                |         547 | Melanie   | Collier | f    | commercial  | 2012-01-08    |    3100 |
                |         876 | Nathalie  | Martin  | f    | juridique   | 2016-01-12    |    3550 |
                |         933 | Emilie    | Sennard | f    | commercial  | 2017-01-11    |    1800 |
                |         990 | Stephanie | Lafaye  | f    | assistant   | 2017-03-01    |    1775 |
                +-------------+-----------+---------+------+-------------+---------------+---------+
        
        -- les prénomes contenant ie
            SELECT * FROM employes WHERE prenom LIKE '%ie%';
                +-------------+-------------+---------+------+--------------+---------------+---------+
                | id_employes | prenom      | nom     | sexe | service      | date_embauche | salaire |
                +-------------+-------------+---------+------+--------------+---------------+---------+
                |         350 | Jean-pierre | Laborde | m    | direction    | 2010-12-09    |    5000 |
                |         491 | Elodie      | Fellier | f    | secretariat  | 2011-11-22    |    1600 |
                |         547 | Melanie     | Collier | f    | commercial   | 2012-01-08    |    3100 |
                |         699 | Julien      | Cottet  | m    | secretariat  | 2013-01-05    |    1390 |
                |         701 | Mathieu     | Vignal  | m    | informatique | 2013-04-03    |    2500 |
                |         739 | Thierry     | Desprez | m    | secretariat  | 2013-07-17    |    1500 |
                |         802 | Damien      | Durand  | m    | informatique | 2014-07-05    |    2250 |
                |         854 | Daniel      | Chevel  | m    | informatique | 2015-09-28    |    3100 |
                |         876 | Nathalie    | Martin  | f    | juridique    | 2016-01-12    |    3550 |
                |         933 | Emilie      | Sennard | f    | commercial   | 2017-01-11    |    1800 |
                |         990 | Stephanie   | Lafaye  | f    | assistant    | 2017-03-01    |    1775 |
                +-------------+-------------+---------+------+--------------+---------------+---------+
-- exemple
/*

id    type      cp
--------------------
23    appart    75010
54    appart    13002
74    appart    13003
78    maison    75020
79    maison    75008
105   appart    75011
112   appart    75001

SELECT * FROM table WHERE cp = 75; -- 0 résultat
SELECT * FROM table WHERE cp LIKE '75%'; -- 5 résultats

*/
    -- Opérateurs de comparaison 
    /*
        =   est égal à 
        !=  est différent de
        <>  est différent de
        >   strictement supérieur
        <   strictement inférieur
        >=  supérieur ou égal
        <=  inférieur ou égal
    */
        -- Affichage des employés sauf ceux du service commerciale
            SELECT * FROM employes WHERE service != 'commercial';
            SELECT * FROM employes WHERE service <> 'commercial';
            +-------------+-------------+----------+------+---------------+---------------+---------+
            | id_employes | prenom      | nom      | sexe | service       | date_embauche | salaire |
            +-------------+-------------+----------+------+---------------+---------------+---------+
            |         350 | Jean-pierre | Laborde  | m    | direction     | 2010-12-09    |    5000 |
            |         417 | Chloe       | Dubar    | f    | production    | 2011-09-05    |    1900 |
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
            |         900 | Benoit      | Lagarde  | m    | production    | 2016-06-03    |    2550 |
            |         990 | Stephanie   | Lafaye   | f    | assistant     | 2017-03-01    |    1775 |
            +-------------+-------------+----------+------+---------------+---------------+---------+

        -- affichage des employés ayant un salaire supérieur à 3000
            SELECT * FROM employes WHERE salaire > 3000;
            SELECT * FROM employes WHERE salaire >'3000';
                +-------------+-------------+----------+------+--------------+---------------+---------+
                | id_employes | prenom      | nom      | sexe | service      | date_embauche | salaire |
                +-------------+-------------+----------+------+--------------+---------------+---------+
                |         350 | Jean-pierre | Laborde  | m    | direction    | 2010-12-09    |    5000 |
                |         415 | Thomas      | Winter   | m    | commercial   | 2011-05-03    |    3550 |
                |         547 | Melanie     | Collier  | f    | commercial   | 2012-01-08    |    3100 |
                |         592 | Laura       | Blanchet | f    | direction    | 2012-05-09    |    4500 |
                |         854 | Daniel      | Chevel   | m    | informatique | 2015-09-28    |    3100 |
                |         876 | Nathalie    | Martin   | f    | juridique    | 2016-01-12    |    3550 |
                +-------------+-------------+----------+------+--------------+---------------+---------+

    --Pour ordonner les résultats : ORDER BY
        -- ASC : ascendant 
        -- DESC : descendant
            --Affichage des employés par ordre alphabetique
                SELECT nom, prenom, service FROM employes ORDER BY nom ASC;
                SELECT nom, prenom, service FROM employes ORDER BY nom;
                    +----------+-------------+---------------+
                    | nom      | prenom      | service       |
                    +----------+-------------+---------------+
                    | Blanchet | Laura       | direction     |
                    | Chevel   | Daniel      | informatique  |
                    | Collier  | Melanie     | commercial    |
                    | Cottet   | Julien      | secretariat   |
                    | Desprez  | Thierry     | secretariat   |
                    | Dubar    | Chloe       | production    |
                    | Durand   | Damien      | informatique  |
                    | Fellier  | Elodie      | secretariat   |
                    | Gallet   | Clement     | commercial    |
                    | Grand    | Fabrice     | comptabilite  |
                    | Laborde  | Jean-pierre | direction     |
                    | Lafaye   | Stephanie   | assistant     |
                    | Lagarde  | Benoit      | production    |
                    | Martin   | Nathalie    | juridique     |
                    | Miller   | Guillaume   | commercial    |
                    | Perrin   | Celine      | commercial    |
                    | Sennard  | Emilie      | commercial    |
                    | Thoyer   | Amandine    | communication |
                    | Vignal   | Mathieu     | informatique  |
                    | Winter   | Thomas      | commercial    |
                    +----------+-------------+---------------+
                SELECT nom, prenom, service FROM employes ORDER BY nom DESC;
        -- Affichage du salaire du plus grand au plus petit
            SELECT salaire, nom, prenom FROM employes ORDER BY salaire DESC;
                +---------+----------+-------------+
                | salaire | nom      | prenom      |
                +---------+----------+-------------+
                |    5000 | Laborde  | Jean-pierre |
                |    4500 | Blanchet | Laura       |
                |    3550 | Winter   | Thomas      |
                |    3550 | Martin   | Nathalie    |
                |    3100 | Collier  | Melanie     |
                |    3100 | Chevel   | Daniel      |
                |    2900 | Grand    | Fabrice     |
                |    2700 | Perrin   | Celine      |
                |    2550 | Lagarde  | Benoit      |
                |    2500 | Vignal   | Mathieu     |
                |    2300 | Gallet   | Clement     |
                |    2250 | Durand   | Damien      |
                |    2100 | Thoyer   | Amandine    |
                |    1900 | Dubar    | Chloe       |
                |    1900 | Miller   | Guillaume   |
                |    1800 | Sennard  | Emilie      |
                |    1775 | Lafaye   | Stephanie   |
                |    1600 | Fellier  | Elodie      |
                |    1500 | Desprez  | Thierry     |
                |    1390 | Cottet   | Julien      |
                +---------+----------+-------------+
        -- il est possible d'ordonner sur plusieurs colonnes (si la colonne prioritaire a polusieurs fois la même valeur)
            SELECT salaire, nom, prenom FROM employes ORDER BY salaire DESC, nom;
            SELECT salaire, nom, prenom FROM employes ORDER BY salaire DESC, nom ASC;
                +---------+----------+-------------+
                | salaire | nom      | prenom      |
                +---------+----------+-------------+
                |    5000 | Laborde  | Jean-pierre |
                |    4500 | Blanchet | Laura       |
                |    3550 | Martin   | Nathalie    |
                |    3550 | Winter   | Thomas      |
                |    3100 | Chevel   | Daniel      |
                |    3100 | Collier  | Melanie     |
                |    2900 | Grand    | Fabrice     |
                |    2700 | Perrin   | Celine      |
                |    2550 | Lagarde  | Benoit      |
                |    2500 | Vignal   | Mathieu     |
                |    2300 | Gallet   | Clement     |
                |    2250 | Durand   | Damien      |
                |    2100 | Thoyer   | Amandine    |
                |    1900 | Dubar    | Chloe       |
                |    1900 | Miller   | Guillaume   |
                |    1800 | Sennard  | Emilie      |
                |    1775 | Lafaye   | Stephanie   |
                |    1600 | Fellier  | Elodie      |
                |    1500 | Desprez  | Thierry     |
                |    1390 | Cottet   | Julien      |
                +---------+----------+-------------+
        -- pour limiter le nombre de résultat (pagination)
            -- un seul chiffre après le LIMIT = le nombre de lignes à récuperer en partant du début de la table
                 SELECT * FROM employes LIMIT 2;
                    +-------------+-------------+---------+------+------------+---------------+---------+
                    | id_employes | prenom      | nom     | sexe | service    | date_embauche | salaire |
                    +-------------+-------------+---------+------+------------+---------------+---------+
                    |         350 | Jean-pierre | Laborde | m    | direction  | 2010-12-09    |    5000 |
                    |         388 | Clement     | Gallet  | m    | commercial | 2010-12-15    |    2300 |
                    +-------------+-------------+---------+------+------------+---------------+---------+
            -- deux chiffres = la position de départ (rappel : début d'une table à 0) et le nombre de lignes
                -- affichage des employés 3 par 3
                    SELECT * FROM employes LIMIT 0, 3;
                        +-------------+-------------+---------+------+------------+---------------+---------+
                        | id_employes | prenom      | nom     | sexe | service    | date_embauche | salaire |
                        +-------------+-------------+---------+------+------------+---------------+---------+
                        |         350 | Jean-pierre | Laborde | m    | direction  | 2010-12-09    |    5000 |
                        |         388 | Clement     | Gallet  | m    | commercial | 2010-12-15    |    2300 |
                        |         415 | Thomas      | Winter  | m    | commercial | 2011-05-03    |    3550 |
                        +-------------+-------------+---------+------+------------+---------------+---------+
                    SELECT * FROM employes LIMIT 3, 3;
                        +-------------+---------+---------+------+--------------+---------------+---------+
                         id_employes | prenom  | nom     | sexe | service      | date_embauche | salaire |
                        -------------+---------+---------+------+--------------+---------------+---------+
                                 417 | Chloe   | Dubar   | f    | production   | 2011-09-05    |    1900 |
                                 491 | Elodie  | Fellier | f    | secretariat  | 2011-11-22    |    1600 |
                                 509 | Fabrice | Grand   | m    | comptabilite | 2011-12-30    |    2900 |
                        -------------+---------+---------+------+--------------+---------------+---------+
                    SELECT * FROM employes LIMIT 6, 3;
                        +-------------+-----------+----------+------+------------+---------------+---------+
                        | id_employes | prenom    | nom      | sexe | service    | date_embauche | salaire |
                        +-------------+-----------+----------+------+------------+---------------+---------+
                        |         547 | Melanie   | Collier  | f    | commercial | 2012-01-08    |    3100 |
                        |         592 | Laura     | Blanchet | f    | direction  | 2012-05-09    |    4500 |
                        |         627 | Guillaume | Miller   | m    | commercial | 2012-07-02    |    1900 |
                        +-------------+-----------+----------+------+------------+---------------+---------+
    
    
    -- IL est possible de faire des calculs 
        -- calcul salaire annuel 
            SELECT nom,prenom, service, (salaire *12) AS 'Salaire annuel' FROM employes;
            SELECT nom,prenom, service, (salaire *12) AS salaire_annuel FROM employes;
                +----------+-------------+---------------+----------------+
                | nom      | prenom      | service       | Salaire annuel |
                +----------+-------------+---------------+----------------+
                | Laborde  | Jean-pierre | direction     |          60000 |
                | Gallet   | Clement     | commercial    |          27600 |
                | Winter   | Thomas      | commercial    |          42600 |
                | Dubar    | Chloe       | production    |          22800 |
                | Fellier  | Elodie      | secretariat   |          19200 |
                | Grand    | Fabrice     | comptabilite  |          34800 |
                | Collier  | Melanie     | commercial    |          37200 |
                | Blanchet | Laura       | direction     |          54000 |
                | Miller   | Guillaume   | commercial    |          22800 |
                | Perrin   | Celine      | commercial    |          32400 |
                | Cottet   | Julien      | secretariat   |          16680 |
                | Vignal   | Mathieu     | informatique  |          30000 |
                | Desprez  | Thierry     | secretariat   |          18000 |
                | Thoyer   | Amandine    | communication |          25200 |
                | Durand   | Damien      | informatique  |          27000 |
                | Chevel   | Daniel      | informatique  |          37200 |
                | Martin   | Nathalie    | juridique     |          42600 |
                | Lagarde  | Benoit      | production    |          30600 |
                | Sennard  | Emilie      | commercial    |          21600 |
                | Lafaye   | Stephanie   | assistant     |          21300 |
                +----------+-------------+---------------+----------------+
    
    --Quelques fonctions prédéfinies :
        -- fonctions d'aggrégation (qui nous renvoie qu'une seule ligne de résultat)
            --la somme : SUM()
                -- Affichage de la lasse salariale annuelle de l'entreprise
                    SELECT SUM(salaire*12) AS masse_salairale FROM employes;
                    +-----------------+
                    | masse_salairale |
                    +-----------------+
                    |          623580 |
                    +-----------------+
            --la moyenne : AVG()
                -- le salais moyen de l'entreprise 
                    SELECT AVG(salaire) AS salaire_moyen FROM employes;
                        +---------------+
                        | salaire_moyen |
                        +---------------+
                        |       2598.25 |
                        +---------------+
            -- pour arrondir : ROUND() mais ce n'est pas une fonction d'agrégation
                --ROUND(valeur) 
                    SELECT ROUND(AVG(salaire)) AS salaire_moyen FROM employes;
                        +---------------+
                        | salaire_moyen |
                        +---------------+
                        |          2598 |
                        +---------------+
                --ROUND(valeur, nombre de décimales accepté) 
                    SELECT ROUND(AVG(salaire), 1) AS salaire_moyen FROM employes;
                        +---------------+
                        | salaire_moyen |
                        +---------------+
                        |        2598.2 |
                        +---------------+
                -- nombre de lignes  : COUNT(). Dans les parenthèses de COUNT() on peut mettre soit étoile, soit une colonne. Si on met une colonne, COUNT() va compter le nombre de ligne sauf lorsqu'il tombe sur la valeur NULL. Si on veut être sûr de compter toutes les lignes : on met *
                    -- Combien d'employés
                        SELECT COUNT(*) AS combien FROM employes;
                            +---------+
                            | combien |
                            +---------+
                            |      20 |
                            +---------+
                    -- Combien de femmes dans l'entreprise
                        SELECT COUNT(id_employes) AS combien FROM employes WHERE sexe="f";
                            +---------+
                            | combien |
                            +---------+
                            |       9 |
                            +---------+
            --MIN() MAX ()
                --Afficher le salaire le plus petit salaire de la table
                    SELECT MIN(salaire) AS salaire_le_plus_bas FROM employes; 
                --Afficher le prénom et le salaire de l'employé ayant le plus petit salaire de la table
                    SELECT prénom, MIN(salaire) AS salaire_le_plus_bas FROM employes; --FAUX 
                    --requête imbriquée
                        SELECT prenom, salaire FROM employes WHERE salaire = (SELECT MIN(salaire) FROM employes);
                            +--------+---------+
                            | prenom | salaire |
                            +--------+---------+
                            | Julien |    1390 |
                            +--------+---------+
                    -- avec ORDER BY
                        SELECT * FROM employes ORDER BY salaire ASC LIMIT 1;
                        SELECT * FROM employes ORDER BY salaire ASC LIMIT 0, 1;
                            +-------------+--------+--------+------+-------------+---------------+---------+
                            | id_employes | prenom | nom    | sexe | service     | date_embauche | salaire |
                            +-------------+--------+--------+------+-------------+---------------+---------+
                            |         699 | Julien | Cottet | m    | secretariat | 2013-01-05    |    1390 |
                            +-------------+--------+--------+------+-------------+---------------+---------+
            
            -- IN () : pour inclure plusieurs valeurs 
            -- NOT IN () : pour exclure plusieurs valeurs
                -- afficher les employés des services informatiques et commercial
                    SELECT * FROM employes WHERE service IN ('commercial', 'informatique') ORDER BY service;
                        +-------------+-----------+---------+------+--------------+---------------+---------+
                        | id_employes | prenom    | nom     | sexe | service      | date_embauche | salaire |
                        +-------------+-----------+---------+------+--------------+---------------+---------+
                        |         388 | Clement   | Gallet  | m    | commercial   | 2010-12-15    |    2300 |
                        |         415 | Thomas    | Winter  | m    | commercial   | 2011-05-03    |    3550 |
                        |         547 | Melanie   | Collier | f    | commercial   | 2012-01-08    |    3100 |
                        |         627 | Guillaume | Miller  | m    | commercial   | 2012-07-02    |    1900 |
                        |         655 | Celine    | Perrin  | f    | commercial   | 2012-09-10    |    2700 |
                        |         933 | Emilie    | Sennard | f    | commercial   | 2017-01-11    |    1800 |
                        |         701 | Mathieu   | Vignal  | m    | informatique | 2013-04-03    |    2500 |
                        |         802 | Damien    | Durand  | m    | informatique | 2014-07-05    |    2250 |
                        |         854 | Daniel    | Chevel  | m    | informatique | 2015-09-28    |    3100 |
                        +-------------+-----------+---------+------+--------------+---------------+---------+
                    SELECT * FROM employes WHERE service NOT IN ('commercial', 'informatique') ORDER BY service;
                        +-------------+-------------+----------+------+---------------+---------------+---------+
                        | id_employes | prenom      | nom      | sexe | service       | date_embauche | salaire |
                        +-------------+-------------+----------+------+---------------+---------------+---------+
                        |         990 | Stephanie   | Lafaye   | f    | assistant     | 2017-03-01    |    1775 |
                        |         780 | Amandine    | Thoyer   | f    | communication | 2014-01-23    |    2100 |
                        |         509 | Fabrice     | Grand    | m    | comptabilite  | 2011-12-30    |    2900 |
                        |         350 | Jean-pierre | Laborde  | m    | direction     | 2010-12-09    |    5000 |
                        |         592 | Laura       | Blanchet | f    | direction     | 2012-05-09    |    4500 |
                        |         876 | Nathalie    | Martin   | f    | juridique     | 2016-01-12    |    3550 |
                        |         417 | Chloe       | Dubar    | f    | production    | 2011-09-05    |    1900 |
                        |         900 | Benoit      | Lagarde  | m    | production    | 2016-06-03    |    2550 |
                        |         491 | Elodie      | Fellier  | f    | secretariat   | 2011-11-22    |    1600 |
                        |         699 | Julien      | Cottet   | m    | secretariat   | 2013-01-05    |    1390 |
                        |         739 | Thierry     | Desprez  | m    | secretariat   | 2013-07-17    |    1500 |
                        +-------------+-------------+----------+------+---------------+---------------+---------+
            -- plusieurs conditions obligatoires : AND
                -- affichage des commerciaux ayant un salaire supérieur à 2000
                    SELECT * FROM employes WHERE service = 'commercial' AND salaire > 2000;
                        +-------------+---------+---------+------+------------+---------------+---------+
                        | id_employes | prenom  | nom     | sexe | service    | date_embauche | salaire |
                        +-------------+---------+---------+------+------------+---------------+---------+
                        |         388 | Clement | Gallet  | m    | commercial | 2010-12-15    |    2300 |
                        |         415 | Thomas  | Winter  | m    | commercial | 2011-05-03    |    3550 |
                        |         547 | Melanie | Collier | f    | commercial | 2012-01-08    |    3100 |
                        |         655 | Celine  | Perrin  | f    | commercial | 2012-09-10    |    2700 |
                        +-------------+---------+---------+------+------------+---------------+---------+
            --l'une ou l'autre d'un ensemble de condition : OR (attention à l'ordre de priorité)
                -- afficher les employés du service production ayant un salaire de 1900 ou 2300
                    SELECT * FROM employes WHERE service = 'production' AND (salaire = 1900 OR salaire = 2300);
                    SELECT * FROM employes WHERE service = 'production' AND salaire IN (1900,2300);
                        +-------------+--------+-------+------+------------+---------------+---------+
                        | id_employes | prenom | nom   | sexe | service    | date_embauche | salaire |
                        +-------------+--------+-------+------+------------+---------------+---------+
                        |         417 | Chloe  | Dubar | f    | production | 2011-09-05    |    1900 |
                        +-------------+--------+-------+------+------------+---------------+---------+
        -- lorsque nous utilisons des fonctions nous renvoyant un résultat unique (COUNT SUM AVG MIN MAX), il n'est pas possibe d'appler un autre champ sauf en utilisant GROUP BY. 
            --GROUP BY va permettre de regrouper les calculs selon les sous groupes. au lieu de faire le calcul sur toutes les lignes tables on va le regrouper selon un ou des colonnes
            -- affichage des employés par service 
                SELECT service, COUNT(*) AS nombre FROM employes GROUP BY service;
                +---------------+--------+
                | service       | nombre |
                +---------------+--------+
                | assistant     |      1 |
                | commercial    |      6 |
                | communication |      1 |
                | comptabilite  |      1 |
                | direction     |      2 |
                | informatique  |      3 |
                | juridique     |      1 |
                | production    |      2 |
                | secretariat   |      3 |
                +---------------+--------+
            -- pour mettre une condition sur un groupe by : HAVING 
                -- affichage des employés par service uniquement s'il y en a plus de deux
                    SELECT service, COUNT(*) AS nombre FROM employes GROUP BY service HAVING COUNT(*)>2;
                    SELECT service, COUNT(*) AS nombre FROM employes GROUP BY service HAVING nombre >2;
                        +--------------+--------+
                        | service      | nombre |
                        +--------------+--------+
                        | commercial   |      6 |
                        | informatique |      3 |
                        | secretariat  |      3 |
                        +--------------+--------+


----------------------------------------------------------------------------------------------------------------------
-- REQUETE D'ENREGISTREMENT : INSERT INTO
-- on commence par lister les colonnes avant d'en donner les valeurs

    INSERT INTO employes (id_employes, prenom, nom, sexe, service, date_embauche, salaire) VALUES 
        (991, 'Brenda', 'Seck', 'f', 'Web', CURDATE(), 3000);
    SELECT * FROM employes;
    -- id_employes est la clef primaire en auto increment, pas besoin de lui donner ue valeur, c'est géré par la BDD. Soit on ne l'appel pas, soit on lui donne la valeur NULL
    INSERT INTO employes (prenom, nom, sexe, service, date_embauche, salaire) VALUES 
        ('Brenda', 'Seck', 'f', 'Web', CURDATE(), 3000);
    SELECT * FROM employes;
        +-------------+-------------+----------+------+---------------+---------------+---------+
        | id_employes | prenom      | nom      | sexe | service       | date_embauche | salaire |
        +-------------+-------------+----------+------+---------------+---------------+---------+
        |         350 | Jean-pierre | Laborde  | m    | direction     | 2010-12-09    |    5000 |
        |         388 | Clement     | Gallet   | m    | commercial    | 2010-12-15    |    2300 |
        |         415 | Thomas      | Winter   | m    | commercial    | 2011-05-03    |    3550 |
        |         417 | Chloe       | Dubar    | f    | production    | 2011-09-05    |    1900 |
        |         491 | Elodie      | Fellier  | f    | secretariat   | 2011-11-22    |    1600 |
        |         509 | Fabrice     | Grand    | m    | comptabilite  | 2011-12-30    |    2900 |
        |         547 | Melanie     | Collier  | f    | commercial    | 2012-01-08    |    3100 |
        |         592 | Laura       | Blanchet | f    | direction     | 2012-05-09    |    4500 |
        |         627 | Guillaume   | Miller   | m    | commercial    | 2012-07-02    |    1900 |
        |         655 | Celine      | Perrin   | f    | commercial    | 2012-09-10    |    2700 |
        |         699 | Julien      | Cottet   | m    | secretariat   | 2013-01-05    |    1390 |
        |         701 | Mathieu     | Vignal   | m    | informatique  | 2013-04-03    |    2500 |
        |         739 | Thierry     | Desprez  | m    | secretariat   | 2013-07-17    |    1500 |
        |         780 | Amandine    | Thoyer   | f    | communication | 2014-01-23    |    2100 |
        |         802 | Damien      | Durand   | m    | informatique  | 2014-07-05    |    2250 |
        |         854 | Daniel      | Chevel   | m    | informatique  | 2015-09-28    |    3100 |
        |         876 | Nathalie    | Martin   | f    | juridique     | 2016-01-12    |    3550 |
        |         900 | Benoit      | Lagarde  | m    | production    | 2016-06-03    |    2550 |
        |         933 | Emilie      | Sennard  | f    | commercial    | 2017-01-11    |    1800 |
        |         990 | Stephanie   | Lafaye   | f    | assistant     | 2017-03-01    |    1775 |
        |         991 | Brenda      | Seck     | f    | Web           | 2023-04-04    |    5000 |
        |         992 | Brenda      | Seck     | f    | Web           | 2023-04-04    |    3000 |
        |         993 | Brenda      | Seck     | f    | Web           | 2023-04-04    |    3000 |
        +-------------+-------------+----------+------+---------------+---------------+---------+
    -- il est possible de ne pas préciser les champs de la table mais il est dans ce cas nécessaire de donner autant de valeru qu'il y a de colonne et dans le même ordre que la structure de la table
    INSERT INTO employes VALUES (NULL,'Brenda', 'Seck', 'f', 'Web', CURDATE(), 3000);
        +-------------+-------------+----------+------+---------------+---------------+---------+
        | id_employes | prenom      | nom      | sexe | service       | date_embauche | salaire |
        +-------------+-------------+----------+------+---------------+---------------+---------+
        |         350 | Jean-pierre | Laborde  | m    | direction     | 2010-12-09    |    5000 |
        |         388 | Clement     | Gallet   | m    | commercial    | 2010-12-15    |    2300 |
        |         415 | Thomas      | Winter   | m    | commercial    | 2011-05-03    |    3550 |
        |         417 | Chloe       | Dubar    | f    | production    | 2011-09-05    |    1900 |
        |         491 | Elodie      | Fellier  | f    | secretariat   | 2011-11-22    |    1600 |
        |         509 | Fabrice     | Grand    | m    | comptabilite  | 2011-12-30    |    2900 |
        |         547 | Melanie     | Collier  | f    | commercial    | 2012-01-08    |    3100 |
        |         592 | Laura       | Blanchet | f    | direction     | 2012-05-09    |    4500 |
        |         627 | Guillaume   | Miller   | m    | commercial    | 2012-07-02    |    1900 |
        |         655 | Celine      | Perrin   | f    | commercial    | 2012-09-10    |    2700 |
        |         699 | Julien      | Cottet   | m    | secretariat   | 2013-01-05    |    1390 |
        |         701 | Mathieu     | Vignal   | m    | informatique  | 2013-04-03    |    2500 |
        |         739 | Thierry     | Desprez  | m    | secretariat   | 2013-07-17    |    1500 |
        |         780 | Amandine    | Thoyer   | f    | communication | 2014-01-23    |    2100 |
        |         802 | Damien      | Durand   | m    | informatique  | 2014-07-05    |    2250 |
        |         854 | Daniel      | Chevel   | m    | informatique  | 2015-09-28    |    3100 |
        |         876 | Nathalie    | Martin   | f    | juridique     | 2016-01-12    |    3550 |
        |         900 | Benoit      | Lagarde  | m    | production    | 2016-06-03    |    2550 |
        |         933 | Emilie      | Sennard  | f    | commercial    | 2017-01-11    |    1800 |
        |         990 | Stephanie   | Lafaye   | f    | assistant     | 2017-03-01    |    1775 |
        |         991 | Brenda      | Seck     | f    | developpeur   | 2023-04-04    |    4000 |
        |         992 | Brenda      | Seck     | f    | developpeur   | 2023-04-04    |    4000 |
        |         993 | Brenda      | Seck     | f    | developpeur   | 2023-04-04    |    4000 |
        +-------------+-------------+----------+------+---------------+---------------+---------+

----------------------------------------------------------------------------------------------------------------------
-- REQUETE DE MODIFICATION : UPDATE

UPDATE employes SET salaire = 5000 WHERE id_employes = 991;
SELECT * FROM employes;

UPDATE employes SET salaire = 4000, service = 'developpeur' WHERE service = 'web';
SELECT * FROM employes;

----------------------------------------------------------------------------------------------------------------------
-- REQUETE DE SUPPRESSION : DELETE

DELETE FROM employes -- ne pas exécuter cette requete : elle va supprimer toutes les données de la table // TRUNCATE car garde la structure de la table

DELETE FROM employes WHERE id_employes > 990;
SELECT * FROM employes;

--  TABLE AVEC ID POUR LES SERVICES, SEXE