
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

/* --- [Registration] --- */

//Checks the correctness of input data in real time.
$(document).ready(function(){
  $('#reg-firstName').keyup(function(){
    $('#reg-firstName-error').text("");
    $('#failMsg').text("");
    if (!pregMatchAlphabets($('#reg-firstName').val())) {
      $('#reg-firstName-error').text("Alphabets only are allowed");
  	}
  });
  $('#reg-lastName').keyup(function(){
    $('#reg-lastName-error').text("");
    $('#failMsg').text("");
    if (!pregMatchAlphabets($('#reg-lastName').val())) {
      $('#reg-lastName-error').text("Alphabets only are allowed");
  	}
  });
  $('#reg-login').keyup(function(){
    $('#reg-login-error').text("");
    $('#failMsg').text("");
    if (!pregMatchCommon($('#reg-login').val())) {
      $('#reg-login-error').text("Invalid Login format");
  	}
  });
  $('#reg-email').keyup(function(){
    $('#reg-email-error').text("");
    $('#failMsg').text("");
    if (!pregMatchCommon($('#reg-email').val())) {
      $('#reg-email-error').text("Invalid Email format");
    }
  });
  $('#reg-password').keyup(function(){
    $('#reg-password-error').text("");
    $('#failMsg').text("");
    if (!pregMatchCommon($('#reg-password').val())) {
      $('#reg-password-error').text("Invalid Password format");
    }
  });
  $('#reg-repassword').keyup(function(){
    $('#reg-repassword-error').text("");
    $('#failMsg').text("");
    if (!pregMatchCommon($('#reg-repassword').val())) {
      $('#reg-repassword-error').text("Invalid Password format");
    }
  });
});

//Validation of input data before inserting to database.
$(document).ready(function(){
	$('#reg-button').click(function(){
    $('#failMsg').text("");
    $('#successMsg').text("");

    clearErrorFields()

    var firstName = $('#reg-firstName').val();
    var lastName = $('#reg-lastName').val();
    var login = $('#reg-login').val();
    var email = $('#reg-email').val();
    var password = $('#reg-password').val();
    var repassword = $('#reg-repassword').val();

    var error = false;

    if (firstName == "") {
      $('#reg-firstName-error').text("First Name is required");
      error = true;
    } else if (!pregMatchAlphabets(firstName)) {
      $('#reg-first-error').text("Alphabets only are allowed");
      error = true;
  	}
    if (lastName == "") {
      $('#reg-lastName-error').text("Last Name is required");
      error = true;
  	} else if (!pregMatchAlphabets(lastName)) {
      $('#reg-lastName-error').text("Alphabets only are allowed");
      error = true;
  	}

    if (login == "") {
      $('#reg-login-error').text("Login is required");
      error = true;
  	} else if (!pregMatchCommon(login)) {
      $('#reg-login-error').text("Invalid Login format");
      error = true;
  	}
    if (email == "") {
      $('#reg-email-error').text("Email is required");
      error = true;
  	} else if (!validateEmail(email)) {
      $('#reg-email-error').text("Invalid Email format");
      error = true;
  	}
    if (password == "") {
        $('#reg-password-error').text("Password is required");
        error = true;
    } else if (!pregMatchCommon(password)) {
        $('#reg-password-error').text("Invalid Password format");
        error = true;
    }
    if (repassword == "") {
        $('#reg-repassword-error').text("Re-Password is required");
        error = true;
    } else if (!pregMatchCommon(repassword)) {
        $('#reg-repassword-error').text("Invalid Re-Password format");
        error = true;
    } else if (password != repassword) {
        $('#reg-repassword-error').text("Passwords do not match");
        error = true;
    }
    if (error == true) {
      $('#failMsg').text("Error, re-Check input data!");
    } else {
      $('#successMsg').text("Successful Registration!");
      $('#failMsg').text("");
      clearRegFields();
    }
	});
});

//Clears all fields and messages (function for "Clear" button).
$(document).ready(function(){
    $('#reg-clear').click(function(){
        $('#failMsg').text("");
        $('#successMsg').text("");
        clearRegFields();
	});
});

//Clears all fields.
function clearRegFields() {
	$('#reg-firstName').val("");
	$('#reg-lastName').val("");
	$('#reg-login').val("");
	$('#reg-email').val("");
	$('#reg-password').val("");
	$('#reg-repassword').val("");
    clearErrorFields()
}
function clearErrorFields() {
    $('#reg-firstName-error').text("");
    $('#reg-lastName-error').text("");
    $('#reg-login-error').text("");
    $('#reg-email-error').text("");
    $('#reg-password-error').text("");
    $('#reg-repassword-error').text("");
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