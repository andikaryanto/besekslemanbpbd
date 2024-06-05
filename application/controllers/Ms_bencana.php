<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ms_bencana extends MY_Controller {
    public function __construct(){
        parent::__construct();
        // $this->login();
        $this->load->model('ms_model', '_ms');
    }

    public function index()
    {
    $data['akses'] = $this->akses_array;
        $this->load->view('v_ms_bencana', $data);
    }

    function tambah(){
      $this->load->view("v_ms_bencana_a");
    }

    function proses_tambah(){
      // print_r($_FILES);
      // die(print_r($this->input->post()));
      $nama = $this->input->post("nama");
      $deskripsi = $this->input->post("keterangan");
      if (isset($_FILES['foto'])) {
        if(! $_FILES['foto']['size'] == '0' ){

          $this->db->insert("tblbencana", array(
            "nama" => $nama, "deskripsi" => $deskripsi, "create_time" => date("Y-m-d H:i:s")
          ));
          $id = $this->db->insert_id();

          $this->upload_image($_FILES, $id);
          $this->session->set_flashdata('insert', "Data $nama Sukses Di Masukan");
        }
      }
      redirect(base_url("ms_bencana"));
    }

    function upload_image($files, $id){

        $fname = $id.'_'.$files['foto']['name'];
        $place                   = './uploads/bencana/';
        $upload_path             = $place;
        $config['upload_path']   = $upload_path;
        $config['file_name']     = $fname;
        $config['allowed_types'] = 'jpg|jpeg|gif|png|ico';
        $config['max_size']  = '20000000';
        $config['max_width']     = '20000';
        $config['max_height']    = '20000';
        $config['overwrite']     = true;

        $this->load->library('upload', $config);
        $this->upload->initialize($config);

        if (! $this->upload->do_upload('foto'))
        {
          die($this->upload->display_errors());
            $this->session->set_flashdata('error', $this->upload->display_errors()."please edit article : '$title', to reupload photo");
            redirect(base_url('ms_bencana'));
        }else{
          $this->db->where("id", $id);
          $this->db->update("tblbencana", array("icon" => $fname));
        }
    }

    function edit($id_md5){
      $data['data'] = $this->db->get_where("tblbencana", array("md5(id)" => $id_md5) )->row();
      // die(print_r($data));
      $this->load->view("v_ms_bencana_e", $data);

    }

    public function get_bm(){
      $idrbm = $this->input->post('idrbm');

      // $province = $this->input->post('province');
      $json_response = $this->db->get_where('tblemployee', array('npk_rbm'=>$idrbm, 'sales_team' => "BMH"))->result();
      foreach ($json_response as $rows){
          echo "<option value='$rows->idtblemployee'> $rows->employee_name </option>";
      }
    }

    public function get_rsr_head(){
      $idbm = $this->input->post('idbm');

      // $province = $this->input->post('province');
      $json_response = $this->db->get_where('tblemployee', array('npk_bm'=>$idbm, 'sales_team' => "RSRH"))->result();
      foreach ($json_response as $rows){
          echo "<option value='$rows->idtblemployee'> $rows->employee_name </option>";
      }
    }

    function get_bencana(){
      // die("asd");
      // $id = $this->input->post("id_client");
      $search = $this->input->post("search")['value'];
      $datax = $this->_ms->get_data($search, "tblbencana")->result();
		  $data = array();

      foreach ($datax as $rows){
        $row = array();
        $row[] = $rows->nama;
        $row[] = $rows->deskripsi;
        $row[] = $rows->flag == '0' ? 'Aktif' : 'Tidak Aktif';
        $row[] = '<a href="#" data-icon="'.$rows->icon.'" class="btn-small btn link_icon teal"><i class="right mdi-action-face-unlock"></i>Icon</a>';
        if($this->akses_array['update'] == '1'){
          $row[4] = '<div style="margin-left: 20px;" class="btn-group"> <a href="'.base_url().'ms_bencana/edit/'.md5($rows->id).'" class="blue btn-small btn "><i class="mdi-editor-border-color right"></i>&nbsp; Ubah</a>';
        }
        if($this->akses_array['delete'] == '1'){
          $row[4] .= '<a href="'.base_url().'ms_bencana/delete/'.md5($rows->id).'" data-nama="'.$rows->nama.'" class="btn-small btn link_delete"><i class="right mdi-navigation-cancel"></i>Hapus</a> </div>';
        }
        $data[] = $row;
			}

      $output = array(
        "data" => $data
      );

      echo json_encode($output);

    }

    function proses_edit(){
      // print_r($_FILES);
      // die(print_r($this->input->post()));
      $nama = $this->input->post("nama");
      $deskripsi = $this->input->post("keterangan");
      $id = $this->input->post("id");

      $this->db->where("id", $id);
      $this->db->update("tblbencana", array(
        "nama" => $nama, "deskripsi" => $deskripsi
      ));

      if (isset($_FILES['foto'])) {
        if(! $_FILES['foto']['size'] == '0' ){
          $this->upload_image($_FILES, $id);
        }
      }
      $this->session->set_flashdata('update', "Data $nama Sukses Di Perbarui");
      redirect(base_url("ms_bencana"));
    }

    function delete($id){
      // die($id);
      $this->db->where('md5(id)', $id);
      $this->db->update('tblbencana', array("flag" => "1"));

      $this->session->set_flashdata('delete', 'Data Sukses di hapus');
      redirect(base_url("ms_bencana"));
    }

    function delete_pict($id_md5, $name){
      //die($id.'_'.$name);
      $picture_name = $this->db->get_where("galery_detail", array('id' => $id))->row("picture_name");
      $file = './uploads/bencana/';
      if(unlink($file)){
        $this->db->where("md5(id)", $id_md5);
        $this->db->update("tblbencana", array("icon" => ''));
      }else{
        echo "gagal hapus";
      }
       echo '1';
    }


  }

?>
