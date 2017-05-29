<fieldset>
    <legend>Master Department</legend>
    <table id="tbl_dept" style="display: none;"></table>
    
    <div id="add_model" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"></h4>
                </div>
                <form id="frm_dept">
                    <div class="modal-body">
                        <input type="hidden" value="add" name="action" id="action">
                        <input type="hidden" value="0" name="edit_id" id="edit_id">
                        <div class="form-group">
                            <label for="kode_department" class="control-label">Kode Department:</label>
                            <input type="text" class="form-control input-sm" id="kode_department" name="kode_department"/>
                        </div>
                        <div class="form-group">
                            <label for="nama_department" class="control-label">Nama Department:</label>
                            <input type="text" class="form-control input-sm" id="nama_department" name="nama_department"/>
                        </div>
                    </div>    
                    <div class="modal-footer">
                        <button type="button" id="btn_cancel" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
                        <button type="submit" id="btn_add" class="btn btn-sm btn-primary">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</fieldset>

<script src="application/department/script.js"></script>