<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

	public function __construct(){

			parent::__construct();
			// $this->load->library('security');
			$this->load->library('filter');
			$this->login();
	}

	function login(){
		if($this->session->userdata('email') != ''){
			redirect(base_url('main/tambah'));
		}
	}

	public function index()
	{
		$this->load->view('v_login');
	}

	function tambah(){
		$data['kelurahan'] = $this->db->get("tblkelurahan")->result();
		$data['bencana'] = $this->db->get_where("tblbencana", array("flag" => '0'))->result();
		$this->load->view("v_laporan", $data);
	}

	function icon(){
		$this->load->view("icon");
	}

	function proses_masuk(){
		// die(print_r($this->input->post()));
		$filter = new filter();

		$email						= $filter->clean($this->input->post("email"));
		$password					= $filter->clean($this->input->post("password"));

		$encyt_pass = md5($password);
		// die($password.'___'.$encyt_pass.'__'.$email);
		$valid = $this->db->get_where('tbluser', array('email'=>$email,'password'=>$encyt_pass))->row();
		// die(print_r($valid));
		if( $valid != array()){
				$data = array(
						'group'=>$valid->idtblgroup,
						'name'=>$valid->nama,
						'email'=>$valid->email,
						'idtbluser'=>$valid->idtbluser
				);
				$this->session->set_userdata($data);
				redirect(base_url('tr_approval'));
		}else{
				$this->session->set_flashdata('error', 'npk/password is not correct');
				redirect(base_url('login'));
		}
	}

}
