<%--
  Created by IntelliJ IDEA.
  User: edy
  Date: 2/4/20
  Time: 9:03 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html lang="en">
<head>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="../../resources/css/car.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-5">
                    <h2><spring:message code="car.label" /></h2>
                </div>
            </div>
        </div>
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th><spring:message code="car.carBrand" /></th>
                <th><spring:message code="car.carModel" /></th>
                <th><spring:message code="car.year" /></th>
                <th><spring:message code="car.price" /></th>
                <th><spring:message code="car.seats" /></th>
                <th><spring:message code="car.owner" /></th>
                <th><spring:message code="car.location" /></th>
                <th><spring:message code="car.description" /></th>
                <th><spring:message code="car.status" /></th>
                <th><spring:message code="car.rent" /></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="car" items="${list}">
                <tr>
                    <td><a href="editcar/${car.id}">${car.carBrand}</a></td>
                    <td>${car.model}</td>
                    <td>${car.year}</td>
                    <td>${car.price}</td>
                    <td>${car.seats}</td>
                    <td>${car.owner.userName}</td>
                    <td>${car.pickUpLocation}</td>
                    <td>${car.description}</td>
                    <td><span class="status text-success">&bull;</span> ${car.status}</td>
<%--                    <td>--%>
<%--                        <a href="${car.id}" class="rent" title="Rent" data-toggle="tooltip"><i class="material-icons">directions_car</i></a>--%>
<%--                    </td>--%>
                    <td>
                        <a href="editcar/${car.id}" class="approve" title="Approve" data-toggle="tooltip"><i class="material-icons">check_circle</i></a>
                        <a href="deletecar/${car.id}" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">cancel</i></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
