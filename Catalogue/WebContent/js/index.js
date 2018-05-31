$(document).ready(function() {
	/* OPTIONS PDF */
	$('#addNew').on('click',function(){
		$('.hidden-form').css("visibility" , "visible");
	});

	$('#likeLeft').on('click',function(){
		writeNote(0);
	});
	
	$('#likeRight').on('click',function(){
		writeNote(1);
	});
	
	$('#mic').on('click',function(){
			start();
	});
	
	$('#bookmarkActive').on('click',function(){
		if($(this).hasClass('active')){
			$(this).removeClass('active');
			$('#likes').css('visibility','hidden');	
		}
		else{
			$(this).addClass('active');
			$('#likes').css('visibility','visible');			
		}
	});
	
	$('#undo').on('click', function(){
		$('#noteList').find('li').last().remove();
	});
	
	$('#save').on('click', function(){
		saveNote();
	});
	
	$('#clear').on('click', function(){
		$("#noteName input:text").val("");
		$('#noteList').find('li').remove();
	});
	
	$('#help').on('click',function(){	
		const panelToggle = document.querySelector(".panel-toggle");
		panelToggle.classList.toggle("toggle-panel");
	});
	
});


/****************************************************** FUNCTIONS ******************************************************/
function writeTitle(){
	$('.hidden-form').css("visibility" , "visible");
}

/* NOTES */
function writeNote(number){
	var currentPages = $('#pageNumber').val();	
	if(number === 1)
		currentPages++;
	
	$.ajax({
		type: "POST",
		url: "writeNote",
		data : {
			currentPages : currentPages,
		},
		success: function(data){
			$('#noteList').append(data);
		},
		error : function(jqXHR, exception, message ) {
			alert("error in writeNote");
		}
	});
	
}

function saveNote(){	
	var noteName = $('#paper #noteName').find('input').val();
	var notes = new Array();
	
	$('#noteList li').each(function() {
		var line = $(this).text();
		notes.push(line);
	})
	
	$.ajax({
		type: "POST",
		url: "saveNote",
		datatype: "json",
		data : {
			noteName  : noteName,
			notes : JSON.stringify(notes),
		},
		success: function(data){
			$("#noteName input:text").val("");
			$('.hidden-form').css("visibility" , "hidden");
			$('#noteList').find('li').remove();
			newNotification("Nota salvata correttamente");
		},
		error : function(jqXHR, exception, message ) {
			if(jqXHR.responseText === "invalid name"){
				newNotification("Inserisci un nome alla nota");
			}else{
				newNotification("Errore nel salvare la nota");
			}
		}
	});
}

/* MIC */
function start(){
	if("webkitSpeechRecognition" in window){
    var speechRecognizer = new webkitSpeechRecognition();
    speechRecognizer.continuous = true;
    speechRecognizer.lang = "it-IT";    
    speechRecognizer.start();
    var title = false;
    
    var finalTranscripts = "";
    speechRecognizer.onresult = function(event){
    	  // event is a SpeechRecognitionEvent object.
    	  // It holds all the lines we have captured so far. 
    	  // We only need the current one.
    	  var current = event.resultIndex;

    	  // Get a transcript of what was said.
    	  var transcript = event.results[current][0].transcript;
    	  
    	  /*TITLE*/
    	  if(transcript.includes("titolo") || transcript.includes("nome nota")|| transcript.includes("nome")){
    		  writeTitle();
    		  title=true;
    		  
    	  }
    	  /*NEXT PAGE*/
    	  else if(transcript.includes("avanti")){
    		  $("#magazine").turn('next');
    	  }
    	  /*PREV PAGE*/
    	  else if(transcript.includes("indietro")){
    		  $("#magazine").turn('previous');
    	  }
    	  /*DELETE LAST*/
    	  else if(transcript.includes("elimina") || transcript.includes("no")){
    		  $('#undo').css('color','#4bff00');
    		  $('#noteList').find('li').last().remove();
    		  $('#undo').css('color','#bebebe');
    	  }
    	  /*END*/
    	  else if(transcript.includes("ok")|| transcript.includes("fine") || transcript.includes("finito")){
    		  alert("Registrazione terminata");
    		  speechRecognizer.stop();
    		  $('#save').css('color','#4bff00');
    		  saveNote();
    		  $('#save').css('color','#bebebe');
    		  
    	  }
       	  else{ 
    		  transcript = transcript.replace(' ', '');
    		  if(title === true){
    			  var noteName = $('#noteName input').val(transcript);
    			  title=false;
    		  }
    		  /*LIST CITIES*/
    		  else{
    			  var id="drag"+transcript;
    			  $("#noteList").append("<li draggable=\"true ondragstart=\"drag(event) id="+id+">"+transcript+"</li>");   
    		  }
    	  }    	    
    };
    
    speechRecognizer.onerror = function(event){
    
    };
    
}
else{
    r.innerHTML = "Your browser does not support that.";
}

}

/* DRAGGABLE DIV - REMOVE / ADD CITIES*/
function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
}