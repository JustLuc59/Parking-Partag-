<?php
header('Content-type: application/json');

// Inclure le fichier de configuration de la base de données
include_once '../config/Database.php';

// Récupérer les données JSON envoyées depuis l'application Android
$json = json_decode(file_get_contents('php://input'), true);

// Vérifier si le nom d'utilisateur a été envoyé depuis l'application Android
if (isset($json['username'])) {
    // Récupérer le nom d'utilisateur envoyé depuis l'application Android
    $username = $json['username'];

    // Connexion à la base de données
    try {
        $database = new PDO('mysql:host=localhost;dbname=bddapp;charset=utf8;', 'superadmin', 'superadmin');
        $database->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Requête SQL pour récupérer les informations de l'utilisateur
        $sql = "SELECT usercity, usermail, userphone, usernumberplate FROM users WHERE username = :username";
        $stmt = $database->prepare($sql);
        $stmt->bindParam(':username', $username);
        $stmt->execute();

        // Vérifier si des résultats ont été trouvés
        if ($stmt->rowCount() > 0) {
            // Renvoyer les informations sous forme de tableau JSON
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            echo json_encode($row);
        } else {
            // Si aucun utilisateur trouvé avec ce nom d'utilisateur
            echo json_encode(array("message" => "Aucun utilisateur trouvé avec ce nom d'utilisateur"));
        }
    } catch (PDOException $e) {
        // En cas d'erreur de connexion à la base de données
        echo json_encode(array("message" => "Erreur de connexion à la base de données : " . $e->getMessage()));
    }
} else {
    // Si le nom d'utilisateur n'a pas été envoyé depuis l'application Android
    echo json_encode(array("message" => "Nom d'utilisateur non spécifié"));
}
?>
