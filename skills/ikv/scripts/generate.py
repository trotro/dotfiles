#!/usr/bin/env python3
"""
Génère une attestation mobilité durable (vélo) au format PDF.
Usage: python generate.py <ANNEE> <MOIS> "<NOM>" "<MATRICULE>" <OUTPUT_PATH>
"""
import sys

MOIS_FR = {
    1: "janvier", 2: "février", 3: "mars", 4: "avril",
    5: "mai", 6: "juin", 7: "juillet", 8: "août",
    9: "septembre", 10: "octobre", 11: "novembre", 12: "décembre"
}


def generate_pdf(annee: int, mois: int, nom: str, matricule: str, output_path: str):
    from reportlab.lib.pagesizes import A4
    from reportlab.pdfgen import canvas
    from reportlab.lib.units import cm

    mois_lettre = MOIS_FR[mois]

    c = canvas.Canvas(output_path, pagesize=A4)
    width, height = A4

    c.setFont("Times-Italic", 11)

    # Objet
    c.drawString(3.5 * cm, height - 5 * cm,
                 "Objet : attestation sur l'honneur – déplacements à vélo")

    # Formule d'appel
    c.drawString(3.5 * cm, height - 8 * cm, "Madame, Monsieur,")

    # Corps du texte
    line1 = f"Je soussigné(e) {nom}, {matricule} atteste sur l'honneur avoir réalisé l'ensemble"
    line2 = f"de mes déplacements domicile – travail à vélo pour le mois de {mois_lettre} {annee}."
    c.drawString(3.5 * cm, height - 11 * cm, line1)
    c.drawString(3.5 * cm, height - 11.7 * cm, line2)

    # Formule de politesse
    c.drawString(3.5 * cm, height - 14 * cm, "Cordialement,")

    c.save()
    print(f"PDF généré : {output_path}")


if __name__ == "__main__":
    if len(sys.argv) != 6:
        print("Usage: python generate.py <ANNEE> <MOIS> <NOM> <MATRICULE> <OUTPUT>")
        sys.exit(1)

    annee = int(sys.argv[1])
    mois = int(sys.argv[2])
    nom = sys.argv[3]
    matricule = sys.argv[4]
    output = sys.argv[5]

    if mois < 1 or mois > 12:
        print("Erreur : le mois doit être entre 1 et 12")
        sys.exit(1)

    generate_pdf(annee, mois, nom, matricule, output)
