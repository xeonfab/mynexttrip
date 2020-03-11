const pokeHover = function () {

  const rotateBall = (markers, marker, rotation) => {
    // Give transition to marker
    marker.style.transition = "all 0.5s ease";

    markers.forEach((marker_item) => {
      marker_item.classList.remove("marker-hover-style");
    });
    marker.classList.add("marker-hover-style");

    // Get transform style
    let string = marker.style.transform;
    // Split it into an array
    let array = string.split(")");

    // Create string with new transform value
    let new_string = array[0] + ") " + array[1] + ") " + `rotate(${rotation}deg)`;
    // Reassign marker transform
    marker.style.transform = new_string;
  };

  // Get all the cards
  const cards = document.querySelectorAll(".city-card");
  // Transform them into an array
  var cards_array = Array.prototype.slice.call(cards);

  // Get all the markers
  const markers = document.querySelectorAll(".mapboxgl-marker");
  // Transform them into an array
  var markers_array = Array.prototype.slice.call(markers);

  cards.forEach((card) => {
    card.addEventListener("mouseover", function(event) {
      // Get the index of the event
      var pokemon_index = cards_array.indexOf(event.currentTarget);
      console.log(pokemon_index);
      console.log(markers[pokemon_index]);

      rotateBall(markers, markers[pokemon_index], 30);

      rotateBall(markers, markers[pokemon_index], 30);
      setTimeout(function(){ rotateBall(markers, markers[pokemon_index], -30);}, 200);
      setTimeout(function(){ rotateBall(markers, markers[pokemon_index], 0);}, 400);
      setTimeout(function(){ rotateBall(markers, markers[pokemon_index], -30);}, 600);
      setTimeout(function(){ rotateBall(markers, markers[pokemon_index], 0);}, 800);
    });
  });
}


export { pokeHover }
