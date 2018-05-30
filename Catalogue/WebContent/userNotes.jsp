<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach var="note" items="${notes}">
	
	<tr id="${note.id}" class="row">
		<td class="col-md-6 col-lg-6" >${note.name}</td>
		<td id="plus" class="col-md-2 col-lg-2"><a href="#"><i class="addToPlan material-icons" data-toggle="tooltip" data-placement="top" title="Aggiungi al tuo piano">add</i></a></td>
		<td class="col-md-2 col-lg-2"><a href="#"><i class="deleteNote material-icons" data-toggle="tooltip" data-placement="top" title="Elimina nota">delete</i></a></td>
		<td class="col-md-2 col-lg-2"><a href="#"><i class="closeNote material-icons" data-toggle="tooltip" data-placement="top" title="Chiudi nota">close</i></a></td>
	</tr>
</c:forEach>