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
        if(!isset($_SESSION["name"])){
            header('Location: home.php');
          } ?>
    </header>
    <div class="test">

      <?php 

            
                $sql="SELECT * FROM PARKING";
                $result = $conn->query($sql);
                if ($result->num_rows > 0) {
                    echo'<div class="tarifs-container">
                    <h2>PARKING</h2>
                    <table>
                        <tr>
                            <th>VILLE</th>
                            <th>PLACE DISPONIBLE</th>
                        </tr>';
                    // Récupérer la première ligne de résultat
                    $prev='';
                    $prev1='';
                    while($row = $result->fetch_assoc()){
                    $nom=$row["VILLE"];
                    $sqlMail = "SELECT COUNT(*) as totalplace FROM PARKING WHERE VILLE='$nom' AND STATE=0";
                    $resultplace = $conn->query($sqlMail);
                    $totalplace = $resultplace->fetch_assoc()['totalplace'];
                    if($nom != $prev && $nom != $prev1){
                        echo'<tr>
                            <td><a href="reserv.php?ville='.$nom.'"</a>'.$nom.'</td>
                            <td>'.$totalplace.'/10</td>
                        </tr>';
                        $prev1=$prev;
                        $prev=$nom;
                        
                    }
                }
                
                }
                echo'</table>
                </div>';
        ?>
        <?php if($_SESSION["reserv"]==1){
      header("Location:404.php");
    }?>



    <footer>
        <p>&copy; 2024 Réservation de Parking</p>
    </footer>
</body>
</html>
