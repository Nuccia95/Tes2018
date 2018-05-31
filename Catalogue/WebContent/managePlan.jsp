<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Crea il tuo piano</title>
<link rel="icon" href="imgs/logo/logo.png"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- CSS -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="css/navbar.css" type="text/css">
<link rel="stylesheet" href="css/navbarprofile.css" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="shortcut icon" href="../favicon.ico">         
<link rel="stylesheet" type="text/css" href="css/managePlan.css" />
<link rel="stylesheet" type="text/css" href="css/categories.css" />
<link rel="stylesheet" type="text/css" href="css/steps.css" />
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/notification.css">
<link rel="stylesheet" type="text/css" href="css/instructions.css">
<!--SCRIP-->
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/modernizr.custom.79639.js"></script> 
<script type="text/javascript" src="js/manageplan.js"></script>
<script type="text/javascript" src="js/steps.js"></script> 
<script type="text/javascript" src="js/notification.js"></script> 
</head>
<body>

	<div class="topnav">
		<a href="#" id="profileImage"> <img src="${user.image}"></a> 
		<a id="logoText" class="logo">IN TOUR</a>
		<a id="logoNavbar" class="logo"><img src="imgs/logo/logo.png"></a>
		<a href="#" id="help"><i class="material-icons" data-toggle="tooltip" data-placement="top" title="Istruzioni">help_outline</i></a>
		<a href="home.jsp">HOME</a>
	</div>
	
	 <div id="achievement" class="">
  		<div class="circle"></div>
  			<div class="copy">
    			<h4>InTour</h4>
    		<p>Bene ${user.firstName} crea il tuo nuovo piano</p>
 	 		</div>
	</div>
		
		<!--RIGHT PROFILE PANEL-->
	<div id="profilePanel" class="row">
		<div id="note">

			<div id="userProfile">
				<span id="icons">
					<a><i id="account" class="material-icons">account_circle</i></a>
					<a href="#"><i id="closePanel" class="material-icons">close</i></a>
				</span>
				<div id="name">
					<div>${user.firstName} ${user.lastName}</div>
				</div>
			<div id="userProfileInfo">
				<img src="${user.image}">
			</div>
			</div>

			<div class="subtitle">
				<h4>LE TUE NOTE</h4>
			</div>

			<table id="notesTable" class="table">
				<thead>
					<tr class="row">
						<th class="col-md-3 col-lg-3"></th>
						<th class="col-md-3 col-lg-3"></th>
						<th class="col-md-3 col-lg-3"></th>
						<th class="col-md-3 col-lg-3"></th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
			<table id="openedNote" class="table">
				<thead>
				</thead>
				<tbody>
				</tbody>
			</table>			
	</div>
	
</div>	
	
 
<div id="frame">

	<div class="container">
  		<div class="panel-toggle">
    	<i id="info" class="material-icons">info</i>
    	<h1>IN TOUR</h1>
    		<p>Il nostro sito ti consente di organizzare passo passo la tua vacanza ideale, sulla base delle città scelte da te.</p>
    	<h2><i class="material-icons">chrome_reader_mode</i>Cataloghi</h2>
    		<p>Sfoglia i nostri cataloghi, scopri posti da sogno e prendi appunti in maniera rapida e ordinata</p>
    	<h2><i class="material-icons">description</i>Piano Vacanza</h2>
    		<p>Costruisci la tua vacanza partendo da una delle tue note, troveremo insieme tutti i luoghi e le attività<br> possibili in queste città</p>
    	<h2><i class="material-icons">search</i> Ispirami</h2>
    		<p>Osserva, scegli, scopri il parere di altri utenti riguardo attività, hotel, ristoranti..</p>
    	<h2><i class="material-icons">map</i>.. E nell vicinanze?</h2>
    		<p>Scopri quali posti è possibile visitare nelle vicinanze delle tue località attraverso le nostre mappe e a quanto distano da te!</p>
  		</div>
	</div>


	<!-- SUBMENU -->
	<ul id="subMenu" class="cl-effect-5">
		<li><a href="catalogues.html" href="#"><span data-hover="CATALOGHI">CATALOGHI</span></a></li>
		<li><a id="createPlan" href="#"><span data-hover="NUOVOPIANO">NUOVO PIANO</span></a></li>
	    <li><a href="#container" id="ispirationMenu" href="#"><span data-hover="ISPIRAMI">ISPIRAMI</span></a></li>
  		<li><a href="nearbies.jsp"><span data-hover="NELLEVICINANZE">NELLE VICINANZE</span></a></li>
  		<li><a href="plan.jsp"><span data-hover="ILTUOPIANO">IL TUO PIANO</span></a></li>
	</ul> 
 
 
	<!-- SLIDER -->
	<div id="sliderBackground">
		<div>
			<div class="title">IN TOUR<img src="imgs/logo/logo.png"></div>
		    <img src="imgs/sliderplan/slide1.jpg">
		</div>
		<div>
		<div class="title">IN TOUR<img src="imgs/logo/logo.png"></div>
		    <img src="imgs/sliderplan/slide2.jpg">
		</div>
		<div>
		<div class="title">IN TOUR<img src="imgs/logo/logo.png"></div>
		    <img src="imgs/sliderplan/slide3.jpg">
		</div>
		<div>
		<div class="title">IN TOUR<img src="imgs/logo/logo.png"></div>
		    <img src="imgs/sliderplan/slide4.jpg">
		</div>
		<div>
		<div class="title">IN TOUR<img src="imgs/logo/logo.png"></div>
		    <img src="imgs/sliderplan/slide5.jpg">
		</div>
		<div>
		<div class="title">IN TOUR<img src="imgs/logo/logo.png"></div>
		    <img src="imgs/sliderplan/slide6.jpg">
		</div>
		<div>
		<div class="title">IN TOUR<img src="imgs/logo/logo.png"></div>
		    <img src="imgs/sliderplan/slide7.jpg">
		</div>
		<div>
		<div class="title">IN TOUR<img src="imgs/logo/logo.png"></div>
		    <img src="imgs/sliderplan/slide8.jpg">
		</div>
		<div>
		<div class="title">IN TOUR<img src="imgs/logo/logo.png"></div>
		    <img src="imgs/sliderplan/slide9.jpg">
		</div>
		<div>
		<div class="title">IN TOUR<img src="imgs/logo/logo.png"></div>
		    <img src="imgs/sliderplan/slide10.jpg">
		</div>
		</div>
	
<div id="panel">
	<div class="progress-steps-wrap">
		<div class="progress-steps" data-count="4">
		
		<a href="#" class="step active" data-index="1">SFOGLIA I CATALOGHI</a>
 		<a href="#" class="step" data-index="2">LASCIATI ISPIRARE</a>
  		<a href="#" class="step" data-index="3">..E NELLE VICINANZE?</a>
  		<a href="#" class="step" data-index="4">SCARICA IL TUO PIANO</a>	
		</div>
	</div>
</div>
	<!-- CATEGORIES -->
	  <div id="container">
			<div id="descrip"><h3>CATEGORIE</h3><br>Seleziona la categoria che ti interessa, scopri un modo di proposte per te e valuta le esperienze di altri
			utenti.</div>
			<section class="main">
			
				<ul class="ch-grid">
					<li>
						<div id="HOTEL" class="ch-item ch-img-1">				
							<div class="ch-info-wrap">
								<div class="ch-info">
									<div class="ch-info-front ch-img-1"><p>HOTEL<p></div>
									<div class="ch-info-back">
										<h3>HOTEL</h3>
										<a href="#" class="material-icons">hotel</a>
									</div>	
								</div>
							</div>
						</div>
					</li>
					<li>
						<div id="RISTORANTI" class="ch-item ch-img-2">
							<div class="ch-info-wrap">
								<div class="ch-info">
									<div class="ch-info-front ch-img-2"><p>RISTORANTI<p></div>
									<div class="ch-info-back">
										<h3>RISTORANTI</h3>
										<a href="#" class="material-icons">restaurant</a>
									</div>
								</div>
							</div>
						</div>
					</li>
										
					<li>
						<div id="SPA" class="ch-item ch-img-5">
							<div class="ch-info-wrap">
								<div class="ch-info">
									<div class="ch-info-front ch-img-5"><p>SPA<p></div>
									<div class="ch-info-back">
										<h3>SPA</h3>
										<a href="#" class="material-icons">spa</a>
									</div>
								</div>
							</div>
						</div>
					</li>
					
					<li>
						<div id="CULTURA" class="ch-item ch-img-3">
							<div class="ch-info-wrap">
								<div class="ch-info">
									<div class="ch-info-front ch-img-3"><p>CULTURA<p></div>
									<div class="ch-info-back">
										<h3>CULTURA</h3>
										<a href="#" class="material-icons">location_city</a>
									</div>
								</div>
							</div>
						</div>
					</li>
							
					<li>
						<div id="SPORT" class="ch-item ch-img-6">
							<div class="ch-info-wrap">
								<div class="ch-info">
									<div class="ch-info-front ch-img-6"><p>SPORT<p></div>
									<div class="ch-info-back">
										<h3>SPORT</h3>
										<a href="#" class="material-icons">fitness_center</a>
									</div>
								</div>
							</div>
						</div>
					</li>
					
					<li>
						<div id="AVVENTURA" class="ch-item ch-img-7">
							<div class="ch-info-wrap">
								<div class="ch-info">
									<div class="ch-info-front ch-img-7"><p>AVVENTURA<p></div>
									<div class="ch-info-back">
										<h3>AVVENTURA</h3>
										<a href="#" class="material-icons">landscape</a>
									</div>
								</div>
							</div>
						</div>
					</li>
					
					<li>
						<div id="SHOPPING" class="ch-item ch-img-8">
							<div class="ch-info-wrap">
								<div class="ch-info">
									<div class="ch-info-front ch-img-8"><p>SHOPPING<p></div>
									<div class="ch-info-back">
										<h3>SHOPPING</h3>
										<a href="#" class="material-icons">local_mall</a>
									</div>
								</div>
							</div>
						</div>
					</li>	
							
					
					<li>
						<div id="NIGHT" class="ch-item ch-img-9">
							<div class="ch-info-wrap">
								<div class="ch-info">
									<div class="ch-info-front ch-img-9"><p>NIGHT<p></div>
									<div class="ch-info-back">
										<h3>NIGHT</h3>
										<a href="#" class="material-icons">local_bar</a>
									</div>
								</div>
							</div>
						</div>
					</li>
									
	
					
	
				</ul>
				
			</section>
        </div>
</div>
</body>
</html>