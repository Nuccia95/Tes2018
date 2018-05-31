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
<link rel="stylesheet" href="css/notification.css" type="text/css">
<link rel="stylesheet" href="css/scrollbar.css" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!--SCRIP-->
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/manageplan.js"></script> 
<script type="text/javascript" src="js/currentcategory.js"></script> 
<script type="text/javascript" src="js/notification.js"></script> 
</head>
<body>

	<div class="topnav">
		<a id="profileImage"> <img src="${user.image}"></a> 
		<a href="#" id="logoText" class="logo">IN TOUR</a>
		<a href="#" id="logoNavbar" class="logo"><img src="imgs/logo/logo.png"></a>
		<a href="managePlan.jsp">HOME</a>
		<a href="plan.jsp">IL MIO PIANO</a>
		<a href="nearbies.jsp">NELLE VICINANZE</a>
		<a href="catalogues.html">CATALOGHI</a> 
	</div>

<div id="frame" class="col-lg-2 col-md-2">

   	<div id="achievement" class="">
  		<div class="circle"></div>
  			<div class="copy">
    			<h4>InTour</h4><p></p>
 	 		</div>
	</div>
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
			<ul class="rbd-review-container"></ul>		
	</div> 

</div> 

	</div>
	
  <div id="title">	<h1> ${currentCategory} NELLE TUE CITTÁ</h1> 
  		<div id="opt">Cosa vuoi fare?<a  href='#' id="like" class="material-icons" data-toggle="tooltip" data-placement="top" title="Aggiungi al tuo piano">add</a>  
  			<a href='#' id="saveAll" class="material-icons" data-toggle="tooltip" data-placement="top" title="Salva tutto">done_all</a></div> 
  </div>
  
  <div id="container" class="column middle">
  	<div id="slider" class="w3-content w3-display-container">
	
	</div>	
  </div>
</body>
</html>