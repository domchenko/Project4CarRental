<%-- 
    Document   : main
    Created on : Jan 10, 2016, 1:07:14 AM
    Author     : Tanya Domchenko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="locale" value="${not empty param.locale ? param.locale : not empty locale ? locale : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${locale}" />
<fmt:setBundle basename="com.carrental.locale.text" />
<!DOCTYPE html>
<html lang="${locale}">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" media="screen" href="css/main.css">
        <script src="js/functions.js"></script>
        <title>Car Rental</title>
    </head>
    <body>
        <table class="tableHeader">
            <tr>
                <td class="tdHeader">
                    <%@include file="header.jsp" %>
                </td>
            </tr>
            <tr class="trMainContainer">
                <c:choose>
                    <c:when test="${empty sessionScope.bgClass}">
                        <c:set var="bgClass" value="tdContainerImage" scope="session" />
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${menuMode}">
                                <c:set var="bgClass" value="tdMenuImage" scope="session" />
                            </c:when>
                            <c:otherwise>
                                <c:set var="bgClass" value="tdContainerImage" scope="session" />
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose>                
                <td class="${sessionScope.bgClass}" valign="top">
                    <c:import url="${contentPath}"/>
                </td>
            </tr>
        </table>
    </body>
</html>
