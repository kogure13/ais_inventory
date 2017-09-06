<fieldset>
    <legend>Location</legend>
    <table id="tbl_location" style="display: none;"></table>

    <div id="add_model" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">                    
                    <h4 class="modal-title"></h4>
                </div>
                <form method="post" id="frm_location">
                    <div class="modal-body">
                        <input type="hidden" value="add" name="action" id="action">
                        <input type="hidden" value="0" name="edit_id" id="edit_id">
                        <div class="form-group">
                            <label for="kode_location" class="control-label">Kode:</label>
                            <input type="text" class="form-control" id="kode_location" name="kode_location"/>
                        </div>
                        <div class="form-group">
                            <label for="nama_location" class="control-label">Description:</label>
                            <input type="text" class="form-control" id="nama_location" name="nama_location"/>
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

<script src="application/location/script.js"></script>
