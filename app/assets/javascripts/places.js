var map;
$(document).ready(function() {
	map = new GMaps({
        div: '#map',
        lat: 40.7127,
        lng: 74.0059,
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
	var geoAddress = {
		lat: 0,
		lng: 0,
		name: "",
		notes: ""
	};
	var geoAddresses = new Array();

  	$('li[class="places"]').each(function() {
  		placeName = $('span[class="name' + i + '"]').text();
  		placeAddress = $('span[class="address' + i + '"]').text();
  		placeNotes = $('span[class="notes' + i + '"]').text();
  		//console.log(placeName + ' ' + i + ' ' + placeAddress);

  		GMaps.geocode({
	  		address: placeAddress,
	  		callback: function(results, status) {
		    	if (status == 'OK') {
					var latlng = results[0].geometry.location;
					map.setCenter(latlng.lat(), latlng.lng());
					// addmarker
					geoAddress.lat = latlng.lat();
					geoAddress.lng = latlng.lng();
					geoAddress.name = placeName;
					geoAddress.notes = placeNotes;
					geoAddresses.push(geoAddress);
		    	}
	  		}
		});
		i++;
  	});
  	
  	for (var j = 0; j < geoAddresses.length; j++) {
  		map.addMarker({
			lat: geoAddresses[j].lat,
			lng: geoAddresses[j].lng,
			title: geoAddresses[j].name,
			infoWindow: {
				content: geoAddresses[j].name + '<br />' + geoAddresses[j].notes
			}
		});

		
  	}
  	console.log("length: " + geoAddresses.length + " " );

});