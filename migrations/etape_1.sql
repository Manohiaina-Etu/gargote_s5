CREATE TABLE IF NOT EXISTS plat (
    id SERIAL PRIMARY KEY NOT NULL,
    nom VARCHAR(50) NOT NULL,
    prix INTEGER NOT NULL
);

INSERT INTO plat (nom, prix) VALUES
    ('Romazava',7000),
    ('Ravitoto sy henakisoa',8000),
    ('Akoho sy voanio',8500),
    ('Mi sao',6000),
    ('Soupe chinoise',5000),
    ('Mofo gasy (les 4)',1000),
    ('Ranon''ampango',500)
;

-- Piège: pour le prix, j'ai choisi le type 'INTEGER'. J'ai choisi 'id' comme identifiant.