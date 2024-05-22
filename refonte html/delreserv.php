<?php
session_start();
// Inclure le fichier de connexion à la base de données
$serveur = "localhost";//$serveur = "192.168.234.249"; // Adresse du serveur MySQL
$utilisateur = "root";//$utilisateur = "admin"; // Nom d'utilisateur MySQL
$motdepasse = "admin";//$motdepasse = "tssnadmin"; // Mot de passe MySQL
$bdd="Projet";
	
	$conn= new mysqli($serveur,$utilisateur,$motdepasse,$bdd);

// Vérifier si un ID de réservation est passé via la méthode GET
if(isset($_GET['id']) && !empty($_GET['id'])) {
    // Récupérer l'ID de réservation à supprimer
    $reservation_id = $_GET['id'];
    $place=$_GET['place'];

    // Construction de la requête de suppression
    $sql = "DELETE FROM PLACE WHERE ID = $reservation_id";

    // Exécution de la requête
    if ($conn->query($sql) === TRUE) {
        $sql = "UPDATE PARKING SET STATE = '0' WHERE PLACE='$place'";
        $conn->query($sql);
        // Redirection vers la page utilisateur après la suppression
        if($_SESSION["lastp"]){
            header("Location: placeadmin.php");
            exit();
        }else{
        header("Location: User.php");
        exit();
    }
    } else {
        echo "Erreur lors de la suppression de la réservation : " . $conn->error;
    }
} else {
    // Redirection vers la page utilisateur si aucun ID de réservation n'est fourni
    header("Location: User.php");
    exit();
}
?>
