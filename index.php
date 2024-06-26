<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8"/>
  <title>Système de réservation de places de parking</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<?php include 'classic_header.php';?>
<body>
  <h1>Système de réservation de places de parking</h1>
  
  <div id="cinema">
    <h2>Sélectionnez vos places :</h2>
    
    <div id="seats">
      <div class="row">
        <div class="seat"><p id="info">A1</p></div>
        <div class="seat"><p id="info">A2</p></div>
        <div class="seat"><p id="info">A3</p></div>
        <div class="seat"><p id="info">A4</p></div>
        <div class="seat"><p id="info">A5</p></div>
      </div>
      <div class="row">
        <div class="seat"><p id="info">B1</p></div>
        <div class="seat"><p id="info">B2</p></div>
        <div class="seat"><p id="info">B3</p></div>
        <div class="seat"><p id="info">B4</p></div>
        <div class="seat"><p id="info">B5</p></div>
      </div>

    </div>
    <div id="seats">
      <div class="row">
        <div class="seat"><p id="info">C1</p></div>
        <div class="seat"><p id="info">C2</p></div>
        <div class="seat"><p id="info">C3</p></div>
        <div class="seat"><p id="info">C4</p></div>
        <div class="seat"><p id="info">C5</p></div>
      </div>
      <div class="row">
        <div class="seat"><p id="info">D1</p></div>
        <div class="seat"><p id="info">D2</p></div>
        <div class="seat"><p id="info">D3</p></div>
        <div class="seat"><p id="info">D4</p></div>
        <div class="seat"><p id="info">D5</p></div>
      </div>
    </div>
    <p id="selected-seats">Places sélectionnées :</p>
    <p id="status-message"></p>
    <button id="btn-reserve">Réserver</button>
  </div>
  
  <script src="app.js"></script>
</body>
</html>
