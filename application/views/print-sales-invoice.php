<?php include"comman/code_css_form.php"; ?>
<body class="hold-transition skin-blue" onload="window.print();">
<?php
  $CI =& get_instance();
  $q1=$this->db->query("select * from db_company where id=1 and status=1");
  $res1=$q1->row();
  $company_name    = $res1->company_name;
  $company_mobile  = $res1->mobile;
  $company_phone   = $res1->phone;
  $company_email   = $res1->email;
  $company_country = $res1->country;
  $company_state   = $res1->state;
  $company_city    = $res1->city;
  $company_address = $res1->address;
  $company_gst_no  = $res1->gst_no;
  $company_vat_no  = $res1->vat_no;
  $company_pan_no  = $res1->pan_no;
  $q3=$this->db->query(
    "SELECT a.customer_name,a.mobile,a.phone,a.gstin,a.tax_number,a.email,
    a.opening_balance,a.country_id,a.state_id,a.city,
    a.postcode,a.address,b.sales_date,b.created_time,b.reference_no,
    b.sales_code,b.sales_status,b.sales_note,
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
    db_sales b
    WHERE
    a.`id`=b.`customer_id` AND
    b.`id`='$sales_id'"
  );
  $res3=$q3->row();
  $customer_name            = $res3->customer_name;
  $customer_mobile          = $res3->mobile;
  $customer_phone           = $res3->phone;
  $customer_email           = $res3->email;
  $customer_country         = $res3->country_id;
  $customer_state           = $res3->state_id;
  $customer_city            = $res3->city;
  $customer_address         = $res3->address;
  $customer_postcode        = $res3->postcode;
  $customer_gst_no          = $res3->gstin;
  $customer_tax_number      = $res3->tax_number;
  $customer_opening_balance = $res3->opening_balance;
  $sales_date               = $res3->sales_date;
  $created_time             = $res3->created_time;
  $reference_no             = $res3->reference_no;
  $sales_code               = $res3->sales_code;
  $sales_status             = $res3->sales_status;
  $sales_note               = $res3->sales_note;
  $subtotal                 = $res3->subtotal;
  $grand_total              = $res3->grand_total;
  $other_charges_input      = $res3->other_charges_input;
  $other_charges_tax_id     = $res3->other_charges_tax_id;
  $other_charges_amt        = $res3->other_charges_amt;
  $paid_amount              = $res3->paid_amount;
  $discount_to_all_input    = $res3->discount_to_all_input;
  $discount_to_all_type     = $res3->discount_to_all_type;
  $discount_to_all_type     = ($discount_to_all_type=='in_percentage') ? '%' : 'Fixed';
  $tot_discount_to_all_amt  = $res3->tot_discount_to_all_amt;
  $round_off                = $res3->round_off;
  $payment_status           = $res3->payment_status;
  $pos                      = $res3->pos;
  $total_damage_cost = 0;

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
<section class="invoice" style="margin: 0px;border: 0px solid #f4f4f4">
  <div class="printableArea">
    <div class="row">
      <div class="col-xs-12">
        <h2 class="page-header">
          <i class="fa fa-globe"></i> <?= $this->lang->line('sales_invoice'); ?>
          <small class="pull-right">Date: <?php echo  show_date($sales_date)." ".$created_time; ?></small>
        </h2>
      </div>
    </div>
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
      <div class="col-sm-4 invoice-col">
        <b><?= $this->lang->line('invoice'); ?>  : #<?php echo  $sales_code; ?></b><br>
        <b><?= $this->lang->line('sales_status'); ?> : <?php echo  $sales_status; ?></b><br>
        <b><?= $this->lang->line('reference_no'); ?> : <?php echo  $reference_no; ?></b><br>
      </div>
    </div>
    <div class="row">
      <div class="col-xs-12 table-responsive">
       <table class="table table-striped" style="width: 80%;">
            <thead style="border: 1px solid black;background-color: #b3cffc">
            <tr>
              <th style="border: 1px solid black;vertical-align: middle;text-align: center;" rowspan="2">#</th>
              <th style="border: 1px solid black;vertical-align: middle;text-align: left;" rowspan="2">Product Name</th>
              <th style="border: 1px solid black;text-align: center;" colspan="2">Load</th>
              <th style="border: 1px solid black;text-align: center;" colspan="2">Return</th>
              <th style="border: 1px solid black;text-align: center;">Damage</th>
              <th style="border: 1px solid black;text-align: center;">Delivery</th>
              <th style="border: 1px solid black;text-align: center;">Sales</th>
              <th style="border: 1px solid black;text-align: center;">Damage</th>
            </tr>
            <tr>
              <th style="border: 1px solid black;text-align: center;">Poly</th>
              <th style="border: 1px solid black;text-align: center;">Pcs</th>
              <th style="border: 1px solid black;text-align: center;">Poly</th>
              <th style="border: 1px solid black;text-align: center;">Pcs</th>
              <th style="border: 1px solid black;text-align: center;">Pcs</th>
              <th style="border: 1px solid black;text-align: center;">Pcs</th>
              <th style="border: 1px solid black;text-align: center;">TK</th>
              <th style="border: 1px solid black;text-align: center;">TK.</th>
            </tr>
            </thead>
            <tbody>
              <?php 
                @$sales_id = end(explode('/', $_SERVER['REQUEST_URI']));
                $this->db->select('db_items.item_name,db_salesitems.sales_box,db_salesitems.price_per_unit,db_salesitems.sales_pieces,db_salesitems.sales_qty,db_salesitems.unit_total_cost,db_salesitems.total_cost,db_items.item_name as return_item_name,db_salesitemsreturn.return_box,db_salesitemsreturn.return_pieces,db_salesitemsreturn.return_qty,db_salesitemsreturn.damage,db_salesitemsreturn.total_cost as return_total_cost,db_salesitemsreturn.unit_total_cost as return_unit_total_cost , db_salespayments.payment');
                $this->db->from('db_sales');
                $this->db->join('db_salesitems','db_salesitems.sales_id = db_sales.id');
                $this->db->join('db_items','db_items.id = db_salesitems.item_id');
                $this->db->join('db_salesreturn','db_salesreturn.sales_id = db_salesitems.sales_id','left');
                $this->db->join('db_salesitemsreturn','db_items.id = db_salesitemsreturn.item_id','left');
                $this->db->join('db_salespayments','db_sales.id = db_salespayments.sales_id','left');
                $this->db->where('db_sales.id', $sales_id);
                $query = $this->db->get()->result();
                // dd($query);
              ?>
              <?php foreach($query as $row){?>
              <tr style="text-align: center;">
              <td style="border: 1px solid black;"><?= @$i+=1; ?></td>
                <td style="border: 1px solid black;text-align: left;background-color: #ffa50073;" ><?= $row->item_name; ?></td>
                <td style="border: 1px solid black;background-color:#0000001a"><?= (isset($row->sales_box) && $row->sales_box != 0) ? $row->sales_box : ' '; ?></td>
                <td style="border: 1px solid black;background-color: #0000001a"><?= (isset($row->sales_qty) && $row->sales_qty != 0) ? $row->sales_qty : ' '; ?></td>
                <td style="border: 1px solid black;background-color:white"><?= (isset($row->return_box) && $row->return_box != 0) ? $row->return_box : ' '; ?></td>
                <td style="border: 1px solid black;background-color:white"><?= (isset($row->return_pieces) && $row->return_pieces != 0) ? $row->return_pieces : ' '; ?></td>
                <td style="border: 1px solid black;background-color:white"><?= (isset($row->damage) && $row->damage != 0) ? $row->damage : ' '; ?></td>
                <td style="border: 1px solid black;background-color:#0686cf1c"><?= (isset($row->return_qty) ? $row->return_qty : 0); ?></td>
                <td style="border: 1px solid black;background-color:#0686cf1c"><?= (isset($row->return_total_cost) ? round($row->return_total_cost,2) : 0); ?></td>
                <td style="border: 1px solid black;background-color:#0686cf1c"><?= (isset($row->return_unit_total_cost) && isset($row->damage) ? round($row->return_unit_total_cost*$row->damage,2) : 0); ?></td>
              </tr>
              <?php 
              $total_damage_cost += (isset($row->return_unit_total_cost) && isset($row->damage) ? round($row->return_unit_total_cost*$row->damage,2) : 0);            
            
            }?>
              <tfoot >
                <tr >
                  <td colspan="2" style="text-align: center;border: 1px solid black;background-color: #b3cffc"><b>Total Amount</b></td>
                  <td colspan="5" style="text-align: center;border: 1px solid black;background-color: #b3cffc"><b></b></td>
                  <td colspan="1" style="text-align: center;border: 1px solid black;background-color: #b3cffc"><b>Total Sale</b></td>
                  <td colspan="1" style="text-align: center;border: 1px solid black;background-color: #b3cffc"><b><?php echo  round($subtotal,2); ?></b></td>
                  <td colspan="1" style="text-align: center;border: 1px solid black;background-color: #0686cf1c"><b><?php echo $total_damage_cost?></td>
                </tr>
                <tr >
                  <td colspan="2" style="text-align: center;border: none;"><b></b></td>
                  <td colspan="5" style="text-align: center;border: none;"><b></b></td>
                  <td colspan="1" style="text-align: center;border: 1px solid black;background-color: #b3cffc"><b>Cash paid</b></td>
                  <td colspan="1" style="text-align: center;border: 1px solid black;background-color: #b3cffc"><b><?php echo  round($row->payment,2); ?></b></td>
                  <td colspan="1" style="text-align: center;border: 1px solid black;background-color: #0686cf1c"><b>0</b></td>
                </tr>
                <tr >
                  <td colspan="2" style="text-align: center;border: 0px solid;"><b></b></td>
                  <td colspan="5" style="text-align: center;border: none;"><b></b></td>
                  <td colspan="1" style="text-align: center;border: 1px solid black;background-color: #b3cffc"><b>Total Due</b></td>
                  <td colspan="1" style="text-align: center;border: 1px solid black;background-color: #b3cffc"><b><?php echo  round($subtotal-$row->payment,2); ?></b></td>
                  <td colspan="1" style="text-align: center;border: 1px solid black;background-color: #0686cf1c"></td>
                </tr>
              </tfoot>
            </tbody>
          </table>
      </div>
    </div>
  </div>
</section>