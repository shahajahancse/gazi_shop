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

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <?= $this->lang->line('invoice'); ?>
      </h1>
      <ol class="breadcrumb">
        <li><a href="<?php echo $base_url; ?>dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?php echo $base_url; ?>sales_return"><?= $this->lang->line('sales_returns_list'); ?></a></li>
        <li><a href="<?php echo $base_url; ?>sales_return/create"><?= $this->lang->line('create_new'); ?></a></li>
        <li class="active"><?= $this->lang->line('invoice'); ?></li>
      </ol>
    </section>

    <?php
    $CI =& get_instance();
    $q1=$this->db->query("select * from db_company where id=1 and status=1");
    $res1=$q1->row();
    $company_name=$res1->company_name;
    $company_mobile=$res1->mobile;
    $company_phone=$res1->phone;
    $company_email=$res1->email;
    $company_country=$res1->country;
    $company_state=$res1->state;
    $company_city=$res1->city;
    $company_address=$res1->address;
    $company_gst_no=$res1->gst_no;
    $company_vat_no=$res1->vat_no;
    $company_pan_no=$res1->pan_no;


    $q3=$this->db->query("SELECT b.sales_id,a.customer_name,a.mobile,a.phone,a.gstin,a.tax_number,a.email,
                           a.opening_balance,a.country_id,a.state_id,a.city,
                           a.postcode,a.address,b.return_date,b.created_time,b.reference_no,
                           b.return_code,b.return_status,b.return_note,
                           coalesce(b.grand_total,0) as grand_total,
                           coalesce(b.subtotal,0) as subtotal,
                           coalesce(b.paid_amount,0) as paid_amount,
                           coalesce(b.other_charges_input,0) as other_charges_input,
                           other_charges_tax_id,
                           coalesce(b.other_charges_amt,0) as other_charges_amt,
                           discount_to_all_input,
                           b.discount_to_all_type,
                           coalesce(b.tot_discount_to_all_amt,0) as tot_discount_to_all_amt,
                           coalesce(b.round_off,0) as round_off,
                           b.payment_status,b.pos

                           FROM db_customers a,
                           db_salesreturn b
                           WHERE
                           a.`id`=b.`customer_id` AND
                           b.`id`='$return_id'
                           ");


    $res3=$q3->row();
    $sales_id=$res3->sales_id;
    $customer_name=$res3->customer_name;
    $customer_mobile=$res3->mobile;
    $customer_phone=$res3->phone;
    $customer_email=$res3->email;
    $customer_country=$res3->country_id;
    $customer_state=$res3->state_id;
    $customer_city=$res3->city;
    $customer_address=$res3->address;
    $customer_postcode=$res3->postcode;
    $customer_gst_no=$res3->gstin;
    $customer_tax_number=$res3->tax_number;
    $customer_opening_balance=$res3->opening_balance;
    $return_date=$res3->return_date;
    $created_time=$res3->created_time;
    $reference_no=$res3->reference_no;
    $return_code=$res3->return_code;
    $return_status=$res3->return_status;
    $return_note=$res3->return_note;


    $subtotal=$res3->subtotal;
    $grand_total=$res3->grand_total;
    $other_charges_input=$res3->other_charges_input;
    $other_charges_tax_id=$res3->other_charges_tax_id;
    $other_charges_amt=$res3->other_charges_amt;
    $paid_amount=$res3->paid_amount;
    $discount_to_all_input=$res3->discount_to_all_input;
    $discount_to_all_type=$res3->discount_to_all_type;
    $discount_to_all_type = ($discount_to_all_type=='in_percentage') ? '%' : 'Fixed';
    $tot_discount_to_all_amt=$res3->tot_discount_to_all_amt;
    $round_off=$res3->round_off;
    $payment_status=$res3->payment_status;
    $pos=$res3->pos;

    if(!empty($customer_country)){
      $customer_country = $this->db->query("select country from db_country where id='$customer_country'")->row()->country;
    }
    if(!empty($customer_state)){
      $customer_state = $this->db->query("select state from db_states where id='$customer_state'")->row()->state;
    }

    $sales_code = (!empty($sales_id))?$this->db->query("select sales_code from db_sales where id=".$sales_id)->row()->sales_code:'';
    ?>


    <!-- Main content -->
    <section class="content-header">
    <div class="row">
      <div class="col-md-12">
      <!-- ********** ALERT MESSAGE START******* -->

            <?php if($this->session->flashdata('error')!=''){ ?>
                <div class="alert alert-danger text-left">
                 <a href="javascript:void()" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong><?= $this->session->flashdata('error') ?></strong>
              </div>
               <?php
              }
              else{ ?>
                <div class="alert alert-success text-left">
                 <a href="javascript:void()" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>
                  <?php
                   if(!empty($this->session->flashdata('success'))){
                    echo $this->session->flashdata('success')."<br>";
                   }
                   if(!empty($sales_id)){
                    echo "<i class='fa fa-fw fa-hand-o-right'></i>Return Against Sales Entry [Sales Code is ".$this->db->select('sales_code')->where('id',$sales_id)->get('db_sales')->row()->sales_code.'].';
                    //echo "<br>";
                   }
                   else{
                    echo '<i class="fa fa-fw fa-hand-o-right"></i>Direct Return Invoice.';
                   }
                   ?>
                  </strong>
              </div>
              <?php } ?>
            <!-- ********** ALERT MESSAGE END******* -->
     </div>
    </div>
    </section>
    <!-- Main content -->
    <section class="invoice">
      <!-- title row -->
      <div class="printableArea">
      <div class="row">
        <div class="col-xs-12">
          <h2 class="page-header">
            <i class="fa fa-globe"></i> <?= $this->lang->line('sales_return_invoice'); ?>
            <small class="pull-right">Date: <?php echo  show_date($return_date)." ".$created_time; ?></small>
          </h2>
        </div>
        <!-- /.col -->
      </div>
      <!-- info row -->
      <div class="row invoice-info">
        <div class="col-sm-4 invoice-col">
          <i><?= $this->lang->line('from'); ?></i>
          <address>
            <strong><?php echo  $company_name; ?></strong><br>
            <?php echo  $company_address; ?>,
            <?= $this->lang->line('city'); ?>:<?php echo  $company_city; ?><br>
            <?= $this->lang->line('phone'); ?>: <?php echo  $company_phone; ?>,
            <?= $this->lang->line('mobile'); ?>: <?php echo  $company_mobile; ?><br>
            <?php echo (!empty(trim($company_email))) ? $this->lang->line('email').": ".$company_email."<br>" : '';?>
            <?php echo (!empty(trim($company_gst_no))) ? $this->lang->line('gst_number').": ".$company_gst_no."<br>" : '';?>
            <?php echo (!empty(trim($company_vat_no))) ? $this->lang->line('vat_number').": ".$company_vat_no."<br>" : '';?>
            <?php echo (!empty(trim($company_pan_no))) ? $this->lang->line('vat_number').": ".$company_pan_no."<br>" : '';?>

          </address>
        </div>
        <!-- /.col -->
        <div class="col-sm-4 invoice-col">
          <i><?= $this->lang->line('customer_details'); ?><br></i>
          <address>
            <strong><?php echo  $customer_name; ?></strong><br>
            <?php
              if(!empty($customer_address)){
                echo $customer_address;
              }
              if(!empty($customer_country)){
                echo $customer_country;
              }
              if(!empty($customer_state)){
                echo ",".$customer_state;
              }
              if(!empty($customer_city)){
                echo ",".$customer_city;
              }
              if(!empty($customer_postcode)){
                echo "-".$customer_postcode;
              }
            ?>
            <br>
            <?php echo (!empty(trim($customer_mobile))) ? $this->lang->line('mobile').": ".$customer_mobile."<br>" : '';?>
            <?php echo (!empty(trim($customer_phone))) ? $this->lang->line('phone').": ".$customer_phone."<br>" : '';?>
            <?php echo (!empty(trim($customer_email))) ? $this->lang->line('email').": ".$customer_email."<br>" : '';?>
            <?php echo (!empty(trim($customer_gst_no))) ? $this->lang->line('gst_number').": ".$customer_gst_no."<br>" : '';?>
            <?php echo (!empty(trim($customer_tax_number))) ? $this->lang->line('tax_number').": ".$customer_tax_number."<br>" : '';?>
          </address>
        </div>
        <!-- /.col -->
        <div class="col-sm-4 invoice-col">
          <b><?= $this->lang->line('invoice'); ?> #<?php echo  $return_code; ?></b><br>
          <b><?= $this->lang->line('return_status'); ?> :<?php echo  $return_status; ?></b><br>
          <b><?= $this->lang->line('reference_no'); ?> :<?php echo  $reference_no; ?></b><br>
          <?php if($sales_code) {?>
            <b><?= $this->lang->line('return_against_sales'); ?> :#<?php echo  $sales_code; ?></b><br>
          <?php } ?>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

      <!-- Table row -->
      <div class="row">
        <div class="col-xs-12 table-responsive">
          <table class="table table-striped records_table table-bordered">
            <thead class="bg-gray-active text-right">
              <tr class="text-right">
                <th>#</th>
                <th class="text-left"><?= $this->lang->line('item_name'); ?></th>
                <th class="text-right"><?= $this->lang->line('quantity'); ?></th>
                <th class="text-right"><?= $this->lang->line('unit_price'); ?></th>
                <th class="text-right">Item Cost</th>
                <th class="text-right">Vat</th>
                <th class="text-right">Discount</th>
                <th class="text-right"><?= $this->lang->line('total_amount'); ?></th>
              </tr>
            </thead>
            <tbody class="text-right">
              <?php
                $tot_qty = 0;
                $unit_cost = 0;
                $tax_amt = 0;
                $dis_amt = 0;
                $total_cost = 0;

                $q2=$this->db->query("SELECT a.*, c.item_name,c.tax_type
                                  FROM db_salesitemsreturn AS a, db_items AS c
                                  WHERE c.id=a.item_id AND a.return_id='$return_id'");

                foreach ($q2->result() as $key => $res2) { ?>
                  <tr>
                    <td class="text-left"><?= $key+1 ?></td>
                    <td class="text-left"><?= $res2->item_name ?></td>
                    <td><?= $res2->return_qty ?></td>
                    <td><?= $res2->price_per_unit ?></td>
                    <td><?= $res2->total_cost ?></td>
                    <td><?= $res2->tax_amt ?></td>
                    <td><?= $res2->discount_amt ?></td>
                    <td><?= $res2->total_cost + $res2->tax_amt - $res2->discount_amt ?></td>
                  </tr>
                <?php
                  $tot_qty    += $res2->return_qty;
                  $unit_cost  += $res2->total_cost;
                  $tax_amt    += $res2->tax_amt;
                  $dis_amt    += $res2->discount_amt;
                  $total_cost += $res2->total_cost + $res2->tax_amt - $res2->discount_amt;
                ?>
              <?php } ?>
            </tbody>
            <tfoot class="text-right text-bold bg-gray">
              <tr>
                <td colspan="2" class="">Total</td>
                <td><?=$tot_qty;?></td>
                <td>-</td>
                <td><?= $CI->currency(number_format($unit_cost,2,'.','')) ;?></td>
                <td><?= $CI->currency(number_format($tax_amt,2,'.','')) ;?></td>
                <td><?= $CI->currency(number_format($dis_amt,2,'.','')) ;?></td>
                <td><?= $CI->currency(number_format($total_cost,2,'.','')) ;?></td>
              </tr>
            </tfoot>
          </table>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

      <div class="row">
       <div class="col-md-6">
           <div class="row">
              <div class="col-md-12">
                 <div class="form-group">
                    <table class="table table-hover table-bordered" style="width:100%" id=""><h4 class="box-title text-info"><?= $this->lang->line('payments_information'); ?> : </h4>
                       <thead>
                          <tr class="bg-purple " >
                             <th>#</th>
                             <th><?= $this->lang->line('date'); ?></th>
                             <th><?= $this->lang->line('payment_type'); ?></th>
                             <th><?= $this->lang->line('payment_note'); ?></th>
                             <th><?= $this->lang->line('payment'); ?></th>
                          </tr>
                       </thead>
                       <tbody>
                          <?php
                            if(isset($return_id)){
                              $q3 = $this->db->query("select * from db_salespaymentsreturn where return_id=$return_id");
                              if($q3->num_rows()>0){
                                $i=1;
                                $total_paid = 0;
                                foreach ($q3->result() as $res3) {
                                  echo "<tr class='text-center text-bold' id='payment_row_".$res3->id."'>";
                                  echo "<td>".$i++."</td>";
                                  echo "<td>".show_date($res3->payment_date)."</td>";
                                  echo "<td>".$res3->payment_type."</td>";
                                  echo "<td>".$res3->payment_note."</td>";
                                  echo "<td class='text-right'>".$res3->payment."</td>";
                                  echo "</tr>";
                                  $total_paid +=$res3->payment;
                                }
                                echo "<tr class='text-right text-bold'><td colspan='4' >Total</td><td>".number_format($total_paid,2,'.','')."</td></tr>";
                              }
                              else{
                                echo "<tr><td colspan='5' class='text-center text-bold'>No Previous Payments Found!!</td></tr>";
                              }

                            }else{
                              echo "<tr><td colspan='5' class='text-center text-bold'>Payments Pending!!</td></tr>";
                            }
                          ?>
                       </tbody>
                    </table>
                 </div>
              </div>
           </div>
        </div>

        <div class="col-md-6">
           <div class="row">
              <div class="col-md-12">
                 <div class="form-group">

                    <table  class="col-md-11">
                       <tr>
                          <th class="text-right" style="font-size: 17px;"><?= $this->lang->line('subtotal'); ?></th>
                          <th class="text-right" style="padding-left:10%;font-size: 17px;">
                             <h4><b id="subtotal_amt" name="subtotal_amt"><?=$unit_cost;?></b></h4>
                          </th>
                       </tr>
                       <tr>
                          <th class="text-right" style="font-size: 17px;"><?= $this->lang->line('discount_on_all'); ?></th>
                          <th class="text-right" style="padding-left:10%;font-size: 17px;">
                             <h4><b id="discount_to_all_amt" name="discount_to_all_amt"><?=$dis_amt;?></b></h4>
                          </th>
                       </tr>
                       <tr>
                          <th class="text-right" style="font-size: 17px;">Vat</th>
                          <th class="text-right" style="padding-left:10%;font-size: 17px;">
                             <h4><b id="round_off_amt" name="tot_round_off_amt"><?=$tax_amt;?></b></h4>
                          </th>
                       </tr>
                       <tr>
                          <th class="text-right" style="font-size: 17px;"><?= $this->lang->line('grand_total'); ?></th>
                          <th class="text-right" style="padding-left:10%;font-size: 17px;">
                             <h4><b id="total_amt" name="total_amt"><?=$total_cost;?></b></h4>
                          </th>
                       </tr>
                    </table>
                 </div>
              </div>
           </div>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </div><!-- printableArea -->
      <!-- this row will not appear when printing -->
      <div class="row no-print">
        <div class="col-xs-12">
          <!-- <?php if($CI->permissions('sales_edit')) { ?>
            <?php $str2= ($pos==1)? 'pos/edit/':'sales_return/edit/'; ?>
            <a href="<?php echo $base_url; ?><?=$str2;?><?php echo  $return_id ?>" class="btn btn-success">
              <i class="fa  fa-edit"></i> Edit
            </a>
          <?php } ?> -->


          <a href="<?php echo $base_url; ?>sales_return/print_invoice/<?php echo  $return_id ?>" target="_blank" class="btn btn-warning">
            <i class="fa fa-print"></i>
          Print
        </a>




        <a href="<?php echo $base_url; ?>sales_return/pdf/<?php echo  $return_id ?>" target="_blank" class="btn btn-primary">
            <i class="fa fa-file-pdf-o"></i>
          PDF
        </a>




        </div>
      </div>

    </section>
    <!-- /.content -->
    <div class="clearfix"></div>
  </div>
  <!-- /.content-wrapper -->
  <?php include"footer.php"; ?>


  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- SOUND CODE -->
<?php include"comman/code_js_sound.php"; ?>
<!-- TABLES CODE -->
<?php include"comman/code_js_form.php"; ?>

<!-- Make sidebar menu hughlighter/selector -->
<script>$(".sales-return-list-active-li").addClass("active");</script>
</body>
</html>
