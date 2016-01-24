<%-- 
    Document   : searchOrder
    Created on : Jan 19, 2016, 10:35:13 PM
    Author     : Tanya Domchenko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${locale}" />
<fmt:setBundle basename="com.carrental.locale.text" />

<form name="SearchOrderForm" method="POST" action="./servlet">
    <input type="hidden" name="act" value="searchorder"/>
    <table class="tableNoBorderAutoSize">
        <tr>
            <td class="tdMenuDataCaption"><fmt:message key="searchorder.applicationNumber"/></td>
            <td><input type="text" name="applicationNumber" autofocus="autofocus"/></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <button class="saveBtn" type="submit" name="searchApplication" value="search">
                    <fmt:message key="searchorder.buttonCaption"/>
                </button>
            </td>
        </tr>
    </table>
</form>
