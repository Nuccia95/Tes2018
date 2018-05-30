<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach var="city" items="${cities}">
	<tr class="row">
		<td>${city.name}<a href="#"><i class="bookmark material-icons col-lg-1 col-md-1">bookmark</i></a></td>	
	</tr>
</c:forEach>
