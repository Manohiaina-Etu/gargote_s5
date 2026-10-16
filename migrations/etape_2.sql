CREATE TABLE IF NOT EXISTS categorie (
    id SERIAL PRIMARY KEY NOT NULL,
    nom VARCHAR(50) NOT NULL
);

INSERT INTO categorie (nom) VALUES
    ('Plat malagasy'),
    ('Plat chinois'),
    ('Soupe'),
    ('Dessert et goûter'),
    ('Boisson')
;

ALTER TABLE plat ADD COLUMN id_categorie INTEGER;

UPDATE plat SET id_categorie=1 where id in (1,2,3);
UPDATE plat SET id_categorie=2 where id = 4;
UPDATE plat SET id_categorie=3 where id = 5;
UPDATE plat SET id_categorie=4 where id = 6;
UPDATE plat SET id_categorie=5 where id = 7;

ALTER TABLE plat ALTER COLUMN id_categorie SET NOT NULL;

ALTER TABLE plat ADD CONSTRAINT fk_categorie
    FOREIGN KEY (id_categorie) REFERENCES categorie(id);


INSERT INTO categorie (nom) VALUES ('Grillade');

---------------------------------------
--- Piège
---------------------------------------
-- Si on a juste ajouté une colonne categorie VARCHAR(50) alors on peut insérer n'importe quel nom de catégorie pour un plat, en cas de faute de frappe alors un plat est considéré comme autre catégorie, en créant une table categorie on peut facilement attribuer une categorie aux plats donc les catégories sont bien fixés.
-- Exemple: on a inséré le plat 'Romazava' avec catécorie 'Plat malagasy', un autre plat 'Ravitoto sy henakisoa' avec catégorie 'Sakafo malagasy', on doit faire un selecte where avec tout les mots sinonymes pour avoir les plats de la même catégorie, or il y a une infinité de possibilité
---------------------------------------
--- Piège
---------------------------------------
