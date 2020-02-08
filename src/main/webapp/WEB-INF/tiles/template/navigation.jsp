<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:if test="${sessionScope.userName == null}">
    <li><a href=login>Login</a></li>
    <li><a href="signup">Sign Up</a></li>
</c:if>

<c:if test="${sessionScope.userName != null}">
    <li><a href="<spring:url value="/welcome"/>">Home</a></li>
    <li><a href="<spring:url value="/viewcar/"/>">Cars</a></li>
    <li><a href="<spring:url value="/cars"/>">Car Management</a></li>
    <c:if test="${sessionScope.role == 'ADMIN'}">
    <li><a href="<spring:url value="/viewapprovecar"/>">Approve</a></li>
    <li><a href="<spring:url value="/viewAllRentals"/>">All Rents</a></li>
	</c:if>
    <li><a href="<spring:url value="/logout"/>">Logout</a></li>
</c:if>



<%--<c:set var="contains" value="false" />--%>
<%--<c:forEach var="item" items="${sessionScope.role}">--%>
<%--    <c:if test="${item == 1}">--%>
<%--        <c:set var="contains" value="true" />--%>
<%--    </c:if>--%>
<%--</c:forEach>--%>

