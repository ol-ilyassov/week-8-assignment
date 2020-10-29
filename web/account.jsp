<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- Header --%>
<jsp:include page="header.jsp"/>

<%-- Content --%>
<div class="block1">
    <h1>- Account -</h1><br>
    <p>Name: <%= session.getAttribute("name")%></p><br>
    <p>Login: <%= session.getAttribute("login")%></p><br>

    <jsp:useBean id="myDate1" class="java.util.Date"/>
    <c:set target="${myDate1}" property="time" value="${session.getCreationTime()}"/>
    <p>Session Creation Time: ${myDate1}</p><br>

    <jsp:useBean id="myDate2" class="java.util.Date"/>
    <c:set target="${myDate2}" property="time" value="${session.getLastAccessedTime()}"/>
    <p>Session Last Accessed Time: ${myDate2}</p><br>

</div>

<%-- Footer --%>
<jsp:include page="footer.jsp"/>
