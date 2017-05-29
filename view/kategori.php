<fieldset>
    <legend>Master Kategori</legend>
    <div class="content">
        <table id="tbl_kategori" style="display: none;"></table>
    </div>

    <div id="add_model" class="modal fade">       
        <div class="modal-dialog">
            <div class="modal-content">                
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"></h4>
                </div>
                <form id="frm_kategori">
                    <div class="modal-body">
                        <input type="hidden" value="add" name="action" id="action">
                        <input type="hidden" value="0" name="edit_id" id="edit_id">
                        <div class="form-group">
                            <label for="kode_kategori" class="control-label">Kode Kategori:</label>
                            <input type="text" class="form-control required" id="kode_kategori" name="kode_kategori"/>
                        </div>
                        <div class="form-group">
                            <label for="nama_kategori" class="control-label">Nama Kategori:</label>
                            <input type="text" class="form-control required" id="nama_kategori" name="nama_kategori"/>
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

<script src="application/kategori/script.js"></script>
