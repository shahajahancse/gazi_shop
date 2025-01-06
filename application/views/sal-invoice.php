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
        <li><a href="<?php echo $base_url; ?>sales"><?= $this->lang->line('sales_list'); ?></a></li>
        <li><a href="<?php echo $base_url; ?>sales/add"><?= $this->lang->line('new_sales'); ?></a></li>
        <li class="active"><?= $this->lang->line('invoice'); ?></li>
      </ol>
    </section>
    <div class="row">
      <div class="col-md-12">
        <!-- ********** ALERT MESSAGE START******* -->
        <?php include"comman/code_flashdata.php"; ?>
        <!-- ********** ALERT MESSAGE END******* -->
      </div>
    </div>
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
    ?>
    <?php
      $this->db->select("a.customer_name,a.mobile,a.phone,a.gstin,a.tax_number,a.email,a.opening_balance,
                a.country_id,a.state_id,a.city,a.postcode,a.address,s.sales_date, s.created_time,s.reference_no,
                s.sales_code,s.sales_status,s.sales_note,s.pos,s.discount_to_all_type,
                COALESCE(s.subtotal,0) as subtotal,
                COALESCE(s.round_off,0) as round_off,
                COALESCE(s.grand_total,0) as grand_total,
                COALESCE(SUM(sr.grand_total),0) as return_total_amt,
                COALESCE(SUM(sp.payment),0) as paid_amount,
      ");
      $this->db->from('db_sales s');
      $this->db->join('db_customers a', 'a.id = s.customer_id','left');
      $this->db->join('db_salespayments as sp', 'sp.sales_id = s.id','left');
      $this->db->join('db_salesreturn as sr', 'sr.sales_id = s.id','left');
      $this->db->where('s.id', $sales_id);
      $this->db->group_by('s.id');
      $res3 = $this->db->get()->row();

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
      $sales_date=$res3->sales_date;
      $created_time=$res3->created_time;
      $reference_no=$res3->reference_no;
      $sales_code=$res3->sales_code;
      $sales_status=$res3->sales_status;
      $sales_note=$res3->sales_note;
    ?>
    <?php
      $subtotal = $res3->subtotal;
      $grand_total = $res3->grand_total;
      $return_total_amt = $res3->return_total_amt;
      $paid_amount = $res3->paid_amount;

      if (!empty($customer_country)) {
        $q = $this->db->query("select country from db_country where id = ?", array($customer_country));
        if ($q->num_rows() > 0) {
          $row = $q->row();
          $customer_country = $row->country;
        }
      }
      if (!empty($customer_state)) {
        $q = $this->db->query("select state from db_states where id = ?", array($customer_state));
        if ($q->num_rows() > 0) {
          $row = $q->row();
          $customer_state = $row->state;
        }
      }
    ?>


    <!-- Main content -->
    <section class="invoice">
      <!-- title row -->
      <div class="printableArea">
        <div class="row">
          <div class="col-xs-12">
            <h2 class="page-header">
              <i class="fa fa-globe"></i> <?= $this->lang->line('sales_invoice'); ?>
              <small class="pull-right">Date: <?php echo  show_date($sales_date)." ".$created_time; ?></small>
            </h2>
          </div>
          <!-- /.col -->
        </div>
        <!-- company info row -->
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
            <b><?= $this->lang->line('invoice'); ?> : #<?php echo  $sales_code; ?></b><br>
            <b><?= $this->lang->line('sales_status'); ?> : <?php echo  $sales_status; ?></b><br>
            <b><?= $this->lang->line('reference_no'); ?> : <?php echo  $reference_no; ?></b><br>
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->

        <!-- item Table row -->
        <div class="row">
          <div class="col-xs-12 table-responsive">
            <table class="table table-striped">
              <thead style="border: 1px solid black;">
                <tr>
                  <th style="border:1px solid black;vertical-align: middle;text-align:center;background:#0686cf1c" rowspan="2">#</th>
                  <th style="border:1px solid black;vertical-align: middle;text-align:left;background:#0686cf1c" rowspan="2">Product Name</th>
                  <th style="border: 1px solid black;text-align: center;" colspan="2">Load</th>
                  <th style="border: 1px solid black;text-align: center;background:#e8fffd" colspan="2">Return</th>
                  <th style="border: 1px solid black;text-align: center;">Damage</th>
                  <th style="border: 1px solid black;text-align: center;background-color: #0686cf1c">Delivery</th>
                  <th style="border: 1px solid black;text-align: center;background-color: #0686cf1c">Sales</th>
                  <th style="border: 1px solid black;text-align: center;">Damage</th>
                </tr>
                <tr>
                  <th style="border: 1px solid black;text-align: center;">Poly</th>
                  <th style="border: 1px solid black;text-align: center;">Pcs</th>
                  <th style="border: 1px solid black;text-align: center;background:#e8fffd">Poly</th>
                  <th style="border: 1px solid black;text-align: center;background:#e8fffd">Pcs</th>
                  <th style="border: 1px solid black;text-align: center;">Pcs</th>
                  <th style="border: 1px solid black;text-align: center;background-color: #0686cf1c">Pcs</th>
                  <th style="border: 1px solid black;text-align: center;background-color: #0686cf1c">TK</th>
                  <th style="border: 1px solid black;text-align: center;">TK.</th>
                </tr>
              </thead>
              <tbody>

                <?php
                  @$sales_id = end(explode('/', $_SERVER['REQUEST_URI']));
                  $this->db->select('
                      db_items.item_name,
                      db_salesitems.sales_box,
                      db_salesitems.price_per_unit,
                      db_salesitems.sales_pieces,
                      db_salesitems.sales_qty,
                      db_salesitems.unit_total_cost,
                      db_salesitems.total_cost as sales_total_cost,
                      sr.return_box,
                      sr.return_pieces,
                      sr.return_qty,
                      sr.damage,
                      sr.total_cost as return_total_cost,
                  ');
                  $this->db->from('db_salesitems');
                  $this->db->join('db_items','db_items.id = db_salesitems.item_id','left');
                  $this->db->join('db_salesitemsreturn as sr','db_items.id = sr.item_id','left');
                  $this->db->where('db_salesitems.sales_id', $sales_id);
                  $this->db->group_by('db_salesitems.item_id');
                  $query = $this->db->get()->result();
                  $damage_amt = 0;
                ?>
                <?php foreach($query as $row){ ?>
                <?php
                  $dam = (isset($row->damage) ? $row->unit_total_cost*$row->damage : 0);
                  $damage_amt = $damage_amt + $dam;
                ?>
                <tr style="text-align: center;">
                  <td style="border: 1px solid black;background:#0686cf1c"><?= @$i+=1; ?></td>
                  <td style="border: 1px solid black;text-align: left;background:#0686cf1c" ><?= $row->item_name; ?></td>
                  <td style="border: 1px solid black;"><?= (isset($row->sales_box) && $row->sales_box != 0) ? $row->sales_box : ' '; ?></td>
                  <td style="border: 1px solid black;"><?= (isset($row->sales_qty) && $row->sales_qty != 0) ? $row->sales_qty : ' '; ?></td>
                  <td style="border: 1px solid black;background-color:#e8fffd"><?= (isset($row->return_box) && $row->return_box != 0) ? $row->return_box : ' '; ?></td>
                  <td style="border: 1px solid black;background-color:#e8fffd"><?= (isset($row->return_pieces) && $row->return_pieces != 0) ? $row->return_pieces : ' '; ?></td>
                  <td style="border: 1px solid black;background-color:white"><?= (isset($row->damage) && $row->damage != 0) ? $row->damage : ' '; ?></td>
                  <td style="border: 1px solid black;background-color:#0686cf1c"><?= (isset($row->return_qty) ? $row->return_qty : 0); ?></td>
                  <td style="border: 1px solid black;background-color:#0686cf1c"><?= (isset($row->sales_total_cost) ? $row->sales_total_cost : 0); ?></td>
                  <td style="border: 1px solid black;"><?= $dam; ?></td>
                </tr>
                <?php } ?>
                <tfoot>
                  <tr>
                    <td colspan="2" style="text-align: center;border: 1px solid black; background:#0686cf1c"><b>Total Amount</b></td>
                    <td colspan="2" style="border: 1px solid black;"></td>
                    <td colspan="2" style="border: 1px solid black; background:#e8fffd"><b></b></td>
                    <td colspan="2" style="text-align: center;border: 1px solid black;"><b>Total Sale</b></td>
                    <td colspan="1" style="text-align: center;border: 1px solid black; background-color: #0686cf1c"><b><?php echo $grand_total; ?></b></td>
                    <td colspan="1" style="text-align: center;border: 1px solid black;"><?= $damage_amt ?></td>
                  </tr>

                  <tr>
                    <td colspan="2" style="text-align: center;border: none;"><b></b></td>
                    <td colspan="5" style="text-align: center;border: none;"><b></b></td>
                    <td colspan="1" style="text-align: center;border: 1px solid black;background-color: #0686cf1c"><b>Cash paid</b></td>
                    <td colspan="1" style="text-align: center;border: 1px solid black;background-color: #0686cf1c"><b><?= $paid_amount ?></b></td>
                    <td colspan="1" style="text-align: center;border: 1px solid black;"></td>
                  </tr>

                  <tr>
                    <td colspan="2" style="text-align: center;border: none;"><b></b></td>
                    <td colspan="5" style="text-align: center;border: none;"><b></b></td>
                    <td colspan="1" style="text-align: center;border: 1px solid black;background-color: #0686cf1c"><b>Return</b></td>
                    <td colspan="1" style="text-align: center;border: 1px solid black;background-color: #0686cf1c"><b><?= $return_total_amt ?></b></td>
                    <td colspan="1" style="text-align: center;border: 1px solid black;"></td>
                  </tr>

                  <?php $due = number_format($grand_total - ($return_total_amt + $paid_amount), 2, '.', ''); ?>

                  <tr>
                    <td colspan="2" style="text-align: center;border: 0px solid;"><b></b></td>
                    <td colspan="5" style="text-align: center;border: none;"><b></b></td>
                    <td colspan="1" style="text-align: center;border: 1px solid black;background-color: #0686cf1c"><b>Total Due</b></td>
                    <td colspan="1" style="text-align: center;border: 1px solid black;background-color: #0686cf1c"><b><?= $due < 0 ? 0 : $due; ?></b></td>
                    <td colspan="1" style="text-align: center;border: 1px solid black;"></td>
                  </tr>
                </tfoot>
              </tbody>
            </table>
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- printableArea -->


      <!-- this row will not appear when printing -->
      <div class="row no-print">
        <div class="col-xs-12">
          <a href="<?php echo $base_url; ?>sales/print_invoice/<?php echo  $sales_id ?>" target="_blank" class="btn btn-warning"> <i class="fa fa-print"></i> Print </a>

        <a href="<?php echo $base_url; ?>sales/pdf/<?php echo  $sales_id ?>" target="_blank" class="btn btn-primary">
            <i class="fa fa-file-pdf-o"></i>
          PDF
        </a>

        <?php if($CI->permissions('sales_return_add')) { ?>
            <a href="<?php echo $base_url; ?>sales_return/add/<?php echo  $sales_id ?>" class="btn btn-danger">
            <i class="fa  fa-undo"></i> Return
          </a>
          <?php } ?>



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
<script>$(".sales-list-active-li").addClass("active");</script>
</body>
</html>
