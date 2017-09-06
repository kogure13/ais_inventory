$(function () {
    $('#login-form').validate({
        rules: {
            uname: {
                required: true,
                minlength: 6
            },
            passwd: {
                required: true,
                pwcheck: /^[A-Za-z0-9\d=!\-@._*]+$/,
                minlength: 8
            },
        },
        messages: {
            uname: {
                required: 'Username cannot empty',
                minlength: 'min 6 characters'
            },
            passwd: {
                required: 'Password cannot empty',
                pwcheck: 'at least capital, lower and numeric allowed',
                minlength: 'min 8 characters'
            }
        },
        submitHandler: function (form) {
            ajaxAction('login');
        }
    });

    $.validator.addMethod("pwcheck", function (value, element, regexpr) {
        return regexpr.test(value);
    });
});

function ajaxAction(action) {
    uname = $('#uname').val();
    passwd = $('#passwd').val();

    $.ajax({
        type: 'POST',
        url: 'application/login/data_login.php',
        data: 'uname=' + uname + '&passwd=' + passwd,
        success: function (html) {
            if (html == 'true') {
                window.location = "index.php";
            } else if(html == 'false') {
                $('#err-login').css('display', 'inline', 'important');
                $('#err-login').html('Wrong Username/Password');
            } else if(html == 'denied'){
                $('#err-login').css('display', 'inline', 'important');
                $('#err-login').html('Access Denied');
            }
        },
        beforeSend: function () {
            $('#err-login').css('display', 'inline', 'important');
            $('#err-login').html("<img src='theme/asset/images/loading.gif' height='20px' /> Loading...");
        }
    });
    return false;
}