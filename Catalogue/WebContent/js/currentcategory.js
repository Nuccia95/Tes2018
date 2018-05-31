$(document).ready(function() {
	var category = $('#categoryName').find('h1').text();
	getPlaces(category);
	var userfavorites = new Array();
	
	$('#like').on('click',function(e){
		var x = document.getElementsByClassName("mySlides");
		var div = x[slideIndex];
		var idPlace = $(div).attr('id');
		userfavorites.push(idPlace);
		newNotification("Aggiunto al tuo piano");
	});
	
	$('#saveAll').on('click',function(e){
		$.ajax({
			type : "POST",
			url : "writeFavorites",
			data : {
				favorites : JSON.stringify(userfavorites),
			},
			success : function(data) {	
				newNotification("Contenuti salvati correttamente");
			},
			error : function(data) {	

			}
		});
	});
	
});

/************************************************ FUNCTIONS ******************************************************************/

function getPlaces(categoryPlace){
	$.ajax({
		type : "GET",
		url : "getPlaces",
		data : {
			category : categoryPlace,
		},
		success : function(data) {	
			$('#categoryName').find('h1').text(categoryPlace);
			$('#title').find('h1').text(categoryPlace+" NELLE TUE CITTÁ");
			$('#slider').html(data);
			var buttons = "<button class=\"w3-button w3-display-left w3-black\" onclick=\"plusDivs(-1)\">&#10094;</button> <button class=\"w3-button w3-display-right w3-black\" onclick=\"plusDivs(1)\">&#10095;</button>";
			$('#slider').append(buttons);
			showDivs(1);
			getReview();
		},
		error : function(data) {	
		}
	});	
}

var slideIndex = 1;
	showDivs(slideIndex);

function plusDivs(n) {
	showDivs(slideIndex += n);
}

function showDivs(n) {
	  var i;
	  var x = document.getElementsByClassName("mySlides");
	  if (n > x.length) {slideIndex = 1}    
	  if (n < 1) {slideIndex = x.length;}
	  for (i = 0; i < x.length; i++) {
	     x[i].style.display = "none";  
	  }	  
	  x[slideIndex-1].style.display = "block";  
}

function changeCategory(category){
	getPlaces(category);
}


function addFavorite(idPlace){
	$.ajax({
		type : "GET",
		url : "addFavorite",
		data : {
			id : idPlace,
		},
		success : function(data) {	
			$('#categoryName').find('h1').text(categoryPlace);
		},
		error : function(data) {	
		}
	});
}

function getReview(){
	$.ajax({
		type : "GET",
		url : "getReviews",
		success : function(data) {	
			$('.rbd-review-container').html(data);
		},
		error : function(data) {	
			alert("errore in GetReviews");
		}
	});
}



