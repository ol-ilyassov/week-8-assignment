<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%-- Header --%>
<jsp:include page="header.jsp"/>

<%-- Content --%>
<div class="block1">
    <sql:query var="result" dataSource="jdbc/db">
        SELECT * FROM book WHERE deleted !=1 AND count !=0
    </sql:query>
    <p>Available Book's List</p>
    <table>
        <tr>
            <th>ISBN: </th>
            <th>Name: </th>
            <th>Author: </th>
        </tr>
        <c:forEach items="${result.rows}" var="row">
            <tr id="tr${row.isbn}">
                <td>${row.isbn}</td>
                <td>${row.name}</td>
                <td>${row.author}</td>
            </tr>
        </c:forEach>
    </table>
</div>


<%-- Footer --%>
<jsp:include page="footer.jsp"/>
