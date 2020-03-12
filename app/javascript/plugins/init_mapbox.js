import mapboxgl from 'mapbox-gl';
import { pokeHover } from 'map_movement';
// 1. select the map element in our HTML
// 2. only build a map if there's a div#map to inject into
// 3. creates a new instance of the Map object on the view
// 4. Add markers to our map
// 5. Fit map to the markers based on furthest lats and lngs
// 6. Add the geocoder input for the map
const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const buildMap = () => {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    return new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
  };

  const addMarkersToMap = (map, markers) => {
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '25px';
      element.style.height = '20px';
      new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
    });
  };

  const fitMapToMarkers = (map, markers) => {

    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
    console.log(bounds);
  };

  if (mapElement) {
    const map = buildMap();
    window.tripmap = map
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    pokeHover();
    fitMapToMarkers(map, markers);
  }
};
window.initMapbox = initMapbox;
export { initMapbox };
