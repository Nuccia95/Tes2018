<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div>
			 <h1>Hai aggiunto la nota ${name} <span><a class="material-icons" style="color:lime">done</a></span></h1> 
				<h3>Cosa ti piacerebbe fare nelle località di<br>
					<c:forEach var="city" items="${cities}" varStatus="status">
						${city.name}
							 <c:if test="${ not status.last}">        
 								,
 							 </c:if></c:forEach>?
 				</h3>
 			<h1> Passa allo step Ispirami e scopriamolo insieme.</h1> 
	
</div>				