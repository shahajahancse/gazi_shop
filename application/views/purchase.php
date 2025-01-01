<!DOCTYPE html>
<html>

<head>
   <!-- TABLES CSS CODE -->
   <?php include"comman/code_css_form.php"; ?>
   <!-- </copy> -->
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
   <?php include"sidebar.php"; ?>
   <?php
      if(!isset($purchase_id)){
         $supplier_id  = $pur_date = $purchase_status = $warehouse_id =
         $reference_no  =
         $other_charges_input          = $other_charges_tax_id =
         $discount_input = $discount_type  = $purchase_note='';
         $pur_date=show_date(date("d-m-Y"));
      } else{
         $q2 = $this->db->query("select * from db_purchase where id=$purchase_id");
         $supplier_id=$q2->row()->supplier_id;
         $pur_date=show_date($q2->row()->purchase_date);
         $purchase_status=$q2->row()->purchase_status;
         $warehouse_id=$q2->row()->warehouse_id;
         $reference_no=$q2->row()->reference_no;
         $discount_input=$q2->row()->discount_to_all_input;
         $discount_type=$q2->row()->discount_to_all_type;
         $other_charges_input=$q2->row()->other_charges_input;
         $other_charges_tax_id=$q2->row()->other_charges_tax_id;
         $purchase_note=$q2->row()->purchase_note;

         $items_count = $this->db->query("select count(*) as items_count from db_purchaseitems where purchase_id=$purchase_id")->row()->items_count;
      }
   ?>

   <!-- Content Wrapper. Contains page content -->
   <div class="content-wrapper">
      <!-- **********************MODALS***************** -->
      <?php include"modals/modal_supplier.php"; ?>
      <!-- **********************MODALS END***************** -->
      <!-- Content Header (Page header) -->
      <section class="content-header">
         <h1>
            <?=$page_title;?>
            <small>Add/Update Purchase</small>
         </h1>
         <ol class="breadcrumb">
            <li><a href="<?php echo $base_url; ?>dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="<?php echo $base_url; ?>purchase"><?= $this->lang->line('purchase_list'); ?></a></li>
            <li><a href="<?php echo $base_url; ?>purchase/add"><?= $this->lang->line('new_purchase'); ?></a></li>
            <li class="active"><?=$page_title;?></li>
         </ol>
      </section>

      <!-- Main content -->
      <section class="content">
         <div class="row">
            <!-- ********** ALERT MESSAGE START******* -->
            <?php include"comman/code_flashdata.php"; ?>
            <!-- ********** ALERT MESSAGE END******* -->
            <!-- right column -->
            <div class="col-md-12">
               <!-- Horizontal Form -->
               <div class="box box-info " >
                  <!-- style="background: #68deac;" -->

                  <!-- form start -->
                  <!-- OK START -->
                  <?= form_open('#', array('class' => 'form-horizontal', 'id' => 'purchase-form', 'enctype'=>'multipart/form-data', 'method'=>'POST'));?>
                     <input type="hidden" id="base_url" value="<?php echo $base_url;; ?>">
                     <input type="hidden" value='1' id="hidden_rowcount" name="hidden_rowcount">
                     <input type="hidden" value='0' id="hidden_update_rowid" name="hidden_update_rowid">

                     <!-- Supplier section -->
                     <div class="box-body">
                        <div class="form-group">
                           <label for="supplier_id" class="col-sm-2 control-label"><?= $this->lang->line('supplier_name'); ?><label class="text-danger">*</label></label>
                           <div class="col-sm-3">
                              <div class="input-group">
                                 <select class="form-control select2" id="supplier_id" name="supplier_id"  style="width: 100%;" onkeyup="shift_cursor(event,'mobile')">
                                    <?php

                                       $query1="select * from db_suppliers where status=1";
                                       $q1=$this->db->query($query1);
                                       if($q1->num_rows($q1)>0)
                                          {
                                             echo "<option value=''>-Select-</option>";
                                             foreach($q1->result() as $res1)
                                          {
                                             $selected=($supplier_id==$res1->id) ? 'selected' : '';
                                             echo "<option $selected  value='".$res1->id."'>".$res1->supplier_name ."</option>";
                                          }
                                          }
                                          else
                                          {
                                             ?>
                                    <option value="">No Records Found</option>
                                    <?php
                                       }
                                       ?>
                                 </select>
                                 <span class="input-group-addon pointer" data-toggle="modal" data-target="#supplier-modal" title="New Supplier?"><i class="fa fa-user-plus text-primary fa-lg"></i></span>
                              </div>
                              <span id="supplier_id_msg" style="display:none" class="text-danger"></span>
                           </div>

                           <label for="pur_date" class="col-sm-2 control-label"><?= $this->lang->line('purchase_date'); ?> <label class="text-danger">*</label></label>
                           <div class="col-sm-3">
                              <div class="input-group date">
                                 <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                 </div>
                                 <input type="text" class="form-control pull-right datepicker"  id="pur_date" name="pur_date" readonly onkeyup="shift_cursor(event,'purchase_status')" value="<?= $pur_date;?>">
                              </div>
                              <span id="pur_date_msg" style="display:none" class="text-danger"></span>
                           </div>
                        </div>
                        <div class="form-group">
                           <label for="purchase_status" class="col-sm-2 control-label"><?= $this->lang->line('status'); ?> <label class="text-danger">*</label></label>
                           <div class="col-sm-3">
                                 <select class="form-control select2" id="purchase_status" name="purchase_status"  style="width: 100%;" onkeyup="shift_cursor(event,'mobile')">
                                    <!-- <option value="">-Select-</option> -->
                                    <?php
                                          $received_select = ($purchase_status=='Received') ? 'selected' : '';
                                          $pending_select = ($purchase_status=='Pending') ? 'selected' : '';
                                          $ordered_select = ($purchase_status=='Ordered') ? 'selected' : '';
                                    ?>
                                             <option <?= $received_select; ?> value="Received">Received</option>
                                             <option <?= $pending_select; ?> value="Pending">Pending</option>
                                             <option <?= $ordered_select; ?> value="Ordered">Ordered</option>
                                 </select>
                              <span id="purchase_status_msg" style="display:none" class="text-danger"></span>
                           </div>
                              <label for="reference_no" class="col-sm-2 control-label"><?= $this->lang->line('reference_no'); ?> </label>
                           <div class="col-sm-3">
                              <input type="text" value="<?php echo  $reference_no; ?>" class="form-control " id="reference_no" name="reference_no" placeholder="" > <span id="reference_no_msg" style="display:none" class="text-danger"></span>
                           </div>
                        </div>
                     </div>
                     <!-- Supplier section -->
                     <!-- /.box-body -->

                     <row class="row">
                        <div class="col-xs-12 ">
                           <div class="col-sm-12">
                              <!-- Item Search Section for Purchase -->
                              <div class="box box-info">
                                 <div class="box-body ">
                                    <div class="col-md-8 col-md-offset-2 d-flex justify-content" >
                                       <div class="input-group">
                                          <span class="input-group-addon" title="Select Items"><i class="fa fa-barcode"></i></span>
                                          <input type="text" class="form-control " placeholder="Item name/Barcode/Itemcode" id="item_search">
                                       </div>
                                    </div>
                                    <br>
                                    <br>
                                 </div>
                              </div>
                              <!-- Item Search Section for Purchase -->
                              <style type="text/css">
                                 .center {
                                    text-align: center;
                                 }
                                 .left {
                                    text-align: left;
                                    padding-left: 10px;
                                 }
                                 .right {
                                    text-align: right;
                                    padding-right: 10px;
                                 }
                                 .table > tbody > tr > td,
                                 .table > tbody > tr > th,
                                 .table > tfoot > tr > td,
                                 .table > tfoot > tr > th,
                                 .table > thead > tr > td,
                                 .table > thead > tr > th
                                 {
                                    padding-left: 2px;
                                    padding-right: 2px;
                                 }
                              </style>
                              <!-- Item list show here -->
                              <table class="table table-hover table-bordered" style="width:100%" id="purchase_table">
                                 <thead class="custom_thead">
                                    <tr class="bg-primary" >
                                       <th class="left" rowspan='2' style="width:20%">Item Name</th>
                                       <th class="center" rowspan='2' style="width:5%">DP. Price </th>
                                       <th class="center" rowspan='2' style="width:7.5%">Box/Poly</th>
                                       <th class="center" rowspan='2' style="width:9.5%">Pieces</th>
                                       <th class="center" rowspan='2' style="width:10%">Total Qty</th>
                                       <th class="center" rowspan='2' style="width:7.5%">Total Amount</th>
                                       <th class="center" rowspan='2' style="width:7.5%">TP Price</th>
                                       <th class="center" rowspan='2' style="width:7.5%">Profit Margin</th>
                                       <th class="center" rowspan='2' style="width:7.5%">Action</th>
                                    </tr>
                                 </thead>
                                 <tbody>

                                 </tbody>
                              </table>
                              <!-- Item list show here -->
                           </div>
                           <!-- /.box -->
                        </div>

                        <!-- Grand section -->
                        <div class="col-md-6">
                           <div class="row">
                              <div class="col-md-12">
                                 <div class="form-group">
                                    <label for="other_charges_input" class="col-sm-4 control-label"><?= $this->lang->line('other_charges'); ?></label>
                                    <div class="col-sm-8">
                                       <input type="text" class="form-control text-right only_currency" id="other_charges_input" name="other_charges_input" onkeyup="final_total();" value="<?php echo  $other_charges_input; ?>">
                                    </div>
                                 </div>
                              </div>
                           </div>

                           <input type="hidden" id="discount_to_all_input" name="discount_to_all_input" value="0">
                           <input type="hidden" id="discount_to_all_type" name="discount_to_all_type" value="in_fixed">

                           <div class="row">
                              <div class="col-md-12">
                                 <div class="form-group">
                                    <label for="purchase_note" class="col-sm-4 control-label"><?= $this->lang->line('note'); ?></label>
                                    <div class="col-sm-8">
                                       <textarea class="form-control text-left" id='purchase_note' name="purchase_note"><?=$purchase_note;?></textarea>
                                       <span id="purchase_note_msg" style="display:none" class="text-danger"></span>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>

                        <div class="col-md-6">
                           <div class="row">
                              <div class="col-md-12">
                                 <div class="form-group">

                                    <table  class="col-md-9">
                                       <tr>
                                          <th class="text-right" style="font-size: 17px;"><?= $this->lang->line('subtotal'); ?></th>
                                          <th class="text-right" style="padding-left:10%;font-size: 17px;">
                                             <h4>
                                                <?= $CI->currency('<b id="subtotal_amt" name="subtotal_amt">0.00</b>'); ?>
                                             </h4>
                                          </th>
                                       </tr>
                                       <tr>
                                          <th class="text-right" style="font-size: 17px;"><?= $this->lang->line('other_charges'); ?></th>
                                          <th class="text-right" style="padding-left:10%;font-size: 17px;">
                                             <h4>
                                                <?= $CI->currency('<b id="other_charges_amt" name="other_charges_amt">0.00</b>'); ?>
                                             </h4>
                                          </th>
                                       </tr>

                                       <input type="hidden" id="discount_to_all_amt" name="discount_to_all_amt" value="0">

                                       <tr>
                                          <th class="text-right" style="font-size: 17px;"><?= $this->lang->line('grand_total'); ?></th>
                                          <th class="text-right" style="padding-left:10%;font-size: 17px;">
                                             <h4>
                                                <?= $CI->currency('<b id="total_amt" name="total_amt">0.00</b>'); ?></h4>
                                          </th>
                                       </tr>
                                    </table>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <!-- Grand section -->

                        <!-- Payment section -->
                        <div class="col-xs-12 ">
                           <div class="col-sm-12">
                                 <div class="box-body ">

                                    <div class="col-md-12 payments_div payments_div_">
                                       <h4 class="box-title text-info"><?= $this->lang->line('make_payment'); ?> : </h4>
                                    <div class="box box-solid bg-gray">
                                       <div class="box-body">
                                          <div class="row">

                                          <div class="col-md-6">
                                             <div class="">
                                             <label for="amount"><?= $this->lang->line('amount'); ?></label>
                                                <input type="text" class="form-control text-right paid_amt only_currency" id="amount" name="amount" placeholder="" >
                                                <span id="amount_msg" style="display:none" class="text-danger"></span>
                                          </div>
                                          </div>
                                          <div class="col-md-6">
                                             <div class="">
                                                <label for="payment_type"><?= $this->lang->line('payment_type'); ?></label>
                                                <select class="form-control select2" id='payment_type' name="payment_type">
                                                <?php
                                                   $q1=$this->db->query("select * from db_paymenttypes where status=1");
                                                   if($q1->num_rows()>0){
                                                      echo "<option value=''>-Select-</option>";
                                                         foreach($q1->result() as $res1){
                                                         echo "<option value='".$res1->payment_type."'>".$res1->payment_type ."</option>";
                                                      }
                                                   }
                                                   else{
                                                      echo "<option>None</option>";
                                                   }
                                                   ?>
                                                </select>
                                                <span id="payment_type_msg" style="display:none" class="text-danger"></span>
                                             </div>
                                          </div>
                                       <div class="clearfix"></div>
                                    </div>
                                    <div class="row">
                                          <div class="col-md-12">
                                             <div class="">
                                                <label for="payment_note"><?= $this->lang->line('payment_note'); ?></label>
                                                <textarea type="text" class="form-control" id="payment_note" name="payment_note" placeholder="" ></textarea>
                                                <span id="payment_note_msg" style="display:none" class="text-danger"></span>
                                             </div>
                                          </div>

                                       <div class="clearfix"></div>
                                    </div>
                                    </div>
                                    </div>
                                    </div><!-- col-md-12 -->
                                 </div>
                                 <!-- /.box-body -->
                              </div>
                           <!-- /.box -->
                        </div>
                        <!-- Payment section -->
                     </div>

                     <!-- /.box-body -->
                     <div class="box-footer col-sm-12">
                        <center>
                           <?php
                           if(isset($purchase_id)){
                              $btn_id='update';
                              $btn_name="Update";
                              echo '<input type="hidden" name="purchase_id" id="purchase_id" value="'.$purchase_id.'"/>';
                           }
                           else{
                              $btn_id='save';
                              $btn_name="Save";
                           }

                           ?>
                           <div class="col-md-3 col-md-offset-3">
                              <button type="button" id="<?php echo $btn_id;?>" class="btn bg-maroon btn-block btn-flat btn-lg payments_modal" title="Save Data"><?php echo $btn_name;?></button>
                           </div>
                           <div class="col-sm-3"><a href="<?= base_url()?>dashboard">
                              <button type="button" class="btn bg-gray btn-block btn-flat btn-lg" title="Go Dashboard">Close</button>
                              </a>
                           </div>
                        </center>
                     </div>
                  <?= form_close(); ?>
                  <!-- OK END -->
               </div>
            </div>
            <!-- /.box-footer -->
         </div>
         <!-- /.box -->
      </section>
      <!-- /.content -->
   </div>
   <!-- /.content-wrapper -->

   <?php include"footer.php"; ?>
   <!-- SOUND CODE -->
   <?php include"comman/code_js_sound.php"; ?>
   <!-- GENERAL CODE -->
   <?php include"comman/code_js_form.php"; ?>

   <script src="<?php echo $theme_link; ?>js/modals.js"></script>
   <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
   <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
<script src="<?php echo $theme_link; ?>js/purchase.js"></script>

<script>
   $(".close_btn").click(function(){
      if(confirm('Are you sure you want to navigate away from this page?')){
         window.location='<?php echo $base_url; ?>dashboard';
      }
   });
   //Initialize Select2 Elements
   $(".select2").select2();
   $('.datepicker').datepicker({
      autoclose: true,
      format: 'dd-mm-yyyy',
      todayHighlight: true
   });

   /* ---------- //CALCUALATED SALES qty and total price -------------*/
   function cal_qty_price(i){
      var bqty = (isNaN(parseFloat($("#td_data_"+i+"_9").val()))) ? 0 :parseFloat($("#td_data_"+i+"_9").val());
      var p_price = (isNaN(parseFloat($("#td_data_"+i+"_2").val()))) ? 0 :parseFloat($("#td_data_"+i+"_2").val());
      var box_qty = (isNaN(parseFloat($("#td_data_"+i+"_3").val()))) ? 0 :parseFloat($("#td_data_"+i+"_3").val());
      var pieces  = (isNaN(parseFloat($("#td_data_"+i+"_4").val()))) ? 0 :parseFloat($("#td_data_"+i+"_4").val());

      // cal total quantity and set in total quantity field
      if (box_qty > 0 && bqty > 0) {
         var total_qty = (parseInt(box_qty * bqty)) + parseInt(pieces);
      } else {
         total_qty = parseInt(pieces);
      }
      $("#td_data_"+i+"_5").val(total_qty);  // set total quantity

      // cal total Amount and set in total amount field
      if (total_qty > 0 && p_price > 0) {
         var total_amt = parseFloat(total_qty) * parseFloat(p_price);
      } else {
         total_amt = 0;
      }
      $("#td_data_"+i+"_6").val(total_amt);  // set total amount

      var s_price = (isNaN(parseFloat($("#td_data_"+i+"_7").val()))) ? 0 :parseFloat($("#td_data_"+i+"_7").val());
      // cal profit margin and set in profit margin field
      if (p_price > 0 && s_price > 0 && s_price > p_price) {
         var profit_margin = parseFloat((s_price - p_price) * total_qty).toFixed(2);
      } else {
         $("#td_data_"+i+"_7").val('');
         profit_margin = 0;
      }
      $("#td_data_"+i+"_8").val(profit_margin);  // set profit margin
      $("#td_data_"+i+"_10").val(parseFloat(s_price - p_price).toFixed(2));  // set per unit profit margin
      final_total();
   }
   /* ---------- CALCULATE END -------------*/

   /* ---------- Final Description of amount ------------*/
   function final_total(){
      var rowcount=$("#hidden_rowcount").val();
      //other charges total amount
      var other_charges = 0;;
      if($("#other_charges_input").val()!=null && $("#other_charges_input").val()!=''){
         other_charges=$("#other_charges_input").val();
      }
      $("#other_charges_amt").html(parseFloat(other_charges).toFixed(2));

      var sub_total = parseFloat(0);
      var profit_total = parseFloat(0);

      for(i=1; i<=rowcount; i++){
         var bqty = (isNaN(parseFloat($("#td_data_"+i+"_9").val()))) ? 0 :parseFloat($("#td_data_"+i+"_9").val());
         var p_price = (isNaN(parseFloat($("#td_data_"+i+"_2").val()))) ? 0 :parseFloat($("#td_data_"+i+"_2").val());
         var box_qty = (isNaN(parseFloat($("#td_data_"+i+"_3").val()))) ? 0 :parseFloat($("#td_data_"+i+"_3").val());
         var pieces  = (isNaN(parseFloat($("#td_data_"+i+"_4").val()))) ? 0 :parseFloat($("#td_data_"+i+"_4").val());

         // cal total quantity and set in total quantity field
         if (box_qty > 0 && bqty > 0) {
            var total_qty = (parseInt(box_qty * bqty)) + parseInt(pieces);
         } else {
            total_qty = parseInt(pieces);
         }
         $("#td_data_"+i+"_5").val(total_qty);  // set total quantity

         // cal total Amount and set in total amount field
         if (total_qty > 0 && p_price > 0) {
            var total_amt = parseFloat(total_qty) * parseFloat(p_price);
         } else {
            total_amt = 0;
         }
         $("#td_data_"+i+"_6").val(total_amt);  // set total amount
         sub_total += parseFloat(total_amt);

         var s_price = (isNaN(parseFloat($("#td_data_"+i+"_7").val()))) ? 0 :parseFloat($("#td_data_"+i+"_7").val());
         // cal profit margin and set in profit margin field
         if (p_price > 0 && s_price > 0 && s_price > p_price) {
            var profit_margin = parseFloat((s_price - p_price) * total_qty).toFixed(2);
         } else {
            $("#td_data_"+i+"_7").val('');
            profit_margin = 0;
         }
         $("#td_data_"+i+"_8").val(profit_margin);  // set profit margin
         $("#td_data_"+i+"_10").val(parseFloat(s_price - p_price).toFixed(2));  // set per unit profit margin
         profit_total += parseFloat(profit_margin);
      } //for end

      //subtotal
      $("#subtotal_amt").html(sub_total.toFixed(2));
      g_total = parseFloat(sub_total) + parseFloat(other_charges);
      $("#total_amt").html(parseFloat(g_total).toFixed(2));
      $("#amount").val(parseFloat(g_total).toFixed(2));
   }
   /* ---------- Final Description of amount end ------------*/

   function removerow(id){//id=Rowid
      $("#row_"+id).remove();
      final_total();
      failed.currentTime = 0;
      failed.play();
   }
</script>

<!-- UPDATE OPERATIONS -->
<script type="text/javascript">
   <?php if(isset($purchase_id)){ ?>
      $(document).ready(function(){
         var base_url='<?= base_url();?>';
         var purchase_id='<?= $purchase_id;?>';
         $(".box").append('<div class="overlay"><i class="fa fa-refresh fa-spin"></i></div>');
         $.post(base_url+"purchase/return_purchase_list/"+purchase_id,{},function(result){
            $('#purchase_table tbody').append(result);
            $("#hidden_rowcount").val(parseInt(<?=$items_count;?>)+1);
            success.currentTime = 0;
            success.play();
            final_total();
            $(".overlay").remove();
         });
      });
   <?php }?>
</script>
<!-- UPDATE OPERATIONS end-->

<!-- Make sidebar menu hughlighter/selector -->
<script>$(".<?php echo basename(__FILE__,'.php');?>-active-li").addClass("active");</script>
</body>
</html>
