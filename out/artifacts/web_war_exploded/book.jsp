<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String driver = "com.mysql.cj.jdbc.Driver";
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Context initContext = new InitialContext();
    Context envContext = (Context) initContext.lookup("java:/comp/env");
    DataSource dataSource = (DataSource) envContext.lookup("jdbc/db");
    Statement statement = null;
    ResultSet resultSet = null;
%>
<%-- Header --%>
<jsp:include page="header.jsp"/>
<head>
    <style>
        .container{
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }
        .items{
            font-size: 30px;
            border: solid black;
            border-radius: 1px;
            width: 80%;
        }
        td,table,th{
            text-align: center;
            border: 1px solid black;
        }
    </style>
</head>
<div class="container">
    <table class="items">
        <tr>
            <th>ISBN</th>
            <th>Name</th>
            <th>Author</th>
        </tr>
        <%
            try{
                Connection connection = dataSource.getConnection();
                statement=connection.createStatement();
                String sql ="select * from week8.book";
                resultSet = statement.executeQuery(sql);
                while(resultSet.next()){
        %>
        <tr>
            <td><%=resultSet.getString("isbn") %></td>
            <td><%=resultSet.getString("name") %></td>
            <td><%=resultSet.getString("author") %></td>
        </tr>
            <%
}
                connection.close();
                } catch (Exception e) {
                e.printStackTrace();
}
%>
    </table>

<%-- Footer --%>
<jsp:include page="footer.jsp"/>