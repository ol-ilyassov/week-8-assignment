<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%-- Header --%>
<jsp:include page="header.jsp"/>

<%-- Content --%>
<div class="block1">

    <p>Status of Last Action:</p><br>
    <p id="response">
        <c:choose>
            <c:when test = "${empty response}">
                - NO COMPLETED PROCESSES -
            </c:when>
            <c:when test = "${not empty response}">
                <c:out value="${response}"/>
            </c:when>
        </c:choose>
    </p><br>

    <sql:query var="result1" dataSource="jdbc/db">
        SELECT isbn, name FROM book WHERE deleted = 0
    </sql:query>

    <p>Adding Book to Student:</p><br>
    <form action="ServletBorrowedBook" method="post">
        <input type="text" name="id" value="${param['id']}" hidden>
        <p>Book Name:</p>
        <select name="bookIsbn">
            <c:forEach items="${result1.rows}" var="row">
                <option value="${row.isbn}">${row.name}</option>
            </c:forEach>
        </select>
        <p>Count of Copies:</p>
        <input type="text" name="count" required>
        <p>Date to Return:</p>
        <input type="date" name="returnDate" required>
        <td><input type="submit" name="submitBtn" value="ADD BOOK"></td>
    </form>
    <br><hr><br>
    <sql:query var="result2" dataSource="jdbc/db">
        SELECT * FROM borrowed WHERE deleted != 1 AND student_id = ${param['id']}
    </sql:query>
    <table>
        <tr>
            <th>ID:</th>
            <th>Book:</th>
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
                <td><button class="btn" onclick="returnBook(${row.id}, ${row.book_id}, ${row.count})">DELETE</button></td>
            </tr>
        </c:forEach>
    </table>
</div>

<script type="text/javascript">
    function returnBook(recordId, bookId, count){
        $.ajax({
                url:"ServletBorrowedBook?id="+recordId+"&isbn="+bookId+"&count="+count,
                type: "DELETE",
            }
        )
            .done (function(data, textStatus, jqXHR) {
                $('#response').text("SUCCESS: Book is returned.");
                $('#tr'+recordId).remove();
            })
            .fail (function(jqXHR, textStatus, errorThrown) {
                alert("Error "+textStatus+": "+errorThrown);
            })
    }
</script>

<%-- Footer --%>
<jsp:include page="footer.jsp"/>