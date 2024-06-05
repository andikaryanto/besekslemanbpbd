<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ms_pengungsian_detail extends MY_Controller {
    public function __construct(){
        parent::__construct();
        // $this->login();
        $this->load->model('ms_model', '_ms');
    }

    public function index()
    {
      $data['table'] = 'tblpengungsian';
      $data['akses'] = $this->akses_array;
      $this->load->view('v_ms_pengungsiandetail', $data);
    }

    function tambah($table, $id = ''){
      $data['table'] = $table;
      $data['id'] = $id;
      $this->load->view("v_ms_pengungsiandetail_a", $data);
    }

    function proses_tambah(){
      // die(print_r($this->input->post()));
      $nama = $this->input->post("nama");
      $alamat = $this->input->post("alamat");
      $penanggung_jawab = $this->input->post("penanggung_jawab");
      $tlpn = $this->input->post("tlpn");
      $tampungreguler = $this->input->post("tampungreguler");
      $tampungprotokol = $this->input->post("tampungprotokol");
      $bilik = $this->input->post("bilik");
      $deskripsi  = $this->input->post("deskripsi");
      $latitude = $this->input->post("latitude");
      $longitude = $this->input->post("longitude");

      $data = array(
        "nama" => $nama, "deskripsi" => $deskripsi, "penanggung_jawab" => $penanggung_jawab, "tlpn" => $tlpn,
        "tampungreguler" => $tampungreguler, "tampungprotokol" => $tampungprotokol, "bilik" =>$bilik,
        "latitude" => $latitude, "longitude" => $longitude, "create_time" => date("Y-m-d H:i:s"));

      $this->db->insert("tblpengungsian", $data);
      $this->session->set_flashdata('insert', "Data $nama Sukses Di Masukan");

      redirect(base_url("Ms_pengungsian_detail"));
    }

    function get_pengungsian(){
      $search = $this->input->post("search")['value'];
      $datax = $this->_ms->get_data($search, "tblpengungsian")->result();
		  $data = array();

      foreach ($datax as $rows){
        $row = array();
        $row[] = $rows->nama;
        $row[] = $rows->alamat;
        $row[] = $rows->penanggung_jawab;
        $row[] = $rows->tlpn;
        $row[] = $rows->tampungreguler;
        $row[] = $rows->tampungprotokol;
        $row[] = $rows->bilik;
        $row[] = $rows->flag == '0' ? 'Aktif' : 'Tidak Aktif';
        $row[] = $rows->deskripsi;
        $row[9] = '<div style="margin-left: 20px;" class="btn-group"> <a href="'.base_url().'ms_pengungsian_detail/detail/'.md5($rows->idtblpengungsian).'" class="light-green darken-4 btn-small btn "><i class="mdi-action-trending-up right"></i>&nbsp; Rekap Pengungsi</a>';

          if($this->akses_array['update'] == '1'){
           $row[9] .= '<a href="#" class="blue btn-small btn btn-edit" data-nama="'.$rows->nama. '" data-alamat="'.$rows->alamat.'" data-penanggung_jawab="'.$rows->penanggung_jawab.'" data-tlpn="'.$rows->tlpn.'" data-tampungreguler="'.$rows->tampungreguler.'" data-tampungprotokol="'.$rows->tampungprotokol.'" data-bilik="'.$rows->bilik.'" data-deskripsi="'.$rows->deskripsi.'" data-id="'.md5($rows->idtblpengungsian).'"><i class="mdi-editor-border-color right"></i>&nbsp; Ubah</a>';
        }
        if($this->akses_array['delete'] == '1'){
          if ($rows->flag == '0') {
              $row[9] .= '<a href="'.base_url().'ms_pengungsian_detail/delete/'.md5($rows->idtblpengungsian).'" data-nama="'.$rows->nama.'" class="btn-small btn link_delete"><i class="right mdi-navigation-cancel"></i>Hapus</a> </div>';
          }else{
            $row[9] .= '<a href="'.base_url().'ms_pengungsian_detail/active/'.md5($rows->idtblpengungsian).'" data-nama="'.$rows->nama.'" data-status="aktif" class="btn-small btn link_delete"> <i class="right mdi-action-done"></i> Aktivasi</a> </div>';
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
      $this->db->where('md5(idtblpengungsian)', $id);
      $this->db->update('tblpengungsian', array("flag" => "0"));

      $this->session->set_flashdata('insert', 'Data Sukses di aktivasi');
      redirect(base_url("ms_pengungsian"));
    }

    function active_detail($id){
      $idtblpengungsian = md5($this->db->get_where("tblpengungsian_detail", array("md5(id)"=>$id))->row('idtblpengungsian'));
      $this->db->where('md5(id)', $id);
      $this->db->update('tblpengungsian_detail', array("flag" => "0"));
      $this->session->set_flashdata('insert', 'Data Sukses di aktivasi');
      redirect(base_url("ms_pengungsian/detail/$idtblpengungsian"));
    }

    function get_pengungsian_det($id_md5){
      $search = $this->input->post("search")['value'];
      $datax = $this->_ms->get_data($search, "tblpengungsian_detail", $id_md5)->result();
		  $data = array();

      foreach ($datax as $rows){
        $row = array();
        $row[] = $rows->jumlahlaki;
        $row[] = $rows->jumlahperempuan;
        $row[] = $rows->dewasalaki;
        $row[] = $rows->dewasaperempuan;
        $row[] = $rows->anaklaki;
        $row[] = $rows->anakperempuan;
        $row[] = $rows->balitalaki;
        $row[] = $rows->balitaperempuan;
        $row[] = $rows->bayilaki;
        $row[] = $rows->bayiperempuan;
        $row[] = $rows->lansialaki;
        $row[] = $rows->lansiaperempuan;
        $row[] = $rows->difabellaki;
        $row[] = $rows->difabelperempuan;
        $row[] = $rows->bumil;
        $row[] = $rows->busui;
        $row[] = $rows->flag == '0' ? 'Aktif' : 'Tidak Aktif';
        $row[] = '<div style="margin-left: 20px;" class="btn-group">
        <a href="#" class="blue btn-small btn btn-edit" data-jumlahL="'.$rows->jumlahlaki.'" data-jumlahP="'.$rows->jumlahperempuan.'" data-dewasaL="'.$rows->dewasalaki.'" data-dewasaP="'.$rows->dewasaperempuan.'" data-anakL="'.$rows->anaklaki.'" data-anakP="'.$rows->anakperempuan.'" data-balitaL="'.$rows->balitalaki.'" data-balitaP="'.$rows->balitaperempuan.'" data-bayiL="'.$rows->bayilaki.'" data-bayiP="'.$rows->bayiperempuan.'" data-lansiaL="'.$rows->lansialaki.'" data-lansiaP="'.$rows->lansiaperempuan.'" data-difabelL="'.$rows->difabellaki.'" data-difabelP="'.$rows->difabelperempuan.'" data-bumil="'.$rows->bumil.'" data-busui="'.$rows->busui.'" data-id="'.md5($rows->id).'"><i class="mdi-editor-border-color right"></i>&nbsp; Ubah</a>';
        if ($rows->flag == '0') {
          $row[6] .= '<a href="'.base_url().'Ms_pengungsiandetail/delete_detail/'.md5($rows->id).'" data-nama="'.$rows->nama.'" class="btn-small btn link_delete"><i class="right mdi-navigation-cancel"></i>Hapus</a> </div>';
        }else{
          $row[6] .= '<a href="'.base_url().'Ms_pengungsiandetail/active_detail/'.md5($rows->id).'" data-nama="'.$rows->nama.'" data-status="aktif" class="btn-small btn link_delete"> <i class="right mdi-action-done"></i> Aktivasi</a> </div>';
        }

        $data[] = $row;
			}

      $output = array(
        "data" => $data
      );

      echo json_encode($output);

    }

    function proses_edit(){
      // die(print_r($this->input->post()));
      $nama = $this->input->post("nama");
      $alamat = $this->input->post("alamat");
      $penanggung_jawab = $this->input->post("penanggung_jawab");
      $tlpn = $this->input->post("tlpn");
      $tampungreguler = $this->input->post("tampungreguler");
      $tampungprotokol = $this->input->post("tampungprotokol");
      $bilik = $this->input->post("bilik");
      $latitude = $this->input->post("latitude");
      $longitude = $this->input->post("longitude");
      $id = $this->input->post("id");

      $data = array("nama" => $nama, "alamat" => $alamat, "penanggung_jawab" => $penanggung_jawab, "tlpn" => $tlpn, "tampungreguler" => $tampungreguler, "tampungprotokol" => $tampungprotokol, "bilik" => $bilik, "latitude" => $latitude, "longitude" =>$longitude);
      $this->db->where("md5(idtblpengungsian)", $id);
      $this->db->update("tblpengungsian", $data);

      $this->session->set_flashdata('update', "Data $nama Sukses Di Perbarui");
      redirect(base_url("ms_pengungsian"));
    }

    function delete($id){
      //  die($id.'__'.$table);
      $this->db->where('md5(idtblpengungsian)', $id);
      $this->db->update("tblpengungsian", array("flag" => '1'));

      $this->session->set_flashdata('delete', 'Data $nama Sukses di hapus');
      redirect(base_url("ms_pengungsian"));

    }

    public function detail($id_md5)
    {
        $isi = $this->db->get_where("tblpengungsian", array("md5(idtblpengungsian)" => $id_md5))->row();
        $id = $isi->idtblpengungsian;
        $data['id_md5'] =  $id_md5;
        $data['id'] = $id;
        $data['data'] = $isi;
        $this->load->view('v_ms_pengungsiandetail_a', $data);
    }

    function proses_tambah_detail(){
      // die(print_r($this->input->post()));
      $id = $this->input->post("id");
      $data = $this->db->get_where("tblpengungsian", array("md5(idtblpengungsian)" => $id))->row();
      // die(print_r($data));

      $idtblpengungsian = $data->idtblpengungsian;
      $jumlahlaki = $this->input->post("jumlahlaki");
      $jumlahperempuan = $this->input->post("jumlahperempuan");
      $dewasalaki = $this->input->post("dewasalaki");
      $dewasaperempuan = $this->input->post("dewasaperempuan");
      $anaklaki = $this->input->post("anaklaki");
      $anakperempuan = $this->input->post("anakperempuan");
      $balitalaki = $this->input->post("balitalaki");
      $balitaperempuan = $this->input->post("balitaperempuan");
      $bayilaki = $this->input->post("bayilaki");
      $bayiperempuan = $this->input->post("bayiperempuan");
      $lansialaki = $this->input->post("lansialaki");
      $lansiaperempuan = $this->input->post("lansiaperempuan");
      $difabellaki = $this->input->post("difabellaki");
      $difabelperempuan = $this->input->post("difabelperempuan");
      $bumil = $this->input->post("bumil");
      $busui = $this->input->post("busui");


      $data = array("jumlahlaki" => $jumlahlaki, "jumlahperempuan" => $jumlahperempuan, "dewasalaki" => $dewasalaki, "dewasaperempuan" => $dewasaperempuan, "anaklaki" => $anaklaki, "anakperempuan" => $anakperempuan, "balitalaki" => $balitalaki, "balitaperempuan" => $balitaperempuan, "bayilaki" =>$bayilaki, "bayiperempuan" => $bayiperempuan, "lansialaki" => $lansialaki, "lansiaperempuan" => $lansiaperempuan, "difabellaki" => $difabelperempuan, "bumil" =>$bumil, "busui" => $busui, "create_date" => date("Y-m-d H:i:s"));

      $this->db->insert("tblpengungsian_detail", $data);
      $this->session->set_flashdata('insert', "Data Sukses Di Masukan");

      redirect(base_url("ms_pengungsian/detail/$id"));
    }

    function proses_edit_detail(){
      // die(print_r($this->input->post()));
      // die(print_r($data));

      $jumlahlaki = $this->input->post("jumlahlaki");
      $jumlahperempuan = $this->input->post("jumlahperempuan");
      $dewasalaki = $this->input->post("dewasalaki");
      $dewasaperempuan = $this->input->post("dewasaperempuan");
      $anaklaki = $this->input->post("anaklaki");
      $anakperempuan = $this->input->post("anakperempuan");
      $balitalaki = $this->input->post("balitalaki");
      $balitaperempuan = $this->input->post("balitaperempuan");
      $bayilaki = $this->input->post("bayilaki");
      $bayiperempuan = $this->input->post("bayiperempuan");
      $lansialaki = $this->input->post("lansialaki");
      $lansiaperempuan = $this->input->post("lansiaperempuan");
      $difabellaki = $this->input->post("difabellaki");
      $difabelperempuan = $this->input->post("difabelperempuan");
      $bumil = $this->input->post("bumil");
      $busui = $this->input->post("busui");
      $id = $this->input->post("id");


      $data = array("jumlahlaki" => $jumlahlaki, "jumlahperempuan" => $jumlahperempuan, "dewasalaki" => $dewasalaki, "dewasaperempuan" => $dewasaperempuan, "anaklaki" => $anaklaki, "anakperempuan" => $anakperempuan, "balitalaki" => $balitalaki, "balitaperempuan" => $balitaperempuan, "bayilaki" =>$bayilaki, "bayiperempuan" => $bayiperempuan, "lansialaki" => $lansialaki, "lansiaperempuan" => $lansiaperempuan, "difabellaki" => $difabelperempuan, "bumil" =>$bumil, "busui" => $busui, "create_date" => date("Y-m-d H:i:s"));
        
      $this->db->where("md5(id)", $id);
      $this->db->update("tblpengungsian_detail", $data);
      $this->session->set_flashdata('update', "Data Sukses Di perbarui");

      redirect(base_url("ms_pengungsian/detail/$id"));
    }


    function delete_detail($id){
      //  die($id.'__'.$table);
      $idtblpengungsian= md5($this->db->get_where("tblpengungsian_detail", array("md5(id)"=>$id))->row('idtblpengungsian'));
      // die($id_md5.'___'.$id);
      $this->db->where('md5(id)', $id);
      $this->db->update("tblpengungsian_detail", array("flag" => '1'));

      $this->session->set_flashdata('delete', 'Data Sukses di hapus');
      redirect(base_url("ms_pengungsian/detail/$idtblpengungsian"));

    }


  }

?>
