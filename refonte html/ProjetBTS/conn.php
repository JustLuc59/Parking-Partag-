<?php     $serveur = "192.168.60.249"; // Adresse du serveur MySQL
     $utilisateur = "admin"; // Nom d'utilisateur MySQL
     $motdepasse = "tssnadmin"; // Mot de passe MySQL
	$bdd="Projet";
	$conn= new mysqli($serveur,$utilisateur,$motdepasse,$bdd);
     $connexion=new mysqli($serveur,$utilisateur,$motdepasse,$bdd);
     ?>