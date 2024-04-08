<?php 
		$servername = 'localhost';
            	$username = 'root';
            	$password = 'admin';
            	$dbname= "IPtest";
            	//On établit la connexion
           	 $conn = new mysqli($servername, $username, $password, $dbname);
            
           	 //On vérifie la connexion
           	 if($conn->connect_error){
           	     die('Erreur : ' .$conn->connect_error);
           	 }
           	 echo 'Connexion réussie <br>';
           	 
		function getIP(){
			if(!empty($_SERVER['HTTP_CLIENT_IP'])){
				$ip = $_SERVER['HTTP_CLIENT_IP'];
			}elseif(!empty($_SERVER['HTTP_X_FORWARDED_FOR'])){
				$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
			}else{
				$ip = $_SERVER['REMOTE_ADDR'];
			}
			return $ip;
		}
		$IP=getIP();
		
		$today = date("Y-m-d");

            	$sql="INSERT INTO Iptest (ID,IP,DATE) VALUE ('0','".getIP()."','".$today."')";
            	$conn->query($sql);
		mysqli_close($conn); 
    header('Location:home.php');
?>