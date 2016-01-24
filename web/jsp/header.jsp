<%-- 
    Document   : header
    Created on : Dec 8, 2015, 2:56:12 PM
    Author     : Tanya Domchenko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<table class="tableNoBorder">
    <tr style="height:45px;">
        <td style="width:248px;padding: 5px;">
            <form name="HomeForm" method="POST" action="./servlet">
                <input type="hidden" name="act" value="home"/>
                <a href="#" onClick="document.HomeForm.submit();"><img src="images/logo.png"/></a>
            </form>
        </td>
        <td>
            <div></div>
        </td>
        <td align="right">
            <form name="LoginForm" method="POST" action="./servlet">
                <input type="hidden" name="act" value="login"/>
            </form>
            <form name="LogoutForm" method="POST" action="./servlet">
                <input type="hidden" name="act" value="logout"/>
            </form>
            <form name="UserCabinetForm" method="POST" action="./servlet">
                <input type="hidden" name="act" value="usercabinet"/>
            </form>
            <form name="UAForm" method="POST" action="./servlet">
                <input type="hidden" name="act" value="lang"/>
                <input type="hidden" name="lang" value="uk"/>
            </form>
            <form name="ENForm" method="POST" action="./servlet">
                <input type="hidden" name="act" value="lang"/>
                <input type="hidden" name="lang" value="en"/>                
            </form>
            <!-- log in/log out -->        
            <c:choose>
                <c:when test="${empty sessionScope.contentManager.user}">
                    <span style="padding: 5px;">
                        <a class="loginLink" href="#" onClick="document.LoginForm.submit();"><fmt:message key="header.logIn"/></a>
                    </span>
                </c:when>
                <c:otherwise>
                    <span style="padding: 5px;">
                        <a class="loginLink" href="#" onClick="document.UserCabinetForm.submit();"><fmt:message key="userCabinet.caption"/></a>
                    </span>
                    <span style="padding: 5px;">
                        <a class="loginLink" href="#" onClick="document.LogoutForm.submit();"><fmt:message key="header.logOut"/></a>
                    </span>
                </c:otherwise>
            </c:choose>                
            <!-- languages -->
            <span style="padding: 5px;">
                <a href="#" onClick="document.UAForm.submit();" 
                    class="${locale.language == 'uk' ? "languageLinkActive" : "languageLink" }">UA</a>
                <a href="#" onClick="document.ENForm.submit();" 
                   class="${locale.language == 'en' ? "languageLinkActive" : "languageLink" }">EN</a>
            </span>
        </td>
    </tr>
</table>
