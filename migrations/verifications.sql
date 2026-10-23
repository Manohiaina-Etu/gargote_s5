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


-----------------------------
--- Etape 4 ---
-----------------------------

-- afficher la liste des commandes avec les clients
SELECT  com.id,
        com.date,
        CASE
            WHEN cli.id IS NULL THEN 'Client de passage'
            ELSE cli.nom
        END AS nom_client
    FROM commande com
    LEFT JOIN client cli on cli.id = com.id_client
;


-----------------------------
--- Etape 5 ---
-----------------------------

-- nombre de commandes par serveur
SELECT  ser.id as id_serveur,
        ser.nom as nom_serveur,
        COUNT(ser.id) as nbr_commande
    FROM commande com 
    JOIN serveur ser on com.id_serveur = ser.id
    GROUP BY ser.id, ser.nom
    ORDER BY ser.id
;

-- chiffre d'affaire par serveur
SELECT  det.id_serveur,
        ser.nom,
        SUM(montant_total) as chiffre_affaire
    FROM detail_commande det
    JOIN serveur ser on ser.id = det.id_serveur
    GROUP BY det.id_serveur, ser.nom
    ORDER BY det.id_serveur
;


-----------------------------
--- Etape 6 ---
-----------------------------

-- vue somme des paiements par commande
CREATE VIEW paiement_commande AS
    SELECT  p.id_commande as id_commande,
            SUM(p.montant) as montant_paye
        FROM paiement p
        GROUP BY p.id_commande
        ORDER BY p.id_commande
;

--  liste des commandes non soldées avec le montant dû, le montant payé et le reste à payer
SELECT  det.id_commande,
        det.montant_total as montant_dû,
        COALESCE(p.montant_paye,0) as montant_paye,
        det.montant_total - COALESCE(p.montant_paye,0) as reste_a_payer    
    FROM detail_commande DET
    LEFT JOIN paiement_commande p on p.id_commande = det.id_commande
    WHERE det.montant_total - COALESCE(p.montant_paye,0) > 0
    ORDER BY det.id_commande
; 

-----------------------------
--- Etape 7 ---
-----------------------------

SELECT rel.id_commande, rel.id_plat, rel.prix_plat, p.prix FROM relation_commande_plat rel
    JOIN plat p ON p.id = rel.id_plat
;

SELECT  com.id as id_commande,
        com.date,
        SUM(rel.prix_plat * rel.quantite) as montant_total
    FROM commande com
    JOIN relation_commande_plat rel ON com.id = rel.id_commande
    JOIN plat p on p.id = rel.id_plat
    GROUP BY com.id, com.date
    ORDER BY com.id
;
