<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mon Profil</title>
    <link rel="stylesheet" href="css.css">
</head>
<body>
    <header>
    <?php include("header.php"); 
    if(!isset($_SESSION["name"])){
        header('Location: home.php');
      }
    ?>
    
    </header>
    <div class="profile">
        <div class="info">
            <?php echo'<h2>'.$_SESSION["name"].'</h2>'; 
            echo"<p>Email: ".$_SESSION["mail"]."</p>";
            echo"<p>Téléphone: ".$_SESSION["tel"]."</p>";
            echo"<p>Ville: ".$_SESSION["ville"]."</p>" ?>
        </div>
    </div>


    <div class="tarifs-container">
        <h2>Réservation</h2>
        <?php 
                $name = $_SESSION["name"];
                $sql="SELECT * FROM PLACE WHERE USER = '$name'";
                $result = $conn->query($sql);
                if ($result->num_rows > 0) {
                    echo'
                    <table>
                        <tr>
                            <th>Place réservé : </th>
                            <th>Date : </th>
                            <th>Ville : </th>
                            <th>Retirer reservation</th>
                        </tr>';
                    // Récupérer la première ligne de résultat
                    while($row = $result->fetch_assoc()){
                    $place=$row["NUMPLACE"];
                    $date=$row["DATE"];
                    $ville=$row["VILLE"];

                        echo'<tr>
                            <td>'.$place.'</td>
                            <td>'.$date.'</td>
                            <td>'.$ville.'</td>';?>
                            <td><a href="delreserv.php?id=<?php echo $row['ID']; ?>&amp;place=<?php echo $row["NUMPLACE"];?>" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette réservation ?');"><button>DEL</button></a></td>
                        <?php echo'</tr>';
                }
                
                }
                echo'</table>';
        ?>
    </div>

    <footer>
      <p>&copy; 2024 Réservation de Parking</p>
    </footer>
</body>
</html>
