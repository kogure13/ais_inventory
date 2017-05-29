
<title> ||</title>
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
<link rel="stylesheet" href="theme/asset/css/jquery.fileupload.css"/>
<link rel="stylesheet" href="theme/asset/css/style.css"/>
<link rel="stylesheet" href="theme/asset/css/ais-custom.css" />
<!-- JS -->
<script src="theme/asset/js/jquery-2.1.0.min.js"></script>
<script src="theme/asset/js/jquery.ui.widget.js"></script>
<script src="theme/asset/js/jquery-ui-1.10.4.custom.min.js"></script>
<script src="theme/asset/js/jquery.iframe-transport.js"></script>
<script src="theme/asset/js/jquery.fileupload.js"></script>
<script src="theme/asset/js/jquery.validate.min.js"></script>
<script src="theme/asset/js/moment.js"></script>
<script src="theme/asset/flexigrid/js/flexigrid.pack.js"></script>
<script src="theme/asset/sweetalert/sweetalert.min.js"></script>
<script src="theme/asset/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">
    var momentNow = moment();

    function loadImage(fileInput) {
        var files = fileInput.files;
        var iSize = ($('#fileupload')[0].files[0].size / 1024);
        var iType = ($('#fileupload')[0].files[0].type);
        iSize = (Math.round((iSize / 1024) * 100) / 100);

        if (iSize > 1) {

        } else {
            for (var i = 0; i < files.length; i++) {
                var file = files[i];
                var imageType = /image.*/;
                if (!file.type.match(imageType)) {
                    continue;
                }

                var img = document.getElementById('imgupload');
                img.file = file;
                var reader = new FileReader();
                reader.onload = (function (aImg) {
                    return function (e) {
                        aImg.src = e.target.result;
                    };
                })(img);
                reader.readAsDataURL(file);
            }
        }
    }

</script>
