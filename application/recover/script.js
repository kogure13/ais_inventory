$(document).ready(function () {
    $('#tbl_dispose').flexigrid({
        url: '',
        sortname: '',
        sortorder: 'asc',
        usepager: true,
        useRp: true,
        rp: 10,
        title: 'Asset Recover List',
        singleSelect: true,
        showTableToggleBtn: true,
        striped: true,
        width: 'auto',
        height: 'auto'
    });
});