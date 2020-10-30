
/* --- Functions to validate input data --- */

function validateEmail(input) {
	var emailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	if (emailFormat.test(input)) {
		return true;
	} else {
		return false;
	}
}

function pregMatchCommon(input) {
	var emailFormat = /^[a-zA-Z0-9!@#$%^&*()_+-<>?]*$/;
	if (emailFormat.test(input)) {
		return true;
	} else {
		return false;
	}
}

function pregMatchAlphabets(input) {
	var regExp = /^[a-zA-Z]*$/;
	if (regExp.test(input)) {
		return true;
	} else {
		return false
	}
}

function pregMatchNumbers(input) {
	var regExp = /^[0-9]*$/;
	if (regExp.test(input)) {
		return true;
	} else {
		return false
	}
}

/* --- [Authorization] --- */

//Validation of input data before making authorisation.
$(document).ready(function(){
    $('#log-login').keyup(function(){
        $('#log-login-error').text("");
        $('#failMsg').text("");
        if (!pregMatchCommon($('#log-login').val())) {
            $('#log-login-error').text("Invalid Login format");
        }
    });
    $('#log-password').keyup(function(){
        $('#log-password-error').text("");
        $('#failMsg').text("");
        if (!pregMatchCommon($('#log-password').val())) {
            $('#log-password-error').text("Invalid Password format");
        }
    });
});

$(document).ready(function(){
    $('#log-button').click(function(){
        $('#failMsg').text("");
        $('#successMsg').text("");
        $('#log-login-error').text("");
        $('#log-password-error').text("");

        var login = $('#log-login').val();
        var password = $('#log-password').val();
        var error = false;

        if (login == "") {
            $('#log-login-error').text("Login is required");
            error = true;
        } else if (!pregMatchCommon(login)) {
            $('#log-login-error').text("Invalid login format");
            error = true;
        }
        if (password == "") {
            $('#log-password-error').text("Password is required");
            error = true;
        } else if (!pregMatchCommon(password)) {
            $('#log-password-error').text("Invalid Password format");
            error = true;
        }
        if (error == true) {
            $('#failMsg').text("Error, re-Check input data!");
        } else {
            $.post("logServlet", {
                login: login,
                password: password,
            }, function(responseText) {
                if (responseText == "success") {
                    $('#failMsg').text("");
                    clearLogFields();
                    window.location.href = "index.jsp";
                } else {
                    $('#failMsg').text(responseText);
                }
            });
        }
    });
});

//Clears all fields and messages (function for "Clear" button).
$(document).ready(function(){
    $('#log-clear').click(function(){
        $('#failMsg').text("");
        clearLogFields();
    });
});

//Clears all fields.
function clearLogFields() {
    $('#log-login').val("");
    $('#log-password').val("");
    $('#log-login-error').text("");
    $('#log-password-error').text("");
};