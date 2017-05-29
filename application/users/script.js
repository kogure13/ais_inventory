$(document).ready(function () {
    $('#btn_cancel').click(function () {
        $('#frm_users').trigger('reset');
    });

    $('#tbl_users').flexigrid({
        url: 'application/users/data_users.php',
        dataType: 'json',
        method: 'POST',
        colModel: [
            {
                display: 'ID',
                name: 'id',
                width: 40
            }, {
                display: 'Username',
                name: 'username',
                width: 200
            }, {
                display: 'Nama Lengkap',
                name: 'nama_user',
                width: 200
            }, {
                display: 'Role Access',
                name: 'keterangan',
                width: 100
            }, {
                display: 'Status',
                name: 'status',
                width: 40,
                align: 'center'
            }
        ],
        buttons: [
            {
                name: 'Add',
                bclass: 'add',
                onpress: gridAction
            }, {
                name: 'Edit',
                bclass: 'edit',
                onpress: gridAction
            }, {
                name: 'Delete',
                bclass: 'delete',
                onpress: gridAction
            }
        ],
        sortname: 'no_induk',
        sortorder: 'asc',
        usepager: true,
        useRp: true,
        rp: 10,
        title: 'Data Users / Agent',
        singleSelect: true,
        showTableToggleBtn: true,
        striped: true,
        width: 'auto',
        height: 'auto'
    });        
});

$(function () {
    $('#role').on('change', function(){
        var this_role = $('#role').val();
        if(this_role == 1) {
            $('#keterangan').val('Administrator');
        }else if(this_role == 2) {
            $('#keterangan').val('Moderator');
        }else if(this_role == 6 || this_role == 7) {
            $('#keterangan').val('Operator');
        }else if(this_role == 8) {
            $('#keterangan').val('Auditor');
        }else if(this_role == 99) {
            $('#keterangan').val('Superuser');
        }
    });
    
    $('#frm_users').validate({
        rules: {
            username: {
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
            username: {
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
            var com_action = $('#action').val();
            if (com_action == 'add') {
                ajaxAction('add');
            } else if (com_action == 'edit') {
                ajaxAction('edit');
            }

            $('#frm_users').trigger('reset');
        }
    });

    $.validator.addMethod("pwcheck", function (value, element, regexpr) {
        return regexpr.test(value);
    });
});

function gridAction(com, grid) {
    if (com == 'Add') {
        $('#add_model').modal('show');
        $('#action').val('add');
        $('.modal-title').html('Add Users');
    } else if (com == 'Edit') {
        if ($('.trSelected', grid).length > 0) {
            var id = 0;

            $('#add_model').modal('show');
            $('#action').val('edit');
            $('.modal-title').html('Edit Users');
            $.each($('.trSelected', grid), function (key, value) {
                $('#edit_id').val(value.children[0].innerText);
                id = $('#edit_id').val();
                $.ajax({
                    type: 'POST',
                    dataType: 'JSON',
                    url: 'application/users/edit_users.php?id=' + id,
                    success: function (data) {
                        $('#username').val(data.username);
                        $('#password').val(data.password);
                        $('#nama_user').val(data.nama_user);
                        $('#role').val(data.role);
                        $('#keterangan').val(data.keterangan);
                        $('#status').val(data.status);
                        //$('#add_model').modal('show');
                    }
                });
            });
        } else {
            swal("Warning", "No row selected! First select row, then click edit button", "warning");
            return;
        }
    } else if (com == 'Delete') {
        if ($('.trSelected', grid).length > 0) {
            var conf = confirm('Delete ' + $('.trSelected', grid).length + ' items?');

            if (conf) {
                $.each($('.trSelected', grid), function (key, value) {
                    $.post('application/users/data_users.php', {id: value.firstChild.innerText, action: com.toLowerCase()}, function () {
                        $('#tbl_users').flexReload();
                    });
                });
            }
        } else {
            swal("Warning", "No row selected! First select row, then click delete button", "warning");
            return;
        }
    }
}

function ajaxAction(action) {
    data = $('#frm_users').serializeArray();    

    $.ajax({
        type: 'POST',
        url: 'application/users/data_users.php',
        data: data,
        dataType: 'json',
        success: function (response) {
            $('#add_model').modal('hide');
            $('#tbl_users').flexReload();
        }
    });
}

