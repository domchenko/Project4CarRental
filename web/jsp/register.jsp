<%-- 
    Document   : register
    Created on : Dec 9, 2015, 2:24:43 PM
    Author     : Tanya Domchenko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${locale}" />
<fmt:setBundle basename="com.carrental.locale.text" />


<div class="divLogin">
    <form name="RegisterInputForm" method="POST" action="./servlet">
        <input type="hidden" name="act" value="register"/>
        <table>
            <tr>
                <td><fmt:message key="logIn.login"/>:</td>
                <td><input type="text" name="login" value="" autofocus="autofocus"/></td>
            </tr>
            <tr>
                <td><fmt:message key="logIn.password"/>:</td>
                <td><input type="password" name="password" value=""/></td>
            </tr>
            <tr>
                <td><fmt:message key="register.passwordConfirm"/>:</td>
                <td><input type="password" name="passwordConfirm" value=""/></td>
            </tr>
            <tr>
                <td colspan=2>
                    <input class="loginBtn" type="submit" name="registerProc" value="<fmt:message key="logIn.register"/>"/>
                </td>
            </tr>
            <c:if test="${registerErrorCode != '' && registerErrorCode != null}">
                <tr>
                    <td colspan=2 align="right">
                        <fmt:bundle basename="com.carrental.locale.messages">
                            <p class="loginError"><fmt:message key="${registerErrorCode}"/></p>
                        </fmt:bundle>
                    </td>
                </tr>
                <c:set var="registerErrorCode" value="" scope="session"/>
            </c:if>
        </table>
    </form>
</div>
