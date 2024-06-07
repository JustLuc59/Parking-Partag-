<?php
session_start();
include("conn.php");
// Vérifier si le formulaire a été soumis
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Récupérer les données du formulaire
    $username = $_POST["username"];
    $password = $_POST["password"];

    echo $username ,',', $password,"/";

  

    // Connexion à la base de données
    //$connexion = new mysqli($serveur, $utilisateur, $motdepasse, $bdd);

    // Vérification de la connexion
    if ($connexion->connect_error) {
        die("Échec de la connexion à la base de données : " . $connexion->connect_error);
    }

    // Requête SQL pour vérifier les informations d'identification
    $sql = "SELECT * FROM Projet WHERE username='$username' AND password='$password'";
    //echo $sql;
    $resultat = $connexion->query($sql);
    //echo $resultat->num_rows ," test";

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
