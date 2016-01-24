<%-- 
    Document   : order
    Created on : Jan 18, 2016, 11:50:15 PM
    Author     : Tanya Domchenko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/mytag_library.tld" prefix="ml"%>
<fmt:setLocale value="${locale}" />
<fmt:setBundle basename="com.carrental.locale.text" />

<table class="tableNoBorderAutoSize">
    <tr style="height:35pt;">
        <td class="tdMenuDataCaption">
            <fmt:message key="order.caption"/> #${sessionScope.contentManager.order.idApplication}
            <fmt:message key="order.state"/>: 
            <b><ml:MultiLangPropertyTag obj="${sessionScope.contentManager.order.state}" lang="${sessionScope.contentManager.lang}" propName="name"/></b>
        </td>
    </tr>
    <tr>
        <td>
            <c:set var="app" value="${sessionScope.contentManager.order.application}"/>
            <table class="tableNoBorder">
                <tr>
                    <td class="tdMenuDataText">
                        <fmt:formatDate value="${app.dateFrom}" type="date" dateStyle="short"/>
                        -
                        <fmt:formatDate value="${app.dateTo}" type="date" dateStyle="short"/>
                    </td>
                    <td class="tdMenuDataText">${app.car.model}</td>
                    <td class="tdMenuDataText">${app.car.price}</td>
                    <td class="tdMenuDataText">${app.summ}</td>                    
                    <td class="tdMenuDataText">
                        <fmt:formatDate value="${app.dateOperation}" type="date" dateStyle="short"/>
                    </td>                   
                </tr>
                <tr>                    
                    <td colspan="5" class="tdMenuDataText">
                        <ml:MultiLangPropertyTag obj="${app.placeFrom}" lang="${sessionScope.contentManager.lang}" propName="name"/>
                        (<ml:MultiLangPropertyTag obj="${app.placeFrom}" lang="${sessionScope.contentManager.lang}" propName="address"/>) -
                        <ml:MultiLangPropertyTag obj="${app.placeTo}" lang="${sessionScope.contentManager.lang}" propName="name"/>
                        (<ml:MultiLangPropertyTag obj="${app.placeTo}" lang="${sessionScope.contentManager.lang}" propName="address"/>)
                        
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="tdMenuDataCaption">
            <fmt:message key="order.payments"/>
        </td>
    </tr>    
    <tr>
        <td>
            <table class="tableNoBorder">
                <tr>
                    <td class="tdMenuDataCaptionSmall"><fmt:message key="payments.sum"/></td>
                    <td class="tdMenuDataCaptionSmall"><fmt:message key="payments.dateOpen"/></td>
                    <td class="tdMenuDataCaptionSmall"><fmt:message key="payments.dateClose"/></td>
                    <td class="tdMenuDataCaptionSmall"><fmt:message key="payments.note"/></td> 
                </tr>
                <c:forEach items="${sessionScope.contentManager.order.payments}" var="payment">
                    <tr>
                        <td class="tdMenuDataText">${payment.sum} ${payment.currencyCode}</td>
                        <td class="tdMenuDataText">
                            <fmt:formatDate value="${payment.dateOpen}" type="date" dateStyle="short"/>
                        </td>
                        <td class="tdMenuDataText">
                            <fmt:formatDate value="${payment.dateClose}" type="date" dateStyle="short"/>
                        </td>
                        <td class="tdMenuDataText">${payment.note}</td>
                    </tr>
                </c:forEach>
            </table>
        </td>
    </tr>
    <c:if test="${not empty sessionScope.contentManager.user && sessionScope.contentManager.user.isAdmin}">
        <tr>
            <td class="tdMenuDataCaption">
                <fmt:message key="order.client"/>
            </td>
        </tr>
        <tr>
            <td>
                <table class="tableNoBorder">
                    <tr>
                        <td class="tdMenuDataCaptionSmall"><fmt:message key="userInfo.surname"/></td>
                        <td class="tdMenuDataCaptionSmall"><fmt:message key="userInfo.firstName"/></td>
                        <td class="tdMenuDataCaptionSmall"><fmt:message key="userInfo.secondName"/></td>
                    </tr>
                    <tr>
                        <td class="tdMenuDataText">${app.client.surname}</td>
                        <td class="tdMenuDataText">${app.client.firstName}</td>
                        <td class="tdMenuDataText">${app.client.secondName}</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <c:if test="${sessionScope.contentManager.order.idState == 3}">
                    <form name="OrderForm" method="POST" action="./servlet">
                        <input type="hidden" name="act" value="vieworder"/>
                        <button class="cancelBtn" type="submit" name="giveOutCar" value="${app.id}">
                            <fmt:message key="order.giveOutCar"/>
                        </button>
                    </form>
                </c:if>
                <c:if test="${sessionScope.contentManager.order.idState == 5}">
                    <form name="OrderForm" method="POST" action="./servlet">
                        <input type="hidden" name="act" value="vieworder"/>
                        <button class="cancelBtn" type="submit" name="returnCar" value="${app.id}">
                            <fmt:message key="order.returnCar"/>
                        </button>
                        <label for="i1"><fmt:message key="order.damages"/></label>
                        <input id="i1" type="number" step="0.01" name="damages" value=''/>
                        <button class="rejectBtn" type="submit" name="repairCar" value="${app.id}">
                            <fmt:message key="order.repairCar"/>
                        </button>
                    </form>
                </c:if>
            </td>
        </tr>
    </c:if>        
</table>