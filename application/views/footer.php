<footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b> <a target="_blank" href="https://www.mysoftheaven.com"><?php  echo $SITE_TITLE;?></a> -v1.0</b> 
    </div>
    <strong>Copyright &copy; <?=date('Y')?> All rights reserved.</strong>
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li>
      </li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <div class="tab-pane" id="control-sidebar-home-tab">
        
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- <script>
    function convert_excel(who,type, fn, dl) {
    var elt = document.getElementById(who);
    var wb = XLSX.utils.table_to_book(elt, {sheet:"Sheet JS"});
    return dl ?
        XLSX.write(wb, {bookType:type, bookSST:true, type: 'base64'}) :
        XLSX.writeFile(wb, fn || ('Sales-Report.' + (type || 'xlsx')));
}
  </script> -->
