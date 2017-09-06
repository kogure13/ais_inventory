
<fieldset>
    <legend>Master Data Users</legend>
    <table id="tbl_users" style="display: none;"></table>

    <div id="add_model" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">                    
                    <h4 class="modal-title"></h4>
                </div>
                <form id="frm_users" name="frm_users" method="post">
                    <div class="modal-body">
                        <input type="hidden" value="add" name="action" id="action">
                        <input type="hidden" value="0" name="edit_id" id="edit_id">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-sm-6">
                                    <label for="username" class="control-label">Username:</label>
                                    <input type="text" class="form-control input-sm" id="username" name="username"/>
                                </div>
                                <div class="col-sm-6">
                                    <label for="password" class="control-label">Password:</label>
                                    <input type="password" class="form-control input-sm" id="password" name="password"/>
                                </div>
                            </div>                            
                        </div>                        
                        <div class="form-group">
                            <div class="row">
                                <div class="col-sm-4">
                                    <label for="nama_user" class="control-label">Surname:</label>
                                    <input type="text" class="form-control input-sm" id="nama_user" name="nama_user"/>
                                </div>                            
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-sm-5">
                                    <label for="role" class="control-label">Role</label>
                                    <select name="role" id="role" class="form-control input-sm">
                                        <option>...</option>
                                        <option value="1">Administrator</option>
                                        <option value="2">Moderator</option>
                                        <option value="6">Operator / Asseting Furniture</option>
                                        <option value="7">Operator / Asseting Electronic</option>
                                        <option value="8">Auditor</option>
                                        <option value="99">Superuser</option>
                                    </select>
                                </div>
                                <div class="col-sm-4">
                                    <label for="status" class="control-label">Status</label>
                                    <select name="status" id="status" class="form-control input-sm">
                                        <option>...</option>
                                        <option value="0">Tidak Aktif</option>
                                        <option value="1">Aktif</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-sm-4">
                                    <label for="keterangan" class="control-label">Keterangan:</label>
                                    <input type="text" class="form-control input-sm" id="keterangan" name="keterangan" readonly="readonly"/>
                                </div>
                            </div>                            
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

<script src="application/users/script.js"></script>
