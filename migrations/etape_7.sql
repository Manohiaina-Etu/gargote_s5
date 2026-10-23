ALTER TABLE relation_commande_plat
    ADD COLUMN prix_plat INTEGER;

UPDATE relation_commande_plat 
    SET prix_plat = (SELECT prix FROM plat WHERE id = 1)
    WHERE id_plat = 1;
UPDATE relation_commande_plat 
    SET prix_plat = (SELECT prix FROM plat WHERE id = 2)
    WHERE id_plat = 2;
UPDATE relation_commande_plat 
    SET prix_plat = (SELECT prix FROM plat WHERE id = 3)
    WHERE id_plat = 3;
UPDATE relation_commande_plat 
    SET prix_plat = (SELECT prix FROM plat WHERE id = 4)
    WHERE id_plat = 4;
UPDATE relation_commande_plat 
    SET prix_plat = (SELECT prix FROM plat WHERE id = 5)
    WHERE id_plat = 5;
UPDATE relation_commande_plat 
    SET prix_plat = (SELECT prix FROM plat WHERE id = 6)
    WHERE id_plat = 6;
UPDATE relation_commande_plat 
    SET prix_plat = (SELECT prix FROM plat WHERE id = 7)
    WHERE id_plat = 7;

ALTER TABLE relation_commande_plat
    ALTER COLUMN prix_plat SET NOT NULL;

UPDATE plat 
    SET prix = 7500
    WHERE id = 1;

-- Le sous total de la commande 1 change en fonction du prix des plats donc il faut modifier la structure de la base de données pour fixer le prix des plats d'une commande
