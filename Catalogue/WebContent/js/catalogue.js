$(document).ready(function() {

	typeWriter();
	
	$('#caraibi').on('click',function(){
		sendCurrentCatalogue("catalogues/caraibi.pdf");
	});

	$('#india').on('click',function(){
		sendCurrentCatalogue("catalogues/india.pdf");
	});
	
	$('#sardegna').on('click',function(){
		sendCurrentCatalogue("catalogues/sardegna.pdf");
	});
	
	$('#tunisia').on('click',function(){
		sendCurrentCatalogue("catalogues/tunisia.pdf");
	});
	
	$('#oceani').on('click',function(){
		sendCurrentCatalogue("catalogues/oceani.pdf");
	});
	
	$('#egitto').on('click',function(){
		sendCurrentCatalogue("catalogues/marrosso.pdf");
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

var i=0;
function typeWriter() {
	var txt = 'Eccoci tra i cataloghi di INTOUR scegli il più adatto a te.';
	var speed = 50;
	
  if (i < txt.length) {
    document.getElementById("textDescription").innerHTML += txt.charAt(i);
    i++;
    setTimeout(typeWriter, speed);
  }
}


