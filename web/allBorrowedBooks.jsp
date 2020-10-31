
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%-- Header --%>
<jsp:include page="header.jsp"/>

<%-- Content --%>
<div class="block1">
        <sql:query var="result2" dataSource="jdbc/db">
        SELECT * FROM borrowed WHERE deleted != 1 ORDER BY borrowing_date DESC, returning_date DESC, id ASC
        </sql:query>
    <h1>List of All Borrowed Books</h1><br>
    <p>List of borrowed books is listed by borrowing date and returning date.</p><br>
        <table>
            <tr>
                <th>ID:</th>
                <th>Student ID</th>
                <th>Book ISBN:</th>
                <th>Count:</th>
                <th>Borrowing Date:</th>
                <th>Returning Date:</th>
            </tr>
            <c:forEach items="${result2.rows}" var="row">
                <tr id="tr${row.id}">
                    <td>${row.id}</td>
                    <td>${row.student_id}</td>
                    <td>${row.book_id}</td>
                    <td>${row.count}</td>
                    <td>${row.borrowing_date}</td>
                    <td>${row.returning_date}</td>
                </tr>
            </c:forEach>
        </table>
</div>

<%-- Footer --%>
<jsp:include page="footer.jsp"/>