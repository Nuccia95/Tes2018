<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach var="review" items="${allReviews}">
	
			<div class="rbd-review ${review.id}">
					<h3 class="rbd-heading">${review.head}</h3>
					<span style="color:yellow">${review.stars}</span>
					<div class="rbd-content"><img class="rbd-gravatar" src="${review.image}">${review.description}</div>
					<div class="rbd-review-meta">${review.lastLine}</div>
			</div>	
	
</c:forEach>