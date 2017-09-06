<div class="well" style="height: 100%">
    <div class="row">
        <div class="col-md-3">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <strong>Form Asset Recover</strong>
                    <span class="text-right pull-right text-muted" id="report-date"></span>
                </div>
                <form id="frm_recover" enctype="multipart/form-data">
                    <div class="panel-body" style="overflow: scroll; min-height: 500px;">
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
            <div class="well">
                <table id="tbl_recover" style="display: none"></table>
            </div>            
        </div>
    </div>    
</div>

<script src="application/recover/script.js"></script>
