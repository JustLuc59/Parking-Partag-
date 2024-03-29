import os
import qrcode
import random
import string
import mysql.connector
from PIL import Image

# Fonction pour générer une clé unique
def generer_cle(longueur):
    return ''.join(random.choices(string.ascii_letters + string.digits, k=longueur))

# Fonction pour obtenir le prochain nom de fichier unique
def obtenir_prochain_nom_fichier(dossier, nom_fichier):
    nom_base, extension = os.path.splitext(nom_fichier)
    i = 1
    nouveau_nom_fichier = nom_fichier
    while os.path.exists(os.path.join(dossier, nouveau_nom_fichier)):
        nouveau_nom_fichier = f"{nom_base}_{i}{extension}"
        i += 1
    return nouveau_nom_fichier

# Générer une clé unique
cle_qr = generer_cle(10)

# Connexion à la base de données MySQL
hote = '192.168.30.249'
base_de_donnees = 'test'
utilisateur = 'admin'
mot_de_passe = 'tssnadmin'

connexion = mysql.connector.connect(
    host=hote,
    user=utilisateur,
    password=mot_de_passe,
    database=base_de_donnees
)

# Créer le curseur pour exécuter des requêtes SQL
curseur = connexion.cursor()

# Créer une table pour stocker les informations du code QR si elle n'existe pas déjà
curseur.execute('''CREATE TABLE IF NOT EXISTS codes_qr (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    cle VARCHAR(255),
                    nom_image VARCHAR(255)
                )''')

# Insérer la clé dans la base de données
requete_insertion = "INSERT INTO codes_qr (cle) VALUES (%s)"
valeurs = (cle_qr,)
curseur.execute(requete_insertion, valeurs)
connexion.commit()

# Obtenir le dernier ID inséré
dernier_id = curseur.lastrowid

# Créer le code QR avec les données uniques
qr = qrcode.QRCode(version=3,
                    error_correction=qrcode.constants.ERROR_CORRECT_H,
                    box_size=100,
                    border=1)
qr.add_data(cle_qr)
qr.make(fit=True)

# Générer l'image du code QR
img = qr.make_image(fill_color="black", back_color="white")

# Spécifier le chemin du dossier où vous souhaitez enregistrer le QR code
dossier = r'C:\Users\arthu\Documents\qrcode'

# Assurer que le dossier existe, sinon le créer
if not os.path.exists(dossier):
    os.makedirs(dossier)

# Nom du fichier QR code
nom_fichier = f'qrcode_{dernier_id}.png'

# Obtenir le prochain nom de fichier unique
nom_fichier = obtenir_prochain_nom_fichier(dossier, nom_fichier)

# Chemin complet du fichier QR code
chemin_qr_code = os.path.join(dossier, nom_fichier)

# Enregistrer l'image dans le dossier spécifié avec le nom spécifié
img.save(chemin_qr_code)

# Mettre à jour la base de données avec le nom de l'image correspondant
requete_mise_a_jour = "UPDATE codes_qr SET nom_image = %s WHERE id = %s"
valeurs_mise_a_jour = (nom_fichier, dernier_id)
curseur.execute(requete_mise_a_jour, valeurs_mise_a_jour)
connexion.commit()

# Fermer la connexion à la base de données
connexion.close()

# Afficher le chemin du fichier enregistré
print("QR code enregistré sous :", chemin_qr_code)
