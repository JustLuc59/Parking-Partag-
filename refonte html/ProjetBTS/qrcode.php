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
       session_start();
        ?>
    </header>
    <div class="map">
        <img src="qrcodes/<?php echo $_SESSION["chaine"];?>.png" width="300" height="300"/>
        <style>
</style>   
    </div>

</body>
</html>