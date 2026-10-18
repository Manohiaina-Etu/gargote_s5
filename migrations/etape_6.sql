CREATE TABLE IF NOT EXISTS type_paiement(
    id SERIAL PRIMARY KEY NOT NULL,
    libelle VARCHAR(50),
    actif BOOLEAN
);

INSERT INTO type_paiement (libelle, actif) VALUES
    ('Espèces', TRUE),
    ('MVola', TRUE),
    ('Orange Money', TRUE),
    ('Airtel Money', TRUE);

CREATE TABLE IF NOT EXISTS paiement (
    id SERIAL PRIMARY KEY NOT NULL,
    id_commande INTEGER NOT NULL REFERENCES commande(id),
    id_type_paiement INTEGER NOT NULL REFERENCES type_paiement(id),
    reference_mobile_money VARCHAR(50),
    montant INTEGER NOT NULL,
    date_paiement TIMESTAMP NOT NULL
);

INSERT INTO paiement (id_commande, id_type_paiement, reference_mobile_money, montant, date_paiement) VALUES    
    (2,1,NULL,10000,'16-10-2026 14:00:00'),
    (2,2,'456641',5000,'16-10-2026 14:05:00'),
    (4,3,'113465',6000,'16-10-2026 12:15:00');


---------------------------------------
--- Piège
---------------------------------------
-- Une colonne montant_paye dans la table des commandes ne suffit pas car on peut avoir plusieurs paiement pour un commande, dans ce cas on ne peut enregistrer qu'une seule paiement par commande
-- La contrainte CHECK est plus simple à mettre en place, mais l'ajout d'un nouveau mode de paiement nécessite de modifier la contrainte. La table de référence est plus flexible, car elle permet d'ajouter ou de désactiver des modes de paiement facilement, sans modifier la structure de la base de données.
