<%-- Header --%>
<jsp:include page="header.jsp"/>

<%-- Content --%>
<div class="block1">
    <%
        String position = (String) session.getAttribute("position");
        out.println("<p>"+position+"</p>");
    %>
</div>

<%-- Footer --%>
<jsp:include page="footer.jsp"/>