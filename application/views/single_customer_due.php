<!DOCTYPE html>
<html lang="en">

<head>
  <title>Sale Due</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f2f2f2;
        color: #333;
        line-height: 1.6;
    }

    .container {
        max-width: 900px;
        margin: 0 auto;
        padding: 8px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .header {
        text-align: center;
        font-weight: bold;
        margin-bottom: 20px;
    }

    .header h5 {
        margin: 0;
        color: #007bff;
    }

    .info-row {
        display: flex;
        justify-content: space-between;
        margin-bottom: 10px;
    }

    .info-label {
        font-weight: bold;
        color: #555;
    }

    .info-value {
        flex: 1;
        margin-left: 10px;
    }

    .status-table {
        width: 100%;
        margin-top: 20px;
        border-collapse: collapse;
    }

    .status-table th,
    .status-table td {
        border: 1px solid #ddd;
        padding: 1px;
        text-align: center;
        font-weight: bold;
    }

    .status-table th {
        background-color: #f0f0f0;
        color: #007bff;
    }

    .pay-table {
        width: 100%;
        margin-top: 20px;
        border-collapse: collapse;
    }

    .pay-table th,
    .pay-table td {
        border: 1px solid #ddd;
        padding: 1px;
        text-align: center;
        font-weight: bold;
    }

    .pay-table th {
        background-color: #f0f0f0;
        color: #007bff;
    }

    .net-pay {
        font-weight: bold;
        text-align: right;
        margin-top: 20px;
        font-size: 18px;
        color: #007bff;
    }
    .btn {
        display: inline-block;
        padding: 4px 7px;
        margin-bottom: 0;
        font-size: 14px;
        font-weight: 400;
        line-height: 1.42857143;
        text-align: center;
        white-space: nowrap;
        vertical-align: middle;
        -ms-touch-action: manipulation;
        touch-action: manipulation;
        cursor: pointer;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
        background-image: none;
        border: 1px solid transparent;
        border-radius: 4px;
        padding-bottom: 1px !important;
    }
    .btn-success {
        background-color: #00a65a;
        border-color: #008d4c;
        color: #fff;
    }
    .btn-primary {
        background-color: #3c8dbc;
        border-color: #367fa9;
        color: #fff;
    }
    #hide-btn {
      display: inline-flex;
      gap: 5px;
    }
    @media print {
      #hide-btn {
        display:none;
      }
    }
  </style>
</head>
  <body>
    <div class="container">
      <div class="header">
        <span><?= $results[0]->customer_name ?></span> <br>
        Report : <?= date('d-m-Y', strtotime($from_date)) ?> To <?= date('d-m-Y', strtotime($to_date)) ?>
        <br><span id='hide-btn' >
          <button type="button" onclick="openPrintPopup()" class="btn btn-primary">Print</button>
          <?= form_open(base_url('reports/single_customer_due'), 'method="post"', ''); ?>
            <input type="hidden" name="from_date" value="<?php echo $from_date; ?>"></input>
            <input type="hidden" name="to_date" value="<?php echo $to_date; ?>"></input>
            <input type="hidden" name="customer_id" value="<?= $results[0]->customer_id ?>"></input>
            <input type="hidden" name="excel" value="1"></input>
            <button type="submit" class="btn btn-success" style="border: 0; cursor:pointer;">Excel</button>
          <?= form_close(); ?>
        </span>
      </div>
      <div class="status">
        <table class="status-table">
          <thead>
            <tr>
              <th>Sl.</th>
              <th>Date</th>
              <th>Sale Code</th>
              <th>Total Sale</th>
              <th>Sale Return</th>
              <th>Total Paid</th>
              <th>Total Due</th>
            </tr>
          </thead>
          <tbody>
            <?php $gtotal = $greturn = $gpaid = 0; ?>
            <?php foreach ($results as $k => $r) { ?>
              <?php
                $tt = $r->grand_total - ($r->return_amt  + $r->paid_amount);
                $gtotal = $r->grand_total + $gtotal;
                $greturn = $r->return_amt + $greturn;
                $gpaid = $r->paid_amount + $gpaid;
              ?>
              <tr>
                <td><?= $k + 1; ?></td>
                <td><?= date('d-m-Y', strtotime($r->created_date)); ?></td>
                <td><?= $r->sales_code; ?></td>
                <td><?= $r->grand_total; ?></td>
                <td><?= $r->return_amt; ?></td>
                <td><?= $r->paid_amount; ?></td>
                <td><?= $tt; ?></td>
              </tr>
            <?php } ?>
          </tbody>
          <tfoot style="background: #f0f0f0">
            <td colspan="3"> Total : </td>
            <td><?= $gtotal; ?></td>
            <td><?= $greturn; ?></td>
            <td><?= $gpaid; ?></td>
            <td><?= $gtotal - ($greturn + $gpaid); ?></td>
          </tfoot>
        </table>
      </div>
    </div>
  </body>
</html>
  <script>
    function openPrintPopup() {
      window.print();
    }
  </script>
<?php exit(); ?>
