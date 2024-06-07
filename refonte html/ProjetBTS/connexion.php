<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion</title>
    <link rel="stylesheet" href="css.css">
</head>
<body>
  <header>
    <?php include("header.php") ?>
</header>
    <div class="login-container">
        <h2>Connexion</h2>
        <form action="connexionuser.php" method="POST">
            <div class="input-group">
                <label for="username">Nom d'utilisateur :</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="input-group">
                <label for="password">Mot de passe :</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit">Se connecter</button>
        </form>
        <p>Pas De compte ? <a href="inscription.php">Inscrivez vous !</a></p> 
    </div>
    <footer>
      <p>&copy; 2024 Réservation de Parking</p>
  </footer>
</body>
</html>
