CREATE TABLE IF NOT EXISTS serveur (
    id SERIAL PRIMARY KEY NOT NULL,
    nom VARCHAR(150) 
);

INSERT INTO serveur (nom) VALUES
    ('Njaka Rakoto'),
    ('Lalao Rasoa');

CREATE TABLE IF NOT EXISTS latabatra (
    id SERIAL PRIMARY KEY NOT NULL,
    nom VARCHAR(50)
);   

INSERT INTO latabatra (nom) VALUES
    ('Table 1'),
    ('Table 2'),
    ('Table 3'),
    ('Table 4'),
    ('Table 5'),
    ('Table 6'),
    ('Table 7'),
    ('Table 8');

ALTER TABLE commande ADD COLUMN id_serveur INTEGER;

UPDATE commande set id_serveur = 1 WHERE id = 1;
UPDATE commande set id_serveur = 2 WHERE id = 2;

ALTER TABLE commande ALTER COLUMN id_serveur SET NOT NULL;

ALTER TABLE commande ADD CONSTRAINT fk_commande_erveur
    FOREIGN KEY (id_serveur)
    REFERENCES serveur(id);

ALTER TABLE commande ADD COLUMN id_latabatra INTEGER;

UPDATE commande set id_latabatra = 4 WHERE id = 2;

ALTER TABLE commande ADD CONSTRAINT fk_commande_latabatra
    FOREIGN KEY (id_latabatra)
    REFERENCES latabatra(id);


-- Données de test supplémentaire
INSERT INTO commande (date, id_client, id_serveur, id_latabatra) VALUES 
    ('16-10-2026 12:45:00',NULL,1,6),
    ('16-10-2026 12:10:00',2,2,NULL),
    ('16-10-2026 13:15:00',NULL,2,NULL),
    ('16-10-2026 13:30:00',3,1,2);
INSERT INTO relation_commande_plat (id_commande, id_plat, quantite) VALUES
    (3, 1, 1),
    (3, 2, 2),
    (4, 3, 3),
    (4, 4, 2),
    (4, 5, 1),
    (5, 6, 2),
    (5, 7, 3),
    (5, 4, 4),
    (5, 5, 3),
    (6, 6, 2),
    (6, 3, 1);

-- detail d'une commande affiche la somme des prix des plats
CREATE VIEW detail_commande AS
    SELECT  com.id as id_commande,
        com.date,
        com.id_serveur,
        com.id_latabatra,
        SUM(p.prix * rel.quantite) as montant_total
    FROM commande com
    JOIN relation_commande_plat rel ON com.id = rel.id_commande
    JOIN plat p on p.id = rel.id_plat
    GROUP BY com.id
    ORDER BY com.id
;


---------------------------------------
--- Piège
---------------------------------------
-- Une table de la salle est différente d'une commande car une table de la salle possède une ou plusieurs commandes, tandisqu'une commande peut ne pas être relié à une table comme le cas d'une commande à emporter.
-- En SQL, le mot table est un mot clé réservé qui sert à définir une table dans la base de données.