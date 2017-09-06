<div class="container" style="height: 100%;">
    <div class="well" style="min-height: 500px; padding: 10px;">
        <h2>
            <strong>User Profile</strong>
        </h2>
        <form id="frm_profile" name="frm_profile" enctype="multipart/form-data" novalidate="novalidate">
            <input type="hidden" name="edit_id" id="edit_id" value="<?=$_SESSION['id_user']?>"/>
            <div class="row">
                <div class="col-xs-4 col-md-3">
                    <div class="thumbnail" align="center" style="height: auto">                        
                        <div class="wrapperImage">                                                            
                            <img width="80%" id="finput">
                            <input id="fupload" name="fupload" type="file" accept="image/*">
                        </div>                    
                    </div>
                </div>
                <div class="col-xs-8 col-md-9">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h2 class="panel-title">
                                <i class="fa fa-pencil fa-fw"></i>
                                Your Profile
                            </h2>
                        </div>
                        <div class="panel-body">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label for="" class="col-sm-2 control-label">Surname</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control input-sm" id="sname" name="sname">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="" class="col-sm-2 control-label">Username</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control input-sm" id="uname" name="uname">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="" class="col-sm-2 control-label">Password</label>
                                    <div class="col-sm-3">
                                        <input type="password" class="form-control input-sm" id="password" name="password">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <button type="submit" id="btn_save" class="btn btn-sm btn-success">
                                <i class="fa fa-save fa-fw"></i>
                                Save
                            </button>            
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>    
</div>

<script src="application/profile/script.js"></script>
