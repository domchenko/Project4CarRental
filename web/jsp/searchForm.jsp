<%-- 
    Document   : searchForm
    Created on : Dec 8, 2015, 3:13:01 PM
    Author     : Tanya Domchenko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<fmt:setLocale value="${locale}" />
<fmt:setBundle basename="com.carrental.locale.text" />

<!DOCTYPE html>

<div class="divSearchForm"><fmt:message key="searchForm.caption"/>
    <form name="SearchForm" method="POST" action="./servlet"
          onSubmit="return validateSearchForm(event, messagesAllId);">
        <input type="hidden" name="act" value="search"/>
        <select class="comboList" name="placesAll" style="display:none;" id="placesAllId">
            <c:forEach items="${sessionScope.contentManager.places}" var="place">
                <option value="${place.key}">${place.value}</option>              
            </c:forEach>  
        </select>
        <select class="comboList" name="messagesAll" style="display:none;" id="messagesAllId">
            <c:forEach items="${sessionScope.contentManager.messages}" var="msg">
                <c:if test="${fn:startsWith( msg.key, 'errormsg.searchform.empty.' )}">
                    <option value="${fn:replace( msg.key, 'errormsg.searchform.empty.', '')}">${msg.value}</option>            
                </c:if>
            </c:forEach>  
        </select>

        <div class="dateControl">
            <fmt:message key="searchForm.dateFromLabel"/>:<br> 
            <input class="inputDate" type="date" name="dateFrom"/>
        </div>
        <div>
            <select class="comboList" name="ddlCityFrom" onchange="OnSelectCity(this,'placeFromId');">
                <option value="0"><fmt:message key="searchForm.cityFromHint"/></option>
                <c:forEach items="${sessionScope.contentManager.cities}" var="city">
                    <option value="${city.key}">${city.value}</option>              
                </c:forEach>  
            </select>
        </div>
        <div>
            <select class="comboList" name="ddlPlaceFrom" id="placeFromId">
                <option value="0"><fmt:message key="searchForm.placeFromHint"/></option>
            </select>
        </div>
        <div class="dateControl">
            <fmt:message key="searchForm.dateToLabel"/>:<br>
            <input class="inputDate" type="date" name="dateTo"/>
        </div>
        <div>
            <select class="comboList" name="ddlCityTo" onchange="OnSelectCity(this,'placeToId');">
                <option value="0"><fmt:message key="searchForm.cityToHint"/></option>
                <c:forEach items="${sessionScope.contentManager.cities}" var="city"  >
                    <option value="${city.key}">${city.value}</option>
                </c:forEach> 
            </select>
        </div>
        <div>
            <select class="comboList" name="ddlPlaceTo" id="placeToId">
                <option><fmt:message key="searchForm.placeToHint"/></option>
            </select>
        </div>
        <div>
            <button class="bookBtn" type="submit" name="search" value="go">
                <fmt:message key="searchForm.buttonCaption"/>
            </button>
        </div>
    </form>
</div>
