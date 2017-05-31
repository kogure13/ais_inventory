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
    data = $('#login-form').serializeArray();
    
    $.ajax({
        type: 'POST',
        url: 'application/login/data_login.php',
        data: data,
        success: function(response) {
            document.location.href = 'index.php';            
        }
    });
}