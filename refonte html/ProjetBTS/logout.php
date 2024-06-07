<?php
// Démarrer la session PHP
session_start();

// Détruire toutes les données de la session
$_SESSION = array();

// Détruire la session
session_destroy();

// Rediriger vers la page de connexion ou une autre page appropriée
header("Location: home.php");
exit();
?>
