# Schema relationnel

## TABLE plat

| colonne | type |
| --- | --- |
| **id** | INTEGER |
| nom | VARCHAR(50) |
| prix | INTEGER |
| #id_categorie | INTEGER |

## TABLE categorie

| colonne | type |
| --- | --- |
| **id** | INTEGER |
| nom | VARCHAR(50) |

## TABLE commande (nouveau)

| colonne | type |
| --- | --- |
| **id** | INTEGER |
| date | TIMESTAMP |

## TABLE relation_commande_plat (nouveau)

| colonne | type |
| --- | --- |
| #id_commande | INTEGER |
| #id_plat | INTEGER |
| quantite | INTEGER |

