import mapboxgl from 'mapbox-gl';

  window.fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxglClass.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 100, maxZoom: 14 });
  };

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  window.mapboxglClass = mapboxgl;

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    window.mapbox = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
      // style: 'mapbox://styles/pdunleav/cjofefl7u3j3e2sp0ylex3cyb'
    });

    window.markers = JSON.parse(mapElement.dataset.markers);

    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '25px';
      element.style.height = '25px';

      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(mapbox);

    });
    fitMapToMarkers(window.mapbox, window.markers);
  };
};

export { initMapbox };
