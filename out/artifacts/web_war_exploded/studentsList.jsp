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

    <a class="btnLink" href="studentForm.jsp?action=add&id=0">ADD STUDENT</a><br>

    <sql:query var="result" dataSource="jdbc/db">
        SELECT id, name, surname, login, password FROM student WHERE deleted = 0
    </sql:query>
    <p>Student's List</p>
    <table>
        <tr>
            <th>ID: </th>
            <th>Name: </th>
            <th>Surname: </th>
            <th>Login: </th>
            <th>Password: </th>
        </tr>
        <c:forEach items="${result.rows}" var="row">
            <tr id="tr${row.id}">
                <td>${row.id}</td>
                <td>${row.name}</td>
                <td>${row.surname}</td>
                <td>${row.login}</td>
                <td>${row.password}</td>
                <td><a class="btnLink" href="studentBooks.jsp?id=${row.id}">VIEW BOOKS</a></td>
                <td><a class="btnLink" href="studentForm.jsp?action=update&id=${row.id}">UPDATE</a></td>
                <td><button class="btn" onclick="deleteStudent(${row.id})">DELETE</button></td>
            </tr>
        </c:forEach>
    </table>
</div>

<script type="text/javascript">
    function deleteStudent(taskId){
        $.ajax({
                url:"ServletStudent?id="+taskId,
                type: "DELETE",
            }
        )
            .done (function(data, textStatus, jqXHR) {
                $('#response').text("SUCCESS: Student account deleted.");
                $('#tr'+taskId).remove();
            })
            .fail (function(jqXHR, textStatus, errorThrown) {
                alert("Error "+textStatus+": "+errorThrown);
            })
    }
</script>

<%-- Footer --%>
<jsp:include page="footer.jsp"/>
