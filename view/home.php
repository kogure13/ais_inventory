<fieldset>
    <legend>Dashboard</legend>
    <div class="well">
        <div class="container">
            <div class="media">
                <div class="media-left">
                    <img src="<?=$_SESSION['foto']?>" height="130px" class="thumbnail">
                </div>
                <div class="media-body">
                    <h3>Welcome, <strong><?= ucwords($_SESSION['nama_user']) ?></strong></h3>
                    <span class="text-info">You're info</span>
                    <?php
                    /**
                     * Show user information like IP address, useragent
                     * */
                    $ip = $_SERVER['REMOTE_ADDR'];
                    $browser = $_SERVER['HTTP_USER_AGENT'];

                    echo "<br/>";
                    echo "<b>Visitor IP address:</b><br/>" . $ip . "<br/>";
                    echo "<b>Browser (User Agent) Info:</b><br/>" . $browser . "<br/>";
                    ?>
                </div>
            </div>
            
            <div class="panel panel-success">
                <div class="panel-heading"></div>
                <div class="panel-body">
                    
                </div>
            </div>
        </div>       
    </div>     
</fieldset>

