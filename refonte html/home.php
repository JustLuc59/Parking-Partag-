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
    <div class="test">
        <br>
      <h1>Bienvenue sur ColbertPark</h1>
        <br>
      <div id="Placeholder">
        <div class="img">
            <img src="0601581415921-web-tete.jpg" width="100%" height="120%"/>
            <div class="txt">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam, nulla sed accumsan efficitur, massa odio elementum eros, a aliquam lorem risus eu nunc. Ut pulvinar magna vitae diam pharetra, et maximus velit euismod. Praesent pretium ac purus ut blandit. Fusce tristique turpis magna, vel dapibus justo suscipit quis. Vestibulum enim nulla, lacinia a lacus sit amet, finibus tempor enim. Nullam lobortis dolor id interdum convallis. Vestibulum maximus eros at felis consectetur, at tempus dui suscipit. Nam et molestie tellus, in semper enim. Maecenas tempor posuere ultrices. Donec a scelerisque ex, nec sodales tellus. Quisque vestibulum congue eros, sed fringilla massa dictum at. Donec bibendum faucibus tellus at faucibus. Suspendisse placerat viverra est a molestie.
            </div>
        </div>
      </div>
      <br><br><br><br>
      <?php 
      if(isset($_SESSION["name"])){
        echo'<a class="breserv" href="choixparking.php">Réservez votre place ici</a>';
      }
      else{
        echo'<a class="breserv" href="connexion.php">Réservez votre place ici</a>';
      }
      ?>
    </div>




    <footer>
        <p>&copy; 2024 Réservation de Parking</p>
    </footer>
</body>
</html>
