<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%-- Header --%>
<jsp:include page="header.jsp"/>

<%-- Content --%>
<div class="block1">
    <form action="ServletStudent" method="post">
        <input type="text" name="action" value="${param['action']}" hidden>

        <table>
            <c:choose>
                <c:when test = "${param['action'] == 'update'}">
                    <sql:query var="result" dataSource="jdbc/db">
                        SELECT name,surname,login,password FROM student where id = ${param['id']}
                    </sql:query>
                    <c:forEach items="${result.rows}" var="row">
                        <input type="text" name="id" value="${param['id']}" hidden>
                        <tr>
                            <td>Name:</td>
                            <td><input type='text' name='name' value="${row.name}"></td>
                        </tr>
                        <tr>
                            <td>Surname:</td>
                            <td><input type='text' name='surname' value="${row.surname}"></td>
                        </tr>
                        <tr>
                            <td>Login:</td>
                            <td><input type='text' name='login' value="${row.login}"></td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td><input type='text' name='password' value="${row.password}"></td>
                        </tr>
                        <tr>
                            <td><input type="submit" name="submitBtn" value="OK"></td>
                            <td></td>
                        </tr>
                    </c:forEach>
                </c:when>

                <c:otherwise>
                    <tr>
                        <td>ID:</td>
                        <td><input type='text' name='id'></td>
                    </tr>
                    <tr>
                        <td>Name:</td>
                        <td><input type='text' name='name'></td>
                    </tr>
                    <tr>
                        <td>Surname:</td>
                        <td><input type='text' name='surname'></td>
                    </tr>
                    <tr>
                        <td>Login:</td>
                        <td><input type='text' name='login'></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type='text' name='password'></td>
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
