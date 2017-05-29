$(document).ready(function () {
    $('#date_check').val(momentNow.format('MM/DD/YYYY'));
    
    $('#queue_checkout').flexigrid({
        url: '',
        dataTyoe: 'json',
        method: 'POST',
        colModel: [],
        buttons: [],
        sortname: 'id',
        sortorder: 'asc',
        usepager: true,
        useRp: true,
        rp: 10,
        title: 'Check Out/Move Queue Asset',
        singleSelect: true,
        striped: true,
        width: 'auto',
        height: 'auto'
    });
    
});