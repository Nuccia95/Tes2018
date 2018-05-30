<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<!--
Created using JS Bin
http://jsbin.com

Copyright (c) 2018 by anonymous (http://jsbin.com/amodAJuQ/1/edit)

Released under the MIT license: http://jsbin.mit-license.org
-->
<html>
<head>
<meta charset="ISO-8859-1">
<title>Crea il tuo piano</title>
<link rel="icon" href="imgs/logo/logo.png"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="css/navbar.css" type="text/css">
<link rel="stylesheet" href="css/navbarprofile.css" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="shortcut icon" href="../favicon.ico">         
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300,700' rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="css/nearbies.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">

<!--SCRIP-->
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/nearbies.js"></script> 
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBLwMcUzEzk4No7kNw0l-szoEms_gTR81k" type="text/javascript"></script> 
<script>
var map;
var geocoder;
var bounds = new google.maps.LatLngBounds();
var markersArray = [];

var origin1 = new google.maps.LatLng(55.930, -3.118);
var destinationB = new google.maps.LatLng(50.087, 14.421);
var origin;
var destination;

var destinationIcon = 'https://chart.googleapis.com/chart?chst=d_map_pin_letter&chld=D|FF0000|000000';
var originIcon = 'https://chart.googleapis.com/chart?chst=d_map_pin_letter&chld=O|FFFF00|000000';
var panorama;
function initialize() {
  var opts = {
    center: new google.maps.LatLng(9.93123, 76.26730),
    zoom: 10
  };
  map = new google.maps.Map(document.getElementById('map-canvas'), opts);
  geocoder = new google.maps.Geocoder();
  

    panorama = new google.maps.StreetViewPanorama(
        document.getElementById('street-view'),
        {
          position: {lat: 37.869260, lng: -122.254811},
          pov: {heading: 165, pitch: 0},
          zoom: 1
        });
}


function calculateDistances() {
  origin = document.getElementById('source').value;
  destination = document.getElementById('dest').value;
  var service = new google.maps.DistanceMatrixService();
  var selectedMode = $('#mode').val();	
  service.getDistanceMatrix(
    {
      origins: [origin],
      destinations: [destination],
      travelMode: google.maps.TravelMode[selectedMode],
      unitSystem: google.maps.UnitSystem.METRIC,
      avoidHighways: false,
      avoidTolls: false
    }, calcDistance);
}

function calcDistance(response, status) {
  if (status != google.maps.DistanceMatrixStatus.OK) {
    alert('Error was: ' + status);
  } else {
    var origins = response.originAddresses;
    var destinations = response.destinationAddresses;
    deleteOverlays();

    for (var i = 0; i < origins.length; i++) {
      var results = response.rows[i].elements;
      addMarker(origins[i], false);
      for (var j = 0; j < results.length; j++) {
        addMarker(destinations[j], true);
        var km = results[j].distance.text;
        var time = results[j].duration.text;
        var line =  '<div id="outputDiv"> <img src="imgs/logo/distance.jpg"> <strong>' + km + ' in '+ time + '</strong> </div>';
        $('#output').html(line);
        var line2= '<div id="cityname">Ti interessa <strong>' +document.getElementById('dest').value +'</strong>? </div>';    
        $('#addcity').html(line2);
      }
    }
   	var city = document.getElementById('dest').value;
    var geocoder =  new google.maps.Geocoder();
    geocoder.geocode( { 'address': city}, function(results, status) {
          if (status == google.maps.GeocoderStatus.OK) {
        	var lat = results[0].geometry.location.lat();
        	var lng = results[0].geometry.location.lng();
		    panorama.setPosition(new google.maps.LatLng(lat,lng));
          } else {
            alert("Something got wrong " + status);
          }
	});
    
  }
}

function addMarker(location, isDestination) {
  var icon;
  if (isDestination) {
    icon = destinationIcon;
  } else {
    icon = originIcon;
  }
  geocoder.geocode({'address': location}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      bounds.extend(results[0].geometry.location);
      map.fitBounds(bounds);
      var marker = new google.maps.Marker({
        map: map,
        position: results[0].geometry.location,
        icon: icon
      });
      markersArray.push(marker);
    } else {
      alert('Geocode was not successful for the following reason: '
        + status);
    }
  });
}

function deleteOverlays() {
  for (var i = 0; i < markersArray.length; i++) {
    markersArray[i].setMap(null);
  }
  markersArray = [];
}


google.maps.event.addDomListener(window, 'load', initialize);

</script>
</head>
<body>
    <div class="topnav">
		<a href="#" id="profileImage"> <img src="${user.image}"></a> 
		<a href="#" id="logoText" class="logo">IN TOUR</a>
		<a href="#" id="logoNavbar" class="logo"><img src="imgs/logo/logo.png"></a>
		<a href="managePlan.jsp">HOME</a>
		<a href="catalogues.html">CATALOGHI</a> 
		<a href="plan.jsp">IL MIO PIANO</a> 
	</div>
	
 	
 	<div id="map-canvas"></div>
 	<div id="street-view"></div>

 	
 <div id="content-pane">

     	
			<label>DA</label><input  type="text" name="source" id="source"/>
			<label>A</label><input type="text" name="dest" id="dest"  />

		<label>MODE OF TRAVEL:</label>
    				<select id="mode">
     		 			<option value="DRIVING">Driving</option>
      		 			<option value="WALKING">Walking</option>
       		 			<option value="TRANSIT">Transit</option>
    	     		</select>
	<!-- 	
		<div id="buttons">
       	 <button type="button" onclick="calculateDistances();">CALCOLA DISTANZA</button>
   		 <button type="button" id="star">AGGIUNGI AL TUO PIANO</button>
		</div> -->
		
		<table id="options">
			<thead>
				<tr class="row">
					<th class="col-md-4 col-lg-4"></th>
					<th class="col-md-4 col-lg-4"></th>
					<th class="col-md-4 col-lg-4"></th>
				</tr>
			</thead>
				<tbody>
					<tr>
						<td><i  id="distance" class="material-icons" data-toggle="tooltip" data-placement="top" title="Calcola distanza" onclick="calculateDistances();">timeline</i>
						<td><i  id="add"      class="material-icons" data-toggle="tooltip" data-placement="top" title="Aggiungi al tuo piano">add_location</i>
						<td><i  id="saveall"  class="material-icons" data-toggle="tooltip" data-placement="top" title="Salva tutto">done_all</i></td>
					</tr>
				</tbody>
		</table>

		
		<div id="info">
		<div id="output">
        </div>

		
		<div id="addcity"></div>
		</div>
		<div id="nearbies"> 
			
		</div>
</div>
  
		


<!--  <script src="http://static.jsbin.com/js/render/edit.js?4.1.4"></script>
<script>jsbinShowEdit && jsbinShowEdit({"static":"http://static.jsbin.com","root":"http://jsbin.com"});</script> -->
<script>
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-1656750-34', 'auto');
ga('require', 'linkid', 'linkid.js');
ga('require', 'displayfeatures');
ga('send', 'pageview');

</script>

</body>
</html>