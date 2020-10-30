<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!--<form action="servlet" method="post">
    <table>
        <tr><td>book isbn:</td><td><input type='number' name='isbn'></td></tr>
        <tr><td>book name:</td><td><input type='text' name='name'></td></tr>
        <tr><td>book author:</td><td><input type='text' name='author'></td></tr>
        <tr><td>book count:</td><td><input type='number' name='count'></td></tr>
        <tr><td><input type="submit" name="name" value="OK"></td><td></td></tr>
    </table>
</form>-->
<form action="servlet" method="post">
    <input type="text" name="action" value="${param['action']}" hidden>
    <table>
        <c:choose>
            <c:when test = "${param['action'] == 'update'}">
                    <input type="text" name="isbn" value="${param['isbn']}" hidden>
                    <tr><td>book name:</td><td><input type='text' name='name'></td></tr>
                    <tr><td>book author:</td><td><input type='text' name='author'></td></tr>
                    <tr><td>book count:</td><td><input type='number' name='count'></td></tr>
                    <tr><td><input type="submit" name="name" value="OK"></td><td></td></tr>
            </c:when>

            <c:otherwise>
                <tr><td>book isbn:</td><td><input type='number' name='isbn'></td></tr>
                <tr><td>book name:</td><td><input type='text' name='name'></td></tr>
                <tr><td>book author:</td><td><input type='text' name='author'></td></tr>
                <tr><td>book count:</td><td><input type='number' name='count'></td></tr>
                <tr><td><input type="submit" name="name" value="OK"></td><td></td></tr>
            </c:otherwise>
        </c:choose>
    </table>
</form>

