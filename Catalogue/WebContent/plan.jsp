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
<link rel="stylesheet" href="css/plan.css" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/plan.js"></script> 
<script type="text/javascript" src="js/jspdf.min.js"></script> 
<script type="text/javascript" src="js/jspdf.debug.js"></script> 
</head>

<body>
	<div class="topnav">
		<a id="profileImage"> <img src="${user.image}"></a> 
		<a id="logoText" class="logo">IN TOUR</a>
		<a id="logoNavbar" class="logo"><img src="imgs/logo/logo.png"></a>
		<a href="managePlan.jsp">HOME</a>
		<a href="catalogues.html">CATALOGHI</a> 
		<a href="nearbies.jsp">NELLE VICINANZE</a>
	</div>

	<div id="editor"></div>
	<div id="pdf" class="w3-center w3-animate-right">Download as PDF<i class="material-icons">arrow_downward</i></div>

<div id="plan">
	
	<div id="info" class="w3-center w3-animate-left">
		
		<div class="infopanel"><p>Completa gli ultimi passi<p></div>
	
			<label>CheckIn</label>
				<div>
					<input id="checkin" class="form-control" type="date">
				</div>
			<label >CheckOut</label>
				<div>
					<input id="checkout" class="form-control" type="date">
				</div>
			<label>Numero Bambini</label>
			<div class="slidecontainer">
  				<input type="range" min="1" max="100" value="50" class="slider" id="myRangeChildren">
  				<p>Val: <span id="demoChildren"></span></p>
			</div>
			<label>Numero Adulti</label>
			<div class="slidecontainer">
  				<input type="range" min="1" max="100" value="50" class="slider" id="myRangeAdults">
  				<p>Val: <span id="demoAdults"></span></p>
			</div>

			<label>Categoria</label>
			<form>
 			 <select id="categories">
    			<option value="Normale">Normale</option>
   				<option value="Economico">Economico</option>
    			<option value="Lusso">Lusso</option>
 			 </select>
			</form>
			
			<div id="submit">INVIA INFO<i class="material-icons">send</i></div>
</div>


	<div id="favoritesContainer">
		<div class="line"></div>
		<div id="paper">
		<div class="subtitle"><strong>INTOUR</strong></div>
		<div class="description">Ti auguriamo che la tua vacanza si svolga nel miglior dei modi. Buon Viaggio!</div>
		
		<div id="calendar"></div>
			
		<div class="subtitle"><strong>PREFERITI</strong></div>
		<ul id="favorites" >
			
		</ul>
		
		<div class="subtitle"><strong>INTERESSI NELLE VICINANZE</strong></div>
		<ul id="nearbies" >	
		  
		</ul>
		</div>
		<div class="line"></div>
	</div>		
		
		
</div>



</body>
</html>