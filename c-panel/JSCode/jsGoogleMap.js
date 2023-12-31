
var placeSearch, autocomplete;

var componentForm = {
    street_number: 'short_name',
    route: 'long_name',
    locality: 'long_name',
    administrative_area_level_1: 'short_name',
    country: 'long_name',
    postal_code: 'short_name'
};
function SetCurrentPos() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            var geolocation = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };
            $("#txtLatitude").val(position.coords.latitude);
            $("#txtLongitude").val(position.coords.longitude);
          
        });
    }
}

function initAutocomplete() {
    // Create the autocomplete object, restricting the search predictions to
    // geographical location types.
    autocomplete = new google.maps.places.Autocomplete(
        document.getElementById('search_address'), { types: ['geocode'] });
    geocoder = new google.maps.Geocoder;



    // Avoid paying for data that you don't need by restricting the set of
    // place fields that are returned to just the address components.
    autocomplete.setFields(['address_component']);

    // When the user selects an address from the drop-down, populate the
    // address fields in the form.
    autocomplete.addListener('place_changed', fillInAddress);
}

function fillInAddress() {
    // Get the place details from the autocomplete object.
    var place = autocomplete.getPlace();
    var TargetAddress = document.getElementById('search_address').value;
    geocoder.geocode({ 'address': TargetAddress }, function (results, status) {

        if (status == google.maps.GeocoderStatus.OK) {
            let latitude = results[0].geometry.location.lat();
            let longitude = results[0].geometry.location.lng();
            let latlng = { lat: latitude, lng: longitude };
            ItemsMap(latlng);
            //("#hfOrderLocationPoint").val(JSON.stringify(latlng));
        }
    });
    for (var component in componentForm) {
        document.getElementById(component).value = '';
        //document.getElementById(component).disabled = false;
    }


    // Get each component of the address from the place details,
    // and then fill-in the corresponding field on the form.
    for (var i = 0; i < place.address_components.length; i++) {
        var addressType = place.address_components[i].types[0];
        if (componentForm[addressType]) {
            var val = place.address_components[i][componentForm[addressType]];
            document.getElementById(addressType).value = val;
        }
    }
}

// Bias the autocomplete object to the user's geographical location,
// as supplied by the browser's 'navigator.geolocation' object.
function geolocate() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            var geolocation = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };
            var circle = new google.maps.Circle(
                { center: geolocation, radius: position.coords.accuracy });
            autocomplete.setBounds(circle.getBounds());
          
        });
    }

}

// Draw map depend on lng and lat
function ItemsMap(geolocation) {
    let PoLat = 30.0444196;
    let PoLng = 31.23571160000006;
   

  
    let txtLat = parseFloat($("#txtLatitude").val()) || '';
    let txtLng = parseFloat($("#txtLongitude").val()) || '';
    if (geolocation != '') {
        PoLat = geolocation.lat;
        PoLng = geolocation.lng;
        txtLat = PoLat;
        txtLng = PoLng;
    }
   
    if (txtLat !== '' && txtLng !== '') {
        $("#txtLatitude").val(txtLat);
        $("#txtLongitude").val(txtLng);
        PoLat = txtLat;
        PoLng = txtLng;
    }
    var mapProp = {
        center: new google.maps.LatLng(PoLat, PoLng),
        mapTypeId: 'roadmap',
        zoomControl: true,
        mapTypeControl: false,
        scaleControl: false,
        streetViewControl: false,
        rotateControl: false,
        fullscreenControl: true,
        zoom: 20,
    };
    var mapDiv = document.getElementById("googleMap");
    //If map div not ready then return
    if (mapDiv === null) { return; }

    var map = new google.maps.Map(mapDiv, mapProp);
    var marker = new google.maps.Marker({
        map: map,
        draggable: true,
        animation: google.maps.Animation.DROP,
        position: { lat: PoLat, lng: PoLng }
    });
    //On click on map set Marker on lat / lng and in their related fields
    google.maps.event.addListener(map, 'click', function (event) {
        marker.setPosition(event.latLng);
        getLatLongDetail(event.latLng);
        $("#txtLatitude").val(event.latLng.lat());
        $("#txtLongitude").val(event.latLng.lng());
    });

    marker.addListener('click', toggleBounce);
    //On Drag Marker set lat / lng in their related fields
    google.maps.event.addListener(marker, 'drag', function (evt) {
        $("#txtLatitude").val(evt.latLng.lat());
        $("#txtLongitude").val(evt.latLng.lng());
    });
    if (txtLat !== '' && txtLng !== '') {
       
        let myLatlng = new google.maps.LatLng(parseFloat(txtLat), parseFloat(txtLng));
        marker.setPosition(myLatlng);
        getLatLongDetail(myLatlng);
        //map.setZoom(20);
    }
    function toggleBounce(e) {
        if (marker.getAnimation() !== null) {
            marker.setAnimation(null);
        } else {
            marker.setAnimation(google.maps.Animation.BOUNCE);
        }
    }
    CheckCity();
}

// get position details depend on lng and lat at controls
function getLatLongDetail(myLatlng) {

    var geocoder = new google.maps.Geocoder();
    geocoder.geocode({ 'latLng': myLatlng },
        function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                if (results[0]) {

                    var address = "", city = "", state = "", zip = "", country = "", formattedAddress = "";
                    var lat;
                    var lng;

                    for (var i = 0; i < results[0].address_components.length; i++) {
                        var addr = results[0].address_components[i];
                        // check if this entry in address_components has a type of country
                        if (addr.types[0] == 'country')
                            country = addr.long_name;
                        else if (addr.types[0] == 'street_address') // address 1
                            address = address + addr.long_name;
                        else if (addr.types[0] == 'establishment')
                            address = address + addr.long_name;
                        else if (addr.types[0] == 'route')  // address 2
                            address = address + addr.long_name;
                        else if (addr.types[0] == 'postal_code')       // Zip
                            zip = addr.short_name;
                        else if (addr.types[0] == ['administrative_area_level_1'])       // State
                            state = addr.long_name;
                        else if (addr.types[0] == ['locality'])       // City
                            city = addr.long_name;
                    }


                    if (results[0].formatted_address != null) {
                        formattedAddress = results[0].formatted_address;
                    }

             

                    var location = results[0].geometry.location;

                    lat = location.lat;
                    lng = location.lng;
                    $("#search_address").val(formattedAddress.replace("Unnamed Road,",""));
                    $("#administrative_area_level_1").val(state);
                    $("#locality").val(city);
                    $("#postal_code").val(zip);
                    $("#country").val(country);
                    //alert('City: ' + city + '\n' + 'State: ' + state + '\n' + 'Zip: ' + zip + '\n' + 'Formatted Address: ' + formattedAddress + '\n' + 'Lat: ' + lat + '\n' + 'Lng: ' + lng);
                    //$("#txtCity").val(state);
                    //var Area = $("#search_address").val();
                    //$("#txtArea").val(Area);
                }

            }

        });
}

function CheckCity() {
    var Country = $("#country").val();
    var City = $("#administrative_area_level_1").val();
    var Area = $("#search_address").val();

   
    WebService.CheckCityAreaExist(Country,City,Area,onSuccess);
}
function onSuccess(val) {

    var cityId = val[1];
    var NewCity = val[2];
    var areaId = val[3];
    var NewArea = val[4];
    //alert(NewArea);
    $("#CityId").val(cityId);
    $("#AreaId").val(areaId);

    SetContextKey(cityId);

    $("#txtCity").val(NewCity);
    $("#txtArea").val(NewArea);
    //$("#aceArea").attr("contextKey", cityId); 
  
}
function SetContextKey(cityId) {
    $find('aceArea').set_contextKey(cityId);
}

function SetCustomLatLng(city) {
    try {
        var geocoder = new google.maps.Geocoder();
        geocoder.geocode({ 'address': city }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                $("#txtLatitude").val(results[0].geometry.location.lat());
                $("#txtLongitude").val(results[0].geometry.location.lng());
                // alert("location : " + results[0].geometry.location.lat() + " " + results[0].geometry.location.lng());
            } else {
                alert("Something got wrong " + status);
            }
        });
    }
    catch (err) {

    }

}