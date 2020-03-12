function mapHide() {
  var x = document.getElementById("map");
  if (x.style.display === "none") {
    x.style.display = "block";
    if (window.tripmap) {
      window.tripmap.resize()
    }
  } else {
    x.style.display = "none";
  }
}
