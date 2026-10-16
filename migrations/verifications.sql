-----------------------------
--- Etape 1 ---
-----------------------------

-- afficher les plats du plus cher au moins cher
SELECT id, nom, prix FROM plat
    ORDER BY prix DESC;


-----------------------------
--- Etape 2 ---
-----------------------------

-- afficher la liste des plats avec categorie
SELECT p.id, p.nom, c.nom, p.prix FROM plat p
    JOIN categorie c ON p.id_categorie = c.id;
    
-- afficher le nombre de plats par catégorie, y compris les catégories sans plat
SELECT c.id, c.nom as nom_categorie,count(p.id) as nbr_plat
    FROM categorie c
    LEFT JOIN plat p ON p.id_categorie = c.id 
    GROUP BY c.id, c.nom
    ORDER BY c.id;


-----------------------------
--- Etape 3 ---
-----------------------------

-- afficher details commande
SELECT  com.id as id_commande,
        com.date,
        rel.id_plat as id_plat,
        p.nom as nom_plat,
        p.prix as prix_plat,
        rel.quantite as quantite_plat
    FROM commande com
    JOIN relation_commande_plat rel ON com.id = rel.id_commande
    JOIN plat p on p.id = rel.id_plat
    ORDER BY com.id
;

-- afficher montant total de chaque commande
SELECT  com.id as id_commande,
        com.date,
        SUM(p.prix * rel.quantite) as montant_total
    FROM commande com
    JOIN relation_commande_plat rel ON com.id = rel.id_commande
    JOIN plat p on p.id = rel.id_plat
    GROUP BY com.id, com.date
    ORDER BY com.id
;
