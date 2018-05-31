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


