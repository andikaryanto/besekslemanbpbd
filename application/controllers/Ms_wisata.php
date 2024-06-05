<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ms_wisata extends MY_Controller {
    public function __construct(){
        parent::__construct();
        // $this->login();
        $this->load->model('ms_model', '_ms');
    }

    public function index()
    {
      // $data['arah'] = 'tblkecamatan';
      $data['table'] = 'tblwisatadestinasi';
      $data['akses'] = $this->akses_array;
      $this->load->view('v_ms_wisatadestinasi', $data);
    }

    function tambah($table, $id = ''){
      $data['table'] = $table;
      $data['id'] = $id;
      $this->load->view("v_ms_wisatadestinasi_a", $data);
    }

    function proses_tambah(){
      // die(print_r($this->input->post()));
      $deskripsi  = $this->input->post("deskripsi");
      $nama       = $this->input->post("nama");
      $who        = $this->session->userdata("idtbluser");

      $data = array(
        "nama" => $nama,
        "deskripsi" => $deskripsi,
        "create_by" => $who,
        "create_time" => date("Y-m-d H:i:s")
      );
      $this->db->insert("tblwisatadestinasi", $data);
      $this->session->set_flashdata('insert', "Data $nama Sukses Di Masukan");

      redirect(base_url("ms_wisata"));
    }

    function get_wisatadestinasi(){
      $search = $this->input->post("search")['value'];
      $datax = $this->_ms->get_data($search, "tblwisatadestinasi")->result();
		  $data = array();

      foreach ($datax as $rows){
        $row = array();
        $row[] = $rows->nama;
        $row[] = $rows->deskripsi;
        $row[] = $rows->flag == '0' ? 'Aktif' : 'Tidak Aktif';
        $row[3] = '<div style="margin-left: 20px;" class="btn-group"> <a href="'.base_url().'ms_wisata/detail/'.md5($rows->iddestinasi).'" class="light-green darken-4 btn-small btn "><i class="mdi-action-trending-up right"></i>&nbsp; Data</a>';
        
        if($this->akses_array['update'] == '1'){
        $row[3] .= '<a href="#" class="blue btn-small btn btn-edit" data-nama="'.$rows->nama.'" data-deskripsi="'.$rows->deskripsi.'" data-id="'.md5($rows->iddestinasi).'"><i class="mdi-editor-border-color right"></i>&nbsp; Ubah</a>';
        }
        if($this->akses_array['delete'] == '1'){
          if ($rows->flag == '0') {
            $row[3] .= '<a href="'.base_url().'ms_wisata/delete/'.md5($rows->iddestinasi).'" data-nama="'.$rows->nama.'" class="btn-small btn link_delete"><i class="right mdi-navigation-cancel"></i>Hapus</a> </div>';
          }else{
            $row[3] .= '<a href="'.base_url().'ms_wisata/active/'.md5($rows->iddestinasi).'" data-nama="'.$rows->nama.'" data-status="aktif" class="btn-small btn link_delete"> <i class="right mdi-action-done"></i> Aktivasi</a> </div>';
          }
        }

        $data[] = $row;
			}

      $output = array(
        "data" => $data
      );

      echo json_encode($output);

    }

    function active($id){
      // die($id);
      $this->db->where('md5(iddestinasi)', $id);
      $this->db->update('tblwisatadestinasi', array("flag" => "0"));

      $this->session->set_flashdata('insert', 'Data Sukses di aktivasi');
      redirect(base_url("ms_wisata"));
    }

    function active_detail($id){
      $iddestinasi = md5($this->db->get_where("tblwisata", array("md5(idtblwisata)"=>$id))->row('iddestinasi'));
      $this->db->where('md5(idtblwisata)', $id);
      $this->db->update('tblwisata', array("flag" => "0"));
      $this->session->set_flashdata('insert', 'Data Sukses di aktivasi');
      redirect(base_url("ms_wisata/detail/$iddestinasi"));
      
    }

    function get_wisata($idtblwisata_md5){
      $search = $this->input->post("search")['value'];
      $datax = $this->_ms->get_data($search, "tblwisata", $idtblwisata_md5)->result();
		  $data = array();

      foreach ($datax as $rows){
        $row = array();
        $row[] = $rows->nama;
        $row[] = $rows->alamat;
        $row[] = $rows->pengelola;
        $row[] = $rows->telp;
        $row[] = $rows->flag == '0' ? 'Aktif' : 'Tidak Aktif';
        $row[] = '<div style="margin-left: 20px;" class="btn-group">
        <a href="#" class="blue btn-small btn btn-edit" data-nama="'.$rows->nama.'" data-alamat="'.$rows->alamat.'" data-pengelola="'.$rows->pengelola.'" data-telp="'.$rows->telp.'" data-latitude="'.$rows->latitude.'"data-longitude="'.$rows->longitude.'" data-id="'.md5($rows->idtblwisata).'"><i class="mdi-editor-border-color right"></i>&nbsp; Ubah</a>';
        if ($rows->flag == '0') {
          $row[5] .= '<a href="'.base_url().'ms_wisata/delete_detail/'.md5($rows->idtblwisata).'" data-nama="'.$rows->nama.'" class="btn-small btn link_delete"><i class="right mdi-navigation-cancel"></i>Hapus</a> </div>';
        }else{
          $row[5] .= '<a href="'.base_url().'ms_wisata/active_detail/'.md5($rows->idtblwisata).'" data-nama="'.$rows->nama.'" data-status="aktif" class="btn-small btn link_delete"> <i class="right mdi-action-done"></i> Aktivasi</a> </div>';
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
      $deskripsi = $this->input->post("deskripsi");
      $id = $this->input->post("id");

      $data = array("nama" => $nama, "deskripsi" => $deskripsi);
      $this->db->where("md5(iddestinasi)", $id);
      $this->db->update("tblwisatadestinasi", $data);

      $this->session->set_flashdata('update', "Data $nama Sukses Di Perbarui");
      redirect(base_url("ms_wisata"));
    }

    function delete($id){
      //  die($id.'__'.$table);
      $this->db->where('md5(iddestinasi)', $id);
      $this->db->update("tblwisatadestinasi", array("flag" => '1'));

      $this->session->set_flashdata('delete', 'Data Sukses di hapus');
      redirect(base_url("ms_wisata"));

    }

    public function detail($id_md5)
    {
        $isi = $this->db->get_where("tblwisatadestinasi", array("md5(iddestinasi)" => $id_md5))->row();
        $id = $isi->iddestinasi;
        $data['id_md5'] =  $id_md5;
        $data['idtblwisata'] = $id;
        $data['data'] = $isi;
        $this->load->view('v_ms_wisata', $data);
    }

    function proses_tambah_detail(){
      // die(print_r($this->input->post()));
      $id = $this->input->post("id");
      $data = $this->db->get_where("tblwisatadestinasi", array("md5(iddestinasi)" => $id))->row();
      // die(print_r($data));

      $iddestinasi    = $data->iddestinasi;
      $alamat         = $this->input->post("alamat");
      $nama           = $this->input->post("nama");
      $pengelola      = $this->input->post("pengelola");
      $telp           = $this->input->post("telp");
      $latitude       = $this->input->post("latitude");
      $longitude      = $this->input->post("longitude");
      $who            = $this->session->userdata("idtbluser");

      $data = array(
        "iddestinasi" => $iddestinasi,
        "nama" => $nama,
        "pengelola" => $pengelola,
        "telp" => $telp,
        "alamat" => $alamat,
        "latitude" => $latitude,
        "longitude" => $longitude,
        "create_by" => $who,
        "create_time" => date("Y-m-d H:i:s")
      );
      print $data;
      $this->db->insert("tblwisata", $data);
      $this->session->set_flashdata('insert', "Data $nama Sukses Di Masukan");

      redirect(base_url("ms_wisata/detail/$id"));
    }

    function proses_edit_detail(){
      // die(print_r($this->input->post()));
      // die(print_r($data));

      $id                  = $this->input->post("idtblwisata");
      $alamat              = $this->input->post("alamat");
      $nama                = $this->input->post("nama");
      $pengelola           = $this->input->post("pengelola");
      $telp                = $this->input->post("telp");
      $latitude            = $this->input->post("latitude");
      $longitude           = $this->input->post("longitude");
      $who                 = $this->session->userdata("idtbluser");


      $data = array(
        "nama" => $nama,
        "pengelola" => $pengelola,
        "telp" => $telp,
        "alamat" => $alamat,
        "latitude" => $latitude,
        "longitude" => $longitude,
        "update_by" => $who,
        "update_time" => date("Y-m-d H:i:s")
      );
      $this->db->where("md5(idtblwisata)", $id);
      $this->db->update("tblwisata", $data);
      $this->session->set_flashdata('update', "Data $nama Sukses Di perbarui");

      redirect(base_url("ms_wisata/detail/$id"));
    }


    function delete_detail($id){
      // die($id.'__'.$table);
      $iddestinasi = md5($this->db->get_where("tblwisata", array("md5(idtblwisata)"=>$id))->row('iddestinasi'));
      // die($id_md5.'___'.$id);
      $this->db->where('md5(idtblwisata)', $id);
      $this->db->update("tblwisata", array("flag" => '1'));

      $this->session->set_flashdata('delete', 'Data Sukses di hapus');
      redirect(base_url("ms_wisata/detail/$iddestinasi"));

    }


  }

?>
