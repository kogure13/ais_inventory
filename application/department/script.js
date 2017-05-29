$(document).ready(function(){
    $('#btn_cancel').click(function () {
        $('#frm_dept').trigger('reset');
    });
    
   $('#tbl_dept').flexigrid({
       url: 'application/department/data_dept.php',
       dataType: 'json',
       method: 'POST',
       colModel: [
           {
               display: 'ID',
               name: 'id',
               width: 40
           }, {
               display: 'Kode Dept',
               name: "kode_department",
               width: 100
           }, {
               display: 'Nama Dept',
               name: "nama_department",
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
       rp: 10,
       title: 'Data Department',
       singleSelect: true,
       showTableToggleBtn: true,
       striped: true,
       width: 'auto',
       height: 'auto'
   });
});

$(function () {
    $('#frm_dept').validate({
        rules: {
            kode_department: {
                required: true,
                minlength: 2
            },
            nama_department: {
                required: true,                
                minlength: 2
            },
        },
        messages: {
            kodeDept: {
                required: 'Kode Department cannot empty',
                minlength: 'min 2 characters'
            },
            namaDept: {
                required: 'Nama Department cannot empty',                
                minlength: 'min 2 characters'
            }
        },
        submitHandler: function (form) {
            var com_action = $('#action').val();
            if (com_action == 'add') {
                ajaxAction('add');
            } else if (com_action == 'edit') {
                ajaxAction('edit');
            }

            $('#frm_dept').trigger('reset');
        }
    });   
});

function gridAction(com, grid) {
    if (com == 'Add') {
        $('#add_model').modal('show');
        $('#action').val('add');
        $('.modal-title').html('Add Department');
    } else if (com == 'Edit') {
        if ($('.trSelected', grid).length > 0) {
            var id = 0;

            $('#add_model').modal('show');
            $('#action').val('edit');
            $('.modal-title').html('Edit Department');
            $.each($('.trSelected', grid), function (key, value) {
                $('#edit_id').val(value.children[0].innerText);
                id = $('#edit_id').val();
                $.ajax({
                    type: 'POST',
                    dataType: 'JSON',
                    url: "application/department/edit_dept.php?id=" + id,
                    success: function (data) {
                        $('#kode_department').val(data.kode_department);
                        $('#nama_department').val(data.nama_department);                        
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
                    $.post('application/department/data_dept.php', {id: value.firstChild.innerText, action: com.toLowerCase()}, function () {
                        $('#tbl_dept').flexReload();
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
    data = $('#frm_dept').serializeArray();    

    $.ajax({
        type: 'POST',
        url: 'application/department/data_dept.php',
        data: data,
        dataType: 'json',
        success: function (response) {
            $('#add_model').modal('hide');
            $('#tbl_dept').flexReload();
        }
    });
}