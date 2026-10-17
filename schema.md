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

## TABLE commande (modifié)

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

## TABLE serveur (nouveau)

| colonne | type |
| --- | --- |
| **id** | INTEGER |
| nom | VARCHAR(150) |

## TABLE latabatra (nouveau)

| colonne | type |
| --- | --- |
| **id** | INTEGER |
| nom | VARCHAR(150) |