var map;
$(document).ready(function() {
	map = new GMaps({
        div: '#map',
        lat: -12.043333,
        lng: -77.028333,
        zoom: 12
	});

	GMaps.geolocate({
		success: function(position) {
		  map.setCenter(position.coords.latitude, position.coords.longitude);
		},
		error: function(error) {
		  alert('Geolocation failed: ' + error.message);
		},
		not_supported: function() {
		  alert("Your browser does not support geolocation");
		},
		always: function() {
		  //alert("Done!");
		}
	});

	//console.log($('span[class="name"]').text());
	var i = 0, placeName, placeAddress, placeNotes;

  	$('li[class="places"]').each(function() {
  		placeName = $('span[class="name' + i + '"]').text();
  		placeAddress = $('span[class="address' + i + '"]').text();
  		placeNotes = $('span[class="notes' + i + '"]').text();
  		console.log(placeName + ' ' + i + ' ' + placeAddress);

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
							content: placeName + '<br />' + placeNotes
						}
					});
		    	}
	  		}
		});
		i++;
  	});

});