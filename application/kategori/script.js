$(document).ready(function () {
    $('#btn_cancel').click(function () {
        $('#frm_kategori').trigger('reset');
    });

    $("#tbl_kategori").flexigrid({
        url: 'application/kategori/data_kategori.php',
        dataType: 'json',
        method: 'POST',
        colModel: [
            {
                display: 'ID',
                name: 'id',
                width: 40
            }, {
                display: 'Code',
                name: 'kode_kategori',
                width: 140
            }, {
                display: 'Category',
                name: 'nama_kategori',
                width: 200
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
        title: 'Data Category',
        singleSelect: true,
        showTableToggleBtn: true,
        striped: true,
        width: 'auto',
        height: 'auto'
    });
});

$(function () {
    $('#frm_kategori').validate({
        rules: {
            kode_kategori: {
                required: true,
                minlength: 2
            },
            nama_kategori: {
                required: true,
                minlength: 2
            }
        },
        messages: {
            kode_kategori: {    
                required: 'Code cannot empty',
                minlength: 'Min. 2 char'
            },
            nama_kategori: {
                required: 'Category cannot empty',
                minlength: 'Min. 2 char'
            }
        },
        submitHandler: function (form) {
            var com_action = $('#action').val();
            if (com_action == 'add') {
                ajaxAction('add');
            } else if (com_action == 'edit') {
                ajaxAction('edit');
            }

            $('#frm_kategori').trigger('reset');
        }
    });
});

function gridAction(com, grid) {
    if (com == 'Add') {
        $('#add_model').modal({backdrop: 'static', keyboard: false});
        $('#action').val('add');
        $('.modal-title').html('Add Category');
    } else if (com == 'Edit') {
        var id = 0;
        if ($('.trSelected', grid).length > 0) {
            $('#add_model').modal({backdrop: 'static', keyboard: false});
            $('#action').val('edit');
            $('.modal-title').html('Edit Category');
            $.each($('.trSelected', grid), function (key, value) {
                $('#edit_id').val(value.children[0].innerText);
                id = $('#edit_id').val();
                $.ajax({
                    type: 'POST',
                    dataType: 'JSON',
                    url: 'application/kategori/edit_kategori.php?id=' + id,
                    success: function (data) {
                        $('#kode_kategori').val(data.kode_kategori);
                        $('#nama_kategori').val(data.nama_kategori);                        
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
                    $.post('application/kategori/data_kategori.php', {id: value.firstChild.innerText, action: com.toLowerCase()}, function () {
                        $('#tbl_kategori').flexReload();
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
    data = $('#frm_kategori').serializeArray();

    $.ajax({
        type: 'POST',
        dataType: 'json',
        url: 'application/kategori/data_kategori.php',
        data: data,
        success: function (response) {
            $('#add_model').modal('hide');
            $('#tbl_kategori').flexReload();
        }
    });
}
