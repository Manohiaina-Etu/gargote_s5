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

## TABLE commande

| colonne | type |
| --- | --- |
| **id** | INTEGER |
| date | TIMESTAMP |
| #id_client | INTEGER |
| #id_serveur | INTEGER |
| #id_latabatra | INTEGER |

## TABLE relation_commande_plat

| colonne | type |
| --- | --- |
| #id_commande | INTEGER |
| #id_plat | INTEGER |
| quantite | INTEGER |

## TABLE client

| colonne | type |
| --- | --- |
| **id** | INTEGER |
| nom | VARCHAR(150) |

## TABLE serveur

| colonne | type |
| --- | --- |
| **id** | INTEGER |
| nom | VARCHAR(150) |

## TABLE latabatra

| colonne | type |
| --- | --- |
| **id** | INTEGER |
| nom | VARCHAR(150) |

## TABLE type_paiement (nouveau)

| colonne | type |
| --- | --- |
| **id** | INTEGER |
| libelle | VARCHAR(150) |
| actif | BOOLEAN |

## TABLE paiement (nouveau)

| colonne | type |
| --- | --- |
| **id** | INTEGER |
| #id_commande | INTEGER |
| #id_type_paiement | INTEGER |
| reference_mobile_money | VARCHAR(150) |
| montant | INTEGER |
| date_paiement | TIMESTAMP |
