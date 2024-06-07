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
    include("conn.php");

    // Connexion à la base de données
    $connexion = new mysqli($serveur, $utilisateur, $motdepasse, $bdd);

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

    $sql = "UPDATE inscription SET creation=1";
    $connexion->query($sql);
    $_SESSION["name"] = $username;
    $caracteres = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $longueurMax = strlen($caracteres);
    $chaineAleatoire = '';
    for ($i = 0; $i < 10; $i++)
    {
    $chaineAleatoire .= $caracteres[rand(0, $longueurMax - 1)];
    }
    $sql = "INSERT INTO Projet (username, mail, telephone, ville, IMAT, password, valeur) VALUES ('$username', '$mail', '$telephone', '$ville', '$IMAT', '$password','$chaineAleatoire')";

    if ($connexion->query($sql) === TRUE) {
    
        //echo $chaineAleatoire;
        echo "Inscription réussie!";
        header("Location: home.php");
    } else {
        echo "Erreur lors de l'inscription : " . $connexion->error;
    }
}

    // Fermer la connexion à la base de données
    $connexion->close();
}
?>
