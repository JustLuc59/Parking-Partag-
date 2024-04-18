import cv2
import numpy as np
import pyzbar.pyzbar as pyzbar
import requests
import mysql.connector

# Connexion à la base de données MySQL/MariaDB
conn = mysql.connector.connect(
	host="192.168.234.249",
	user="admin",
	password="tssnadmin",
	database="Projet"
)
cursor = conn.cursor()

# Création de la table si elle n'existe pas
cursor.execute('''CREATE TABLE IF NOT EXISTS qrcodes (id INT AUTO_INCREMENT PRIMARY KEY, data TEXT)''')

# URL de la caméra
url = 'http://192.168.234.16/'

# Paramètres d'affichage
font = cv2.FONT_HERSHEY_PLAIN
cv2.namedWindow("live transmission", cv2.WINDOW_AUTOSIZE)

# Variables de contrôle des QR codes précédents et actuels
prev = ""
pres = ""

while True:
	try:
    	# Récupération de l'image de la caméra
    	img_resp = requests.get(url + 'cam-hi.jpg', timeout=5)  # Augmentez le délai d'attente (en secondes) si nécessaire
    	img_bytes = img_resp.content
    	imgnp = np.array(bytearray(img_bytes), dtype=np.uint8)
    	frame = cv2.imdecode(imgnp, -1)

    	# Détection des QR codes dans l'image
    	decodedObjects = pyzbar.decode(frame)

    	for obj in decodedObjects:
        	pres = obj.data.decode('utf-8')  # Convertir bytes en str

        	# Si le QR code actuel est différent du précédent, l'ajouter à la base de données
        	if prev != pres:
            	print("Type:", obj.type)
            	print("Data:", pres)

            	try:
                	# Insérer la valeur du QR code dans la base de données
                	cursor.execute("INSERT INTO qrcodes (data) VALUES (%s)", (pres,))
                	conn.commit()
            	except Exception as e:
                	print("Erreur lors de l'insertion dans la base de données:", e)

            	# Mettre à jour la variable précédente
            	prev = pres

        	# Dessiner le texte du QR code sur l'image
        	cv2.putText(frame, str(obj.data), (50, 50), font, 2, (255, 0, 0), 3)

    	cv2.imshow("live transmission", frame)

    	key = cv2.waitKey(1)
    	if key == 27:
        	break
	except Exception as e:
    	print("Erreur lors de la récupération de l'image:", e)

# Fermer la connexion à la base de données et détruire la fenêtre OpenCV
conn.close()
cv2.destroyAllWindows()
