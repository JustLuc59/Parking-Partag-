<?php
session_start();
// Vérifier si le formulaire a été soumis
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Récupérer les données du formulaire
    $username = $_POST["username"];
    $mail = $_POST["Mail"];
    $telephone = $_POST["Telephone"];
    $ville = $_POST["Ville"];
    $password = $_POST["password"];
    $IMAT= $_POST["Imat"];

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
// Requête SQL pour vérifier si un compte avec le même nom d'utilisateur existe déjà
$sql_check_username = "SELECT * FROM Projet WHERE username='$username'";
$result_check_username = $connexion->query($sql_check_username);

if ($result_check_username->num_rows > 0) {
    // Un compte avec le même nom d'utilisateur existe déjà
    echo "Un compte avec le même nom d'utilisateur existe déjà.";
} else {
    // Aucun compte avec le même nom d'utilisateur, procéder à l'inscription
    $sql = "INSERT INTO Projet (username, mail, telephone, ville, IMAT, password) VALUES ('$username', '$mail', '$telephone', '$ville', '$IMAT', '$password')";

    if ($connexion->query($sql) === TRUE) {
        echo "Inscription réussie!";
        $_SESSION["name"] = $username;
        header("Location: home.php");
    } else {
        echo "Erreur lors de l'inscription : " . $connexion->error;
    }
}

    // Fermer la connexion à la base de données
    $connexion->close();
}
?>
