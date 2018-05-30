$(document).ready(function() {
	getNearbies();
	var favorites = new Array();
	
	$('#add').on('click',function(e){
		var cityname = $('#addcity').find('#cityname').find('strong').text();
		favorites.push(cityname);
		alert("Hai aggiunto "+cityname);
	});
	
	$('#saveall').on('click',function(e){
		$.ajax({
			type : "POST",
			url : "getNearbiesPlan",
			data : {
				favorites : JSON.stringify(favorites),
			},
			success : function(data) {		
				alert("Contenuti Salvati");
			},
			error : function(data) {	
			}
		});
	});

});

/****************************************************** FUNCTIONS ******************************************************/

function getNearbies(){
	$.ajax({
		type : "GET",
		url : "getNearbies",
		success : function(data) {	
			$('#nearbies').html(data);
		},
		error : function(data) {	
			alert("error in get nearbies");
		}
		
	});
	
}





