$(function () {   
    $('#frm_profile').validate({
        rules: {
            uname: {
                required: true,
                minlength: 6
            },
            password: {
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
            password: {
                required: 'Password cannot empty',
                pwcheck: 'at least capital, lower and numeric allowed',
                minlength: 'min 8 characters'
            }
        },
        submitHandler: function (form) {
            profileUpdate();
        }
    });

    $.validator.addMethod("pwcheck", function (value, element, regexpr) {
        return regexpr.test(value);
    });
   
    var id = $('#edit_id').val();

    $.ajax({
        type: 'POST',
        dataType: 'JSON',
        url: 'application/users/edit_users.php?id=' + id,
        success: function (data) {            
            var path_img = data.foto_profile;            
            
            if(path_img == null || path_img == '') {
                $('#finput').attr('src', 'theme/asset/images/user.png');
            }else{
                $('#finput').attr('src', path_img);
            }
            
            $('#sname').val(data.nama_user);
            $('#uname').val(data.username);
            $('#password').val(data.password);
        }
    });

});

function profileUpdate() {
    data = $('#frm_profile').serializeArray();
    console.log(data)

//    $.ajax({
//        type: 'POST',
//        url: 'application/profile/data_profile.php',
//        data: data,
//        dataType: 'json'
//    });
}

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#finput').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

$("#fupload").change(function () {
    readURL(this);
});
