<?php
session_start();
// Inclure le fichier de connexion à la base de données
include("conn.php");
$_SESSION["reserv"]=0;
$user=$_SESSION["name"];
	$conn= new mysqli($serveur,$utilisateur,$motdepasse,$bdd);
    $serveur2 = "192.168.60.235"; // Adresse du serveur MySQL
    $utilisateur2 = "superadmin"; // Nom d'utilisateur MySQL
    $motdepasse2 = "superadmin"; // Mot de passe MySQL
    $bdd2="bddapp";
    $conn2= new mysqli($serveur2,$utilisateur2,$motdepasse2,$bdd2);

// Vérifier si un ID de réservation est passé via la méthode GET
if(isset($_GET['id']) && !empty($_GET['id'])) {
    // Récupérer l'ID de réservation à supprimer
    $reservation_id = $_GET['id'];
    $place=$_GET['place'];

    // Construction de la requête de suppression
    $sql = "DELETE FROM PLACE WHERE ID = $reservation_id";
    $sql2 = "DELETE FROM place WHERE ID = $reservation_id";

    // Exécution de la requête
    if ($conn->query($sql) === TRUE && $conn2->query($sql2) === TRUE) {
        $sql = "UPDATE PARKING SET STATE = '0' WHERE PLACE='$place'";
        $conn->query($sql);
        $sql = "UPDATE Projet SET reservation = '0', entree ='0' WHERE username='$user'";
        $conn->query($sql);
        $sql2 = "UPDATE parking SET STATE = '0' WHERE PLACE='$place'";
        $conn->query($sql2);
        $sql2 = "UPDATE users SET reservation = '0', entree ='0' WHERE username='$user'";
        $conn->query($sql2);
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
