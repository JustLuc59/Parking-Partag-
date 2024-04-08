<?php
// Vérifier si le formulaire a été soumis
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Récupérer les données du formulaire
    $name = $_POST["name"];
    $mail = $_POST["email"];
    $msg = $_POST["message"];
    $today = date("Y-m-d H:i:s");  

    // Paramètres de connexion à la base de données
    $serveur = "localhost"; // Adresse du serveur MySQL
    $utilisateur = "root"; // Nom d'utilisateur MySQL
    $motdepasse = "admin"; // Mot de passe MySQL
    $base_de_donnees = "Projet"; // Nom de la base de données MySQL

    // Connexion à la base de données
    $connexion = new mysqli($serveur, $utilisateur, $motdepasse, $base_de_donnees);

    // Vérification de la connexion
    if ($connexion->connect_error) {
        die("Échec de la connexion à la base de données : " . $connexion->connect_error);
    }

    // Requête SQL pour insérer les données dans la base de données
    $sql = "INSERT INTO message (USER, DATE, MAIL, MSG) VALUES ('$name', '$today', '$mail', '$msg')";

    if ($connexion->query($sql) === TRUE) {
        echo "Message envoyé";
        $_SESSION["name"]=$username;
        header("Location:home.php");
    } else {
        echo "Erreur: " . $connexion->error;
    }

    // Fermer la connexion à la base de données
    $connexion->close();
}
?>
