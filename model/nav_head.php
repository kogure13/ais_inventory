
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
                            <i>
                                <h5 class="media-heading text-capitalize text-muted"> Asset Management System</h5>
                                <span class="text-muted">.::Data-Transaction-Repost::.</span>
                            </i>
                        </div>
                    </div>
                </div>
            </div>
        </div>    
    </div>
</header>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand text-capitalize" href="#"></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">            
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        Master
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="?page=kategori">Category</a></li>                        
                        <li><a href="?page=jenis">Asset Items</a></li>
                        <li><a href="?page=location">Location</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="?page=users" id="users">Users/Agent</a></li>
                        <li><a href="?page=department" id="department">Department</a></li>                        
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        Asset
                        <span class="caret"></span>
                    </a>	
                    <ul class="dropdown-menu">
                        <li><a href="?page=check_in">Asset Check In</a></li>						
                        <li><a href="?page=asset_move">Asset Move</a></li>
                        <li><a href="?page=asset_recover">Asset Recover</a></li>
                        <li><a href="?page=asset_dispose">Asset Dispose</a></li>                        
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <?= $_SESSION['nama_user'] ?>
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="?page=profile">Profile</a></li>                        
                        <li role="separator" class="divider"></li>
                        <li>
                            <a href="?page=logout">
                                <i class="fa fa-sign-out fa-fw"></i>
                                logout
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
