<%-- 
    Document   : userCabinet
    Created on : Dec 10, 2015, 3:19:01 AM
    Author     : Tanya Domchenko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${locale}" />
<fmt:setBundle basename="com.carrental.locale.text" />

<div id="menuContainter">
<table class="tableNoBorder">
    <tr>
        <td class="tdUserMenu" valign="top">
            <ul class="ulUserMenu" id="menuLink">
                <c:if test="${not empty sessionScope.contentManager.user && sessionScope.contentManager.user.isAdmin}">
                    <li class="liUserMenu">
                        <form name="MenuApplicationsForm" method="POST" action="./servlet">
                            <input type="hidden" name="act" value="applications"/>
                            <input type="hidden" name="app_stateid_active" value="1"/>
                            <a href="#" onClick="document.MenuApplicationsForm.submit();"><fmt:message key="userMenu.admin.applications"/></a>
                        </form>
                    </li>
                    <li class="liUserMenu">
                        <form name="MenuPaymentsForm" method="POST" action="./servlet">
                            <input type="hidden" name="act" value="payments"/>
                            <input type="hidden" name="payment_stateid_active" value="1"/>
                            <a href="#" onClick="document.MenuPaymentsForm.submit();"><fmt:message key="userMenu.admin.payments"/></a>
                        </form>
                    </li>
                    <li class="liUserMenu">
                        <form name="MenuSearchOrderForm" method="POST" action="./servlet">
                            <input type="hidden" name="act" value="searchorder"/>
                            <a href="#" onClick="document.MenuSearchOrderForm.submit();"><fmt:message key="userMenu.admin.searchOrder"/></a>
                        </form>
                    </li>
                </c:if>    
                <c:if test="${not empty sessionScope.contentManager.user && !sessionScope.contentManager.user.isAdmin}">    
                    <li class="liUserMenu">
                        <form name="MenuMyApplicationsForm" method="POST" action="./servlet">
                            <input type="hidden" name="act" value="applications"/>
                            <input type="hidden" name="app_stateid_active" value="1"/>
                            <a href="#" onClick="document.MenuMyApplicationsForm.submit();"><fmt:message key="userMenu.myApplications"/></a>
                        </form>
                    </li>
                    <li class="liUserMenu">
                        <form name="MenuMyPaymentsForm" method="POST" action="./servlet">
                            <input type="hidden" name="act" value="payments"/>
                            <input type="hidden" name="payment_stateid_active" value="1"/>                            
                            <a href="#" onClick="document.MenuMyPaymentsForm.submit();"><fmt:message key="userMenu.myPayments"/></a>
                        </form>
                    </li>
                </c:if>    
                    <li class="liUserMenu">
                        <form name="MenuInfoForm" method="POST" action="./servlet">
                            <input type="hidden" name="act" value="userinfo"/>
                            <a href="#" onClick="document.MenuInfoForm.submit();"><fmt:message key="userMenu.myInfo"/></a>
                        </form>
                    </li>
            </ul>
        </td>
        <td class="tdUserMenuContent" valign="top">
            <c:import url="${menuContentPath}"/>
        </td>
    </tr>
</table>
</div>