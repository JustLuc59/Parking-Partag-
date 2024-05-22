<?php
include ("header.php");
// Connexion à la base de données
$servername = "localhost";
$username = "root";
$password = "admin";
$database = "Projet";

$conn = new mysqli($servername, $username, $password, $database);

// Vérification de la connexion
if ($conn->connect_error) {
    die("La connexion a échoué : " . $conn->connect_error);
}

$username=$_SESSION["name"];
$mail=$_SESSION["mail"];
$tel=$_SESSION["tel"];
$ville=$_SESSION["ville"];
$Imat=$_SESSION["Imat"];
$Password=$_SESSION["password"];
$new_username = $_POST['new_username'];
$new_email = $_POST['new_email'];
$new_Telephone  = $_POST['new_Telephone'];
$new_ville  = $_POST['new_ville'];
$new_Imat  = $_POST['new_Imat'];
$new_password  = $_POST['new_password'];

if(empty($_POST['new_username'])){
    $new_username=$username;
}
if(empty($_POST['new_email'])){
    $new_email=$mail;
}
if(empty($_POST['new_Telephone'])){
    $new_Telephone=$tel;
}
if(empty($_POST['new_ville'])){
    $new_ville=$ville;
}
if(empty($_POST['new_Imat'])){
    $new_Imat=$Imat;
}
if(empty($_POST['new_password'])){
    $new_password=$Password;
}

echo $new_username,', ',$new_email,', ',$new_Telephone, ', ',$new_ville, ', ', $new_Imat,', ',$new_password;
$sql_check_username = "SELECT * FROM Projet WHERE username='$new_username'";
echo $sql_check_username;
$result_check_username = $conn->query($sql_check_username);
if($new_username!=$username){
    echo "test";
    if ($result_check_username->num_rows > 0) {
        // Un compte avec le même nom d'utilisateur existe déjà
        echo "Un compte avec le même nom d'utilisateur existe déjà.";
        header("Location: User.php");
        exit;
    }
}

// Requête SQL pour mettre à jour les informations de l'utilisateur
$sql = "UPDATE Projet SET username='$new_username', mail='$new_email', telephone='$new_Telephone', ville='$new_ville', IMAT='$new_Imat', password='$new_password' WHERE username='$username'";
echo $sql;
if ($conn->query($sql) === TRUE) {
    echo "Les informations de l'utilisateur ont été mises à jour avec succès.";
    $_SESSION['name']=$new_username;
    $sql ="UPDATE PLACE SET USER='$new_username' WHERE USER='$username'";
    $conn->query($sql);
} else {
    echo "Erreur lors de la mise à jour des informations de l'utilisateur : " . $conn->error;
}
header("Location: User.php");
// Fermeture de la connexion à la base de données
$conn->close();
?>
