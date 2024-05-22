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
        $url = basename($_SERVER['PHP_SELF']);
        $query = $_SERVER['QUERY_STRING'];
        if($query){
        $url .= "?".$query;
        }
        $_SESSION['current_page'] = $url;
                $previous_page = $_SESSION['current_page']; 
                $_SESSION["lastp"]=$previous_page;
                if(!isset($_SESSION["admin"])){
                    header('Location: home.php');
                  } 
                ?>
        
    </header>
    <div class="test">
        <?php 
                $sql="SELECT * FROM PLACE";
                $result = $conn->query($sql);
                if ($result->num_rows > 0) {
                    echo'<div class="tarifs-container">
                    <table>
                        <tr>
                            <th>PARKING</th>
                            <th>PLACE</th>
                            <th>UTILISATEUR</th>
                            <th>DATE</th>
                            <th>ETAT</th>
                            <th>DEL</th>
                        </tr>';
                    // Récupérer la première ligne de résultat
                    while($row = $result->fetch_assoc()){
                    $nom=$row["USER"];
                    $date=$row["DATE"];
                    $place=$row["NUMPLACE"];
                    $PARKING=$row["VILLE"];
                    

                        echo'<tr>
                            <td>'.$PARKING.'</td>
                            <td>'.$place.'</td>
                            <td>'.$nom.'</td>
                            <td>'.$date.'</td>';?>
                           <td><?php 
                                $sql2="SELECT * FROM PARKING WHERE VILLE ='$PARKING' AND PLACE ='$place'";
                                $result2 = $conn->query($sql2);
                                $row2 = $result2->fetch_assoc();

                                $state=$row2["STATE"];
                                //echo $state;
                                if($state==1){
                                    echo "réservé";
                                }else{
                                    echo "occupé";
                                }                  
                            
                            ?></td>
                            <td><a href="delreserv.php?id=<?php echo $row['ID'];?>&amp;place=<?php echo $row["NUMPLACE"];?>" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette réservation ?');"><button>DEL</button></a></td>
                        <?php echo '</tr>';
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
