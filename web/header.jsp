<!DOCTYPE HTML>
<html>
<head>
    <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/left-nav-style.css">
    <link rel="shortcut icon" href="img/book.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>- Library -</title>
</head>
<body>
<input type="checkbox" id="nav-toggle" hidden>
<nav class="nav">
    <label for="nav-toggle" class="nav-toggle" onclick></label>
    <h2>Menu</h2>
    <ul>
        <li><a href='index.jsp'>Main Page</a></li>
        <%
            String temp = " ";
            Cookie[] cookies = null;
            cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie: cookies) {
                    if (cookie.getName().equals("role")) {
                        temp = cookie.getValue();
                    }
                }
            }
            if (temp.equals(" ")) {
                out.print("<li><a href='library.jsp'>Library</a></li>");
                out.print("<li><a href='login.jsp'>Login</a></li>");
            } else if (temp.equals("Student")) {
                out.print("<li><a href='library.jsp'>Library</a></li>");
                out.print("<li><a href='account.jsp'>Account</a></li>");
                out.print("<li><a href='logOut'>Logout</a></li>");
            } else if (temp.equals("Librarian")) {
                out.print("<li><a href='booklist.jsp'>Books</a></li>");
                out.print("<li><a href='studentsList.jsp'>Students</a></li>");
                out.print("<li><a href='allBorrowedBooks.jsp'>Page with Events</a></li>");
                out.print("<li><a href='account.jsp'>Account</a></li>");
                out.print("<li><a href='logOut'>Logout</a></li>");
            }
        %>
    </ul>
</nav>

<header>
    <img src="img/book.png" width="100px" height="100px">
</header>
<div class="wrapper">