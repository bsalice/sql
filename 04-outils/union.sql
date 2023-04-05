-- UNION permet de fusionner deux requetes en une seule. Pour qu'elle puisse fonctionner, les deux requetes doient avoir le même nombre de colonnes dans le SELECT

-- Affichage des abonnés et des auteurs (liste des personne physiques)

USE bibliotheque;

SELECT UPPER(prenom) AS liste FROM abonne
UNION
SELECT auteur FROM livre; 

+-------------------+
| liste             |
+-------------------+
| GUILLAUME         |
| BENOIT            |
| CHLOE             |
| LAURA             |
| BRENDA            |
| CELINE            |
| GUY DE MAUPASSANT |
| HONORE DE BALZAC  |
| ALPHONSE DAUDET   |
| ALEXANDRE DUMAS   |
+-------------------+

-- UNION applique un DISTINC par defaut : il n'affiche pas deux éléments similaires. Pour avoir toutes les données, même les doublons : UNION ALL

SELECT UPPER(prenom) AS liste FROM abonne
UNION ALL
SELECT auteur FROM livre;

+-------------------+
| liste             |
+-------------------+
| GUILLAUME         |
| BENOIT            |
| CHLOE             |
| LAURA             |
| BRENDA            |
| CELINE            |
| GUY DE MAUPASSANT |
| GUY DE MAUPASSANT |
| HONORE DE BALZAC  |
| ALPHONSE DAUDET   |
| ALEXANDRE DUMAS   |
| ALEXANDRE DUMAS   |
+-------------------+

--Afficher tous les abonnés sans exceptions, tous les livres et les relations liées à la table emprunt 

SELECT prenom, auteur, titre, date_sortie, date_rendu
FROM abonne
LEFT JOIN emprunt USING(id_abonne)
LEFT JOIN livre USING(id_livre);

+-----------+-------------------+-------------------------+-------------+------------+
| prenom    | auteur            | titre                   | date_sortie | date_rendu |
+-----------+-------------------+-------------------------+-------------+------------+
| Guillaume | GUY DE MAUPASSANT | Une vie                 | 2016-12-07  | 2016-12-11 |
| Benoit    | GUY DE MAUPASSANT | Bel-Ami                 | 2016-12-07  | 2016-12-18 |
| Chloe     | GUY DE MAUPASSANT | Une vie                 | 2016-12-11  | 2016-12-19 |
| Laura     | ALPHONSE DAUDET   | Le Petit chose          | 2016-12-12  | 2016-12-22 |
| Guillaume | ALEXANDRE DUMAS   | La Reine Margot         | 2016-12-15  | 2016-12-30 |
| Benoit    | ALEXANDRE DUMAS   | Les Trois Mousquetaires | 2017-01-02  | 2017-01-15 |
| Chloe     | ALEXANDRE DUMAS   | Les Trois Mousquetaires | 2017-02-15  | NULL       |
| Benoit    | GUY DE MAUPASSANT | Une vie                 | 2017-02-20  | NULL       |
| Brenda    | NULL              | NULL                    | NULL        | NULL       |
| Celine    | NULL              | NULL                    | NULL        | NULL       |
+-----------+-------------------+-------------------------+-------------+------------+


SELECT prenom, auteur, titre, date_sortie, date_rendu
FROM abonne
RIGHT JOIN emprunt USING(id_abonne)
RIGHT JOIN livre USING(id_livre);

+-----------+-------------------+-------------------------+-------------+------------+
| prenom    | auteur            | titre                   | date_sortie | date_rendu |
+-----------+-------------------+-------------------------+-------------+------------+
| Guillaume | GUY DE MAUPASSANT | Une vie                 | 2016-12-07  | 2016-12-11 |
| Chloe     | GUY DE MAUPASSANT | Une vie                 | 2016-12-11  | 2016-12-19 |
| Benoit    | GUY DE MAUPASSANT | Une vie                 | 2017-02-20  | NULL       |
| Benoit    | GUY DE MAUPASSANT | Bel-Ami                 | 2016-12-07  | 2016-12-18 |
| NULL      | HONORE DE BALZAC  | Le père Goriot          | NULL        | NULL       |
| Laura     | ALPHONSE DAUDET   | Le Petit chose          | 2016-12-12  | 2016-12-22 |
| Guillaume | ALEXANDRE DUMAS   | La Reine Margot         | 2016-12-15  | 2016-12-30 |
| Benoit    | ALEXANDRE DUMAS   | Les Trois Mousquetaires | 2017-01-02  | 2017-01-15 |
| Chloe     | ALEXANDRE DUMAS   | Les Trois Mousquetaires | 2017-02-15  | NULL       |
+-----------+-------------------+-------------------------+-------------+------------+

SELECT prenom, auteur, titre, date_sortie, date_rendu
FROM abonne
LEFT JOIN emprunt USING(id_abonne)
LEFT JOIN livre USING(id_livre)
UNION
SELECT prenom, auteur, titre, date_sortie, date_rendu
FROM abonne
RIGHT JOIN emprunt USING(id_abonne)
RIGHT JOIN livre USING(id_livre);

+-----------+-------------------+-------------------------+-------------+------------+
| prenom    | auteur            | titre                   | date_sortie | date_rendu |
+-----------+-------------------+-------------------------+-------------+------------+
| Guillaume | GUY DE MAUPASSANT | Une vie                 | 2016-12-07  | 2016-12-11 |
| Benoit    | GUY DE MAUPASSANT | Bel-Ami                 | 2016-12-07  | 2016-12-18 |
| Chloe     | GUY DE MAUPASSANT | Une vie                 | 2016-12-11  | 2016-12-19 |
| Laura     | ALPHONSE DAUDET   | Le Petit chose          | 2016-12-12  | 2016-12-22 |
| Guillaume | ALEXANDRE DUMAS   | La Reine Margot         | 2016-12-15  | 2016-12-30 |
| Benoit    | ALEXANDRE DUMAS   | Les Trois Mousquetaires | 2017-01-02  | 2017-01-15 |
| Chloe     | ALEXANDRE DUMAS   | Les Trois Mousquetaires | 2017-02-15  | NULL       |
| Benoit    | GUY DE MAUPASSANT | Une vie                 | 2017-02-20  | NULL       |
| Brenda    | NULL              | NULL                    | NULL        | NULL       |
| Celine    | NULL              | NULL                    | NULL        | NULL       |
| NULL      | HONORE DE BALZAC  | Le père Goriot          | NULL        | NULL       |
+-----------+-------------------+-------------------------+-------------+------------+