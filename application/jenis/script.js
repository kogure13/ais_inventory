$(document).ready(function () {

    $('#btn_cancel').click(function () {
        $('#frm_jenis').trigger('reset');
    });
    $('#date_purchase').datepicker({
        dateFormat: 'yy-mm-dd'
    });

    $('#tbl_jenis').flexigrid({
        url: 'application/jenis/data_jenis.php',
        dataType: 'json',
        method: 'POST',
        colModel: [
            {
                display: 'ID',
                name: 'id',
                width: 40
            }, {
                display: 'Category',
                name: 'nama_kategori',
                width: 120
            }, {
                display: 'Items',
                name: 'nama_jenis',
                width: 220
            }, {
                display: 'Type',
                name: 'kode_jenis',
                width: 120
            }, {
                display: 'Quantity',
                name: 'qty',
                align: 'right',
                width: 50
            }, {
                display: 'Date Purchased',
                name: 'date_purchase',                
                align: 'right',
                width: 100
            }, {
                display: 'Sample Foto',
                name: 'sample_foto',                
                width: 120
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
        searchitems: [            
            {display: 'Items', name: 'nama_jenis'},
            {display: 'Type', name: 'kode_jenis', isdefault: true}
        ],
        sortname: 'date_purchase',
        sortorder: 'asc',
        usepager: true,
        useRp: true,
        rp: 10,
        title: 'Data Jenis',
        singleSelect: true,        
        striped: true,
        width: 'auto',
        height: 'auto'
    });        

    var items = '';
    $.ajax({
        url: "application/jenis/option_jenis.php",
        dataType: 'JSON',
        success: function (data) {
            $.each(data, function (key, value) {
                items += "<option value='" + value.id + "'>" + value.nama_kategori + "</option>";
            });
            $('#kategori').append(items);
        }
    });        
});

$(function () {
    $('#frm_jenis').validate({
        rules: {
            kategori: {
                required: true
            },
            kode_jenis: {
                required: true,
                minlength: 2
            },
            nama_jenis: {
                required: true,
                minlength: 2
            },
            qty: {
                required: true
            },
            date_purchase: {
                required: true
            }
        },
        messages: {
            kategori: {
                required: 'Value not selected'
            },
            kode_jenis: {
                required: 'Type cannot empty',
                minlength: 'Min. 2 char'
            },
            nama_jenis: {
                required: 'Items cannot empty',
                minlength: 'Min. 2 char'
            }, 
            qty: {
                required: 'field cannot empty'
            },
            date_purchase: {
                required: 'field cannot empty'
            }
        },
        submitHandler: function (form) {
            var com_action = $('#action').val();
            if (com_action == 'add') {
                ajaxAction('add');
            } else if (com_action == 'edit') {
                ajaxAction('edit');
            }

            $('#frm_jenis').trigger('reset');
        }
    });
});

function gridAction(com, grid) {
    if (com == 'Add') {
        $('#add_model').modal('show');
        $('#action').val('add');
        $('.modal-title').html('Add Jenis/Items');
        $('#imgupload').attr('src', 'theme/asset/images/empty_pic.png');
        $('#fileupload').val('');
    } else if (com == 'Edit') {
        if ($('.trSelected', grid).length > 0) {
            var id = 0;

            $('#add_model').modal('show');
            $('#action').val('edit');
            $('.modal-title').html('Edit Jenis/Items');
            $.each($('.trSelected', grid), function (key, value) {
                $('#edit_id').val(value.children[0].innerText);
                id = $('#edit_id').val();
                $.ajax({
                    type: 'POST',
                    dataType: 'JSON',
                    url: 'application/jenis/edit_jenis.php?id=' + id,
                    success: function (data) {
                        $('#kategori').val(data.id_kategori);
                        $('#kode_jenis').val(data.kode_jenis);
                        $('#nama_jenis').val(data.nama_jenis);
                        $('#date_purchase').val(data.date_purchase);
                        $('#qty').val(data.qty);
                    }
                });
            });
        } else {
            swal("Warning", "No row selected! First select row, then click edit button", "warning");
            return;
        }
    } else if (com == 'Delete') {
        if ($('.trSelected', grid).length > 0) {
            var conf = confirm('Delete ' + $('.trSelected', grid).length + ' items ?');

            if (conf) {
                $.each($('.trSelected', grid), function (key, value) {
                    $.post('application/jenis/data_jenis.php', {id: value.firstChild.innerText, action: com.toLowerCase()}, function () {
                        $('#tbl_jenis').flexReload();
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
    data = $('#frm_jenis').serializeArray();

    $.ajax({
        url: 'application/jenis/data_jenis.php',
        dataType: 'json',
        type: 'POST',
        data: data,
        success: function (response) {
            $('#add_model').modal('hide');
            $('#tbl_jenis').flexReload();
        }
    });
}
