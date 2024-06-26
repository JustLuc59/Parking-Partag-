document.addEventListener('DOMContentLoaded', function() {
    const seats = document.querySelectorAll('.seat');
    const selectedSeats = document.getElementById('selected-seats');
    const statusMessage = document.getElementById('status-message');
    const reserveButton = document.getElementById('btn-reserve');
    var text ="test"; // document.getElementById('info').textContent;
    
    let selectedSeatCount = 0;
    
    // Fonction pour mettre à jour le nombre de places sélectionnées
    function updateSelectedSeatCount() {
      selectedSeats.innerText = 'Places sélectionnées : ' + selectedSeatCount;
    }
    
    // Fonction pour gérer le clic sur un siège
    function seatClickHandler() {
      if (this.classList.contains('selected')) {
        this.classList.remove('selected');
        selectedSeatCount--;
      } else {
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
        statusMessage.innerText = 'Places réservées : ' + text;
        text = document.getElementsByClassName('selected')[0].textContent;
        //alert("place réservé "+text);
        statusMessage.style.color = 'green';
        // Vous pouvez ajouter ici la logique pour enregistrer les places réservées.
      } else {
        statusMessage.innerText = 'Veuillez sélectionner une place.';
        statusMessage.style.color = 'red';
      }
    }
    
    // Ajouter un écouteur d'événement de clic au bouton de réservation
    reserveButton.addEventListener('click', reserveSeats);
  });
  
