<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- Header --%>
<jsp:include page="header.jsp"/>

<%-- Content --%>
<div class="block1">
    <h1>- Account -</h1><br>
    <p>Name: <%= session.getAttribute("name")%></p><br>
    <p>Login: <%= session.getAttribute("login")%></p><br>

</div>

<%-- Footer --%>
<jsp:include page="footer.jsp"/>
