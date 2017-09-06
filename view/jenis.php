<fieldset>
    <legend>Master Asset Items</legend>
    <div class="content">
        <table id="tbl_jenis" style="display: none;"></table>
    </div>

    <div id="add_model" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">                    
                    <h4 class="modal-title"></h4>
                </div>
                <form id="frm_jenis" enctype="multipart/form-data" accept="image/*">
                    <div class="modal-body">
                        <input type="hidden" value="add" name="action" id="action">
                        <input type="hidden" value="0" name="edit_id" id="edit_id">
                        <div class="">
                            <div class="col-sm-4">
                                <div class="form-group">                            
                                    <label for="kategori" class="control-label">Category:</label>
                                    <select name="kategori" id="kategori" class="form-control input-sm">
                                        <option value="">...</option>
                                    </select>
                                </div>
                            </div>
                        </div>                        
                        <table class="table-condensed table-responsive form-group">
                            <tr>
                                <td>
                                    <label for="kode_jenis" class="control-label">Type:</label>
                                    <input type="text" class="form-control input-sm" id="kode_jenis" name="kode_jenis"/>
                                </td>
                                <td>
                                    <label for="nama_jenis" class="control-label">Items:</label>
                                    <input type="text" class="form-control input-sm" id="nama_jenis" name="nama_jenis"/>
                                </td>
                                <td>
                                    <label for="qty" class="control-label">Qty:</label>
                                    <input type="text" class="form-control input-sm" id="qty" name="qty" size="5"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="date_purchase" class="control-label">Date Purchased:</label>
                                    <input type="text" class="form-control input-sm" id="date_purchase" name="date_purchase"/>
                                </td>
                            </tr>
                        </table>                        
                        <div class="form-group">
                            <label for="sample_foto" class="control-label">Sample Foto:</label>
                            <div class="wrapperImage">
                                <input id="fileUpload" name="fileUpload" multiple="multiple" type="file"><br/>
                                <div id="image-holder"></div>
                            </div>                             
                        </div>                    
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
                        <button type="submit" id="btn_add" class="btn btn-sm btn-primary">Save</button>
                    </div>
                </form>                
            </div>
        </div>
    </div>
</fieldset>

<script src="application/jenis/script.js"></script>
