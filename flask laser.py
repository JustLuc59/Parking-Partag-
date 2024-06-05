from flask import Flask, request, jsonify
import mysql.connector
from mysql.connector import Error

app = Flask(__name__)

# Connexion à la base de données MySQL
try:
    db = mysql.connector.connect(
        host="192.168.164.249",  # Adresse IP du serveur MySQL
        user="admin",            # Nom d'utilisateur MySQL
        password="tssnadmin",    # Mot de passe MySQL
        database="Projet"        # Nom de la base de données MySQL
    )
    cursor = db.cursor()

    # Créer la table si elle n'existe pas
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS lasersensor (
            id INT AUTO_INCREMENT PRIMARY KEY,
            distance_mm INT,
            PLACE VARCHAR(50)
        )
    """)
    db.commit()
except Error as e:
    print(f"Error connecting to MySQL Platform: {e}")

@app.route('/measurements', methods=['POST'])
def receive_data():
    if request.is_json:
        data = request.json  # Les données envoyées par l'ESP32
        distance_mm = data.get('distance_mm')

        try:
            distance_mm = int(distance_mm)
        except ValueError:
            return jsonify(error="Invalid 'distance_mm' value. Must be an integer.")

        if distance_mm is not None and distance_mm <= 50000:  # Vérifie si la distance est <= 50 mm
            try:
                # Mettre à jour la valeur dans la base de données où PLACE est 'A4'
                update_query = "UPDATE lasersensor SET distance_mm = %s WHERE PLACE = 'A4'"
                values = (distance_mm,)
                cursor.execute(update_query, values)
                db.commit()

                return jsonify(message="Data received and updated successfully!")
            except Error as e:
                return jsonify(error=f"Failed to update data in MySQL table: {e}")
        else:
            return jsonify(error="'distance_mm' field is missing or greater than 50 in the received data.")
    else:
        return jsonify(error="Request data is not in JSON format.")

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
