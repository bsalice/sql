-- copier coller l'intégralité du contenu de la biblotheque.sql dans la console

-- la valeur NULL se test avce is NULL ou IS NOT NULL (on ne peut pas utiliser l'égalité = pour tester NULL)

-- Quels sont les n° (id_livre) des livres qui n'ont pas été rendus
SELECT id_livre FROM emprunt WHERE date_rendu IS NULL;
+----------+
| id_livre |
+----------+
|      105 |
|      100 |
+----------+

----------------------------------------------------------------------------------------------------------------------
--REQUETE IMBRIQUEE SUR PLUSIEURS TABLES 

    --QUELS SONT LES LIVRES QUI N'ONT PAS ETE RENDUS A LA BIBLIOTHEQUE ?
        SELECT titre FROM livre WHERE id_livre IN (100, 105); 
        SELECT titre FROM livre WHERE id_livre IN 
            (SELECT id_livre FROM emprunt WHERE date_rendu IS NULL); 
                +-------------------------+
                | titre                   |
                +-------------------------+
                | Les Trois Mousquetaires |
                | Une vie                 |
                +-------------------------+

    --QUELS SONT LES ABONNES N'AYANT PAS ENCORE RENDU LEUR LIVRE : sélectionner le prenom de la table abonné à condition que l'id est le même que celui issu de la table emprunt dont la date de rendu est NULL
        SELECT prenom FROM abonne WHERE id_abonne IN 
            (SELECT id_abonne FROM emprunt WHERE date_rendu IS NULL); 
                +--------+
                | prenom |
                +--------+
                | Chloe  |
                | Benoit |
                +--------+
    
    -- Nous aimerions connaitre le numero des livres empruntés par CHLOE
    SELECT id_livre FROM emprunt WHERE id_abonne IN
        (SELECT id_abonne FROM abonne WHERE prenom IN ('Chloe'));
            +----------+
            | id_livre |
            +----------+
            |      100 |
            |      105 |
            +----------+

    -- afficher les prenoms des abonnés ayant emprunté un livre le  11/12/2016
        SELECT prenom FROM abonne WHERE id_abonne IN
        (SELECT id_abonne FROM emprunt WHERE date_sortie = '2016-12-11');
        +--------+
        | prenom |
        +--------+
        | Chloe  |
        +--------+
    
    -- combien de livre Guillaume a emprunté 
    SELECT COUNT(*) AS nb_emprunts_guillaume FROM emprunt WHERE id_abonne IN
        (SELECT id_abonne FROM abonne WHERE prenom = 'Guillaume');
        +-----------------------+
        | nb_emprunts_guillaume |
        +-----------------------+
        |                     2 |
        +-----------------------+

    -- Afficher la liste des abonnés ayant déjà emprunté un livre d'Alphons Daudet
    SELECT prenom FROM abonne WHERE id_abonne IN
    ( SELECT id_abonne FROM emprunt WHERE id_livre IN 
        (SELECT id_livre FROM livre WHERE auteur = 'Alphonse Daudet'));
        +--------+
        | prenom |
        +--------+
        | Laura  |
        +--------+

    -- Nous aimerions connaitre le ou les titres des livres empruntés par Chloe
    SELECT titre FROM livre WHERE id_livre IN
        (SELECT id_livre FROM emprunt WHERE id_abonne IN
            (SELECT id_abonne FROM abonne WHERE prenom = 'Chloe'));
            +-------------------------+
            | titre                   |
            +-------------------------+
            | Une vie                 |
            | Les Trois Mousquetaires |
            +-------------------------+

    -- Nous aimerions connaitre le ou les titres des livres que chloé n'a pas encore rendu à la bibliothèque
    SELECT titre FROM livre WHERE id_livre IN
        (SELECT id_livre FROM emprunt WHERE date_rendu IS NULL AND id_abonne IN
            (SELECT id_abonne FROM abonne WHERE prenom = 'Chloe'));
    SELECT titre FROM livre WHERE id_livre IN
        (SELECT id_livre FROM emprunt WHERE id_abonne IN
            (SELECT id_abonne FROM abonne WHERE prenom = 'Chloe') 
        AND date_rendu IS NULL );
            +-------------------------+
            | titre                   |
            +-------------------------+
            | Les Trois Mousquetaires |
            +-------------------------+
    
    -- Nous aimerions connaitre le titre des livres que Chloe n'a pas encore emprunté
        SELECT titre FROM livre WHERE id_livre NOT IN
        (SELECT id_livre FROM emprunt WHERE id_abonne IN
            (SELECT id_abonne FROM abonne WHERE prenom = 'Chloe'));
            +-----------------+
            | titre           |
            +-----------------+
            | Bel-Ami         |
            | Le père Goriot  |
            | Le Petit chose  |
            | La Reine Margot |
            +-----------------+
    
    -- Qui a emprunté le plus de livres? 
    -- Benoit

    SELECT prenom FROM abonne WHERE id_abonne = (
        SELECT id_abonne  FROM emprunt GROUP BY id_abonne ORDER BY COUNT(*) DESC LIMIT 1
    );
        +--------+
        | prenom |
        +--------+
        | Benoit |
        +--------+


---------------------------------------------------------------------REQUETE EN JOINTURE (sur plusieurs tables)

--différence entre une requete imrbriquée et une requete eb jointure
    -- une requete imbriquée est possible dans tous les cas
    -- une requete ne jointure n'estossible que si les colonnes récupérées ne proviennent que d'une seule table

--sur une requête en jointure, on mélange les colonnes de sortie, els tables concernées et les conditions.

-- Nous aimerions connaites les dates de sortie et les dates de rendu pour l'abonné GUILLAUME

SELECT prenom, date_sortie, date_rendu
FROM abonne, emprunt
WHERE abonne.id_abonne = emprunt.id_abonne
AND prenom = 'guillaume';
+-----------+-------------+------------+
| prenom    | date_sortie | date_rendu |
+-----------+-------------+------------+
| Guillaume | 2016-12-07  | 2016-12-11 |
| Guillaume | 2016-12-15  | 2016-12-30 |
+-----------+-------------+------------+

-- il est possible de donner des alias pour nos tables :
SELECT prenom, date_sortie, date_rendu
FROM abonne a, emprunt e
WHERE a.id_abonne = e.id_abonne
AND prenom = 'guillaume';

--AUTRES SYNTAXES : on appelle les tables une par une
SELECT prenom, date_sortie, date_rendu
FROM abonne 
JOIN emprunt 
    ON abonne.id_abonne = emprunt.id_abonne
WHERE prenom = 'guillaume';

SELECT prenom, date_sortie, date_rendu
FROM abonne 
JOIN emprunt USING (id_abonne)
WHERE prenom = 'guillaume';

--Nous aimerions connnaitre les dates de sortie et de rendu pour les livres écrits par Alphonse Daudet
-- la requête nécessite plusieurs tables en select donc ne peutêtre faite en imbriqué
SELECT auteur, titre, date_sortie, date_rendu
FROM livre 
JOIN emprunt USING (id_livre)
WHERE auteur = 'alphonse daudet';


+-----------------+----------------+-------------+------------+
| auteur          | titre          | date_sortie | date_rendu |
+-----------------+----------------+-------------+------------+
| ALPHONSE DAUDET | Le Petit chose | 2016-12-12  | 2016-12-22 |
+-----------------+----------------+-------------+------------+

--- Seule possibilité pour faire une requête imbriquée : select d'une seule et unique table. 
-- refaire la dernière en impriqué

SELECT date_sortie, date_rendu
FROM livre 
JOIN emprunt USING (id_livre)
WHERE auteur = 'alphonse daudet';
+-------------+------------+
| date_sortie | date_rendu |
+-------------+------------+
| 2016-12-12  | 2016-12-22 |
+-------------+------------

SELECT date_sortie, date_rendu 
FROM emprunt 
WHERE id_livre IN (
    SELECT id_livre 
    FROM LIVRE 
    WHERE auteur ='alphonse daudet'
);
+-------------+------------+
| date_sortie | date_rendu |
+-------------+------------+
| 2016-12-12  | 2016-12-22 |
+-------------+------------+

-- qui a emprunté le livre Une vie sur l'année 2016 (on peut mettre autant de JOIN que nécessaire)

SELECT prenom, titre, auteur, date_sortie
FROM emprunt
JOIN abonne USING (id_abonne)
JOIN livre USING (id_livre)
WHERE YEAR(date_sortie) = 2016 
AND titre = 'une vie';

+-----------+---------+-------------------+-------------+
| prenom    | titre   | auteur            | date_sortie |
+-----------+---------+-------------------+-------------+
| Guillaume | Une vie | GUY DE MAUPASSANT | 2016-12-07  |
| Chloe     | Une vie | GUY DE MAUPASSANT | 2016-12-11  |
+-----------+---------+-------------------+-------------+

-- Nous aimerions connaitre le nombre de livres empruntés par chaque abonné. le COUNT(*) lira le nombre de ligne de la table qui en a le plus

SELECT prenom, COUNT(*) AS nb_emprunts
FROM emprunt
JOIN abonne USING (id_abonne)
GROUP BY id_abonne;
+-----------+-------------+
| prenom    | nb_emprunts |
+-----------+-------------+
| Guillaume |           2 |
| Benoit    |           3 |
| Chloe     |           2 |
| Laura     |           1 |
+-----------+-------------+

SELECT prenom, COUNT(id_emprunt) AS nb_emprunts
FROM emprunt
JOIN abonne USING (id_abonne)
GROUP BY prenom
+-----------+-------------+
| prenom    | nb_emprunts |
+-----------+-------------+
| Benoit    |           3 |
| Chloe     |           2 |
| Guillaume |           2 |
| Laura     |           1 |
+-----------+-------------+

--améliorer en ne prenant que celui qui en le plus
SELECT prenom, COUNT(id_emprunt) AS nb_emprunts
FROM emprunt
JOIN abonne USING (id_abonne)
GROUP BY prenom
ORDER BY nb_emprunts 
DESC
LIMIT 1;
+--------+-------------+
| prenom | nb_emprunts |
+--------+-------------+
| Benoit |           3 |
+--------+-------------+

-- Nous aimerions connaitre le nombre de livres à rendre pour chaque abonné. Attenion : WHERE toujours après FROM

SELECT prenom, COUNT(id_emprunt) AS nb_emprunts
FROM emprunt
JOIN abonne USING (id_abonne)
WHERE date_rendu IS NULL
GROUP BY prenom;
+--------+-------------+
| prenom | nb_emprunts |
+--------+-------------+
| Benoit |           1 |
| Chloe  |           1 |
+--------+-------------+

SELECT prenom, COUNT(id_emprunt) AS nb_emprunts
FROM emprunt, abonne
WHERE abonne.id_abonne = emprunt.id_abonne
AND date_rendu IS NULL
GROUP BY prenom;

-- Qui a emprunté quoi et quand
select prenom, titre, auteur, date_sortie
FROM emprunt
JOIN abonne USING (id_abonne)
JOIN livre USING (id_livre);
+-----------+-------------------------+-------------------+-------------+
| prenom    | titre                   | auteur            | date_sortie |
+-----------+-------------------------+-------------------+-------------+
| Guillaume | Une vie                 | GUY DE MAUPASSANT | 2016-12-07  |
| Benoit    | Bel-Ami                 | GUY DE MAUPASSANT | 2016-12-07  |
| Chloe     | Une vie                 | GUY DE MAUPASSANT | 2016-12-11  |
| Laura     | Le Petit chose          | ALPHONSE DAUDET   | 2016-12-12  |
| Guillaume | La Reine Margot         | ALEXANDRE DUMAS   | 2016-12-15  |
| Benoit    | Les Trois Mousquetaires | ALEXANDRE DUMAS   | 2017-01-02  |
| Chloe     | Les Trois Mousquetaires | ALEXANDRE DUMAS   | 2017-02-15  |
| Benoit    | Une vie                 | GUY DE MAUPASSANT | 2017-02-20  |
+-----------+-------------------------+-------------------+-------------+


----------------------------------------------------------------------------------REQUETES EN JOINTURE EXTERNE (sans correspondance exigée)

-- afiicher la liste des abonnés et les id livres qu'ils ont emprunté

SELECT prenom, id_livre
FROM emprunt
JOIN livre USING (id_livre)
JOIN abonne USING (id_abonne)
ORDER by prenom;
-- se rajouter


INSERT INTO abonne VALUES (NULL, 'Brenda');

-- afficher tous les abonnés puis la liste des id_livre s'ils ont fait un emprunt. Si on relance la requete précédente, nous ne figurons pas dans la liste car nous n'avons pas réalisé d'emprunt. 

-- Dans ce cas nous pouvons utiliser une jointure externe, qui consiste à donner une priorité à une table dont on récupère tout le contenu sans excepton avant de rajouter les éléments d'une autre table sur la base de la relation. 

-- pour la jointure externe : LEFT JOIN ou RIGHT JOIN
-- LEFT donnera la priotité à la table considéré comme étant à gauche dans le sens de lecture de la requete, RIGHT à droite

SELECT prenom, id_livre
FROM emprunt
RIGHT JOIN abonne USING (id_abonne)
ORDER by prenom;

SELECT prenom, id_livre
FROM abonne
LEFT JOIN emprunt  USING (id_abonne)
ORDER by prenom;

+-----------+----------+
| prenom    | id_livre |
+-----------+----------+
| Benoit    |      100 |
| Benoit    |      101 |
| Benoit    |      105 |
| Brenda    |     NULL |
| Chloe     |      100 |
| Chloe     |      105 |
| Guillaume |      100 |
| Guillaume |      104 |
| Laura     |      103 |
+-----------+----------+

-- afficher tous les livres sans exceptions puis les id abonne les ayant emprunté

SELECT titre, auteur, id_abonne 
FROM livre
LEFT JOIN emprunt USING (id_livre)
lEFT JOIN abonne USING (id_abonne)
ORDER by id_livre;

+-------------------------+-------------------+-----------+
| titre                   | auteur            | id_abonne |
+-------------------------+-------------------+-----------+
| Une vie                 | GUY DE MAUPASSANT |         2 |
| Une vie                 | GUY DE MAUPASSANT |         1 |
| Une vie                 | GUY DE MAUPASSANT |         3 |
| Bel-Ami                 | GUY DE MAUPASSANT |         2 |
| Le père Goriot          | HONORE DE BALZAC  |      NULL |
| Le Petit chose          | ALPHONSE DAUDET   |         4 |
| La Reine Margot         | ALEXANDRE DUMAS   |         1 |
| Les Trois Mousquetaires | ALEXANDRE DUMAS   |         3 |
| Les Trois Mousquetaires | ALEXANDRE DUMAS   |         2 |
+-------------------------+-------------------+-----------+

-- il n'est pas possible de mélanger RIGHT et LEFT dans une même requête. On doit conserver le même jusqu'à la fin de la requete. 

SELECT titre, auteur, id_abonne, prenom 
FROM livre
LEFT JOIN emprunt USING (id_livre)
lEFT JOIN abonne USING (id_abonne)
ORDER by id_livre;
+-------------------------+-------------------+-----------+-----------+
| titre                   | auteur            | id_abonne | prenom    |
+-------------------------+-------------------+-----------+-----------+
| Une vie                 | GUY DE MAUPASSANT |         3 | Chloe     |
| Une vie                 | GUY DE MAUPASSANT |         1 | Guillaume |
| Une vie                 | GUY DE MAUPASSANT |         2 | Benoit    |
| Bel-Ami                 | GUY DE MAUPASSANT |         2 | Benoit    |
| Le père Goriot          | HONORE DE BALZAC  |      NULL | NULL      |
| Le Petit chose          | ALPHONSE DAUDET   |         4 | Laura     |
| La Reine Margot         | ALEXANDRE DUMAS   |         1 | Guillaume |
| Les Trois Mousquetaires | ALEXANDRE DUMAS   |         2 | Benoit    |
| Les Trois Mousquetaires | ALEXANDRE DUMAS   |         3 | Chloe     |
+-------------------------+-------------------+-----------+-----------+

-- nous aimerions afficher tous les abonnés puis le nombre de livres empruntés

SELECT prenom, COUNT(id_emprunt) AS nb_emprunts
FROM abonne
LEFT JOIN emprunt USING (id_abonne)
GROUP BY prenom;


SELECT prenom, COUNT(id_emprunt) AS nb_emprunts
FROM abonne
LEFT JOIN emprunt USING (id_abonne) AND date_rendu IS NULL
GROUP BY prenom;