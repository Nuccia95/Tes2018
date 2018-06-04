<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link rel="icon" href="imgs/logo/logo.png" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--CSS-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="css/navbar.css" type="text/css">
<link rel="stylesheet" href="css/navbarprofile.css" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="css/home.css" type="text/css">
<link rel="stylesheet" href="css/steps.css" type="text/css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">

<!--SCRIP-->
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

	<!--NAVBAR-->
	<div class="topnav">
		<a 	id="profileImage"> <img src="${user.image}"></a>
		<a  id="logoText" class="logo">IN TOUR</a> 
		<a 	id="logoNavbar" class="logo"><img src="imgs/logo/logo.png"></a>
		<a href="catalogues.html">CATALOGHI</a>
	</div>
	
	<div id="container">
		<div id="homeeffect" class="warmOscar">
			<div class="absoluteCenter">
				<h2>
					IN TOUR<span><img src="imgs/logo/logo.png"></span>
				</h2>
				<p>Ciao ${user.firstName}, pianifica la tua vacanza e lasciati ispirare dai nostri cataloghi,<br>
				   annota i tuoi posti preferiti e organizza passo passo le tue giornate.
				</p>
			</div>
				<div id="createPlane" class="goTo">
					<a href="managePlan.jsp">INIZIAMO</a>
				</div>
		</div>
	</div>
</body>
</html>