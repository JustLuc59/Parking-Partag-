from flask import Flask, request
import mysql.connector

app = Flask(__name__)

# Connexion à la base de données MySQL
db = mysql.connector.connect(
    host="192.168.60.249",  # Adresse IP du serveur MySQL
    user="admin",           # Nom d'utilisateur MySQL
    password="tssnadmin",   # Mot de passe MySQL
    database="Projet"       # Nom de la base de données MySQL
)
cursor = db.cursor()

@app.route('/measurements', methods=['POST'])
def receive_data():
    if request.is_json:
        data = request.json  # Les données envoyées par l'ESP32
        distance_cm = data.get('distance_cm')
        if distance_cm is not None:
            # Insérer les données dans la base de données
            query = "INSERT INTO Mesures (distance_cm) VALUES (%s)"
            values = (distance_cm,)
            cursor.execute(query, values)
            db.commit()

            # Mettre à jour la valeur de la colonne "En_Attente" dans la table "Ecoute"
            update_query = "UPDATE Ecoute SET Nouveau_Colonne = 1 WHERE ID = 1"
            cursor.execute(update_query)
            db.commit()

            # Vérifier la nouvelle valeur de la colonne "Nouveau_Colonne"
            check_nouveau_colonne()

            return "Data received and stored successfully!"
        else:
            return "Error: 'distance_cm' field is missing in the received data."
    else:
        return "Error: Request data is not in JSON format."

def check_nouveau_colonne():
    try:
        select_query = "SELECT Nouveau_Colonne FROM Ecoute WHERE ID = 1"
        cursor.execute(select_query)
        result = cursor.fetchone()
        if result:
            nouveau_colonne_value = result[0]
            print(f"Valeur actuelle de Nouveau_Colonne : {nouveau_colonne_value}")
        else:
            print("Aucun enregistrement trouvé dans la table Ecoute avec l'ID 1.")
    except mysql.connector.Error as err:
        print(f"Erreur lors de la récupération de la valeur de 'Nouveau_Colonne': {err}")

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
