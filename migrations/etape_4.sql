CREATE TABLE IF NOT EXISTS client (
    id SERIAL PRIMARY KEY NOT NULL,
    nom VARCHAR(150)
);

INSERT INTO client (nom) VALUES
    ('RANAIVO Jean'),
    ('ANDRIANJAKA Fidy'),
    ('RANAIVOSON Malala');

ALTER TABLE commande ADD COLUMN id_client INTEGER;

ALTER TABLE commande ADD CONSTRAINT fk_commande_client 
    FOREIGN KEY (id_client)
    REFERENCES client(id);

UPDATE commande SET id_client = 2 WHERE id = 2;

---------------------------------------
--- Piège
---------------------------------------
-- La clée étrangère est nullable. On utilise le LEFT JION pour ne perdre aucune commande.