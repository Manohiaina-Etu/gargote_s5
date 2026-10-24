ALTER TABLE plat ADD COLUMN is_menu BOOLEAN NOT NULL DEFAULT FALSE;

INSERT INTO categorie (nom) VALUES
    ('Menu');

INSERT INTO plat (nom, prix, id_categorie, is_menu) VALUES
    ('Menu Romazava',8000, 7, TRUE);

CREATE TABLE IF NOT EXISTS plat_menu (
    id_plat INTEGER NOT NULL,
    id_plat_compose INTEGER NOT NULL,
    quantite_plat_compose INTEGER NOT NULL DEFAULT 1,
    CHECK (id_plat <> id_plat_compose)
);

INSERT INTO plat_menu (id_plat, id_plat_compose, quantite_plat_compose) VALUES
    (8,1,1),
    (8,7,1),
    (8,6,1);


---------------------------------------
--- Piège
---------------------------------------
-- On ne crée pas une table menu séparée parce qu’un menu est lui-même un plat : il peut donc être stocké dans la table plat, ce qui évite la duplication des données et simplifie les commandes. Une table plat_menu permet ensuite de relier chaque menu aux plats qui le composent.
-- Une contrainte CHECK (id_plat <> id_plat_compose) empêche un menu de se contenir directement lui-même.