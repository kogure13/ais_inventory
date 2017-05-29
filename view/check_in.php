<div class="container-fluid">
    <div class="row">
        <div class="col-md-3">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <strong>Form Asset Check In</strong>
                    <span class="text-right pull-right text-muted" id="report-date"></span>
                </div>
                <form id="frm_checkin" enctype="multipart/form-data">
                    <div class="panel-body" style="overflow: scroll; height: 450px;">                    
                        <div class="form-group">
                            <label class="control-label" for="no_checkin">No. Check In Asset:</label>
                            <input type="text" id="no_checkin" class="form-control input-sm" name="no_checkin" readonly="readonly">
                        </div>
                        <table class="table-condensed table-responsive form-group">
                            <tr>
                                <td width="70%" style="padding-right: 5px">                                    
                                    <label class="control-label" for="jenis_asset">Jenis Asset:</label>
                                    <input type="hidden" id="id_jenis" name="id_jenis">
                                    <input type="text" id="jenis_asset" name="jenis_asset" class="form-control input-sm">                                    
                                </td>
                                <td>                                    
                                    <label class="control-label" for="qty">Qty:</label>
                                    <input type="text" id="qty" name="qty" class="form-control input-sm">
                                </td>
                            </tr>                            
                        </table>                        
                        <div class="form-group">
                            <label class="control-label" for="location">location:</label>
                            <input type="text" id="location" name="location" class="form-control input-sm">
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="descp">Description:</label>
                            <textarea class="form-control input-sm" id="descp" name="descp"></textarea>
                        </div>
                        <table class="table-condensed table-responsive form-group">
                            <tr>
                                <td style="padding-right: 5px">
                                    <label class="control-label" for="checin_by">Check In By:</label>
                                    <input type="text" id="user_check" name="user_check" class="form-control input-sm" readonly="readonly">
                                </td>
                                <td>
                                    <label class="control-label" for="checin_by">Date Check In:</label>
                                    <input type="text" id="date_check" name="date_check" class="form-control input-sm" readonly="readonly">
                                </td>
                            </tr>
                        </table>
                        <div class="form-group">
                            <label for="sample_foto" class="control-label">Sample Foto:</label>
                            <div class="hiddenFileInputContainter text-center">
                                <!-- The file input field used as target for the file upload widget -->
                                <input id="fileupload" class="hidden_pic" type="file" name="files" accept="image/*; capture=camera" onchange="loadImage(this)">
                                <img id="imgupload" class="imgupload" src="theme/asset/images/empty_pic.png" alt="">                        
                            </div>                            
                        </div>                    
                    </div>
                    <div class="panel-footer">                    
                        <div class="text-right">                        
                            <button type="submit" id="btn_add" class="btn btn-sm btn-primary">Save</button>                    
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-9 hidden-sm hidden-xs">
            <table id="queue_checkin" style="display: none"></table>
        </div>
    </div>    
</div>

<script src="application/check_in/script.js"></script>
