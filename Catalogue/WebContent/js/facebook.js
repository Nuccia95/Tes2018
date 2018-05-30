function checkLogin(){
	window.fbAsyncInit = function() {
		FB.init({
			appId : '635526440172244',
			autoLogAppEvents : true,
			xfbml : true,
			version : 'v2.11'
		});
		FB.getLoginStatus(function(response) {
			  if (response.status === 'connected') {
				  window.location.assign("home.jsp");
			    var accessToken = response.authResponse.accessToken;
			  } else if (response.status === 'not_authorized') {
			    // the user is logged in to Facebook, but has not authenticated your app
				  alert("Effettua l'accesso");
				  window.location.assign("index.html");
			  } else {
			    // the user isn't logged in to Facebook.
				  alert("Effettua l'accesso");
				  window.location.assign("index.html");
			  }
		});
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
}