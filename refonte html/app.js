document.addEventListener('DOMContentLoaded', function() {
    const seats = document.querySelectorAll('.seat');
    const selectedSeats = document.getElementById('selected-seats');
    const statusMessage = document.getElementById('status-message');
    const reserveButton = document.getElementById('btn-reserve');
    var text ="test"; // document.getElementById('info').textContent;
    
    let selectedSeatCount = 0;
    
    function getReservedSeats() {
      var xhr = new XMLHttpRequest();
      xhr.open("GET", "getReserved.php", true);
      xhr.onreadystatechange = function() {
          if (xhr.readyState === 4 && xhr.status === 200) {
              // Analyser les données JSON récupérées
              const reservedSeats = JSON.parse(xhr.responseText);
              
              // Mettre à jour l'apparence des places déjà réservées en rouge
              seats.forEach(function(seat) {
                  if (reservedSeats.includes(seat.textContent)) {
                      seat.classList.add('reserved');
                  }
              });
          }
      };
      xhr.send();
  }
  getReservedSeats();
    
    // Fonction pour mettre à jour le nombre de places sélectionnées
    function updateSelectedSeatCount() {
      selectedSeats.innerText = 'Place sélectionnée : ' + selectedSeatCount +'/1';
    }
    
    // Fonction pour gérer le clic sur un siège
    function seatClickHandler() {
      if (this.classList.contains('selected')) {
        this.classList.remove('selected');
        selectedSeatCount--;
      } else if(selectedSeatCount <1) {
        this.classList.add('selected');
        selectedSeatCount++;
      } 
      
      updateSelectedSeatCount();
    }
    
    // Ajouter un écouteur d'événement de clic à chaque siège
    seats.forEach(function(seat) {
      seat.addEventListener('click', seatClickHandler);
    });
    

    // Fonction pour gérer la réservation
    function reserveSeats() {
      if (selectedSeatCount == 1) {
        text = document.getElementsByClassName('selected')[0].textContent;
        var seatReserved = document.getElementsByClassName('selected')[0].textContent;
        //alert("place réservé "+text);
        //statusMessage.innerText = 'Place réservée : '+text;
        //statusMessage.style.color = 'green';
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "RPLACE.php", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // Affichage de la réponse du serveur
                statusMessage.innerText = xhr.responseText;
                statusMessage.style.color = 'green';
            }
        };
        xhr.send("seatReserved=" + seatReserved);

        // Vous pouvez ajouter ici la logique pour enregistrer les places réservées.
      } else {
        statusMessage.innerText = 'Veuillez sélectionner une place.';
        statusMessage.style.color = 'red';
      }
    }
    
    // Ajouter un écouteur d'événement de clic au bouton de réservation
    reserveButton.addEventListener('click', reserveSeats);
  });
  