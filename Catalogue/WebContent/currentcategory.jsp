<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Categorie</title>
<link rel="icon" href="imgs/logo/logo.png"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="css/navbar.css" type="text/css">
<link rel="stylesheet" href="css/navbarprofile.css" type="text/css">
<link rel="stylesheet" href="css/currentcategory.css" type="text/css">
<link rel="stylesheet" href="css/reviews.css" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!--SCRIP-->
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/manageplan.js"></script> 
<script type="text/javascript" src="js/currentcategory.js"></script> 

</head>
<body>

	<div class="topnav">
		<a href="#" id="profileImage"> <img src="${user.image}"></a> 
		<a href="#" id="logoText" class="logo">IN TOUR</a>
		<a href="#" id="logoNavbar" class="logo"><img src="imgs/logo/logo.png"></a>
		<a href="home.jsp">HOME</a>
		<a id="plan">IL MIO PIANO</a>
		<a href="nearbies.jsp">NELLE VICINANZE</a>
		<a href="catalogues.html">CATALOGHI</a> 
	</div>

<div id="frame" class="col-lg-2 col-md-2">

  <div id="info" class="column side">
  
	<div class="dropdown">
  		<button class="dropbtn">CATEGORIE<i class="material-icons">category</i></button>
  			<div class="dropdown-content">
    			<a id="HOTEL" href="#" onclick="changeCategory(this.id)">HOTEL</a>
    			<a id="RISTORANTI" href="#" onclick="changeCategory(this.id)">RISTORANTI</a>
    			<a id="SPA" href="#" onclick="changeCategory(this.id)">SPA</a>
    			<a id="SPORT" href="#" onclick="changeCategory(this.id)">SPORT</a>
    			<a id="SHOPPING" href="#" onclick="changeCategory(this.id)">SHOPPING</a>
    			<a id="CULTURA" href="#" onclick="changeCategory(this.id)">CULTURA</a>
    			<a id="AVVENTURA" href="#" onclick="changeCategory(this.id)">AVVENTURA</a>
    			<a id="NIGHT" href="#"onclick="changeCategory(this.id)">NIGHT</a>
  			</div>
	</div>
	
	<div id="infoAboutNote">	
	<label id="infoLogo">Info<a href="#" id="logo" class="logo"><img src="imgs/logo/logo.png"></a></label>
  		<div id="category">
		<label>CATEGORIA SELEZIONATA:</label>
			<div id="categoryName"> <h1>${currentCategory}</h1> </div>
		</div>
	
	</div>
	
	<div id="titleOpinions"><label>Impressioni</label></div>
	<div id="opinions" class="column side">
		<div class="rbd-core-ui">
			<div class="rbd-review-slider">
				<div class="rbd-review-container"></div>		
			</div>	
		</div>
	</div>
	
</div> 
<script type="text/javascript">
	let options = {
			'speed': 4000,
			'pause': true,
		}

	$(document).ready(function(){
			let slider = document.querySelector('.rbd-review-slider');
			let slides = slider.querySelectorAll('.rbd-review');
			let total  = slides.length;
			let pause  = false;
			
			function pauseSlide(){
				slider.onmouseleave = function(){ pause = false; };
				slider.onmouseenter = function(){ pause = true; };
				return pause;
			}
			
			function slide(){
				if( options.pause && pauseSlide() ) return;
				
				let activeSlide = document.querySelector('.rbd-review-slider .rbd-review.rbd-curr');
				let prev, curr, next, soon;		
				
				curr = activeSlide;
				prev = activeSlide.previousElementSibling;
				next = activeSlide.nextElementSibling;
				
				if( next != null ){
					soon = next.nextElementSibling == null ? slides[0] : next.nextElementSibling;
				} else {
					next = slides[0];
					soon = slides[1];
				}
				
				if( prev != null ) prev.classList.remove('rbd-prev', 'rbd-curr', 'rbd-next');
				if( curr != null ) curr.classList.remove('rbd-prev', 'rbd-curr', 'rbd-next'); curr.classList.add('rbd-prev');
				if( next != null ) next.classList.remove('rbd-prev', 'rbd-curr', 'rbd-next'); next.classList.add('rbd-curr');
				if( soon != null ) soon.classList.remove('rbd-prev', 'rbd-curr', 'rbd-next'); soon.classList.add('rbd-next');
			}
			
			let slideTimer = setInterval(function(){
				slide();
			}, options.speed);
		}, true);
</script> 
	</div>
	
  <div id="title">	<h1> ${currentCategory} NELLE TUE CITTÁ</h1> 
  		<div id="opt">Cosa vuoi fare?<a id="like" class="material-icons" data-toggle="tooltip" data-placement="top" title="Aggiungi al tuo piano">add</a>  
  			<a id="saveAll" class="material-icons" data-toggle="tooltip" data-placement="top" title="Salva tutto">done_all</a></div> 
  </div>
  
  <div id="container" class="column middle">
  	<div id="slider" class="w3-content w3-display-container">
	
	</div>	
  </div>
</body>
</html>