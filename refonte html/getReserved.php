<?php
// Connexion à la base de données MariaDB
$conn = new mysqli("localhost", "root ", "admin", "Projet");

// Vérifier la connexion
if ($conn->connect_error) {
    die("Échec de la connexion à la base de données : " . $conn->connect_error);
}

// Récupérer les places déjà réservées depuis la base de données
$sql = "SELECT NUMPLACE FROM PLACE";
$result = $conn->query($sql);

$reservedSeats = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $reservedSeats[] = $row['NUMPLACE'];
    }
}

// Fermer la connexion à la base de données
$conn->close();

// Renvoyer les données au format JSON
header('Content-Type: application/json');
echo json_encode($reservedSeats);
?>
