<%-- 
    Document   : LogIn
    Created on : Dec 8, 2015, 9:50:49 PM
    Author     : Tanya Domchenko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${locale}" />
<fmt:setBundle basename="com.carrental.locale.text" />

<div class="divLogin">
    <form name="LoginInputForm" method="POST" action="./servlet">
        <input type="hidden" name="act" value="login"/>
        <table>
            <tr>
                <td><fmt:message key="logIn.login"/>:</td>
                <td><input type="text" name="login" value="" autofocus = "autofocus"/></td>
            </tr>
            <tr>
                <td><fmt:message key="logIn.password"/>:</td>
                <td><input type="password" name="password" value=""/></td>
            </tr>
            <tr>
                <td colspan=2 align="right">
                    <input class="loginBtn" type="submit" name="loginProc" value="<fmt:message key='logIn.logInBtn'/>"/>
                </td>
            </tr>
            <c:if test="${logInErrorCode != '' && logInErrorCode != null }">
                <tr>
                    <td colspan=2 align="right">
                        <fmt:bundle basename="com.carrental.locale.messages">
                            <p class="loginError"><fmt:message key="${logInErrorCode}"/></p>   
                        </fmt:bundle>
                    </td>
                </tr>
                <c:set var="logInErrorCode" value="" scope="session"/>
            </c:if>
        </table>
    </form>
    <form name="RegisterForm" method="POST" action="./servlet">
        <input type="hidden" name="act" value="register"/>
        <table width="100%">    
            <tr style="height:24pt;">
                <td colspan="2" valign="bottom" align="right">
                    <div id="regLink">
                        <a href="#" onClick="document.RegisterForm.submit();"><fmt:message key="logIn.register"/></a>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</div>
