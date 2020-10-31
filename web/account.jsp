<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%-- Header --%>
<jsp:include page="header.jsp"/>

<%-- Content --%>
<div class="block1">
    <h1>- Account -</h1><br>

    <%
        String role = " ";
        String userId = " ";
        Cookie[] cookies = null;
        cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie: cookies) {
                if (cookie.getName().equals("role")) {
                    role = cookie.getValue();
                }
                if (cookie.getName().equals("userId")) {
                    userId = cookie.getValue();
                }
            }
        }

        out.println("<p>Role of Account: "+ role +"</p><br>");
        out.println("<p>Id of Account: "+ userId +"</p><br>");

        if (role.equals("Student")) {
            int number = Integer.parseInt(userId);
        %>
    <sql:query var="result2" dataSource="jdbc/db">
        SELECT * FROM borrowed WHERE deleted != 1 AND student_id = <%=number%>
    </sql:query>
    <p>List of book's borrowed by you:</p>
    <table>
        <tr>
            <th>ID:</th>
            <th>Book ISBN:</th>
            <th>Count:</th>
            <th>Borrowing Date:</th>
            <th>Returning Date:</th>
        </tr>
        <c:forEach items="${result2.rows}" var="row">
            <tr id="tr${row.id}">
                <td>${row.id}</td>
                <td>${row.book_id}</td>
                <td>${row.count}</td>
                <td>${row.borrowing_date}</td>
                <td>${row.returning_date}</td>
            </tr>
        </c:forEach>
    </table>
    <%
        }
    %>

</div>

<%-- Footer --%>
<jsp:include page="footer.jsp"/>
