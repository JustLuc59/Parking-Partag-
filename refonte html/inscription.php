<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription</title>
    <link rel="stylesheet" href="css.css">
</head>
<body>
  <header>
    <?php include("header.php") ?>
</header>
    <div class="login-container">
        <h2>Inscription</h2>
        <form action="registeruser.php" method="POST">
            <div class="input-group">
                <label for="username">Nom d'utilisateur :</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="input-group">
                <label for="Mail">Mail :</label>
                <input type="email" id="Mail" name="Mail" required>
            </div>
            <div class="input-group">
                <label for="Telephone">Téléphone : (0612345678)</label>
                <input type="tel" id="Telephone" name="Telephone" pattern="[0-9]{2}[0-9]{2}[0-9]{2}[0-9]{2}[0-9]{2}" required>
            </div>
            <div class="input-group">
                <label for="Ville">Ville : </label>
                <input type="text" id="Ville" name="Ville" required>
            </div>
            <div class="input-group">
                <label for="Imat">N° Imatriculation : (AA229AA)</label>
                <input type="text" id="Imat" name="Imat" pattern="[A-Z]{2}[0-9]{3}[A-Z]{2}" required>
            </div>
            <div class="input-group">
                <label for="password">Mot de passe :</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit">S'inscrire</button>
        </form>
    </div>
    <footer>
      <p>&copy; 2024 Réservation de Parking</p>
  </footer>
</body>
</html>
