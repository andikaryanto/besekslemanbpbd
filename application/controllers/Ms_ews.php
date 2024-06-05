<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class ms_ews extends MY_Controller {
    public function __construct(){
        parent::__construct();
        // $this->login();
        $this->load->model('ms_model', '_ms');
    }

    public function index()
    {
      $data['akses'] = $this->akses_array;
      $this->load->view('v_ms_ews', $data);
    }

    function tambah(){
      $data['kelurahan'] = $this->db->get("tblkelurahan")->result();
      $this->load->view("v_ms_ews_a", $data);
    }

    function proses_tambah(){
      // print_r($_FILES);
      // die(print_r($this->input->post()));
      $nama = $this->input->post("nama");
      $alamat = $this->input->post("alamat");
      $kelurahan = $this->input->post("kelurahan");
      $tlpn = $this->input->post("tlpn");
      $latitude = $this->input->post("latitude");
      $longitude = $this->input->post("longitude");
      $deskripsi = $this->input->post("keterangan");
      if (isset($_FILES['foto'])) {
        if(! $_FILES['foto']['size'] == '0' ){

          $this->db->insert("tblews", array(
            "nama" => $nama, "deskripsi" => $deskripsi, "create_time" => date("Y-m-d H:i:s"),
            "alamat" => $alamat, "id_kel" => $kelurahan, "tlpn" => $tlpn,
            "latitude" => $latitude, "longitude" => $longitude
          ));
          $id = $this->db->insert_id();

          $this->upload_image($_FILES, $id);
          $this->session->set_flashdata('insert', "Data $nama Sukses Di Masukan");
        }
      }
      redirect(base_url("ms_ews"));
    }

    function upload_image($files, $id){

        $fname = $id.'_'.$files['foto']['name'];
        $place                   = './uploads/ews/';
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
            redirect(base_url('ms_ews'));
        }else{
          $this->db->where("idtblews", $id);
          $this->db->update("tblews", array("picture_name" => $fname));
        }
    }

    function edit($id_md5){
      $data['data'] = $this->db->get_where("tblews", array("md5(idtblews)" => $id_md5) )->row();
      $data['kelurahan'] = $this->db->get("tblkelurahan")->result();
      $this->load->view("v_ms_ews_e", $data);

    }

    function get_ews(){
      $search = $this->input->post("search")['value'];
      $datax = $this->_ms->get_data($search, "tblews")->result();
		  $data = array(); $x = 0;

      foreach ($datax as $rows){
        $row = array();
        $x++;
        $row[] = $rows->nama;
        $row[] = $rows->alamat;
        $row[] = $rows->nama_kelurahan;
        $row[] = $rows->tlpn;
        $row[] = $rows->deskripsi;
        $row[] = $rows->flag == '0' ? 'Aktif' : 'Tidak Aktif';
        $row[6] = '<div style="margin-left: 20px;" class="btn-group">
                <a href="#" data-image="'.$rows->picture_name.'" data-nama="'.$rows->nama.'" class="btn-small btn link_foto deep-purple" style="width:3%;"><i class="right mdi-image-photo-camera"></i></a>
                <a href="#" data-latitude="'.$rows->latitude.'" data-longitude="'.$rows->longitude.'" data-nama="'.$rows->nama.'" class="btn-small btn link_map teal" style="width:3%;"><i class="right mdi-action-room"></i></a>';
        if($this->akses_array['update'] == '1'){
        $row[6] .= '<a href="'.base_url().'ms_ews/edit/'.md5($rows->idtblews).'" class="blue btn-small btn " style="width:3%;"> <i class="mdi-editor-border-color right"></i></a>';
        }
        if($this->akses_array['delete'] == '1'){
        $row[6] .= '<a href="'.base_url().'ms_ews/delete/'.md5($rows->idtblews).'" data-nama="'.$rows->nama.'" class="btn-small btn link_delete" style="width:3%;"> <i class="right mdi-navigation-cancel"></i></a> </div>';
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
      $alamat = $this->input->post("alamat");
      $kelurahan = $this->input->post("kelurahan");
      $tlpn = $this->input->post("tlpn");
      $latitude = $this->input->post("latitude");
      $longitude = $this->input->post("longitude");
      $deskripsi = $this->input->post("keterangan");
      $id = $this->input->post("id");

      $this->db->where("idtblews", $id);
      $this->db->update("tblews", array(
        "nama" => $nama, "deskripsi" => $deskripsi, "create_time" => date("Y-m-d H:i:s"),
        "alamat" => $alamat, "id_kel" => $kelurahan, "tlpn" => $tlpn,
        "latitude" => $latitude, "longitude" => $longitude
      ));

      if (isset($_FILES['foto'])) {
        if(! $_FILES['foto']['size'] == '0' ){
          $this->upload_image($_FILES, $id);
        }
      }
      $this->session->set_flashdata('update', "Data $nama Sukses Di Perbarui");
      redirect(base_url("ms_ews"));
    }

    function delete($id){
      // die($id);
      $this->db->where('md5(idtblews)', $id);
      $this->db->update('tblews', array("flag" => "1"));

      $this->session->set_flashdata('delete', 'Data Sukses di hapus');
      redirect(base_url("ms_ews"));
    }

    function delete_pict($id_md5, $name){
      //die($id.'_'.$name);
      // $picture_name = $this->db->get_where("galery_detail", array('id' => $id))->row("picture_name");
      $file = './uploads/ews/'.$name;
      if(unlink($file)){
        $this->db->where("md5(idtblews)", $id_md5);
        $this->db->update("tblews", array("picture_name" => ''));
      }else{
        echo "gagal hapus";
      }
       echo '1';
    }


  }

?>
