import os
import qrcode
import mysql.connector
import time

# Fonction pour obtenir les clés ajoutées depuis la dernière exécution du script
def obtenir_nouvelles_cles(dernier_id):
	connexion = mysql.connector.connect(
    	host='192.168.47.249',
    	user='admin',
    	password='tssnadmin',
    	database='Projet'
	)
	curseur = connexion.cursor()
	requete = "SELECT id, valeur FROM chaine WHERE id > %s"
	curseur.execute(requete, (dernier_id,))
	nouvelles_cles = curseur.fetchall()
	connexion.close()
	return nouvelles_cles

# Fonction pour créer un QR code pour une clé donnée
def creer_qr_code(cle):
	dossier = '/home/goldo/Documents/qrcodes'
	if not os.path.exists(dossier):
    	os.makedirs(dossier)
    
	nom_fichier = f'{cle}.png'
	chemin_qr_code = os.path.join(dossier, nom_fichier)
    
	# Vérifier si le QR code existe déjà
	if os.path.exists(chemin_qr_code):
    	print(f"Le QR code pour la clé '{cle}' existe déjà.")
	else:
    	qr = qrcode.QRCode(
        	version=3,
        	error_correction=qrcode.constants.ERROR_CORRECT_H,
        	box_size=100,  # Remis à 100
        	border=1
    	)
    	qr.add_data(cle)
    	qr.make(fit=True)
    	img = qr.make_image(fill_color="black", back_color="white")
   	 
    	img.save(chemin_qr_code)
    	print(f"QR code pour la clé '{cle}' créé sous : {chemin_qr_code}")

# Récupérer l'ID de la dernière clé traitée
dernier_id_traite = 0

# Boucle principale
while True:
	print("Vérification des nouvelles clés...")
    
	# Obtenir les nouvelles clés depuis la dernière exécution
	nouvelles_cles = obtenir_nouvelles_cles(dernier_id_traite)
    
	if nouvelles_cles:
    	print(f"Nouvelles clés trouvées : {nouvelles_cles}")
	else:
    	print("Aucune nouvelle clé trouvée.")
    
	# Vérifier et créer les QR codes pour les nouvelles clés
	for (id_cle, cle) in nouvelles_cles:
    	creer_qr_code(cle)
    	dernier_id_traite = max(dernier_id_traite, id_cle)
    
	# Attendre avant de vérifier à nouveau (par exemple, toutes les 5 secondes)
	time.sleep(5)
