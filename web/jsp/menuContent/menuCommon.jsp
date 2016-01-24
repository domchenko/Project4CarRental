<%-- 
    Document   : menuCommon
    Created on : Jan 11, 2016, 10:01:17 PM
    Author     : Tanya Domchenko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${locale}" />
<fmt:setBundle basename="com.carrental.locale.messages" />

<div>
    <c:if test="${not empty userCabinetMessage}">
        <p class="loginError"><fmt:message key="${userCabinetMessage}"/></p>
        <c:set var="userCabinetMessage" value="" scope="session"/>
    </c:if>
</div>
