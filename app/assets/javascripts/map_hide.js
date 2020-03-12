function mapHide() {
  var x = document.getElementById("map");
  if (x.style.visibility === "hidden") {
    x.style.visibility = "visible";
    x.style.position = "relative";
    if (window.tripmap) {
      window.tripmap.resize()
    }
  } else {
    x.style.visibility = "hidden";
    x.style.position = "absolute";
  }
}
