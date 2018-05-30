<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="city" items="${nearbies}">
  <div class="citiesconteiner">	
		<h3>Nelle Vicinanze ${city.name}</h3>
				<ul>
					<c:forEach var="nearby" items="${city.nearbyCities}">
								<li>${nearby}</li>
					</c:forEach>
				</ul>
  </div>
</c:forEach> 