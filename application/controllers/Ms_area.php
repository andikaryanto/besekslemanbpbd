<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ms_area extends MY_Controller {
    public function __construct(){
        parent::__construct();
        // $this->login();
        $this->load->model('ms_model', '_ms');
    }

    public function index()
    {
      // $data['arah'] = 'tblkecamatan';
      $data['table'] = 'tblkecamatan';
      $data['arah'] = '';
        $this->load->view('v_ms_area', $data);
    }

    function tambah($table, $id = ''){
      $data['table'] = $table;
      $data['id'] = $id;
      $data['krb'] = $this->db->get_where("tblkrb", array("flag" => '0'))->result();
      $this->load->view("v_ms_area_a", $data);
    }

    function proses_tambah(){
      //die(print_r($this->input->post()));

      $table = $this->input->post("table");
      $nama = $this->input->post("nama");
      $nama_pejabat = $this->input->post("nama_pejabat");
      $alamat = $this->input->post("alamat");
      $notelp = $this->input->post("notelp");
      $idtblkrb = $this->input->post("krb");
      $radius_merapi = $this->input->post("radius_merapi");

      if ($table == 'tblkecamatan') {
        $id = $this->last_id();
        $data = array( "nama" => $nama, "id_kec" => "3404".$id, "id_kab" => "3404", "nama_pejabat" => $nama_pejabat, "alamat" => $alamat, "notelp" => $notelp);
      }elseif ($table == 'tblkelurahan') {
        $id_kec = $this->input->post("id");
        $id = $this->db->get_where("tblkecamatan", array("md5(id_kec)" => $id_kec))->row('id_kec');
        // die($id.'__'.$id_kec);
        $data = array("nama" => $nama, "nama_pejabat" => $nama_pejabat, "alamat" => $alamat, "notelp" => $notelp, "id_kec" => $id);
      }elseif($table == 'tbldusun'){ 
      	$id_kel = $this->input->post("id");
        $id = $this->db->get_where("tblkelurahan", array("md5(id_kel)" => $id_kel ))->row('id_kel');
        
      	$data = array("nama" => $nama, "idtblkrb" => $idtblkrb, "radius_merapi" => $radius_merapi, "nama_pejabat" => $nama_pejabat, "alamat" => $alamat, "notelp" => $notelp, "id_kel" => $id);
      }
      $this->db->insert($table, $data);
      $this->session->set_flashdata('insert', "Data $nama Sukses Di Masukan");

      if ($table == 'tblkecamatan') {
        redirect(base_url("ms_area"));
      }elseif ($table == 'tblkelurahan') {
        redirect(base_url("ms_area/kelurahan/$id_kec"));
      }elseif ($table == 'tbldusun') {
        redirect(base_url("ms_area/dusun/$id_kel"));
      }
    }

    function last_id(){
      $sql = "SELECT (SUBSTR(id_kec,5,2) + 1) AS id FROM tblkecamatan ORDER BY id_kec DESC";
      return $this->db->query($sql)->row("id");
    }
    function edit($table, $id_md5){
      if ($table == 'tblkecamatan') {
        $id = 'id_kec';
      }elseif ($table == 'tblkelurahan') {
        $id = 'id_kel';
      }elseif ($table == 'tbldusun') {
        $id = 'idtbldusun';
        $data['krb'] = $this->db->get_where("tblkrb", array("flag" => '0'))->result();
      }
      $data['data'] = $this->db->get_where($table, array("md5($id)" => $id_md5) )->row();
      $data['table'] = $table;
      // die(print_r($data));
      $this->load->view("v_ms_area_e", $data);

    }

    function get_area($table, $id = ''){
      $search = $this->input->post("search")['value'];
      $datax = $this->_ms->get_data($search, $table, $id)->result();
	  $data = array();

      foreach ($datax as $rows){
        $row = array();
        $row[] = $rows->nama;
        if ($table == 'tblkecamatan') {
          $row[] = $rows->nama_pejabat;
          $row[] = $rows->alamat;
          $row[] = $rows->notelp;
          $row[] = '<div style="margin-left: 20px;" class="btn-group"> <a href="'.base_url().'ms_area/kelurahan/'.md5($rows->id_kec).'" class="light-green darken-4 btn-small btn "><i class="mdi-action-trending-up right"></i>&nbsp; Data Kelurahan '.$rows->nama.'</a>';
          $row[] = '<div style="margin-left: 20px;" class="btn-group"> <a href="'.base_url().'ms_area/edit/tblkecamatan/'.md5($rows->id_kec).'" class="blue btn-small btn "><i class="mdi-editor-border-color right"></i>&nbsp; Ubah</a> <a href="'.base_url().'ms_area/delete/'.md5($rows->id_kec).'/tblkecamatan" data-nama="'.$rows->nama.'" class="btn-small btn link_delete"><i class="right mdi-navigation-cancel"></i>Hapus</a> </div>';
        }elseif ($table == 'tblkelurahan'){
          $row[] = $rows->nama_pejabat;
          $row[] = $rows->alamat;
          $row[] = $rows->notelp;
	       	$row[] = '<div style="margin-left: 20px;" class="btn-group"> <a href="'.base_url().'ms_area/dusun/'.md5($rows->id_kel).'" class="light-green darken-4 btn-small btn "><i class="mdi-action-trending-up right"></i>&nbsp; Data Dusun '.$rows->nama.'</a>';
          $row[] = '<div style="margin-left: 20px;" class="btn-group"> <a href="'.base_url().'ms_area/edit/tblkelurahan/'.md5($rows->id_kel).'" class="blue btn-small btn "><i class="mdi-editor-border-color right"></i>&nbsp; Ubah</a> <a href="'.base_url().'ms_area/delete/'.md5($rows->id_kel).'/tblkelurahan" data-nama="'.$rows->nama.'" class="btn-small btn link_delete"><i class="right mdi-navigation-cancel"></i>Hapus</a> </div>';
        }elseif ($table == 'tbldusun'){
        	$row[] = $rows->nama_krb;
        	$row[] = $rows->radius_merapi.' Km';
          $row[] = $rows->nama_pejabat;
          $row[] = $rows->alamat;
          $row[] = $rows->notelp;
        	$row[] = '<div style="margin-left: 20px;" class="btn-group"> <a href="'.base_url().'ms_area/edit/tbldusun/'.md5($rows->idtbldusun).'" class="blue btn-small btn "><i class="mdi-editor-border-color right"></i>&nbsp; Ubah</a> <a href="'.base_url().'ms_area/delete/'.md5($rows->idtbldusun).'/tbldusun" data-nama="'.$rows->nama.'" class="btn-small btn link_delete"><i class="right mdi-navigation-cancel"></i>Hapus</a> </div>';
        }
        $data[] = $row;
	}

      $output = array(
        "data" => $data
      );

      echo json_encode($output);

    }

    function proses_edit(){
      //die(print_r($this->input->post()));
      $nama = $this->input->post("nama");
      $nama_pejabat = $this->input->post("nama_pejabat");
      $alamat = $this->input->post("alamat");
      $notelp = $this->input->post("notelp");
      $table = $this->input->post("table");
      $id = $this->input->post("id");

      $data = array("nama" => $nama, "nama_pejabat" => $nama_pejabat, "alamat" => $alamat, "notelp" =>$notelp);
      if ($table == 'tblkecamatan') {
        $this->db->where("id_kec", $id);
      }elseif ($table == 'tblkelurahan'){
        $this->db->where("id_kel", $id);
      }elseif ($table == 'tbldusun'){

	    $idtblkrb = $this->input->post("krb");
	    $radius_merapi = $this->input->post("radius_merapi");
      	$data["idtblkrb"] = $idtblkrb;
      	$data["radius_merapi"] = $radius_merapi;
      	// die(print_r($data));
        $this->db->where("idtbldusun", $id);
      }
      $this->db->update($table, $data);

      $this->session->set_flashdata('update', "Data $nama Sukses Di Perbarui");
      if ($table == 'tblkecamatan') {
        redirect(base_url("ms_area"));
      }elseif ($table == 'tblkelurahan') {
        $id_kec = md5($this->db->get_where("tblkelurahan", array("id_kel" => $id))->row("id_kec"));
        redirect(base_url("ms_area/kelurahan/$id_kec"));
      }elseif ($table == 'tbldusun') {
        $id_kel = md5($this->db->get_where("tbldusun", array("idtbldusun" => $id))->row("id_kel"));
        redirect(base_url("ms_area/dusun/$id_kel"));
      }
    }

    function delete($id, $table){
      //  die($id.'__'.$table);
      if ($table == 'tblkecamatan') {
        $this->db->where('md5(id_kec)', $id);
      }elseif($table == 'tblkelurahan'){
        $id_kec = md5($this->db->get_where("tblkelurahan", array("md5(id_kel)" => $id))->row("id_kec"));
        $this->db->where('md5(id_kel)', $id);
      }elseif($table == 'tbldusun'){
        $id_kel = md5($this->db->get_where("tbldusun", array("md5(idtbldusun)" => $id))->row("id_kel"));
        $this->db->where('md5(idtbldusun)', $id);
      }
      $this->db->delete($table);

      $this->session->set_flashdata('delete', 'Data Sukses di hapus');
      if ($table == 'tblkecamatan') {
        redirect(base_url("ms_area"));
      }elseif ($table == 'tblkelurahan') {
        redirect(base_url("ms_area/kelurahan/$id_kec"));
      }elseif ($table == 'tbldusun') {
        redirect(base_url("ms_area/dusun/$id_kel"));
      }

    }

    public function kelurahan($id)
    {
    	//die("asd");
        $data['table'] = "tblkelurahan/$id"; //agar datatable bisa ajax
        $data['arah'] = 'tblkelurahan';
        $data['kecamatan'] = $this->db->get_where("tblkecamatan", array("md5(id_kec)" => $id))->row();
        $this->load->view('v_ms_area', $data);
    }

    public function dusun($id)
    {
        $data['table'] = "tbldusun/$id"; //agar datatable bisa ajax
        $data['arah'] = 'tbldusun';
        $data['kelurahan'] = $this->db->get_where("tblkelurahan", array("md5(id_kel)" => $id))->row();
        $this->load->view('v_ms_area', $data);
    }


  }

?>
