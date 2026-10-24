CREATE TABLE IF NOT EXISTS  ingredient (
    id SERIAL PRIMARY KEY NOT NULL,
    libele VARCHAR(50) NOT NULL,
    unite VARCHAR(50) NOT NULL,
    stock INTEGER NOT NULL DEFAULT 0
);

INSERT INTO ingredient (libele, unite, stock) VALUES
    ('Riz','g',10000),
    ('Viande de zébu','g',8000),
    ('Brèdes mafana','g',4000),
    ('Ravitoto','g',2000),
    ('Viand de porc','g',4000),
    ('Viande de poule','g',4000),
    ('Voanio','g',2000),
    ('Pattes','g',10000),
    ('Carottes','g',3000),
    ('Haricot Vert','g',2000),
    ('Oeuf','unit',50),
    ('Farine','g',4000),
    ('Sucre','g',5000),
    ('Eau','l',5000);

CREATE TABLE IF NOT EXISTS composition_plat (
    id_plat INTEGER NOT NULL REFERENCES plat(id),
    id_ingredient INTEGER NOT NULL REFERENCES ingredient(id),
    qauntite INTEGER NOT NULL
);

INSERT INTO composition_plat (id_plat, id_ingredient, quantite) VALUES 
    (1,1,250),
    (1,2,150),
    (1,3,100),
    (2,1,250),
    (2,4,100),
    (2,5,150),
    (3,1,250),
    (3,6,150),
    (3,7,100),
    (4,8,250),
    (4,9,50),
    (4,10,50),
    (5,8,250),
    (5,11,3),
    (6,12,200),
    (6,13,100),
    (6,14,500),
    (7,1,50),
    (7,14,200);


---------------------------------------
--- Piège
---------------------------------------
-- Stocker « riz, zébu, brèdes » dans une colonne VARCHAR(500) n’est pas conseillé, car les ingrédients sont regroupés dans un seul champ, ce qui complique les recherches, les modifications et la gestion des ingrédients individuellement.