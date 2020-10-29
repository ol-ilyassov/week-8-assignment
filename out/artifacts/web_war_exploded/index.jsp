
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
<head>
    <title>todo list</title>
    <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>

</head>
<body>

<jsp:include page="add.jsp" />
<hr>
<sql:query var="result" dataSource="jdbc/db">
    SELECT * FROM todo
</sql:query>
<table>
    <tr><th>task</th></tr>

    <c:forEach items="${result.rows}" var="row">
        <tr id="tr${row.id}"><td>${row.task}</td><td><button onclick="deleteTask(${row.id})">DELETE</button> </td></tr>
    </c:forEach>
    <script type="text/javascript">
        function deleteTask(taskId){
            console.log("deleteTask: "+taskId);
            $.ajax({
                    url:"servlet?id="+taskId,
                    type: "DELETE",
                }
            )
                .done (function(data, textStatus, jqXHR) {
                    alert("Success ");
                    $('#tr'+taskId).remove();
                })
                .fail (function(jqXHR, textStatus, errorThrown) {
                    alert("Error "+textStatus+": "+errorThrown);
                })

        }
    </script>
</table>
</body>
</html>
