<?php 
     $serveur = "localhost";//$serveur = "192.168.234.249"; // Adresse du serveur MySQL
     $utilisateur = "root";//$utilisateur = "admin"; // Nom d'utilisateur MySQL
     $motdepasse = "admin";//$motdepasse = "tssnadmin"; // Mot de passe MySQL
	$bdd="Projet";
	
	$conn= new mysqli($serveur,$utilisateur,$motdepasse,$bdd);
	
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
        // Vous pouvez stocker d'autres valeurs de la même manière
    } else {
        echo "Aucun résultat trouvé pour cet utilisateur.";
    }
    }
?>

<?php if(isset($_SESSION["name"])){
                	echo'<img class="ppuser" src="ppuser.png"/>';
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
                	echo'<li><a href="User.php">User</a></li>';
                }?>
                <?php if(isset($_SESSION["admin"])&& $_SESSION["admin"]==1){
                	echo'<li><a href="gestion.php">Gestion</a></li>';
                }?>
                <?php if(isset($_SESSION["name"])){
                	echo'<li><a href="logout.php">Log out</a></li>';
                }?>
            </ul>
        </nav>
       
