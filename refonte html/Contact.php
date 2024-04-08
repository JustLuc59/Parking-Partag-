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
      <h1>Contact</h1>

        <div class="contact-container">
            <h2>Nous Contacter</h2>
            <form action="msg.php" method="POST">
                <div class="input-group">
                    <label for="name">Nom :</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="input-group">
                    <label for="email">Email :</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="input-group">
                    <label for="message">Message :</label>
                    <textarea id="message" name="message" rows="5" style="width: 100%;" required></textarea>
                </div>
                <button type="submit">Envoyer</button>
            </form>
        </div>
       <h1>TEST</h1>
    </div>
    <footer>
        <p>&copy; 2024 Réservation de Parking</p>
    </footer>
</body>
</html>
