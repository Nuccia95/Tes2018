$(document).ready(function() {
	$('#caraibi').on('click',function(){
		sendCurrentCatalogue("catalogues/caraibi.pdf");
	});

	$('#india').on('click',function(){
		sendCurrentCatalogue("catalogues/india.pdf");
	});
	
	$('#sardegna').on('click',function(){
		sendCurrentCatalogue("catalogues/sardegna.pdf");
	});
	
});

function sendCurrentCatalogue(name){
	$.ajax({
		type : "POST",
		url : "getCurrentCatalogue",
		data : {
			catalogueName : name,
		},
		success : function(data) {
			 window.location.assign("index.html");
		},
		error : function(data) {	
			alert("errore in sendCurrentCatalogue");
		}
	});
	

	
}