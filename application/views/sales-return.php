<!DOCTYPE html>
<html>

<head>
<!-- FORM CSS CODE -->
<?php include"comman/code_css_form.php"; ?>
<!-- </copy> -->
</head>


<body class="hold-transition skin-blue sidebar-mini">
   <div class="wrapper">

      <?php include"sidebar.php"; ?>
      <?php
         $sales_code=$customer_name='';
         if($oper=='return_against_sales'){

               $return_id='';
               $q2 = $this->db->query("select * from db_sales where id=$sales_id");
               $customer_id=$q2->row()->customer_id;
               $return_date=show_date(date("d-m-Y"));
               $sales_code=$q2->row()->sales_code;
               $return_status=$q2->row()->sales_status;
               $warehouse_id=$q2->row()->warehouse_id;
               $reference_no='';
               $discount_input=$q2->row()->discount_to_all_input;
               $discount_type=$q2->row()->discount_to_all_type;
               $other_charges_input=$q2->row()->other_charges_input;
               $other_charges_tax_id=$q2->row()->other_charges_tax_id;
               $return_note='';

               $items_count = $this->db->query("select count(*) as items_count from db_salesitems where sales_id=$sales_id")->row()->items_count;
         }

         if($oper=='edit_existing_return'){
               $q2 = $this->db->query("select * from db_salesreturn where id=$return_id");
               $sales_id=$q2->row()->sales_id;
               $customer_id=$q2->row()->customer_id;
               $return_date=show_date(date("d-m-Y"));
               $return_status=$q2->row()->return_status;
               $return_code=$q2->row()->return_code;
               $warehouse_id=$q2->row()->warehouse_id;
               $reference_no=$q2->row()->reference_no;
               $discount_input=$q2->row()->discount_to_all_input;
               $discount_type=$q2->row()->discount_to_all_type;
               $other_charges_input=$q2->row()->other_charges_input;
               $other_charges_tax_id=$q2->row()->other_charges_tax_id;
               $return_note=$q2->row()->return_note;

               $items_count = $this->db->query("select count(*) as items_count from db_salesitemsreturn where return_id=$return_id")->row()->items_count;
               $sales_code = (!empty($sales_id)) ? $this->db->query("select * from db_sales where id=$sales_id")->row()->sales_code : '';
         }
         if($oper=='create_new_return'){
               $customer_id  = $return_date = $return_status = $warehouse_id =
               $reference_no  =
               $other_charges_input          = $other_charges_tax_id =
               $discount_input = $discount_type  = $return_note='';
               $return_date=show_date(date("d-m-Y"));
         }

         if(!empty($customer_id)){
            $customer_name=$this->db->select('customer_name')->where('id',$customer_id)->get('db_customers')->row()->customer_name;
         }
      ?>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
         <!-- **********************MODALS***************** -->
         <?php include"modals/modal_customer.php"; ?>
         <!-- **********************MODALS END***************** -->
         <!-- Content Header (Page header) -->
         <section class="content-header">
            <h1>
               <?=$page_title;?>
               <small><?=$subtitle;?></small>
            </h1>
            <ol class="breadcrumb">
               <li><a href="<?php echo $base_url; ?>dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
               <li><a href="<?php echo $base_url; ?>sales_return"><?= $this->lang->line('sales_return_list'); ?></a></li>
               <li><a href="<?php echo $base_url; ?>sales_return/create"><?= $this->lang->line('new_sales'); ?></a></li>
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
                     <?= form_open('#', array('class' => 'form-horizontal', 'id' => 'sales-form', 'enctype'=>'multipart/form-data', 'method'=>'POST'));?>
                        <input type="hidden" id="base_url" value="<?php echo $base_url;; ?>">
                        <input type="hidden" value='1' id="hidden_rowcount" name="hidden_rowcount">
                        <input type="hidden" value='0' id="hidden_update_rowid" name="hidden_update_rowid">


                        <!-- Customer info -->
                        <div class="box-body">
                           <div class="form-group">
                              <?php if(!empty($sales_code)) { ?>
                                 <label for="" class="col-sm-2 control-label"><?= $this->lang->line('sales_code'); ?><label class="text-danger">*</label> </label>
                                 <label class="col-sm-3 control-label" style="text-align: left;"><?= $sales_code;?></label>
                              <?php } ?>
                              <?php if(!empty($customer_name)) { ?>
                              <label for="" class="col-sm-2 control-label"><?= $this->lang->line('customer_name'); ?><label class="text-danger">*</label> </label>
                                 <label class="col-sm-3 control-label" style="text-align: left;"><?= $customer_name;?></label>
                                 <input type="hidden" name="customer_id" id='customer_id' value="<?=$customer_id;?>">
                              <?php } ?>
                           </div>

                           <div class="form-group">
                              <?php if(!empty($return_code)) { ?>
                              <label for="" class="col-sm-2 control-label"><?= $this->lang->line('invoice'); ?><label class="text-danger">*</label> </label>
                                 <label class="col-sm-3 control-label" style="text-align: left;">#<?= $return_code;?></label>
                              <?php } ?>

                              <?php if(empty($customer_id)) {?>
                              <label for="customer_id" class="col-sm-2 control-label"><?= $this->lang->line('customer_name'); ?><label class="text-danger">*</label></label>
                              <div class="col-sm-3">
                                 <div class="input-group">
                                    <select class="form-control select2" id="customer_id" name="customer_id"  style="width: 100%;" onkeyup="shift_cursor(event,'mobile')">
                                       <?php

                                          $query1="select * from db_customers where status=1";
                                          $q1=$this->db->query($query1);
                                          if($q1->num_rows($q1)>0)
                                             {
                                                //echo "<option value=''>-Select-</option>";
                                                foreach($q1->result() as $res1)
                                             {
                                                $selected=($customer_id==$res1->id) ? 'selected' : '';
                                                echo "<option $selected  value='".$res1->id."'>".$res1->customer_name ."</option>";
                                             }
                                             }
                                             else
                                             { ?>
                                          <option value="">No Records Found</option>
                                       <?php } ?>
                                    </select>
                                    <span class="input-group-addon pointer" data-toggle="modal" data-target="#customer-modal" title="New customer?"><i class="fa fa-user-plus text-primary fa-lg"></i></span>
                                 </div>
                                 <span id="customer_id_msg" style="display:none" class="text-danger"></span>
                              </div>
                              <?php } ?>



                              <label for="return_date" class="col-sm-2 control-label"><?= $this->lang->line('date'); ?> <label class="text-danger">*</label></label>
                              <div class="col-sm-3">
                                 <div class="input-group date">
                                    <div class="input-group-addon">
                                       <i class="fa fa-calendar"></i>
                                    </div>
                                    <input type="text" class="form-control pull-right datepicker"  id="return_date" name="return_date" readonly onkeyup="shift_cursor(event,'return_status')" value="<?= $return_date;?>">
                                 </div>
                                 <span id="return_date_msg" style="display:none" class="text-danger"></span>
                              </div>

                              <label for="return_status" class="col-sm-2 control-label"><?= $this->lang->line('status'); ?> <label class="text-danger">*</label></label>
                              <div class="col-sm-3">
                                 <select class="form-control select2" id="return_status" name="return_status" style="width: 100%;" onkeyup="shift_cursor(event,'mobile')">
                                    <!-- <option value="">-Select-</option> -->
                                    <?php
                                          $return_select = ($return_status=='Return') ? 'selected' : '';
                                          $cancel_select = ($return_status=='Cancel') ? 'selected' : '';
                                    ?>
                                       <option <?= $return_select; ?> value="Return">Return</option>
                                       <option <?= $cancel_select; ?> value="Cancel">Cancel</option>
                                 </select>
                                 <span id="return_status_msg" style="display:none" class="text-danger"></span>
                              </div>
                           </div>

                           <input type="hidden" value="<?php echo  $reference_no; ?>" id="reference_no" name="reference_no">
                        </div>
                        <!-- Customer info -->
                        <!-- /.box-body -->

                        <!-- Item section -->
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
                                          <th class="center" rowspan='2' style="width:7.5%">Trade Price</th>
                                          <th class="center" rowspan='2' style="width:7.5%">Box/Poly</th>
                                          <th class="center" rowspan='2' style="width:9.5%">Pieces</th>
                                          <th class="center" rowspan='2' style="width:10%">Total Qty</th>
                                          <th class="center" rowspan='2' style="width:7.5%">Total Amount</th>
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
                                          <input type="text" class="form-control text-right only_currency" id="other_charges_input" name="other_charges_input" onkeyup="final_total();" value="0">
                                       </div>
                                    </div>
                                 </div>
                              </div>

                              <input type="hidden" id="discount_to_all_input" name="discount_to_all_input" value="0">
                              <input type="hidden" id="discount_to_all_type" name="discount_to_all_type" value="in_fixed">

                              <div class="row">
                                 <div class="col-md-12">
                                    <div class="form-group">
                                       <label for="sales_note" class="col-sm-4 control-label"><?= $this->lang->line('note'); ?></label>
                                       <div class="col-sm-8">
                                          <textarea class="form-control text-left" id='sales_note' name="sales_note"></textarea>
                                          <span id="sales_note_msg" style="display:none" class="text-danger"></span>
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
                                          <input type="hidden" id="profit_total" name="profit_total" value="0">
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

                              if($oper=='return_against_sales'){
                                 $btn_id='save';
                                 $btn_name="Save";
                                 echo '<input type="hidden" name="sales_id" id="sales_id" value="'.$sales_id.'"/>';
                              }
                              if($oper=='edit_existing_return'){
                                 $btn_id='update';
                                 $btn_name="Update";
                                 echo '<input type="hidden" name="return_id" id="return_id" value="'.$return_id.'"/>';
                                 echo '<input type="hidden" name="sales_id" id="sales_id" value="'.$sales_id.'"/>';
                              }
                              if($oper=='create_new_return'){
                                 $btn_id='create';
                                 $btn_name="Create";
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
      <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
      <div class="control-sidebar-bg"></div>
   </div>
   <!-- ./wrapper -->

   <script src="<?php echo $theme_link; ?>js/sales-return.js"></script>
   <!-- Return against sales Entry -->
   <script type="text/javascript">
      <?php if($oper=='return_against_sales') { ?>
         $(document).ready(function(){
               var base_url='<?= base_url();?>';
               var sales_id='<?= $sales_id;?>';
               $(".box").append('<div class="overlay"><i class="fa fa-refresh fa-spin"></i></div>');
               $.post(base_url+"sales_return/sales_list/"+sales_id,{},function(result){
                  //alert(result);
                  $('#sales_table tbody').append(result);
                  $("#hidden_rowcount").val(parseInt(<?=$items_count;?>)+1);
                  success.currentTime = 0;
                  success.play();
                  final_total();
                  $(".overlay").remove();
               });
         });
      <?php } ?>
   </script>
   <!-- EDIT OPERATIONS -->

   <!-- /* ---------- Final Description of amount ------------*/ -->
   <script>
      function final_total(){
         var rowcount = $("#hidden_rowcount").val();
         var subtotal = parseFloat(0);
         var discount = parseFloat(0);
         var grand_total = parseFloat(0);
         var vat_amt = parseFloat(0);
         total_quantity = 0;

         for(i=1; i < rowcount; i++){
            // price cal
            var qty = $("#td_data_" + i + "_3").val();
            var unit_price = $("#td_data_" + i + "_10").val();
            if (qty > 0 && unit_price > 0) {
               sub_amt = (parseFloat(qty) * parseFloat(unit_price));
               $("#td_data_" + i + "_9").val(sub_amt);

               // grand sub total
               subtotal = subtotal + parseFloat(sub_amt);

               // additional dis cal
               var addi_dis = $("#addi_dis_" + i).val();
               discount = discount + parseFloat((qty * addi_dis).toFixed(2));
               $("#td_data_" + i + "_7").val(parseFloat((qty * addi_dis).toFixed(2)));

               // vat cal
               var vat_unit = $("#vat_unit_" + i).val();
               vat_amt = vat_amt + parseFloat((vat_unit * qty).toFixed(2));
               $("#td_data_" + i + "_8").val(parseFloat((qty * vat_unit).toFixed(2)));

               total_quantity = total_quantity + parseInt(qty);
            }

         }//for end

         //Show grand total
         grand_total = grand_total + subtotal - discount + vat_amt;
         $("#subtotal_amt").html(parseFloat(subtotal).toFixed(2));
         $("#discount_to_all_amt").html(parseFloat(discount).toFixed(2));
         $("#vat_grand").html(parseFloat(vat_amt).toFixed(2));
         $("#total_amt").html(parseFloat(grand_total).toFixed(2));
         $("#amount").val(parseFloat(grand_total).toFixed(2));

         //Show total Sales Quantity
         $(".total_quantity").html(total_quantity);

         //alert("final_total() end");
      }

      function removerow(id){//id=Rowid\
         $("#row_"+id).remove();
         final_total();
         failed.currentTime = 0;
         failed.play();
      }
   </script>
   <!-- /* ---------- Final Description of amount end ------------*/ -->


   <script>
      $(".close_btn").click(function(){
         if(confirm('Are you sure you want to navigate away from this page?')){
            window.location='<?php echo $base_url; ?>dashboard';
            }
      });
      //Initialize Select2 Elements
      $(".select2").select2();
      //Date picker
      $('.datepicker').datepicker({
         autoclose: true,
         format: 'dd-mm-yyyy',
         todayHighlight: true
      });

      /* ---------- CALCULATE TAX -------------*/
      function calculate_tax(i){ //i=Row
         var qty=$("#td_data_"+i+"_3").val().trim();
         var sales_price=parseFloat($("#td_data_"+i+"_10").val().trim());
         var discount=$("#td_data_"+i+"_8").val().trim();

         //Discount on All
         var discount_input = (isNaN(parseFloat($("#discount_to_all_input").val()))) ? 0 : parseFloat($("#discount_to_all_input").val());
         if(discount_input>0){
            discount=0;
         }

         discount   =(isNaN(parseFloat(discount)))    ? 0 : parseFloat(discount);

         var amt=parseInt(qty) * sales_price;//Taxable
         var discount_amt=((amt) * discount)/100;

         var total_amt=amt-discount_amt;

         //Set Unit cost
         var per_unit_discount = (sales_price)*discount/100;
         var per_unit_total    = sales_price - per_unit_discount;
         $("#td_data_"+i+"_9").val('').val(total_amt.toFixed(2));
         //alert("calculate_tax() end");
         final_total();

      }
      /* ---------- CALCULATE GST END -------------*/

      function enable_or_disable_item_discount(){
         var discount_input=parseFloat($("#discount_to_all_input").val());
         discount_input = isNaN(discount_input) ? 0 : discount_input;
         if(discount_input>0){
            $(".item_discount").attr({
               'readonly': true,
               'style': 'border-color:red;cursor:no-drop',
            });
         } else{
            $(".item_discount").attr({
               'readonly': false,
               'style': '',
            });
         }

         var rowcount=$("#hidden_rowcount").val();
         for(k=1;k<=rowcount;k++){
            if(document.getElementById("tr_item_id_"+k)){
               calculate_tax(k);
            }//if end
         }//for end
         //final_total();
      }
   </script>

   <script type="text/javascript">
      <?php if($oper=='edit_existing_return') { ?>
            $(document).ready(function(){
               var base_url='<?= base_url();?>';
               var return_id='<?= $return_id;?>';
               $(".box").append('<div class="overlay"><i class="fa fa-refresh fa-spin"></i></div>');
               $.post(base_url+"sales_return/return_sales_list/"+return_id,{},function(result){
               //alert(result);
               $('#sales_table tbody').append(result);
               $("#hidden_rowcount").val(parseInt(<?=$items_count;?>)+1);
               success.currentTime = 0;
               success.play();
               enable_or_disable_item_discount();
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
