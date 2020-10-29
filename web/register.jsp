<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- Header --%>
<jsp:include page="header.jsp"/>

<%-- Content --%>
<script src="js/login-register.js"></script>
<div class="block1">
    <h1>- Registration Form -</h1><br>
    <div class="msg">
        <span id="successMsg" class="success"></span>
        <span id="failMsg" class="error"></span>
    </div>
    <form role="form" method="post" name="reg-form">
        <fieldset>
            <div class="form-register">
                <div>
                    <label for="reg-firstName">First Name:</label>
                    <input type="text" id="reg-firstName" name="reg-firstName" placeholder="Enter First Name">
                    <span id="reg-firstName-error" class="error"></span>
                </div>
                <div>
                    <label for="reg-lastName">Last Name:</label>
                    <input type="text" id="reg-lastName" name="reg-lastName" placeholder="Enter Last Name">
                    <span id="reg-lastName-error" class="error"></span>
                </div>
                <div>
                    <label for="reg-login">Login:</label>
                    <input type="text" id="reg-login" name="reg-login" placeholder="Enter Login">
                    <span id="reg-login-error" class="error"></span>
                </div>
                <div>
                    <label for="reg-email">Email:</label>
                    <input type="text" id="reg-email" name="reg-email" placeholder="Enter Email">
                    <span id="reg-email-error" class="error"></span>
                </div>
                <div>
                    <label for="reg-password">Password:</label>
                    <input type="password" id="reg-password" name="reg-password" placeholder="Enter Password">
                    <span id="reg-password-error" class="error"></span>
                </div>
                <div>
                    <label for="reg-repassword">Re-Password:</label>
                    <input type="password" id="reg-repassword" name="reg-repassword" placeholder="Enter Re-Password">
                    <span id="reg-repassword-error" class="error"></span>
                </div>
                <div class="buttons">
                    <input type="button" id="reg-button" name="reg-button" value="Register">
                    <input type="button" id="reg-clear" name="reg-clear" value="Clear">
                </div>
            </div>
        </fieldset>
    </form>
</div>

<%-- Footer --%>
<jsp:include page="footer.jsp"/>
