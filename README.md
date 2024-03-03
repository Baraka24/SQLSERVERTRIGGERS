# SQLSERVERTRIGGERS
Homework

##  Questions

1. Soit le schéma relationnel d’une agence bancaire régionale.
CLIENT (NUMCL, NOM, PRENOM, ADR, NumVille, VILLE, SALAIRE, CONJOINT)
DETENTEUR (idDet, #NUMCL, #NUMCP)
COMPTE (NUMCP, DATEOUVR, SOLDE)
Ecrire un trigger en insertion permettant de contrôler les contraintes suivantes :
*1.* Le numéro de ville dans laquelle habite le client doit être 01, 07, 26, 38, 42, 69, 73, ou 74
*2.* le nom du conjoint doit être le même que celui du client.

2. Soit une table quelconque, dont la clé primaire CLENUM est numérique, définir un trigger en
insertion permettant d’implémenter une numérotation automatique de la clé. Le premier numéro
doit être 1.

## Resolution
In queries.sql file above

