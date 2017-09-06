$(document).ready(function () {
    $('#tbl_recover').flexigrid({
        url: '',
        sortname: '',
        sortorder: 'asc',
        usepager: true,
        useRp: true,
        rp: 10,
        title: 'List Asset Recover',
        singleSelect: true,
        showTableToggleBtn: true,
        striped: true,
        width: 'auto',
        height: 'auto'
    });
});