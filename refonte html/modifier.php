<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier Utilisateur</title>
    <link rel="stylesheet" href="css.css">
</head>
<body>
<header>
    <?php include("header.php") ?>
</header>
    <div class="login-container">
    <h2>Modifier Utilisateur</h2>
    <form action="modifierutilisateur.php" method="post">
    <div class="input-group">
        <label for="new_username">Nouvel username:</label><br>
        <input type="text" id="new_username" name="new_username"><br><br>

        <label for="new_email">Nouvel email:</label><br>
        <input type="email" id="new_email" name="new_email"><br><br>


        <label for="new_tel">Nouveau numéro:</label><br>
        <input type="tel" id="new_Telephone" name="new_Telephone" pattern="[0-9]{2}[0-9]{2}[0-9]{2}[0-9]{2}[0-9]{2}" ><br><br>

        <label for="new_ville">Nouvelle Ville:</label><br>
        <input type="text" id="new_ville" name="new_ville" ><br><br>

        <label for="new_Imat">N° Imatriculation : (AA229AA)</label>
        <input type="text" id="new_Imat" name="new_Imat" pattern="[A-Z]{2}[0-9]{3}[A-Z]{2}" ><br><br>

        <label for="new_password">Nouveau mot de passe :</label>
        <input type="password" id="new_password" name="new_password" ><br><br>

        <input type="submit" value="Modifier">
    </div>
    </form>

</div>
<footer>
      <p>&copy; 2024 Réservation de Parking</p>
  </footer>
</body>
</html>
