$(document).ready(function () {
    $('#date_check').val(momentNow.format('MM/DD/YYYY'));

    $('#date_purcash').datepicker();

    $('#queue_checkin').flexigrid({
        url: '',
        dataTyoe: 'json',
        method: 'POST',
        colModel: [
            {
                display: 'No. Check In Asset',
                name: 'no_check_in',
                width: 120
            }, {
                display: 'Location',
                name: 'location',
                width: 120
            }, {
                display: 'Date Check In',
                name: 'date_check_in',
                width: 120
            }
        ],
        buttons: [],
        searchitems: [
            {display: 'Nama Jenis', name: 'nama_jenis'},
            {display: 'Type', name: 'kode_jenis'},
            {display: 'Location', name: 'location'}
        ],
        sortname: 'id',
        sortorder: 'asc',
        usepager: true,
        useRp: true,
        rp: 10,
        title: 'Check In Queue Asset',
        singleSelect: true,
        striped: true,
        width: 'auto',
        height: 'auto'
    });

    $('#jenis_asset').autocomplete({
        source: 'application/check_in/files_jenis.php',
        minlength: 2,
        select: function (event, ui) {
            event.preventDefault();
            $('#id_jenis').val(ui.item.id);
            $('#jenis_asset').val(ui.item.label);
        }
    });

    $("#location").autocomplete({
        source: 'application/check_in/files_location.php',
        minlength: 2,
        select: function (event, ui) {
            event.preventDefault();
            $('#id_location').val(ui.item.id);
            $('#location').val(ui.item.label);
        }
    });
});