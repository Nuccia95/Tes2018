$(document).ready(function() {	
	
	/*SLIDER*/
	$("#slideshow > div:gt(0)").hide();

	setInterval(function() {
	  $('#slideshow > div:first')
	    .fadeOut(1000)
	    .next()
	    .fadeIn(1000)
	    .end()
	    .appendTo('#slideshow');
	}, 3000);
	
	
	/*FACEBOOK*/
	window.fbAsyncInit = function() {
		FB.init({
			appId : '160256901453032',
			autoLogAppEvents : true,
			xfbml : true,
			version : 'v2.11'
		});
		
		FB.getLoginStatus(function(response){
			if(response.status === 'connected')
				getData();	
		})
	};

	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) {
			return;
		}
		js = d.createElement(s);
		js.id = id;
		js.src = "https://connect.facebook.net/it_IT/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	
	$("#fbButton").on('click', function() {
		FB.login(function(response) {
		}, { scope : 'user_friends, email', return_scopes:true });
	},false);

	$('#enterAsUser').on('click',function(){
		$('.facebook').animate({"right":"0px"}, 1100);
	})
	
});

/* USER LOGIN */
function getData() {
	FB.api('/me', 'GET', {	//get data about user
		fields : 'id, first_name, last_name, picture.width(250).height(250)',
	}, function(response) {
		var idFacebook = response.id;
		var firstnameFacebook = response.first_name;
		var lastnameFacebook = response.last_name;
		var pictureFacebook = response.picture.data.url;

		var jsonUser = {
			id : idFacebook,
			firstName : firstnameFacebook,
			lastName : lastnameFacebook,
			image : pictureFacebook,
		};

			$.ajax({
				type : "POST",
				url : "loginFacebook",
				datatype : "json",
				async : false,
				data : {
					user : JSON.stringify(jsonUser),
				},
				success : function(data) {
					if (data === "login")
						window.location.assign("home.jsp");
				},
				error : function(data) {
					alert("Cannot login with Facebook");
				}
			});
	});

}

