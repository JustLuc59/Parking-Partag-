<?php
session_start();
$ville=$_SESSION["villename"];
$name=$_SESSION["name"];
$_SESSION["reserv"]=0;
$date=date('Y-m-d');
// Récupérer les données envoyées depuis la requête AJAX
$seatReserved = $_POST['seatReserved'];

// Connexion à la base de données MariaDB
include("conn.php");
$conn = new mysqli($serveur,$utilisateur ,$motdepasse,$bdd);

// Vérifier la connexion
if ($conn->connect_error) {
    die("Échec de la connexion à la base de données : " . $conn->connect_error);
}
// Préparer et exécuter la requête SQL pour insérer les données dans la base de données
$sql = "SELECT STATE FROM PARKING WHERE PLACE = '$seatReserved' AND VILLE='$ville'";
$result = $conn->query($sql);
$row = mysqli_fetch_array($result, MYSQLI_ASSOC);

if ($row["STATE"] == 1) {
    // La place est déjà réservée
    echo  "Place déjà réservée";
}else if ($row["STATE"] == 2) {
    // La place est déjà réservée
    echo  "Place déjà occupé";
}  
else if ($row["STATE"] == 0){
    // La place est disponible, vous pouvez procéder à la réservation
    $sql = "INSERT INTO PLACE (NUMPLACE, USER, DATE, VILLE) VALUES ('$seatReserved','$name','$date','$ville')";
    if ($conn->query($sql) === TRUE) {
        echo "Place réservée avec succès !";
        $sql = "UPDATE Projet SET reservation = '1' WHERE username='$name'";
        $conn->query($sql);
        
    } else {
        echo "Erreur lors de la réservation de la place : " . $conn->error;
    }
}

/*$sql = "INSERT INTO PLACE (NUMPLACE,USER) VALUES ('$seatReserved','$name')";
if ($conn->query($sql) === TRUE) {
    echo "Place réservée avec succès !";
} else {
    echo "Erreur lors de la réservation de la place : " . $conn->error;
}*/

// Fermer la connexion à la base de données
$conn->close();
?>
