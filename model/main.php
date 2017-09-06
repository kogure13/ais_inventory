<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie ie9" lang="en" class="no-js"> <![endif]-->
<!--[if !(IE)]><!-->
<html lang="en">
    <head>
        <?php include 'model/header.php'; ?>
    </head>
    <body>        
        <div class="wrapper fill-height">            
            <div class="ais-header-strip"></div>
            <?php $main->getNavHead(); ?>
            <div class="ais-main">
                <?php $main->getPage(); ?>                
            </div>                       
        </div>
                
        <footer class="hidden-xs">
            <span class="text-capitalize">
                IT-AIS &COPY; <?= date('Y') ?>

            </span>    
        </footer>              
    </body>
</html>