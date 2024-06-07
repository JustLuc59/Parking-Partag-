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
        <?php include("header.php") ?>
    </header>
    <div class="tarifs-container">
        <ul>
        <?php if(!isset($_SESSION["name"])){
                	echo'<li><a href="connexion.php">Inscription / Connexion</a></li>';
                }?>
            <br>
            <li><a href="tarif.php">Tarifs</a></li>
            <br>
            <li><a href="Parking.php">Voir nos parking</a></li>
            <br>
            <?php if(isset($_SESSION["name"])){
        echo'<li><a href="choixparking.php">Réservation</a></li>';
      }
      else{
        echo'<li><a href="connexion.php">Réservation</a></li>';
      }
      ?>
        </ul>
    </div>




    <footer>
        <p>&copy; 2024 Réservation de Parking</p>
    </footer>
</body>
</html>
