<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tarifs Parking</title>
    <link rel="stylesheet" href="css.css">
</head>
<body>
  <header>
    <?php include("header.php") ?>
</header>
    <div class="tarifs-container">
        <h2>Tarifs de Stationnement</h2>
        <table>
            <tr>
                <th>Type de Véhicule</th>
                <th>Tarif par Heure</th>
                <th>Tarif Journalier</th>
            </tr>
            <tr>
                <td>Voiture</td>
                <td>€2.50</td>
                <td>€15.00</td>
            </tr>
            <tr>
                <td>Camionnette</td>
                <td>€3.00</td>
                <td>€20.00</td>
            </tr>
            <tr>
              <td>Voiture+remorque</td>
              <td>€3.00</td>
              <td>€20.00</td>
          </tr>
        </table>
    </div>
    <footer>
      <p>&copy; 2024 Réservation de Parking</p>
  </footer>
</body>
</html>
