<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Tr_absensi extends MY_Controller {
    public function __construct(){
        parent::__construct();
        // $this->login();
        $this->load->model('ms_model', '_ms');
    }

    public function index()
    {
      $data['akses'] = $this->akses_array;
      $this->load->view('v_tr_absensi', $data);
    }

    function tambah(){
      $data['relawan'] = $this->db->get("tblrelawan")->result();
      $data['kegiatan'] = $this->db->get("tblkegiatan")->result();
      // $data['absensi'] = $this->db->get("tblabsensi")->result();
      $this->load->view("v_tr_absensi_a", $data);
    }

    public function get_kelurahan(){
      $id_kec = $this->input->post('idkec');

      $json_response = $this->db->get_where('tblkelurahan', array('id_kec'=>$id_kec))->result();
      foreach ($json_response as $rows){
          echo "<option value='$rows->id_kel'> $rows->nama </option>";
      }
    }

    public function get_image(){
      $idtbl = $this->input->post('idtbl');
      $type = $this->input->post('type');
      $lokasi = base_url()."uploads/absensi/".$idtbl.'/';
      $x = 1;
      $json_response = $this->db->get_where('tblgalery', array('idtbl'=>$idtbl, "type" => $type))->result();
      foreach ($json_response as $rows){

          $foto = $lokasi.$rows->picture_name;
          echo  "<a class='carousel-item active' href='$foto' target='_blank'>
              	  <img src='$foto' alt='img-$x' style='width:80%;height:50%;'>
              	</a>";
          // echo "<img class='activator' src='$foto' alt='Icon'>";
          $x++;
      }

    }

    function proses_tambah(){
      $no_induk = $this->input->post('no_induk');
      $kegiatan = $this->input->post('kegiatan');
      $tanggal = date("Y-m-d", strtotime($this->input->post("tanggal")));

      $data = array(
        'no_induk' => $no_induk,
        'kegiatan' => $kegiatan,
        'tanggal' => $tanggal,
      );

      $this->db->insert("tblabsensi", $data);
      $idtblabsensi		= $this->db->insert_id();

      redirect(base_url("tr_absensi"));
    }

    function set_upload_options($judul, $folder)
      {
        //upload an image options
        $config = array();
        $config['file_name']     = $judul;
        $config['upload_path']   = './uploads/absensi/'.$folder;
        $config['allowed_types'] = 'gif|jpg|png';
        $config['max_size']      = '0';
        $config['overwrite']     = FALSE;

        $this->load->library('upload', $config);
        return $config;
      }

    function edit($id_md5){
      $data['data'] = $this->db->get_where("tblabsensi", array("md5(idtblabsensi)" => $id_md5) )->row_array();
      $data['picture'] = $this->db->get_where("tblgalery", array("md5(idtbl)" => $id_md5, "type" => '1'))->result();
      $data['relawan'] = $this->db->get("tblrelawan")->result();
      $data['kegiatan'] = $this->db->get("tblkegiatan")->result();
      $this->load->view("v_tr_absensi_e", $data);

    }

    function get_absensi(){
      $search = $this->input->post("search")['value'];
      $datax = $this->_ms->get_data($search, "tblabsensi")->result();
		  $data = array(); $x = 0;
      // die(json_encode($datax));

      foreach ($datax as $rows){
        $row = array();
        $x++;
        $row[] = $rows->idtblabsensi;
        $row[] = $rows->no_induk;
        $row[] = $rows->nama_relawan;
        $row[] = $rows->nama_kegiatan;
        $row[] = $rows->tanggal;

        $row[5] = '';
        if($this->akses_array['update'] == '1'){
          $row[5] .= '<a href="'.base_url().'tr_absensi/edit/'.md5($rows->idtblabsensi).'" class="blue btn-small btn " style="width:3%;"> <i class="mdi-editor-border-color right"></i></a>';
        }
        if($this->akses_array['delete'] == '1'){
          $row[5] .= '<a href="'.base_url().'tr_absensi/delete/'.md5($rows->idtblabsensi).'" data-nama="'.$rows->nama_relawan.'" data-status="hapus" class="btn-small btn link_delete" style="width:3%;"> <i class="right mdi-navigation-cancel"></i></a> </div>';
        }

        $data[] = $row;
			}

      $output = array(
        "data" => $data
      );

      echo json_encode($output);

    }

    function proses_edit(){
      $no_induk = $this->input->post('no_induk');
      $kegiatan = $this->input->post('kegiatan');
      $tanggal = date("Y-m-d", strtotime($this->input->post("tanggal")));
      $idtblabsensi = $this->input->post('idtblabsensi');

      $data = array(
        'no_induk' => $no_induk,
        'kegiatan' => $kegiatan,
        'tanggal' => $tanggal,
      );

      $this->db->where("idtblabsensi", $idtblabsensi);
      $this->db->update("tblabsensi", $data);

      $this->session->set_flashdata('update', "Data $nama Sukses Di Perbarui");
      redirect(base_url("tr_absensi"));
    }

    function delete($id){
      // die($id);
      $this->db->where('md5(idtblabsensi)', $id);
      $this->db->delete('tblabsensi');
      // $this->db->update('tblabsensi', array("flag" => "1"));

      $this->session->set_flashdata('delete', 'Data Sukses di hapus');
      redirect(base_url("tr_absensi"));
    }

    function active($id){
      // die($id);
      $this->db->where('md5(idtblabsensi)', $id);
      $this->db->update('tblabsensi', array("flag" => "0"));

      $this->session->set_flashdata('insert', 'Data Sukses di aktivasi');
      redirect(base_url("tr_absensi"));
    }

    function delete_pict($id, $id_md5, $name){
      // die($id_md5.'_'.$name);
      // $picture_name = $this->db->get_where("galery_detail", array('id' => $id))->row("picture_name");
      $file = './uploads/absensi/'.$id.'/'.$name;
      if(unlink($file)){
        $this->db->where("md5(id)", $id_md5);
        $this->db->delete("tblgalery");
      }else{
        echo "gagal hapus";
      }
       echo '1';
    }


  }

?>
