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
		<a href="#" id="profileImage"> <img src="${user.image}"></a> 
		<a href="#" id="logoText" class="logo">IN TOUR</a>
		<a href="#" id="logoNavbar" class="logo"><img src="imgs/logo/logo.png"></a>
		<a href="managePlan.jsp">HOME</a>
		<a href="catalogues.html">CATALOGHI</a> 
		<a href="nearbies.jsp">NELLE VICINANZE</a>
	</div>

	<div id="editor"></div>
	<div id="pdf">Download as PDF</div>

<div id="plan">
	
	<div id="info">
		
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
				<div>
					<input id="children" class="form-control" type="number" min="0"
					step="1">
				</div>
			<label>Numero Adulti</label>
				<div>
					<input id="adults" class="form-control" type="number" min="1"
					step="1">
				</div>
			<label>Categoria</label>
			<form>
 			 <select id="categories">
    			<option value="Normale">Normale</option>
   				<option value="Economico">Economico</option>
    			<option value="Lusso">Lusso</option>
 			 </select>
			</form>
			
			<div id="submit">INVIA INFO</div>
</div>


	<div id="favoritesContainer">
		<div id="paper">
			<span><a href="#" id="logo" class="logo"><img src="imgs/logo/logo2.png"></a></span>
		
		<div id="title">
			<span style="color:#001748"><strong>IN TOUR</strong></span>
		</div>
		<div id="" class="description"><span>Ti auguriamo che la tua vacanza ideale si svolga nel miglior dei modi.</span></div>
		
		<div id="calendar"></div>
			
		<div class="subtitle"><strong>PREFERITI</strong></div>
		<ul id="favorites" class="list">
		</ul>
		
		<div class="subtitle"><strong>INTERESSI NELLE VICINANZE</strong></div>
		<ul id="nearbies" class="list">
	
		</ul>
		</div>
	</div>		
		
		
</div>



</body>
</html>