<?php 
     
     include("conn.php");

	
	if (!$conn) {
	echo "Connection Error".mysqli_connect_errno();
	die();
	} 
    session_start();
	
    if(isset($_SESSION["name"])){
        $name=$_SESSION["name"];
        $sql="SELECT * FROM Projet WHERE username='$name'";
        $result = $conn->query($sql);
        //echo $_SESSION['name'];

    if ($result->num_rows > 0) {
        // Récupérer la première ligne de résultat
        $row = $result->fetch_assoc();

        // Stocker les valeurs dans des variables de session
        $_SESSION["mail"] = $row["mail"];
        $_SESSION["tel"] = $row["telephone"];
        $_SESSION["ville"] = $row["ville"];
        $_SESSION["Imat"] = $row["IMAT"];
        $_SESSION["password"] = $row["password"];
        $_SESSION["admin"] = $row["ADMIN"];
        $_SESSION["chaine"]=$row["valeur"];


        $sql="SELECT * FROM PLACE WHERE USER='$name'";
        //echo $sql;
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {$_SESSION["reserv"]=1;}
        else{$_SESSION["reserv"]=0;}
        //echo $_SESSION["reserv"];
        // Vous pouvez stocker d'autres valeurs de la même manière
        $sql="SELECT * FROM Projet";
        //echo $sql;
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()){
            if($row["reservation"]+$row["entree"]+$row["sortie"]==3){
                $id=$row['ID'];
                $sql="UPDATE Projet SET reservation ='0',entree='0',sortie='0' WHERE ID='$id'";
                $result = $conn->query($sql);
                header("Refresh:0");

            }
        }
        }
    } else {
        echo "Aucun résultat trouvé pour cet utilisateur.";
    }
    }
?>

<?php if(isset($_SESSION["name"])){
                	echo'<a href="User.php"><img class="ppuser" src="ppuser.png"/></a>';
        }?>
<h1>Réservez Votre Place de Parking</h1>
        <p>Facile, Rapide et Sécurisé</p>
        <nav class="menu">
            <ul>
                <li><a href="home.php">Accueil</a></li>
                <li><a href="service.php">Services</a>
                    <ul>
                        <?php if(!isset($_SESSION["name"])){
                	echo'<li><a href="connexion.php">Inscription / Connexion</a></li>';
                }?>
                        <li><a href="tarif.php">Tarifs</a></li>
                        <li><a href="Parking.php">Voir nos parking</a></li>
                        <?php if(isset($_SESSION["name"])){
                            echo'<li><a href="choixparking.php">Réservation</a></li>';
                        }
                        else{
                            echo'<li><a href="connexion.php">Réservation</a></li>';
                        }
                ?>
                    </ul>
                </li>
                <li><a href="apropos.php">À Propos</a></li>
                <li><a href="Contact.php">Contact</a></li>
                <?php if(isset($_SESSION["name"])){
                	echo'<li><a href="User.php">Utilisateur</a></li>';
                }?>
                <?php if(isset($_SESSION["admin"])&& $_SESSION["admin"]==1){
                	echo'<li><a href="gestion.php">Gestion</a></li>';
                }?>
                <?php if(isset($_SESSION["name"])){
                	echo'<li><a href="logout.php">Déconnexion</a></li>';
                }?>
            </ul>
        </nav>
       
