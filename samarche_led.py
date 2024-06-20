from flask import Flask, jsonify
import mysql.connector

app = Flask(__name__)

# Connexion à la base de données MySQL
def connect_to_database():
    return mysql.connector.connect(
        host="192.168.60.249",  # Adresse IP du serveur MySQL
        user="admin",           # Nom d'utilisateur MySQL
        password="tssnadmin",   # Mot de passe MySQL
        database="Projet"       # Nom de la base de données MySQL
    )

# Fonction pour récupérer l'état actuel de la LED depuis la base de données
def get_led_state_from_database():
    db = connect_to_database()
    cursor = db.cursor()
    cursor.execute("SELECT barriere FROM Ecoute WHERE ID = 1")
    result = cursor.fetchone()
    db.close()  # Fermer la connexion à la base de données
    if result is not None:
        return result[0]
    else:
        return 0  # Si aucune donnée n'est trouvée, retourner l'état 0 par défaut

# Route pour récupérer l'état actuel de la LED
@app.route('/led_state', methods=['GET'])
def get_led_state():
    led_state = get_led_state_from_database()
    return jsonify({"led_state": led_state})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
