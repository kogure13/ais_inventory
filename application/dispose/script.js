$(document).ready(function () {
    $('#tbl_dispose').flexigrid({
        url: '',
        sortname: '',
        sortorder: 'asc',
        usepager: true,
        useRp: true,
        rp: 10,
        title: 'Asset Dispose List',
        singleSelect: true,
        showTableToggleBtn: true,
        striped: true,
        width: 'auto',
        height: 'auto'
    });
});