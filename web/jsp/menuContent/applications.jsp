<%-- 
    Document   : cities
    Created on : Dec 10, 2015, 5:07:08 PM
    Author     : Tanya Domchenko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="/WEB-INF/tlds/mytag_library.tld" prefix="ml"%>
<fmt:setLocale value="${locale}" />
<fmt:setBundle basename="com.carrental.locale.text" />

<table class="tableNoBorderAutoSize">
    <tr>
        <td valign="top">
            <ul class="ulListStateMenu" id="listStateLink">
                <c:forEach items="${sessionScope.contentManager.appStates}" var="state">
                    <form name="form${state.id}" method="POST" action="./servlet" style="display: inline-block;">
                        <input type="hidden" name="act" value="applications"/>
                        <input type="hidden" name="app_stateid_active" value="${state.id}"/>
                        <c:choose>
                            <c:when test="${state.id == sessionScope.app_stateid_active}">
                                <li class="liListStateMenu">
                                    <a class="active" href="#" onClick="document.form${state.id}.submit();">
                                        <ml:MultiLangPropertyTag obj="${state}" lang="${sessionScope.contentManager.lang}" propName="name"/>
                                    </a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="liListStateMenu">
                                    <a href="#" onClick="document.form${state.id}.submit();">
                                        <ml:MultiLangPropertyTag obj="${state}" lang="${sessionScope.contentManager.lang}" propName="name"/>
                                    </a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </form>
                </c:forEach>
            </ul>
        </td>
    </tr>
</table>

<form name="ApplicationsForm" method="POST" action="./servlet">
    <input type="hidden" name="act" value="applications"/>
    
    <table width="100%">
        <tr style="height:35pt;">
            <td class="tdMenuDataCaption"><fmt:message key="applications.from"/></td>                
            <td class="tdMenuDataCaption"><fmt:message key="applications.to"/></td>
            <td class="tdMenuDataCaption"><fmt:message key="applications.car"/></td>
            <td class="tdMenuDataCaption"><fmt:message key="applications.price"/></td>
            <td class="tdMenuDataCaption"><fmt:message key="applications.total"/></td>
            <td class="tdMenuDataCaption"><fmt:message key="applications.state"/></td>
            <td class="tdMenuDataCaption"><fmt:message key="applications.date"/></td>                
        </tr>

        <c:forEach items="${sessionScope.contentManager.applications}" var="app">            
            <tr>
                <td class="tdMenuDataText">
                    <fmt:formatDate value="${app.dateFrom}" type="date" dateStyle="short"/>
                </td>
                <td class="tdMenuDataText">
                    <fmt:formatDate value="${app.dateTo}" type="date" dateStyle="short"/>
                </td>
                <td rowspan="2" class="tdMenuDataText">${app.car.model}</td>
                <td rowspan="2" class="tdMenuDataText">${app.car.price}</td>
                <td rowspan="2" class="tdMenuDataText">${app.summ}</td>
                <td rowspan="2" class="tdMenuDataText">
                    <ml:MultiLangPropertyTag obj="${app.state}" lang="${sessionScope.contentManager.lang}" propName="name"/>
                    <div style="text-align: center;">
                        <c:if test="${not empty app.order}">
                            <button type="submit" name="viewOrder" value="${app.id}" title="<fmt:message key="applications.viewOrderHint"/>">
                                <img src="images/view.png" alt="<fmt:message key="applications.viewOrderHint"/>"/>
                            </button>
                        </c:if>
                    </div>
                </td>
                <td rowspan="2" class="tdMenuDataText">${app.dateOperation}</td>                   
            </tr>
            <tr>
                <td class="tdMenuDataText">
                    <span title="<ml:MultiLangPropertyTag obj="${app.placeFrom}" lang="${sessionScope.contentManager.lang}" propName="address"/>">
                        <ml:MultiLangPropertyTag obj="${app.placeFrom}" lang="${sessionScope.contentManager.lang}" propName="name"/>
                    </span>
                </td>
                <td class="tdMenuDataText">
                    <span title="<ml:MultiLangPropertyTag obj="${app.placeTo}" lang="${sessionScope.contentManager.lang}" propName="address"/>">
                        <ml:MultiLangPropertyTag obj="${app.placeTo}" lang="${sessionScope.contentManager.lang}" propName="name"/>
                    </span>
                </td>
            </tr>
            <tr>
                <td class="tdMenuDataCaption"><fmt:message key="applications.note"/></td>                
                <td colspan="6" class="tdMenuDataText">
                    <div><textarea rows="3" cols="30" name="note${app.id}">${app.note}</textarea></div>
                </td>                
            </tr>                    
            <tr>
                <td colspan="7" align="right">
                    <c:if test="${not empty sessionScope.contentManager.user && sessionScope.contentManager.user.isAdmin}">
                        <c:if test="${app.idState == 1}">
                            <button class="confirmBtn" type="submit" name="confirmApplication" value="${app.id}">
                                <fmt:message key="applications.confirmApplication"/>
                            </button>
                            <button class="rejectBtn" type="submit" name="rejectApplication" value="${app.id}">
                                <fmt:message key="applications.rejectApplication"/>
                            </button>
                        </c:if>
                    </c:if>
                    <c:if test="${not empty sessionScope.contentManager.user && !sessionScope.contentManager.user.isAdmin}">
                        <c:if test="${app.idState == 1}">
                            <button class="cancelBtn" type="submit" name="cancelApplication" value="${app.id}">
                                <fmt:message key="applications.cancelApplication"/>
                            </button>
                        </c:if>
                    </c:if>
                </td>
            </tr>
        </c:forEach>        
    </table>
</form>