CREATE TABLE IF NOT EXISTS commande (
    id SERIAL PRIMARY KEY NOT NULL,
    date TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS relation_commande_plat (
    id_commande INTEGER REFERENCES commande(id) NOT NULL,
    id_plat INTEGER REFERENCES plat(id) NOT NULL,
    quantite INTEGER NOT NULL
);


INSERT INTO commande (date) VALUES 
    ('16-10-2026 12:00:00');
INSERT INTO relation_commande_plat (id_commande, id_plat, quantite) VALUES
    (1, 2, 1),
    (1, 7, 1);


INSERT INTO commande (date) VALUES 
    ('16-10-2026 13:20:00');
INSERT INTO relation_commande_plat (id_commande, id_plat, quantite) VALUES
    (2, 1, 2),
    (2, 3, 3),
    (2, 5, 1);


---------------------------------------
--- Piège
---------------------------------------
-- La quantite se place dans la relation entre commande et plat.