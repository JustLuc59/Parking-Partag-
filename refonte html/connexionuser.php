<?php
session_start();

// Vérifier si le formulaire a été soumis
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Récupérer les données du formulaire
    $username = $_POST["username"];
    $password = $_POST["password"];

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

    // Requête SQL pour vérifier les informations d'identification
    $sql = "SELECT * FROM Projet WHERE username='$username' AND password='$password'";
    $resultat = $connexion->query($sql);

    // Vérifier si l'utilisateur existe dans la base de données
    if ($resultat->num_rows > 0) {
    	$_SESSION["name"]=$username;
        // L'utilisateur est authentifié, rediriger vers une page sécurisée
        header("Location: home.php");
        exit;
    } else {
        // L'utilisateur n'est pas authentifié, afficher un message d'erreur
        echo "Nom d'utilisateur ou mot de passe incorrect.";
    }

    // Fermer la connexion à la base de données
    $connexion->close();
}
?>
