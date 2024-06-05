<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ms_barak extends MY_Controller {
    public function __construct(){
        parent::__construct();
        // $this->login();
        $this->load->model('ms_model', '_ms');
    }

    public function index()
    {
        $this->load->view('v_ms_barak');
    }

    function tambah(){
      $this->load->view("v_ms_barak_a");
    }

    function proses_tambah(){
      // print_r($_FILES);
      // die(print_r($this->input->post()));
      $nama = $this->input->post("nama");
      $alamat = $this->input->post("alamat");
      $penanggung_jawab = $this->input->post("penanggung_jawab");
      $tlpn = $this->input->post("tlpn");
      $tampung = $this->input->post("tampung");
      $latitude = $this->input->post("latitude");
      $longitude = $this->input->post("longitude");
      $deskripsi = $this->input->post("keterangan");
      if (isset($_FILES['foto'])) {
        if(! $_FILES['foto']['size'] == '0' ){

          $this->db->insert("tblbarak", array(
            "nama" => $nama, "deskripsi" => $deskripsi, "create_time" => date("Y-m-d H:i:s"),
            "alamat" => $alamat, "penanggung_jawab" => $penanggung_jawab, "tlpn" => $tlpn, "tampung" => $tampung,
            "latitude" => $latitude, "longitude" => $longitude
          ));
          $id = $this->db->insert_id();

          $this->upload_image($_FILES, $id);
          $this->session->set_flashdata('insert', "Data $nama Sukses Di Masukan");
        }
      }
      redirect(base_url("ms_barak"));
    }

    function upload_image($files, $id){

        $fname = $id.'_'.$files['foto']['name'];
        $place                   = './uploads/barak/';
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
            redirect(base_url('ms_barak'));
        }else{
          $this->db->where("idtblbarak", $id);
          $this->db->update("tblbarak", array("picture_name" => $fname));
        }
    }

    function edit($id_md5){
      $data['data'] = $this->db->get_where("tblbarak", array("md5(idtblbarak)" => $id_md5) )->row();
      $this->load->view("v_ms_barak_e", $data);

    }

    function get_barak(){
      $search = $this->input->post("search")['value'];
      $datax = $this->_ms->get_data($search, "tblbarak")->result();
		  $data = array(); $x = 0;

      foreach ($datax as $rows){
        $row = array();
        $x++;
        $row[] = $rows->nama;
        $row[] = $rows->alamat;
        // $row[] = '<a href="#" data-latitude="'.$rows->latitude.'" data-longitude="'.$rows->longitude.'" data-nama="'.$rows->nama.'" class="btn-small btn link_map teal"><i class="right mdi-action-room"></i>Map</a>';
        $row[] = $rows->penanggung_jawab;
        $row[] = $rows->tlpn;
        $row[] = $rows->tampung;
        $row[] = $rows->flag == '0' ? 'Aktif' : 'Tidak Aktif';
        // $row[] = '<div style="margin-left: 20px;" class="btn-group"> <a href="'.base_url().'ms_barak/edit/'.md5($rows->idtblbarak).'" class="blue btn-small btn "><i class="mdi-editor-border-color right"></i>&nbsp; Ubah</a> <a href="'.base_url().'ms_barak/delete/'.md5($rows->idtblbarak).'" data-nama="'.$rows->nama.'" class="btn-small btn link_delete"><i class="right mdi-navigation-cancel"></i>Hapus</a> </div>';
        // $row[] = '<a class="dropdown-button btn-floating btn-large waves-effect waves-light " id="drop'.$x.'" href="#!" data-activates="dropdown'.$x.'"><i class="mdi-editor-vertical-align-bottom"></i></a>
        //                   <ul id="dropdown'.$x.'" class="dropdown-content">
        //                     <li><a href="#!" class="-text">.zip</a>
        //                     </li>
        //                     <li><a href="#!" class="-text">.tar</a>
        //                     </li>
        //                     <li><a href="#!" class="-text">.exe</a>
        //                     </li>
        //                   </ul>';
        $row[] = '<div style="margin-left: 20px;" class="btn-group">
                <a href="#" data-image="'.$rows->picture_name.'" data-nama="'.$rows->nama.'" class="btn-small btn link_foto deep-purple" style="width:3%;"><i class="right mdi-image-photo-camera"></i></a>
                <a href="#" data-latitude="'.$rows->latitude.'" data-longitude="'.$rows->longitude.'" data-nama="'.$rows->nama.'" class="btn-small btn link_map teal" style="width:3%;"><i class="right mdi-action-room"></i></a>
                <a href="'.base_url().'ms_barak/edit/'.md5($rows->idtblbarak).'" class="blue btn-small btn " style="width:3%;"> <i class="mdi-editor-border-color right"></i></a>
                <a href="'.base_url().'ms_barak/delete/'.md5($rows->idtblbarak).'" data-nama="'.$rows->nama.'" class="btn-small btn link_delete" style="width:3%;"> <i class="right mdi-navigation-cancel"></i></a> </div>';

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
      $penanggung_jawab = $this->input->post("penanggung_jawab");
      $tlpn = $this->input->post("tlpn");
      $tampung = $this->input->post("tampung");
      $latitude = $this->input->post("latitude");
      $longitude = $this->input->post("longitude");
      $deskripsi = $this->input->post("keterangan");
      $id = $this->input->post("id");

      $this->db->where("idtblbarak", $id);
      $this->db->update("tblbarak", array(
        "nama" => $nama, "deskripsi" => $deskripsi, "create_time" => date("Y-m-d H:i:s"),
        "alamat" => $alamat, "penanggung_jawab" => $penanggung_jawab, "tlpn" => $tlpn, "tampung" => $tampung,
        "latitude" => $latitude, "longitude" => $longitude
      ));

      if (isset($_FILES['foto'])) {
        if(! $_FILES['foto']['size'] == '0' ){
          $this->upload_image($_FILES, $id);
        }
      }
      $this->session->set_flashdata('update', "Data $nama Sukses Di Perbarui");
      redirect(base_url("ms_barak"));
    }

    function delete($id){
      // die($id);
      $this->db->where('md5(idtblbarak)', $id);
      $this->db->update('tblbarak', array("flag" => "1"));

      $this->session->set_flashdata('delete', 'Data Sukses di hapus');
      redirect(base_url("ms_barak"));
    }

    function delete_pict($id_md5, $name){
      //die($id.'_'.$name);
      // $picture_name = $this->db->get_where("galery_detail", array('id' => $id))->row("picture_name");
      $file = './uploads/barak/'.$name;
      if(unlink($file)){
        $this->db->where("md5(idtblbarak)", $id_md5);
        $this->db->update("tblbarak", array("picture_name" => ''));
      }else{
        echo "gagal hapus";
      }
       echo '1';
    }


  }

?>
