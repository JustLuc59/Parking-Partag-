<?php 
//include("conn.php");
$serv="192.168.164.249";
$user="root";
$mdp="tssnadmin";
$bdd="Projet";
$conn= new mysqli($serv,$user,$mdp,$bdd);
//echo "test err : ".$conn->error."<br>";
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
    echo $n;
    $caracteres = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $longueurMax = strlen($caracteres);
    $chaineAleatoire = '';
    for ($i = 0; $i < 10; $i++)
    {
    $chaineAleatoire .= $caracteres[rand(0, $longueurMax - 1)];
    }*/
    $sql="SELECT * FROM Ecoute WHERE id='1'";
      //echo $sql;
      $result = $conn->query($sql);
      $row = $result->fetch_assoc();
      echo $row["barriere"];
      if($row["barriere"]==1){
        $i=0;
      }
      else{
        $i=1;}
    
    $sql="UPDATE Ecoute SET barriere='1' WHERE id='1'";
    echo $sql;
    $conn->query($sql);
    echo "test err : ".$conn->error."<br>";
    //echo $chaineAleatoire;
?>