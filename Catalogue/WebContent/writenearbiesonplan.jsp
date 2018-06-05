<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="nearby" items="${nearbiesFavorites}">
				<li>	
					<span>${nearby}</span> 					 
					<span class="float-right delete">x</span>
				</li>
</c:forEach>