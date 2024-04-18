import os
import qrcode
import random
import string
import mysql.connector
from PIL import Image
import time

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

# Fonction pour surveiller les changements dans la base de données
def surveiller_changements():
	while True:
    	# Connexion à la base de données MySQL
    	connexion = mysql.connector.connect(
        	host='192.168.234.249',
        	user='admin',
        	password='tssnadmin',
        	database='Projet'
    	)

    	curseur = connexion.cursor()
    	curseur.execute("SELECT creation FROM inscription WHERE id = 1")
    	creation = curseur.fetchone()[0]
    	curseur.close()

    	if creation == 1:
        	connexion = generer_et_enregistrer_qr_code(connexion)
        	# Attente avant la prochaine vérification
        	time.sleep(20)
    	else:
        	# Attente avant la prochaine vérification
        	time.sleep(20)

# Fonction pour générer et enregistrer le QR code
def generer_et_enregistrer_qr_code(connexion):
	# Générer une clé unique
	cle_qr = generer_cle(10)

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

	# Obtenir le dernier ID inséré dans la table codes_qr
	curseur = connexion.cursor()
	curseur.execute("SELECT MAX(id) FROM codes_qr")
	dernier_id = curseur.fetchone()[0]+1
	curseur.close()

	# Nom du fichier QR code avec l'ID le plus récent
	nom_fichier = f'qrcode_{dernier_id}.png'

	# Chemin complet du fichier QR code
	chemin_qr_code = os.path.join(dossier, nom_fichier)

	# Enregistrer l'image dans le dossier spécifié avec le nom spécifié
	img.save(chemin_qr_code)

	# Insérer la clé dans la table codes_qr
	curseur = connexion.cursor()
	requete_insertion = "INSERT INTO codes_qr (cle, nom_image) VALUES (%s, %s)"
	valeurs_insertion = (cle_qr, nom_fichier)
	curseur.execute(requete_insertion, valeurs_insertion)
	connexion.commit()

	# Mettre à jour la valeur de la colonne creation à 0 dans la table inscription
	curseur.execute("UPDATE inscription SET creation = 0 WHERE id = 1")
	connexion.commit()
	curseur.close()

	# Afficher le chemin du fichier enregistré
	print("QR code enregistré sous :", chemin_qr_code)

	return connexion

# Lancer la surveillance des changements dans la base de données
surveiller_changements()


