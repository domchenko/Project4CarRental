<%-- 
    Document   : catalog
    Created on : Jan 11, 2016, 2:04:00 AM
    Author     : Tanya Domchenko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<fmt:setLocale value="${locale}" />
<fmt:setBundle basename="com.carrental.locale.text" />

<form name="RentCarForm" method="POST" action="./servlet">
    <input type="hidden" name="act" value="rent"/>
    
    <table class="tableCatalog">
        <tr style="height:35pt;">
            <td>
                <div class="catalogHeader"><fmt:message key="rentCar.car"/></div>
            </td>
            <td>
                <div class="catalogHeader">
                    <fmt:message key="rentCar.model"/>/<fmt:message key="rentCar.price"/>
                </div>
            </td>            
        </tr>

        <c:forEach items="${sessionScope.contentManager.cars}" var="car">
            <tr>
                <td rowspan="3">
                    <c:set var="model_img" value="${fn:replace( fn:toLowerCase( car.model ), ' ', '_' )}"/>
                    <img src="images/cars/${model_img}.jpg"/>
                </td>
                <td valign="bottom">
                    <div class="catalogItem">${car.model}</div>
                </td>
            </tr>            
            <tr>
                <td valign="center">
                    <div class="catalogItem">${car.price}</div>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <c:choose>
                        <c:when test="${not empty sessionScope.contentManager.user}">
                            <div style="text-align: center">
                                <button class="orderCarBtn" type="submit" name="rentCar" value="${car.id}">
                                    <fmt:message key="catalog.rentCar"/>
                                </button>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="catalogHint">
                                <fmt:message key="catalog.hint.loginNeed"/>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>        
    </table>
</form>