<%-- 
    Document   : userInfo
    Created on : Jan 12, 2016, 1:33:54 AM
    Author     : Tanya Domchenko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${locale}" />
<fmt:setBundle basename="com.carrental.locale.text" />

<div class='menuContentDiv'>
    <form name="UserInfoForm" method="POST" action="./servlet">
        <input type="hidden" name="act" value="userinfo"/>
        <table class="tableNoBorderAutoSize">
            <tr>
                <td class="tdMenuDataCaption">
                    <label for="i1"><fmt:message key="userInfo.surname"/></label>
                </td>
                <td>
                    <input id="i1" type="text" name="surname" 
                           value='${not empty sessionScope.contentManager.user.client ? sessionScope.contentManager.user.client.surname : ""}'/>
                </td>
            </tr>
            <tr>
                <td class="tdMenuDataCaption">
                    <label for="i2"><fmt:message key="userInfo.firstName"/></label>
                </td>
                <td>
                    <input id="i2" type="text" name="firstName" 
                           value='${not empty sessionScope.contentManager.user.client ? sessionScope.contentManager.user.client.firstName : ""}'/>
                </td>
            </tr>
            <tr>
                <td class="tdMenuDataCaption">
                    <label for="i3"><fmt:message key="userInfo.secondName"/></label>
                </td>
                <td>
                    <input id="i3" type="text" name="secondName" 
                           value='${not empty sessionScope.contentManager.user.client ? sessionScope.contentManager.user.client.secondName : ""}'/>
                </td>
            </tr>
            <tr>
                <td class="tdMenuDataCaption">
                    <label for="i4"><fmt:message key="userInfo.passportNumber"/></label>
                </td>
                <td>
                    <input id="i4" type="text" name="passportNumber" 
                           value='${not empty sessionScope.contentManager.user.client ? sessionScope.contentManager.user.client.passportNumber : ""}'/>
                </td>
            </tr>
            <tr>
                <td class="tdMenuDataCaption">
                    <label for="i5"><fmt:message key="userInfo.dateOfIssue"/></label>
                </td>
                <td>
                    <input id="i5" type="date" name="dateOfIssue" 
                           value='${not empty sessionScope.contentManager.user.client ? sessionScope.contentManager.user.client.dateOfIssue : ""}'/>
                </td>
            </tr>
            <tr>
                <td class="tdMenuDataCaption">
                    <label for="i6"><fmt:message key="userInfo.validUntil"/></label>
                </td>
                <td>
                    <input id="i6" type="date" name="validUntil"
                           value='${not empty sessionScope.contentManager.user.client ? sessionScope.contentManager.user.client.validUntil : ""}'/>
                </td>
            </tr>
            <tr>
                <td class="tdMenuDataCaption">
                    <label for="i7"><fmt:message key="userInfo.issuedBy"/></label>
                </td>
                <td>
                    <textarea id="i7" rows="2" cols="50" name="issuedBy">${not empty sessionScope.contentManager.user.client ? sessionScope.contentManager.user.client.issuedBy : ""}</textarea>
                </td>
            </tr>
            <tr>
                <td class="tdMenuDataCaption">
                    <label for="i8"><fmt:message key="userInfo.birthday"/></label>
                </td>
                <td>
                    <input id="i8" type="date" name="birthday"
                           value='${not empty sessionScope.contentManager.user.client ? sessionScope.contentManager.user.client.birthday : ""}'/>
                </td>
            </tr>
            <tr>
                <td class="tdMenuDataCaption">
                    <label for="i9"><fmt:message key="userInfo.address"/></label>
                </td>
                <td>
                    <textarea id="i9" rows="3" cols="50" name="address">${not empty sessionScope.contentManager.user.client ? sessionScope.contentManager.user.client.address : ""}</textarea>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <button class="saveBtn" type="submit" name="userInfo" value="save">
                        <fmt:message key="userInfo.buttonCaption"/>
                    </button>
                </td>
            </tr>
        </table>
    </form>
</div>