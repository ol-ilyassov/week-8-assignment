<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%-- Header --%>
<jsp:include page="header.jsp"/>

<%-- Content --%>
<div class="block1">
    <form action="ServletBook" method="post">
        <input type="text" name="action" value="${param['action']}" hidden>

        <table>
            <c:choose>
                <c:when test = "${param['action'] == 'update'}">
                    <sql:query var="result" dataSource="jdbc/db">
                        SELECT name,author,count FROM book where isbn = ${param['isbn']}
                    </sql:query>
                    <c:forEach items="${result.rows}" var="row">
                        <input type="text" name="isbn" value="${param['isbn']}" hidden>
                        <tr>
                            <td>Name:</td>
                            <td><input type='text' name='name' value="${row.name}"></td>
                        </tr>
                        <tr>
                            <td>Author:</td>
                            <td><input type='text' name='author' value="${row.author}"></td>
                        </tr>
                        <tr>
                            <td>Count:</td>
                            <td><input type='text' name='count' value="${row.count}"></td>
                        </tr>
                        <tr>
                            <td><input type="submit" name="submitBtn" value="OK"></td>
                            <td></td>
                        </tr>
                    </c:forEach>
                </c:when>

                <c:otherwise>
                    <tr>
                        <td>ISBN:</td>
                        <td><input type='text' name='isbn'></td>
                    </tr>
                    <tr>
                        <td>Name:</td>
                        <td><input type='text' name='name'></td>
                    </tr>
                    <tr>
                        <td>Author:</td>
                        <td><input type='text' name='author'></td>
                    </tr>
                    <tr>
                        <td>Count:</td>
                        <td><input type='text' name='count'></td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="submitBtn" value="OK"></td>
                        <td></td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </table>
    </form>
</div>

<%-- Footer --%>
<jsp:include page="footer.jsp"/>
