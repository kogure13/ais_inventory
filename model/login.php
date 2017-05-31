<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Login Form</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
        <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, front-end, frontend, web development" />
        <meta name="keywords" content="Bandung" />
        <!-- CSS -->
        <link rel="stylesheet" href="theme/asset/bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="theme/asset/css/ais-custom.css" />
        <style type="text/css">
            body{background: #eee url(theme/asset/images/ao.gif);}
            html,body{
                position: relative;
                height: 100%;
            }

            .login-container{
                position: relative;
                width: 300px;
                margin: 80px auto;
                padding: 20px 40px 40px;
                text-align: center;
                background: #fff;
                border: 1px solid #ccc;
            }

            #output{
                position: absolute;
                width: 300px;
                top: -75px;
                left: 0;
                color: #fff;
            }

            #output.alert-success{
                background: rgb(25, 204, 25);
            }

            #output.alert-danger{
                background: rgb(228, 105, 105);
            }


            .login-container::before,.login-container::after{
                content: "";
                position: absolute;
                width: 100%;height: 100%;
                top: 3.5px;left: 0;
                background: #fff;
                z-index: -1;
                -webkit-transform: rotateZ(4deg);
                -moz-transform: rotateZ(4deg);
                -ms-transform: rotateZ(4deg);
                border: 1px solid #ccc;

            }

            .login-container::after{
                top: 5px;
                z-index: -2;
                -webkit-transform: rotateZ(-2deg);
                -moz-transform: rotateZ(-2deg);
                -ms-transform: rotateZ(-2deg);

            }

            .avatar{
                width: 100px;height: 100px;
                margin: 10px auto 30px;
                border-radius: 100%;
                border: 2px solid #aaa;
                background-size: cover;
            }

            .form-box input{
                width: 100%;
                padding: 10px;
                text-align: center;
                height:40px;
                border: 1px solid #ccc;;
                background: #fafafa;
                transition:0.2s ease-in-out;

            }

            .form-box input:focus{
                outline: 0;
                background: #eee;
            }

            .form-box input[type="text"]{
                border-radius: 5px 5px 0 0;
                text-transform: lowercase;
            }

            .form-box input[type="password"]{
                border-radius: 0 0 5px 5px;
                border-top: 0;
            }

            .form-box button.login{
                margin-top:15px;
                padding: 10px 20px;
            }

            .animated {
                -webkit-animation-duration: 1s;
                animation-duration: 1s;
                -webkit-animation-fill-mode: both;
                animation-fill-mode: both;
            }

            @-webkit-keyframes fadeInUp {
                0% {
                    opacity: 0;
                    -webkit-transform: translateY(20px);
                    transform: translateY(20px);
                }

                100% {
                    opacity: 1;
                    -webkit-transform: translateY(0);
                    transform: translateY(0);
                }
            }

            @keyframes fadeInUp {
                0% {
                    opacity: 0;
                    -webkit-transform: translateY(20px);
                    -ms-transform: translateY(20px);
                    transform: translateY(20px);
                }

                100% {
                    opacity: 1;
                    -webkit-transform: translateY(0);
                    -ms-transform: translateY(0);
                    transform: translateY(0);
                }
            }

            .fadeInUp {
                -webkit-animation-name: fadeInUp;
                animation-name: fadeInUp;
            }
        </style>
        <script src="theme/asset/js/jquery-2.1.0.min.js"></script>
        <script src="theme/asset/js/jquery.validate.min.js"></script>
        <script src="theme/asset/bootstrap/js/bootstrap.min.js"></script>        
    </head>
    
    <body>
        <div class="ais-header-strip"></div>
        <header class="ais-header-banner">
            <div class="hidden-print hidden-lg hidden-md hidden-sm">
                <span class="media-heading text-muted">.::Asset Management System::.</span>    
            </div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3 hidden-xs col-xs-6">
                        <div class="media">
                            <div class="media-left">
                                <a href="index.php" class="ais-header-logo">
                                    <img src="theme/asset/images/logo-ais.png" alt="Al-Irsyad Satya Islamic Scholl" class="thumbnail">
                                </a>
                            </div>
                            <div class="media-body">
                                <h5 class="media-heading text-muted">
                                    Al-Irsyad Satya Islamic School
                                </h5>
                                <h6 class="text-muted">
                                    Kota Baru Parahyangan km 2.7, Padalarang, Bandung 40553 West Java, Indonesia
                                </h6>
                            </div>
                        </div>    
                    </div>
                    <div class="col-md-9 hidden-xs col-xs-6">
                        <div class="pull-right text-right">
                            <div class="media">                        
                                <div class="media-body">
                                    <h5 class="media-heading text-capitalize text-info"> Asset Management System</h5>
                                    <span class="text-muted text-info">.::Data-Transaction-Repost::.</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>    
            </div>
        </header>

        <div class="container">
            <div class="login-container">
                <div id="output"></div>
                <div class="avatar"></div>
                <div class="form-box">
                    <form id="login-form" method="post">
                        <input id="uname" name="uname" type="text" placeholder="username">
                        <input id="passwd" name="passwd" type="password" placeholder="password">
                        <button class="btn btn-info btn-block login" type="submit" id="login-btn">Login</button>
                        <div class="err" id="err-login"></div>
                    </form>
                </div>
            </div>
        </div>
        
        <script type="text/javascript" src="application/login/script.js"></script>        
    </body>
</html>