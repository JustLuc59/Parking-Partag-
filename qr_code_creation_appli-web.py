import os
import qrcode
import mysql.connector

# Fonction pour obtenir la dernière clé et l'ID associé dans la base de données
def obtenir_derniere_cle_avec_id():
    connexion = mysql.connector.connect(
        host='192.168.234.249',
        user='admin',
        password='tssnadmin',
        database='Projet'
    )
    curseur = connexion.cursor()
    requete = "SELECT id, cle FROM codes_qr ORDER BY id DESC LIMIT 1"
    curseur.execute(requete)
    derniere_cle_id = curseur.fetchone()
    connexion.close()
    return derniere_cle_id

# Obtenir la dernière clé et son ID
derniere_cle_id = obtenir_derniere_cle_avec_id()

# Extraire l'ID et la clé
dernier_id, derniere_cle = derniere_cle_id

# Créer le code QR avec la dernière clé
qr = qrcode.QRCode(version=3,
                   error_correction=qrcode.constants.ERROR_CORRECT_H,
                   box_size=100,
                   border=1)
qr.add_data(derniere_cle)
qr.make(fit=True)

# Générer l'image du code QR
img = qr.make_image(fill_color="black", back_color="white")

# Spécifier le nom du fichier QR code avec l'ID
nom_fichier = f'qrcode_{dernier_id}.png'

# Spécifier le chemin du dossier où vous souhaitez enregistrer le QR code
dossier = '/home/etudiantciel/Documents'

# Assurer que le dossier existe, sinon le créer
if not os.path.exists(dossier):
    os.makedirs(dossier)

# Chemin complet du fichier QR code
chemin_qr_code = os.path.join(dossier, nom_fichier)

# Enregistrer l'image dans le dossier spécifié avec le nom spécifié
img.save(chemin_qr_code)

# Afficher le chemin du fichier enregistré
print("QR code enregistré sous :", chemin_qr_code)
