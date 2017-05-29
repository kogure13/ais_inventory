<fieldset>
    <legend> Tahun Ajaran</legend>
    <table id="tbl_thajar" style="display: none;"></table>

    <div id="add_model" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"></h4>
                </div>
                <form method="post" id="frm_thajar">
                    <div class="modal-body">
                        <input type="hidden" value="add" name="action" id="action">
                        <input type="hidden" value="0" name="edit_id" id="edit_id">
                        <div class="form-group">
                            <label for="kode_th_ajaran" class="control-label">Kode Tahun Ajaran:</label>
                            <input type="text" class="form-control" id="kode_th_ajaran" name="kode_th_ajaran"/>
                        </div>
                        <div class="form-group">
                            <label for="nama_th_ajaran" class="control-label">Nama Tahun Ajaran:</label>
                            <input type="text" class="form-control" id="nama_th_ajaran" name="nama_th_ajaran"/>
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

<script src="application/th_ajar/script.js"></script>
