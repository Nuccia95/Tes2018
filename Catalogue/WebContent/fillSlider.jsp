<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach var="place" items="${allPlaces}">

	<div id="${place.id}" class="w3-display-container mySlides">
 		 <img src="${place.image}" style="width:100%">
  		<div class="w3-display-bottomright w3-large w3-container w3-padding-16 w3-black">
    			${place.name}, ${place.city}
  			</div>
	</div>
	
	
</c:forEach>

