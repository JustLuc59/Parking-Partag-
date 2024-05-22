<?php 
$serv="localhost";
$user="root";
$mdp="admin";
$bdd="Projet";

$conn= new mysqli($serv,$user,$mdp,$bdd);
echo "test err : ".$conn->error."<br>";
/*
function verif($n,$conn){
      $sql="SELECT * FROM PARKING WHERE PLACE='$n'";
      //echo $sql;
      $result = $conn->query($sql);
      $row = $result->fetch_assoc();
      if($row["STATE"]==1){
        return 1;
      }
      else{
        return 0;}
    }

    $test=A1;
    $n=verif($test,$conn);
    echo $n;*/
    $caracteres = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $longueurMax = strlen($caracteres);
    $chaineAleatoire = '';
    for ($i = 0; $i < 10; $i++)
    {
    $chaineAleatoire .= $caracteres[rand(0, $longueurMax - 1)];
    }
    $sql="INSERT INTO chaine (valeur) VALUES ('$chaineAleatoire')";
    $conn->query($sql);
    echo $chaineAleatoire;
?>