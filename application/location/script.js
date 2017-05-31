$(document).ready(function () {
    $('#btn_cancel').click(function () {
        $('#frm_location').trigger('reset');
    });

    $('#tbl_location').flexigrid({
        url: 'application/location/data_location.php',
        dataType: 'json',
        method: 'POST',
        colModel: [
            {
                display: 'ID',
                name: 'id',
                align: 'right',
                width: 30
            }, {
                display: 'Kode',
                name: 'kode_location',
                width: 80
            }, {
                display: 'Description',
                name: 'nama_location',
                width: 150
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
        sortname: 'id',
        sortorder: 'asc',
        usepager: true,
        useRp: true,
        rp: 10,
        title: 'Data Room Location',
        singleSelect: true,
        showTableToggleBtn: true,
        striped: true,
        width: 'auto',
        height: 'auto'
    });
});

$(function () {
    $('#frm_location').validate({
        rules: {
            kode_location: {
                required: true,
                minlength: 3
            },
            nama_location: {
                required: true,
                minlength: 3
            },
        },
        messages: {
            kode_location: {
                required: 'Kode cannot empty',
                minlength: 'min 3 characters'
            },
            nama_location: {
                required: 'Nama cannot empty',
                minlength: 'min 3 characters'
            }
        },
        submitHandler: function (form) {
            var com_action = $('#action').val();
            if (com_action == 'add') {
                ajaxAction('add');
            } else if (com_action == 'edit') {
                ajaxAction('edit');
            }

            $('#frm_location').trigger('reset');
        }
    });
});

function gridAction(com, grid) {
    if (com == 'Add') {
        $('#add_model').modal('show');
        $('#action').val('add');
        $('.modal-title').html('Add Data Room Name');
    } else if (com == 'Edit') {
        if ($('.trSelected', grid).length > 0) {
            $('#add_model').modal('show');
            $('#action').val('edit');
            $('.modal-title').html('Edit Data Room Name');
            $.each($('.trSelected', grid), function (key, value) {
                $('#edit_id').val(value.children[0].innerText);
                $('#kode_location').val(value.children[1].innerText);
                $('#nama_location').val(value.children[2].innerText);
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
                    $.post('application/location/data_location.php', {id: value.firstChild.innerText, action: com.toLowerCase()}, function () {
                        $('#tbl_location').flexReload();
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
    data = $('#frm_location').serializeArray();

    $.ajax({
        type: 'POST',
        url: 'application/location/data_location.php',
        data: data,
        dataType: 'json',
        success: function (response) {
            $('#add_model').modal('hide');
            $('#tbl_location').flexReload();
        }
    });
}