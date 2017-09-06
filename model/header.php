
<title>Asset Managment System</title>
<link rel="shortcut icon" href="favicon.png">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, front-end, frontend, web development" />
<meta name="keywords" content="Billing, Manglayang, Bandung" />
<!-- CSS -->
<link rel="stylesheet" href="theme/asset/bootstrap/css/bootstrap.min.css"/>
<link rel="stylesheet" href="theme/asset/css/jquery-ui.css"/>
<link rel="stylesheet" href="theme/asset/font-awesome/css/font-awesome.min.css"/>
<link rel="stylesheet" href="theme/asset/flexigrid/css/flexigrid.pack.css" />
<link rel="stylesheet" href="theme/asset/sweetalert/sweetalert.css" />
<link rel="stylesheet" href="theme/asset/css/style.css"/>
<link rel="stylesheet" href="theme/asset/css/ais-custom.css" />
<!-- JS -->
<script src="theme/asset/js/jquery-2.1.0.min.js"></script>
<script src="theme/asset/js/jquery.ui.widget.js"></script>
<script src="theme/asset/js/jquery-ui-1.10.4.custom.min.js"></script>
<script src="theme/asset/js/jquery.iframe-transport.js"></script>
<script src="theme/asset/js/jquery.validate.min.js"></script>
<script src="theme/asset/js/moment.js"></script>
<script src="theme/asset/flexigrid/js/flexigrid.pack.js"></script>
<script src="theme/asset/sweetalert/sweetalert.min.js"></script>
<script src="theme/asset/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">
    var momentNow = moment();

    $(document).ready(function () {
        $("#fileUpload").on('change', function () {
            //Get count of selected files
            var countFiles = $(this)[0].files.length;
            var imgPath = $(this)[0].value;
            var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
            var image_holder = $("#image-holder");
            image_holder.empty();

            if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
                if (typeof (FileReader) != "undefined") {
                    //loop for each file selected for uploaded.
                    for (var i = 0; i < countFiles; i++)
                    {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            $("<img />", {
                                "src": e.target.result,
                                "class": "thumb-image"
                            }).appendTo(image_holder);
                        }
                        image_holder.show();
                        reader.readAsDataURL($(this)[0].files[i]);
                    }
                } else {
                    alert("This browser does not support FileReader.");
                }
            } else {
                alert("Pls select only images");
            }
        });

        $('#profile').on('click', function () {
            $('#profile_model').modal({backdrop: 'static', keyboard: false});
            $('.modal-title').html('Edit Users Profile');
            var id = $('#edit_id').val();

            $.ajax({
                type: 'POST',
                dataType: 'JSON',
                url: 'application/users/edit_users.php?id=' + id,
                success: function (data) {
                    $('#username').val(data.username);
                    $('#password').val(data.password);
                }
            });                        
        });
    });
</script>
