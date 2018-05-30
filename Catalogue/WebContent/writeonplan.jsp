<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="place" items="${favorites}">
		
	<li>
		<span id="${place.id}"><strong>${place.category}</strong> ${place.name}, <span id="city">${place.city}</span></span> 					 
		<span class="float-right delete">x</span>
	</li>

</c:forEach>