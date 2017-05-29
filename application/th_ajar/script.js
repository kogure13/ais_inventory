$(document).ready(function () {
    $('#btn_cancel').click(function () {
        $('#frm_thajar').trigger('reset');
    });

    $('#tbl_thajar').flexigrid({
        url: 'application/th_ajar/data_thajar.php',
        dataType: 'json',
        method: 'POST',
        colModel: [
            {
                display: 'ID',
                name: 'id',
                align: 'right',
                width: 40
            }, {
                display: 'Kode Tahun Ajaran',
                name: 'kode_th_ajaran',
                width: 100
            }, {
                display: 'Tahun Ajaran',
                name: 'nama_th_ajaran',
                width: 100
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
        title: 'Data Tahun Ajaran',
        singleSelect: true,
        showTableToggleBtn: true,
        striped: true,
        width: 'auto',
        height: 'auto'
    });
});

$(function () {
    $('#frm_thajar').validate({
        rules: {
            kode_th_ajaran: {
                required: true,
                minlength: 3
            },
            nama_th_ajaran: {
                required: true,
                minlength: 3
            },
        },
        messages: {
            kode_th_ajaran: {
                required: 'Kode Tahun Ajaran cannot empty',
                minlength: 'min 3 characters'
            },
            nama_th_ajaran: {
                required: 'Nama Tahun Ajaran cannot empty',
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

            $('#frm_thajar').trigger('reset');
        }
    });
});

function gridAction(com, grid) {
    if (com == 'Add') {
        $('#add_model').modal('show');
        $('#action').val('add');
        $('.modal-title').html('Add Tahun Ajaran');
    } else if (com == 'Edit') {
        if ($('.trSelected', grid).length > 0) {
            $('#add_model').modal('show');
            $('#action').val('edit');
            $('.modal-title').html('Edit Tahun Ajaran');
            $.each($('.trSelected', grid), function (key, value) {
                $('#edit_id').val(value.children[0].innerText);
                $('#kode_th_ajaran').val(value.children[1].innerText);
                $('#nama_th_ajaran').val(value.children[2].innerText);
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
                    $.post('application/th_ajar/data_thajar.php', {id: value.firstChild.innerText, action: com.toLowerCase()}, function () {
                        $('#tbl_thajar').flexReload();
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
    data = $('#frm_thajar').serializeArray();

    $.ajax({
        type: 'POST',
        url: 'application/th_ajar/data_thajar.php',
        data: data,
        dataType: 'json',
        success: function (response) {
            $('#add_model').modal('hide');
            $('#tbl_thajar').flexReload();
        }
    });
}