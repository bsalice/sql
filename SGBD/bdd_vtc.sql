-- Ceci est un commentaire dans un fichier SQL
# Ceci est aussi un commentaire dans fichier SQL

/*
Commentaire sur plusieurs lignes
*/

/*
BBD : vtc


TABLES : 

    - conducteur
        - colonnes                  
            NOM DE LA COLONNE      - TYPE DE DONNEES                   - CATEGORY
            id_conducteur           - INT(3)                            - PK AI
            nom                     - VARCHAR(255)//taille max input    
            prenom                  - VARCHAR(255)
            localisation            - VARCHAR(255)
            type_de_permis          - ENUM("A", "B", "C")
            date_embauche           - DATE
            date_naissance          - DATE
            sexe                    - ENUM("M", "F", "NB")
            adresse                 - TEXT (pas de taille définie)
            cp                      - VARCHAR(5)
            ville                   - VARCHAR(255)
            statut                  - ENUM("disponible"/"indisponible")
    
    - vehicule
        -colonnes 
            id_vehicule             - INT(3)                            - PK AI
            immatriculation         - VARCHAR(9)
            marque                  - VARCHAR(255)
            modele                  - VARCHAR(255)
            categorie               - VARCHAR(255)
            type                    - VARCHAR(255)
            couleur                 - VARCHAR(255)
            annee                   - YEAR
            energie                 - VARCHAR(255)
            etat                    - ENUPM("disponible"/"indisponible")

    - association_vehicule_conducteur
        -   id_association             - INT(3)                            - PK AI
        -   id_vehicule                - INT(3)                            - FK (index : index)
        -   id_conducteur              - INT(3)                            - FK (index : index)

*/