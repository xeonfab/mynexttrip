export const initBanner = () => {
  window.myNextTripBanner = bannerPlugin;
}

const bannerPlugin = (placeName) => {
  var fakeMapDiv = document.createElement('div');
  var map = new google.maps.Map(fakeMapDiv);
  var service = new google.maps.places.PlacesService(map);
  var bannerPhotoEls = document.querySelectorAll('.js-banner-photo');

  // console.log(bannerPhotoEls);

  service.findPlaceFromQuery({
    query: placeName,
    fields: ['name', 'photos', 'place_id'],
  }, function(results, status) {
    const result = results[0];

    if (result) {
      service.getDetails({
        placeId: result.place_id,
        fields: ['photos'],
      }, function(result) {
        result.photos.forEach(function(photo, index) {
          var photoUrl = photo.getUrl();
          if (bannerPhotoEls[index]) {
            bannerPhotoEls[index].style.backgroundImage = 'url(' + photoUrl + ')';
          }
        });
      });
    }
  });
}
