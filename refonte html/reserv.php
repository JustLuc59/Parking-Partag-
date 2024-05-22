<!DOCTYPE html>
<html>
<head>
  <title>Système de réservation de places de parking</title>
  <link rel="stylesheet" type="text/css" href="css.css">
</head>
<header>
    <?php include("header.php");
    
    if(!isset($_SESSION["name"])){
      header('Location: home.php');
    }
    $_SESSION['villename']=$_GET["ville"];
    $ville=$_SESSION['villename'];
    $sql="SELECT * FROM PARKING WHERE VILLE='$ville'";
    $result = $conn->query($sql);

    if ($result->num_rows <= 0) {
      header('Location: choixparking.php');
    }
    function verif($n,$conn,$ville){
      $sql="SELECT * FROM PARKING WHERE PLACE='$n' AND VILLE='$ville'";
      //echo $sql;
      $result = $conn->query($sql);
      $row = $result->fetch_assoc();
      //echo $row["STATE"];
      //echo "<br>";
      if($row["STATE"]==1){
        return 'background-color:orange';
      }
      if($row["STATE"]==2){
        return 'background-color:red';
      }
      else{
        return 'color:green';}
    }
    $A1=verif('A1',$conn,$ville);
    $A2=verif('A2',$conn,$ville);
    $A3=verif('A3',$conn,$ville);
    $A4=verif('A4',$conn,$ville);
    $A5=verif('A5',$conn,$ville);

    $B1=verif('B1',$conn,$ville);
    $B2=verif('B2',$conn,$ville);
    $B3=verif('B3',$conn,$ville);
    $B4=verif('B4',$conn,$ville);
    $B5=verif('B5',$conn,$ville);

    $C1=verif('C1',$conn,$ville);
    $C2=verif('C2',$conn,$ville);
    $C3=verif('C3',$conn,$ville);
    $C4=verif('C4',$conn,$ville);
    $C5=verif('C5',$conn,$ville);

    $D1=verif('D1',$conn,$ville);
    $D2=verif('D2',$conn,$ville);
    $D3=verif('D3',$conn,$ville);
    $D4=verif('D4',$conn,$ville);
    $D5=verif('D5',$conn,$ville);
    
    //echo $A1;
?>
</header>
<body>
  <h1>Système de réservation de places de parking</h1>
  <div id="cinema">
    <h2>Sélectionnez votre place :</h2>
    
    <div id="seats">
      <div class="row">
        <div <?php echo "style=".$A1.";"; ?> class="seat"><p id="info">A1</p></div>
        <div <?php echo "style=".$A2.";"; ?> class="seat"><p id="info">A2</p></div>
        <div <?php echo "style=".$A3.";"; ?> class="seat"><p id="info">A3</p></div>
        <div <?php echo "style=".$A4.";"; ?> class="seat"><p id="info">A4</p></div>
        <div <?php echo "style=".$A5.";"; ?> class="seat"><p id="info">A5</p></div>
      </div>
      <div class="row">
      <div <?php echo "style=".$B1.";"; ?> class="seat"><p id="info">B1</p></div>
        <div <?php echo "style=".$B2.";"; ?> class="seat"><p id="info">B2</p></div>
        <div <?php echo "style=".$B3.";"; ?> class="seat"><p id="info">B3</p></div>
        <div <?php echo "style=".$B4.";"; ?> class="seat"><p id="info">B4</p></div>
        <div <?php echo "style=".$B5.";"; ?> class="seat"><p id="info">B5</p></div>
      </div>

    </div>
    <div id="seats">
      <div class="row">
      <div <?php echo "style=".$C1.";"; ?> class="seat"><p id="info">C1</p></div>
        <div <?php echo "style=".$C2.";"; ?> class="seat"><p id="info">C2</p></div>
        <div <?php echo "style=".$C3.";"; ?> class="seat"><p id="info">C3</p></div>
        <div <?php echo "style=".$C4.";"; ?> class="seat"><p id="info">C4</p></div>
        <div <?php echo "style=".$C5.";"; ?> class="seat"><p id="info">C5</p></div>
      </div>
      <div class="row">
      <div <?php echo "style=".$D1.";"; ?> class="seat"><p id="info">D1</p></div>
        <div <?php echo "style=".$D2.";"; ?> class="seat"><p id="info">D2</p></div>
        <div <?php echo "style=".$D3.";"; ?> class="seat"><p id="info">D3</p></div>
        <div <?php echo "style=".$D4.";"; ?> class="seat"><p id="info">D4</p></div>
        <div <?php echo "style=".$D5.";"; ?> class="seat"><p id="info">D5</p></div>
      </div>
    </div>
    <p id="selected-seats">Place sélectionnée : 0/1</p>
    <p id="status-message"></p>
    <button id="btn-reserve">Réserver</button>

  </div>
  
  <script src="app.js"></script>
</body>
<footer>
        <p>&copy; 2024 Réservation de Parking</p>
    </footer>
</html>
