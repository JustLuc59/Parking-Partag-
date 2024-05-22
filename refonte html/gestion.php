<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Réservation de Parking</title>
    <link rel="stylesheet" href="css.css">
</head>
<body>
    <header>
        <?php include("header.php"); 
        if($_SESSION["admin"]==0){
      header('Location: home.php');
    }?>
    </header>
    <div class="tarifs-container">
        <br>
      <h1>GESTION DU PARK</h1>
    <?php 

    
    $sqlMail = "SELECT COUNT(*) as totalMails FROM message";
    $resultMail = $conn->query($sqlMail);
    $totalMails = $resultMail->fetch_assoc()['totalMails'];

    $sqlUser = "SELECT COUNT(*) as totalUsers FROM Projet";
    $resultUser = $conn->query($sqlUser);
    $totalUsers = $resultUser->fetch_assoc()['totalUsers'];

    $sqlPlace = "SELECT COUNT(*) as totalPlaces FROM PLACE";
    $resultPlace = $conn->query($sqlPlace);
    $totalPlaces = $resultPlace->fetch_assoc()['totalPlaces'];
    
    echo'
    <table>
        <tr>
            <th><a href="mailadmin.php">MAIL</a></th>
            <th><a href="placeadmin.php">RESERVATION</a></th>
            <th><a href="userlist.php">UTILISATEUR</a></th>
            <th><a href="#">TARIF</a></th>
        </tr>
        <tr>
            <td>'.$totalMails.'</td>
            <td>'.$totalPlaces.'</td>
            <td>'.$totalUsers.'</td>
            <td>0</td>
        </tr>
    </table>';?>
    </div>




    <footer>
        <p>&copy; 2024 Réservation de Parking</p>
    </footer>
</body>
</html>
