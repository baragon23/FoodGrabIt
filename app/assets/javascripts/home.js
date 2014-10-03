var map;
$(document).ready(function() {
	map = new GMaps({
        div: '#map',
        lat: -12.043333,
        lng: -77.028333,
        zoom: 11
	});

	/*GMaps.geolocate({
		success: function(position){
		  map.setCenter(position.coords.latitude, position.coords.longitude);
		},
		error: function(error){
		  console.log('Geolocation failed: ' + error.message);
		},
		not_supported: function(){
		  alert("Your browser does not support geolocation");
		},
		always: function(){
		  //alert("Done!");
		}
	});*/

	var i = 0;

  	$('li[class="places"]').each(function() {
  		var placeAddress = $('span[class="address' + i + '"]').text();
  		var placeName = $('span[class="name' + i + ' place-name"]').text();
  		var placeNotes = $('span[class="notes' + i + '"]').text();

  		GMaps.geocode({
	  		address: placeAddress,
	  		callback: function(results, status) {
		    	if (status == 'OK') {
					var latlng = results[0].geometry.location;
					map.setCenter(latlng.lat(), latlng.lng());
					map.addMarker({
						lat: latlng.lat(),
						lng: latlng.lng(),
						title: placeName,
						infoWindow: {
							content: '<div class="info-window"><strong>' + placeName + '</strong><br />' + placeNotes + '</div>'
						}
					});
		    	}
	  		}
		});
		i++;
  	});

});