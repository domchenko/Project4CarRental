<%-- 
    Document   : payments
    Created on : Jan 18, 2016, 2:22:11 AM
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
                <c:forEach items="${sessionScope.contentManager.orderStates}" var="state">
                    <form name="form${state.id}" method="POST" action="./servlet" style="display: inline-block;">
                        <input type="hidden" name="act" value="payments"/>
                        <input type="hidden" name="payment_stateid_active" value="${state.id}"/>
                        <c:choose>
                            <c:when test="${state.id == sessionScope.payment_stateid_active}">
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


<form name="PaymentsForm" method="POST" action="./servlet">
    <input type="hidden" name="act" value="payments"/>
    
    <table width="100%">
        <tr style="height:35pt;">
            <td class="tdMenuDataCaption"><fmt:message key="payments.number"/></td>
            <td class="tdMenuDataCaption"><fmt:message key="payments.sum"/></td>
            <td class="tdMenuDataCaption"><fmt:message key="payments.dateOpen"/></td>
            <td class="tdMenuDataCaption"><fmt:message key="payments.dateClose"/></td>
            <td class="tdMenuDataCaption"><fmt:message key="payments.state"/></td>
            <td class="tdMenuDataCaption"><fmt:message key="payments.note"/></td>                
        </tr>
        
        <c:forEach items="${sessionScope.contentManager.payments}" var="payment">
            <tr>
                <td class="tdMenuDataText">
                    ${payment.order.idApplication}
                    <span style="text-align: left;">
                        <c:if test="${not empty payment.order}">
                            <button type="submit" name="viewOrder" value="${payment.order.idApplication}" 
                                    title="<fmt:message key="applications.viewOrderHint"/>">
                                <img src="images/view.png" alt="<fmt:message key="payments.viewOrderHint"/>"/>
                            </button>
                        </c:if>
                    </span>
                </td>
                <td class="tdMenuDataText">${payment.sum} ${payment.currencyCode}</td>
                <td class="tdMenuDataText">
                    <fmt:formatDate value="${payment.dateOpen}" type="date" dateStyle="short"/>
                </td>
                <td class="tdMenuDataText">
                    <fmt:formatDate value="${payment.dateClose}" type="date" dateStyle="short"/>
                </td>
                <td class="tdMenuDataText">
                    <ml:MultiLangPropertyTag obj="${payment.order.state}" lang="${sessionScope.contentManager.lang}" propName="name"/>
                </td>
                <td class="tdMenuDataText">${payment.note}</td>
            </tr>
            <tr>
                <td colspan="6" align="right">
                    <c:if test="${not empty sessionScope.contentManager.user && sessionScope.contentManager.user.isAdmin}">
                        <c:if test="${not empty payment.order and payment.order.idState == 1}">
                            <button class="confirmBtn" type="submit" name="confirmPayment" value="${payment.id}">
                                <fmt:message key="payments.confirmPayment"/>
                            </button>
                            <button class="rejectBtn" type="submit" name="rejectPayment" value="${payment.id}">
                                <fmt:message key="payments.rejectPayment"/>
                            </button>
                        </c:if>
                        <c:if test="${not empty payment.order and payment.order.idState == 6 and empty payment.dateClose }">
                            <button class="confirmBtn" type="submit" name="repairPayment" value="${payment.id}">
                                <fmt:message key="payments.confirmPayment"/>
                            </button>
                        </c:if>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
</form>
