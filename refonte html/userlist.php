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
                if(!isset($_SESSION["admin"])){
                    header('Location: home.php');
                  }  

        ?>
    </header>
    <div class="test">
        <?php 
                $sql="SELECT * FROM Projet";
                $result = $conn->query($sql);
                if ($result->num_rows > 0) {
                    echo'<div class="tarifs-container">
                    <h2>Utilisateur</h2>
                    <table>
                        <tr>
                            <th>Nom</th>
                            <th>Mail</th>
                            <th>Ville</th>
                            <th>Téléphone</th>
                        </tr>';
                    // Récupérer la première ligne de résultat
                    while($row = $result->fetch_assoc()){
                    $nom=$row["username"];
                    $date=$row["ville"];
                    $mail=$row["mail"];
                    $nbr=$row["telephone"];
                    

                        echo'<tr>
                            <td>'.$nom.'</td>
                            <td>'.$mail.'</td>
                            <td>'.$date.'</td>
                            <td>'.$nbr.'</td>
                        </tr>';
                }
                
                }
                echo'</table>
                </div>';
        ?>

    </div>




    <footer>
        <p>&copy; 2024 Réservation de Parking</p>
    </footer>
</body>
</html>
