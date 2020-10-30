<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- Header --%>
<jsp:include page="header.jsp"/>

<%-- Content --%>
<script src="js/login-register.js"></script>
<div class="block1">
    <h1>- Authorization Form -</h1><br>
    <div class="msg">
        <span id="failMsg" class="error"></span>
    </div>
    <form role="form" method="post" name="log-form" action="logServlet">
        <fieldset>
            <div class="form-login">
                <div>
                    <label for="log-login">Login:</label>
                    <input type="text" id="log-login" name="log-login" placeholder="Enter Login">
                    <span id="log-login-error" class="error"></span>
                </div>
                <div>
                    <label for="log-password">Password:</label>
                    <input type="password" id="log-password" name="log-password" placeholder="Enter Password">
                    <span id="log-password-error" class="error"></span>
                </div>
                <div class="buttons">
                    <input type="button" id="log-button" name="log-button" value="Login">
                    <input type="button" id="log-clear" name="log-clear" value="Clear">
                </div>
            </div>
        </fieldset>
    </form>
</div>

<%-- Footer --%>
<jsp:include page="footer.jsp"/>