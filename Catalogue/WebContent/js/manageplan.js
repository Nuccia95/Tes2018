$(document).ready(function() {
	getNotes();
	//showAchievement();
	
	$('#help').on('click',function(){	
		const panelToggle = document.querySelector(".panel-toggle");
		panelToggle.classList.toggle("toggle-panel");
	});

	
	/* PROFILE */
	$('#profileImage').on('click',function(){
		openProfile();
	});
	
	$('#closePanel').on('click', function(){
		closeProfile();
	});
	
	
	/* CREATE PLAN */
	$('#createPlan').on('click',function(){
		var message='Seleziona la <strong>NOTA</strong> su cui desideri creare il tuo <strong>PIANO</strong>';
		newNotification(message);		
		
		openProfile();

		$("#notesTable tr").each(function(){
			 $(this).find('td').each(function(){
			        $(this).find(".material-icons.addToPlan").css("color","lime");
			 })
		});
	})
	
	/*CATEGORIES*/
	$(".ch-item").click(function() {
		var category = $(this).attr('id');
		$.ajax({
			type : "POST",
			url : "currentCategory",
			data : {
				currentCategory : category,
			},
			success : function(data) {
				window.location.assign("currentcategory.jsp");
			},
			error : function(data) {	
				alert("errore in currentCategory");
			}
		});
	});
	
	
	$('#ispirationMenu').on('click',function(){
		$('#subMenu').css('background-color','#00005b'); 
		getIspiration();
	})
	
	
	/*SLIDER*/
	$("#sliderBackground > div:gt(0)").hide();

	setInterval(function() {
	  $('#sliderBackground > div:first')
	    .fadeOut(1000)
	    .next()
	    .fadeIn(1000)
	    .end()
	    .appendTo('#sliderBackground');
	}, 5000);
	

});

/****************************************************** FUNCTIONS ******************************************************/
 
/*PROFILE*/
function openProfile(){
	$('#profilePanel').animate({"right":"0px"}, 1000);
}

function closeProfile(){
	$('#profilePanel').animate({"right":"-400px"}, 1000);
}


/*NOTIFICATION*/
function showAchievement() {
	  $('#achievement .circle').removeClass('rotate');
	  // Run the animations
	  setTimeout(function () {
	    $('#achievement').addClass('expand');
	    setTimeout(function () {
	      $('#achievement').addClass('widen');
	      setTimeout(function () {
	        $('#achievement .copy').addClass('show');
	      }, 900);
	    }, 80);
	  }, 200);
	  //Hide the achievement
	  setTimeout(function () {
	    hideAchievement();
	  }, 2000);
}

function hideAchievement() {
	  setTimeout(function () {
	    $('#achievement .copy').removeClass('show');
	     setTimeout(function () {
	      $('#achievement').removeClass('widen');
	       $('#achievement .circle').addClass('rotate');
	        setTimeout(function () {
	          $('#achievement').removeClass('expand');
	          $('.refresh').fadeIn(300);
	        }, 80);
	     }, 100);
	  }, 2000);
	  
}

function newNotification(message){
	 $('.copy').find('p').html(message);
	 showAchievement();
}


/* NOTES */
function getNotes(){
	$.ajax({
		type : "GET",
		url : "userNotes",
		success : function(data) {
			$('#notesTable').html(data);
			
			$("#notesTable tr").on('click', function() {
				var id = $(this).attr('id');
				openNote(id);
			});
		
			$(".addToPlan").on('click', function(e) {
				e.stopPropagation();
				var row = $(this).closest('tr');
				var id = row.attr('id');
				var noteName = row.find("td:first").text();
				addToPlane(id);
				newNotification("Hai aggiunto la nota "+noteName+" passa allo step <strong>ISPIRAMI</strong>")
			});
			
			$(".closeNote").on('click', function(e) {
				e.stopPropagation();
				$('#openedNote tbody').empty();
			});
		
			$(".deleteNote").on('click', function(e) {
				e.stopPropagation();
				var row = $(this).closest('tr');
				var id = row.attr('id');
				$(this).closest('tr').remove();
				deleteNote(id);
				e.stopPropagation();
				$('#openedNote tbody').empty();

			});
		},
		error : function(data) {
			
		}
	});
}

function openNote(id){
	$.ajax({
		type : "POST",
		url : "userNotes",
		datatype : "json",
		data : {
			id : id,
		},
		success : function(data) {
			$('#openedNote tbody').html(data);
		},
		error : function(data){
			alert("errore in openNote");
		}
	});
}

function deleteNote(id){
	$.ajax({
		type : "POST",
		url : "deleteNote",
		data : {
			id : id,
		},
		success : function(data) {
		},
		error : function(data) {	
			alert("errore in deleteNote");
		}
	});
}


/* PLAN */
function addToPlane(id){
	$.ajax({
		type : "POST",
		url : "addNoteToPlan",
		data : {
			id : id,
		},
		success : function(data) {	
			closeProfile();	
		},
		error : function(data) {	
		}
	});
}


/* SHOW CATEGORIES */
function getIspiration() {
    var x = document.getElementById(".container");
    var clss = $('#container').attr('class');
  
    if(clss === 'checked'){
    	$('#container').removeClass('checked');
    	$('#container').css('visibility','hidden'); 
    }
    else {
    	$('#container').addClass('checked');
    	$('#container').css('visibility','visible'); 
    }
}


