<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reports extends MY_Controller {
	public function __construct(){
		parent::__construct();
		$this->load_global();
		$this->load->model('reports_model','reports');
	}

	// sales due reports
	public function sales_due(){
		$this->permission_check('sales_report');
		$data=$this->data;
		$data['page_title'] = 'Sales Due Report';
		$this->load->view('sales_due', $data);
	}
	public function show_sales_due(){
		echo $this->reports->show_sales_due();
	}
	public function single_customer_due(){
		$from_date = date("Y-m-d",strtotime($_POST['from_date']));
		$to_date = date("Y-m-d",strtotime($_POST['to_date']));
		$customer_id = $this->input->post('customer_id');
		$excel = $this->input->post('excel');

		$this->db->select("
			s.sales_code, s.customer_id, c.customer_name, c.mobile,c.phone,c.email,
			COALESCE(SUM(s.subtotal),0) as subtotal,
			COALESCE(SUM(s.grand_total),0) as grand_total,
			COALESCE(SUM(sr.grand_total),0) as return_amt,
			COALESCE(SUM(sp.payment)) as paid_amount,
			s.created_date,
		");
		$this->db->from('db_sales s');
		$this->db->join('db_customers c', 's.customer_id = c.id','left');
		$this->db->join('db_salesreturn sr', 's.customer_id = sr.customer_id AND s.id = sr.sales_id','left');
		$this->db->join('db_salespayments sp', 's.id = sp.sales_id','left');

		if (!empty($customer_id)) {
		  $this->db->where('s.customer_id', $customer_id);
	  	}
		if (!empty($from_date) && !empty($to_date)) {
			$this->db->where('s.sales_date >=', $from_date);
			$this->db->where('s.sales_date <=', $to_date);
		}
		$this->db->group_by('s.id');
		$sql = $this->db->get()->result();
		$data['results'] = $sql;
		$data['from_date'] = $from_date;
		$data['to_date'] = $to_date;
		if ($excel == 1) {
			// dd($data['results']);
			$this->load->view('single_customer_due_excel', $data);
		} else {
			$this->load->view('single_customer_due', $data);
		}
		exit;
	}
	// sales due reports

	// sales damage report
	function damage_report() {
		$this->permission_check('sales_report');
		$data=$this->data;
		$data['page_title'] = 'Sales Damage Report';
		$this->load->view('damage_report', $data);
	}
	public function damage_ajax_list(){
		echo $this->reports->damage_ajax_list();
	}


	// old code
	//Sales Report
	public function sales(){
		$this->permission_check('sales_report');
		$data=$this->data;
		$data['page_title']=$this->lang->line('sales_report');
		$this->load->view('report-sales', $data);
	}
	public function show_sales_report(){
		echo $this->reports->show_sales_report();
	}

	//Sales Return Report
	public function sales_return(){
		$this->permission_check('sales_return_report');
		$data=$this->data;
		$data['page_title']=$this->lang->line('sales_return_report');
		$this->load->view('report-sales-return', $data);
	}
	public function show_sales_return_report(){
		echo $this->reports->show_sales_return_report();
	}

	//Purchase report
	public function purchase(){
		$this->permission_check('purchase_report');
		$data=$this->data;
		$data['page_title']=$this->lang->line('purchase_report');
		$this->load->view('report-purchase', $data);
	}
	public function show_purchase_report(){
		echo $this->reports->show_purchase_report();
	}

	//Purchase Return report
	public function purchase_return(){
		$this->permission_check('purchase_return_report');
		$data=$this->data;
		$data['page_title']=$this->lang->line('purchase_return_report');
		$this->load->view('report-purchase-return', $data);
	}
	public function show_purchase_return_report(){
		echo $this->reports->show_purchase_return_report();
	}

	//Expense report
	public function expense(){
		$this->permission_check('expense_report');
		$data=$this->data;
		$data['page_title']=$this->lang->line('expense_report');
		$this->load->view('report-expense', $data);
	}
	public function show_expense_report(){
		echo $this->reports->show_expense_report();
	}
	//Profit report
	public function profit_loss(){
		$this->permission_check('profit_report');
		$data=$this->data;
		$data['page_title']=$this->lang->line('profit_and_loss_report');
		$this->load->view('report-profit-loss', $data);
	}
	public function get_profit_by_item(){
		echo $this->reports->get_profit_by_item();
	}
	public function get_profit_by_invoice(){
		echo $this->reports->get_profit_by_invoice();
	}

	//Summary report
	public function stock(){
		$this->permission_check('stock_report');
		$data=$this->data;
		$data['page_title']=$this->lang->line('stock_report');
		$this->load->view('report-stock', $data);
	}
	/*Stock Report*/
	public function show_stock_report(){
		echo $this->reports->show_stock_report();
	}
	public function brand_wise_stock(){
		echo $this->reports->brand_wise_stock();
	}
	//Item Sales Report
	public function item_sales(){
		$this->permission_check('item_sales_report');
		$data=$this->data;
		$data['page_title']=$this->lang->line('item_sales_report');
		$this->load->view('report-sales-item', $data);
	}
	public function show_item_sales_report(){
		echo $this->reports->show_item_sales_report();
	}

	//Purchase Payments report
	public function purchase_payments(){
		$this->permission_check('purchase_payments_report');
		$data=$this->data;
		$data['page_title']=$this->lang->line('purchase_payments_report');
		$this->load->view('report-purchase-payments', $data);
	}
	public function show_purchase_payments_report(){
		echo $this->reports->show_purchase_payments_report();
	}

	//Sales Payments report
	public function sales_payments(){
		$this->permission_check('sales_payments_report');
		$data=$this->data;
		$data['page_title']=$this->lang->line('sales_payments_report');
		$this->load->view('report-sales-payments', $data);
	}
	public function show_sales_payments_report(){
		echo $this->reports->show_sales_payments_report();
	}
	//Expired Items Report
	public function expired_items(){
		$this->permission_check('expired_items_report');
		$data=$this->data;
		$data['page_title']=$this->lang->line('expired_items_report');
		$this->load->view('report-expired-items', $data);
	}
	public function show_expired_items_report(){
		echo $this->reports->show_expired_items_report();
	}


}

