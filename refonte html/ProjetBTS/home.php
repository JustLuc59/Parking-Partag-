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
            Trouver un stationnement en ville peut parfois être un véritable casse-tête. Mais ne vous inquiétez pas, nous sommes là pour simplifier votre expérience de stationnement urbain.

<br>Avec ColbertPark, trouver une place de stationnement n'a jamais été aussi facile. Que vous ayez besoin d'un stationnement pour quelques heures ou plusieurs jours, notre plateforme conviviale vous permet de réserver rapidement et en toute sécurité une place de stationnement dans votre quartier ou à proximité de votre destination.

Notre réseau de parkings partagés offre des solutions de stationnement pratiques, abordables et respectueuses de l'environnement. En partageant les places de stationnement inutilisées, nous contribuons à réduire la congestion urbaine et les émissions de CO2, tout en offrant une solution de stationnement flexible et accessible à tous.

<br>Dites adieu aux tracas de la recherche de stationnement et rejoignez dès aujourd'hui la communauté ColbertPark ! Ensemble, nous pouvons rendre les déplacements en ville plus simples, plus durables et plus agréables pour tous.</div>
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
