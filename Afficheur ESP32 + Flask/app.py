from flask import Flask, request, jsonify
import mysql.connector
from mysql.connector import Error

app = Flask(__name__)

# Configuration de la base de données
db_config = {
    'host': '192.168.47.249',
    'user': 'root',
    'password': 'tssnadmin',
    'database': 'Projet'
}

def get_db_connection():
    return mysql.connector.connect(**db_config)


@app.route('/')
def index():
    return "Server is running!"

@app.route('/data', methods=['GET'])
def get_data():
    try:
        connection = get_db_connection()
        cursor = connection.cursor(dictionary=True)
        cursor.execute("SELECT * FROM Ecoute")
        result = cursor.fetchall()
        return jsonify(result), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
