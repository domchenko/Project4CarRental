<%-- 
    Document   : error
    Created on : Jan 24, 2016, 7:09:59 PM
    Author     : Tanya Domchenko
--%>

<%@page isErrorPage="true" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="${locale}" />
<fmt:setBundle basename="com.carrental.locale.messages" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Car Rental</title>
        <style>
            .divErrorHeader {
                display: block;
                background: #ffffff;
                color: #be0808;
                font-weight: bold;
                font-size: 22pt;
                text-align: center;
                margin: auto;
                width: 60%;
            }
            .divError {
                display: block;
                background: #eaeaed;
                color: #be0808;
                font-size: 16pt;
                text-align: center;
                margin: auto;
                width: 60%;
            }
            .divHomePage {
                display: block;
                background: #eaeaed;
                color: #2f597f;
                font-weight: bold;
                font-size: 20pt;
                text-decoration: none;
                text-align: left;
            }
        </style>
    </head>
    <body>    
        <div class="divHomePage">
            <form name="HomeForm" method="POST" action="${initPath}/servlet">
                <input type="hidden" name="act" value="init"/>
                <a class="divHomePage" href="#" onClick="document.HomeForm.submit();"><fmt:message key="error.home"/></a>
            </form>
        </div>
        <br>
        <div class="divErrorHeader">
            <fmt:message key="error.caption"/>
        </div>
        <div class="divError">
            <div><fmt:message key="error.request"/>: ${pageContext.errorData.requestURI}</div>
            <div><fmt:message key="error.statusCode"/>: ${pageContext.errorData.statusCode}</div>
            <div><fmt:message key="error.message"/>: ${pageContext.errorData.throwable}</div>
        </div>
    </body>
</html>
