<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ms_kml extends MY_Controller {
    public function __construct(){
        parent::__construct();
        // $this->login();
        $this->load->model('ms_model', '_ms');
    }

    public function index()
    {
    $data['akses'] = $this->akses_array;
        $this->load->view('v_ms_kml', $data);
    }

    function tambah(){
      $this->load->view("v_ms_kml_a");
    }

    function proses_tambah(){
      // print_r($_FILES);
      //die(print_r($this->input->post()));
      $nama = $this->input->post("nama");
      $type = $this->input->post("tipe");
      $file = $this->input->post("fele");
      if (isset($_FILES['peta'])) {
        if(! $_FILES['peta']['size'] == '0' ){
          $this->db->insert("tblkml", array(
            "nama" => $nama, "tipe" => $type, "fele" => $file, "create_time" => date("Y-m-d H:i:s")
          ));
          $id = $this->db->insert_id();

          $this->upload_peta($_FILES, $id);
          $this->session->set_flashdata('insert', "Data $nama Sukses Di Masukan");
        }
      }
      redirect(base_url("ms_kml"));
    }

    function upload_peta($files, $id){

        $fname = $id.'_'.$files['peta']['nama'];
        $place                   = './uploads/kml/';
        $upload_path             = $place;
        $config['upload_path']   = $upload_path;
        $config['file_name']     = $fname;
        $config['allowed_types'] = 'kml';
        $config['max_size']  = '20000000';
        $config['max_width']     = '20000';
        $config['max_height']    = '20000';
        $config['overwrite']     = true;

        $this->load->library('upload', $config);
        $this->upload->initialize($config);

        if (! $this->upload->do_upload('peta'))
        {
          die($this->upload->display_errors());
            $this->session->set_flashdata('error', $this->upload->display_errors()."please edit article : '$title', to reupload photo");
            redirect(base_url('ms_kml'));
        }else{
          $this->db->where("id", $id);
          $this->db->update("tblkml", array("peta" => $fname));
        }
    }

    function edit($id_md5){
      $data['data'] = $this->db->get_where("tblkml", array("md5(id)" => $id_md5) )->row();
      // die(print_r($data));
      $this->load->view("v_ms_kml_e", $data);

    }

    function get_kml(){
      // die("asd");
      // $id = $this->input->post("id_client");
      $search = $this->input->post("search")['value'];
      $datax = $this->_ms->get_data($search, "tblkml")->result();
		  $data = array();

      foreach ($datax as $rows){
        $row = array();
        $row[] = $rows->nama;
        $row[] = $rows->type;
        $row[] = $rows->file;
        $row[] = $rows->flag == '1' ? 'Aktif' : 'Tidak Aktif';
        $row[] = '<a href="#" data-icon="'.$rows->nama.'" class="btn-small btn link_icon teal"><i class="right mdi-action-face-unlock"></i>Icon</a>';
        if($this->akses_array['update'] == '1'){
          $row[4] = '<div style="margin-left: 20px;" class="btn-group"> <a href="'.base_url().'ms_kml/edit/'.md5($rows->id).'" class="blue btn-small btn "><i class="mdi-editor-border-color right"></i>&nbsp; Ubah</a>';
        }
        if($this->akses_array['delete'] == '1'){
          $row[4] .= '<a href="'.base_url().'ms_kml/delete/'.md5($rows->id).'" data-nama="'.$rows->nama.'" class="btn-small btn link_delete"><i class="right mdi-navigation-cancel"></i>Hapus</a> </div>';
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
      $type = $this->input->post("type");
      $file = $this->input->post("file");
      $id = $this->input->post("id");

      $this->db->where("id", $id);
      $this->db->update("tblkml", array(
         "nama" => $nama, "type" => $type, "file" => $file
      ));

      if (isset($_FILES['peta'])) {
        if(! $_FILES['peta']['size'] == '0' ){
          $this->upload_image($_FILES, $id);
        }
      }
      $this->session->set_flashdata('update', "Data $file Sukses Di Perbarui");
      redirect(base_url("ms_kml"));
    }

    function delete($id){
      // die($id);
      $this->db->where('md5(id)', $id);
      $this->db->update('tblkml', array("flag" => "1"));

      $this->session->set_flashdata('delete', 'Data Sukses di hapus');
      redirect(base_url("ms_kml"));
    }

    function delete_pict($id_md5, $file){
      //die($id.'_'.$name);
      $picture_name = $this->db->get_where("galery_detail", array('id' => $id))->row("picture_name");
      $file = './uploads/kml/'.$name;
      if(unlink($file)){
        $this->db->where("md5(id)", $id_md5);
        $this->db->update("tblkml", array("nama" => ''));
      }else{
        echo "gagal hapus";
      }
       echo '1';
    }


  }

?>
