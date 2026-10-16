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