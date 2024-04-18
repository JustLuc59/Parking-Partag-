import mysql.connector
import os
import time

# Fonction pour vérifier si la valeur de création de l'ID 1 est égale à 1 dans la table 'inscription'
def check_creation_value():
	# Nouvelle connexion à la base de données pour récupérer la valeur
	new_db_connection = mysql.connector.connect(
    	host="192.168.234.249",
    	user="admin",
    	password="tssnadmin",
    	database="Projet"
	)

	new_cursor = new_db_connection.cursor()

	# Requête pour récupérer la valeur de création de l'ID 1 dans la table 'renomage'
	sql = "SELECT creation FROM renomage WHERE ID = 1"
	new_cursor.execute(sql)
	result = new_cursor.fetchone()

	new_db_connection.close()

	if result:
    	# Si la valeur est égale à 1, retourne True, sinon False
    	return result[0] == 1
	else:
    	# Si aucun résultat n'est retourné, retourne False par défaut
    	return False

# Fonction pour exécuter le code de renommage et de mise à jour de la base de données
def execute_renaming():
	# Répertoire contenant les fichiers qrcode
	qrcode_directory = "/home/goldo/Documents/qrcodes"

	# Connexion à la base de données
	mydb = mysql.connector.connect(
    	host="192.168.234.249",
    	user="admin",
    	password="tssnadmin",
    	database="Projet"
	)

	# Création du curseur
	mycursor = mydb.cursor()

	# Requête pour récupérer le premier username sans valeur dans la colonne cle
	sql = "SELECT username FROM Projet2 WHERE cle IS NULL LIMIT 1"
	mycursor.execute(sql)
	result = mycursor.fetchone()

	if result:
    	username = result[0]
    	# Vérifier si le fichier qrcode existe
    	qrcode_files = [f for f in os.listdir(qrcode_directory) if f.startswith("qrcode_")]
    	if qrcode_files:
        	# Récupérer le premier fichier qrcode à renommer
        	qrcode_filename = qrcode_files[0]
        	old_qrcode_path = os.path.join(qrcode_directory, qrcode_filename)
        	# Nouveau nom de fichier
        	new_qrcode_filename = f"qr_{username}.png"
        	new_qrcode_path = os.path.join(qrcode_directory, new_qrcode_filename)
        	# Renommer le fichier qrcode
        	os.rename(old_qrcode_path, new_qrcode_path)
        	print(f"Le fichier {qrcode_filename} a été renommé en {new_qrcode_filename}.")

        	# Mettre à jour la colonne cle dans la base de données
        	sql_update_cle = "UPDATE Projet2 SET cle = %s WHERE username = %s"
        	mycursor.execute(sql_update_cle, (new_qrcode_filename, username))
        	mydb.commit()
        	print(f"La colonne cle de l'utilisateur {username} a été mise à jour avec la valeur {new_qrcode_filename}.")
    	else:
        	print("Aucun fichier 'qrcode_' trouvé dans le répertoire.")

	else:
    	print("Aucun username trouvé sans valeur dans la colonne cle.")

	# Mettre à jour la colonne 'creation' de la table 'renomage' à 0
	sql_update_creation = "UPDATE renomage SET creation = 0 WHERE ID = 1"
	mycursor.execute(sql_update_creation)
	mydb.commit()

	# Fermer la connexion à la base de données
	mydb.close()

# Boucle infinie pour maintenir le script en écoute et l'exécuter toutes les 5 secondes
while True:
	# Vérifie si la valeur de création de l'ID 1 est égale à 1
	if check_creation_value():
    	# Si c'est le cas, exécute le code de renommage et de mise à jour de la base de données
    	execute_renaming()
	else:
    	print("La valeur de création de l'ID 1 dans la table 'renomage' n'est pas égale à 1. Le programme ne s'exécutera pas.")

	# Attends 5 secondes avant la prochaine exécution
	time.sleep(5)
