<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
<head>
    <title>todo list</title>
    <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>
</head>
<body>

<c:if test="${not empty response}">
    <p>${response}</p>
</c:if>

<jsp:include page="add.jsp?action=add" />
<hr>

<sql:query var="result" dataSource="jdbc/db">
    SELECT * FROM book WHERE deleted !=1
</sql:query>
<table>
    <tr><th>book</th></tr>

    <c:forEach items="${result.rows}" var="row">
        <tr id="tr${row.isbn}">
            <td>${row.name}</td>
            <td>${row.author}</td>
            <td>${row.count}</td>
            <td><button><a style="color: black;text-decoration: none;" href="add.jsp?action=update&isbn=${row.isbn}">UPDATE</a></button> </td>
            <td><button onclick="deleteTask(${row.isbn})">DELETE</button> </td></tr>
    </c:forEach>
    <script type="text/javascript">
        function deleteTask(bookisbn){
            console.log("deleteTask: "+bookisbn);
            $.ajax({
                    url:"servlet?isbn="+bookisbn,
                    type: "DELETE",
                }
            )
                .done (function(data, textStatus, jqXHR) {
                    alert("Success ");
                    $('#tr'+bookisbn).remove();
                })
                .fail (function(jqXHR, textStatus, errorThrown) {
                    alert("Error "+textStatus+": "+errorThrown);
                })
        }
    </script>
</table>
</body>
</html>
