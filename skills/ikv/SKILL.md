---
name: ikv
description: Génère une attestation sur l'honneur de déplacements domicile-travail à vélo au format PDF. Utiliser ce skill dès que l'utilisateur demande de générer un fichier pour l’indemnité kilométrique vélo ou ikv. Le nom du fichier suit le format mobilite-durable-<AAAAMM>.pdf et le mois en toutes lettres dans le texte correspond au numéro du mois dans le nom du fichier.
---

# Skill : Attestation Mobilité Durable (vélo)

## Objectif

Générer le fichier `mobilite-durable-<AAAAMM>.pdf` pour un mois donné.

## Informations à collecter

Si l'utilisateur ne les fournit pas, demander :

- **Année** (AAAA)
- **Mois** (MM, 1–12)
- **Nom et prénom** du signataire
- **Matricule** (identifiant employé)

## Génération du PDF

Utiliser le script `scripts/generate.py` :

```bash
pip install reportlab --break-system-packages -q
python scripts/generate.py <ANNEE> <MOIS> "<NOM PRENOM>" "<MATRICULE>" /tmp/mobilite-durable-<AAAAMM>.pdf
```

Exemple pour février 2025 :

```bash
python scripts/generate.py 2025 2 "Trauwaen Nicolas" "0000000000" /tmp/mobilite-durable-202502.pdf
```

## Règles importantes

- Le nom de fichier : `mobilite-durable-AAAAMM.pdf` (mois sur 2 chiffres, ex: `202502`)
- Le mois **en lettres** dans le texte doit correspondre au mois **numérique** dans le nom du fichier
- Mois en français : janvier, février, mars, avril, mai, juin, juillet, août, septembre, octobre, novembre, décembre

## Après génération

Présenter le fichier à l'utilisateur avec `present_files`.
