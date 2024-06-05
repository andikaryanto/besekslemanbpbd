<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ms_kk extends MY_Controller {
    public function __construct(){
        parent::__construct();
        $this->load->model('ms_model', '_ms');
    }

    public function index()
    {
        $data['agama'] = $this->db->get_where("tblagama", array("flag" => '0'))->result();
        // $data['krb'] = $this->db->get_where("tblkrb", array("flag" => '0'))->result();
        $data['kelurahan'] = $this->db->get("tblkelurahan")->result();
        // $data['desa'] = $this->db->get_where("tbldesa", array("flag" => '0'))->result();
        $data['akses'] = $this->akses_array;
        $this->load->view('v_ms_kk', $data);
    }

    function proses_tambah(){
      $nama = $this->input->post("nama");
      $kelurahan = $this->input->post("kelurahan");
      $nokk = $this->input->post("nokk");
      $dusun = $this->input->post("desa");
      $jenis_kelamin = $this->input->post("jenis_kelamin");
      $rt = $this->input->post("rt");
      $rw = $this->input->post("rw");
      $kewarganegaraan = $this->input->post("kewarganegaraan");
      // $krb = $this->input->post("krb");
      $ktp = $this->input->post("ktp");
      $pekerjaan = $this->input->post("pekerjaan");
      $agama = $this->input->post("agama");
      $tempat_lahir = $this->input->post("tempat_lahir");
      $tanggal_lahir = date("Y-m-d", strtotime($this->input->post("tanggal_lahir")));
	  // echo $tanggal_lahir;
	  // die(print_r($this->input->post()));
      
      $this->input->post("disabilitas") == '' ? $disabilitas = '0' : $disabilitas = '1';
      // die($tanggal_lahir);
      $status = $this->input->post("status");
      $status_kawin = $this->input->post("status_kawin");
      $deskripsi = $this->input->post("deskripsi");

      $data = array(
        "nokk" => $nokk,
        "nama" => $nama,
        "ktp" => $ktp,
        "tempat_lahir" => $tempat_lahir,
        "tanggal_lahir" => $tanggal_lahir,
        "idtblagama" => $agama,
        "status_kawin" => $status_kawin,
        "pekerjaan" => $pekerjaan,
        "jenis_kelamin" => $jenis_kelamin,
        "kewarganegaraan" => $kewarganegaraan,
        "kelurahan" => $kelurahan,
        "rt" => $rt,
        "rw" => $rw,
        "idtbldusun" => $dusun,
        "status" => $status,
        "deskripsi" => $deskripsi,
        'disabilitas' => $disabilitas,
        "create_time" => date("Y-m-d H:i:s")
      );
      $this->db->insert("tblkk", $data);
      $this->session->set_flashdata('insert', "Data $nama Sukses Di Masukan");
      // die("asd");
      redirect(base_url("ms_kk"));
    }

    public function get_desa(){
      $id_kel = $this->input->post('idkel');

      $json_response = $this->db->get_where('tbldusun', array('id_kel'=>$id_kel))->result();
      foreach ($json_response as $rows){
          echo "<option value='$rows->idtbldusun'> $rows->nama </option>";
      }
    }

    function get_kk(){
      $search = $this->input->post("search")['value'];
      $datax = $this->_ms->get_data($search, "tblkk")->result();
		  $data = array();

      foreach ($datax as $rows){
        $row = array();
        $row[] = $rows->nokk;
        $row[] = $rows->nama;
        $row[] = $rows->flag == '0' ? 'Aktif' : 'Tidak Aktif';
        $row[] = '<div style="margin-left: 20px;" class="btn-group"> <a href="'.base_url().'ms_kk/detail/'.md5($rows->idtblkk).'" class="light-green darken-4 btn-small btn "><i class="mdi-action-account-child right"></i>&nbsp; Anggota KK</a>';
        if($this->akses_array['update'] == '1'){
        $row[3] .= '<a href="'.base_url().'ms_kk/edit/'.md5($rows->idtblkk).'" class="blue btn btn-small"><i class="mdi-editor-border-color right"></i>&nbsp; Ubah</a>';
        }
        if($this->akses_array['delete'] == '1'){
          if ($rows->flag == '0') {
            $row[3] .= '<a href="'.base_url().'ms_kk/delete/'.md5($rows->idtblkk).'" data-nama="'.$rows->nama.'" class="btn-small btn link_delete"><i class="right mdi-navigation-cancel"></i>Hapus</a> </div>';
          }else{
            $row[3] .= '<a href="'.base_url().'ms_kk/active/'.md5($rows->idtblkk).'" data-nama="'.$rows->nama.'" data-status="aktif" class="btn-small btn link_delete"> <i class="right mdi-action-done"></i> Aktivasi</a> </div>';
          }
        }

        $data[] = $row;
			}

      $output = array(
        "data" => $data
      );

      echo json_encode($output);
    }

    function edit($id_md5){
      $data["data"] = $this->db->get_where("tblkk", array("md5(idtblkk)" => $id_md5))->row();
      $data['dusun'] = $this->db->get_where("tbldusun", array("id_kel" => $data["data"]->kelurahan))->result();
      // die(print_r($data));
      $data['agama'] = $this->db->get_where("tblagama", array("flag" => '0'))->result();
      $data['krb'] = $this->db->get_where("tblkrb", array("flag" => '0'))->result();
      $data['kelurahan'] = $this->db->get("tblkelurahan")->result();
      $this->load->view("v_ms_kk_e", $data);
    }

    function edit_detail_anggota($id_md5){
      $data["data"] = $this->db->get_where("tblkk_detail", array("md5(id)" => $id_md5))->row();
      $data['agama'] = $this->db->get_where("tblagama", array("flag" => '0'))->result();
      $data['krb'] = $this->db->get_where("tblkrb", array("flag" => '0'))->result();
      $data['kelurahan'] = $this->db->get("tblkelurahan")->result();
      $this->load->view("v_ms_kk_det_e", $data);
    }
    function edit_ternak($id_md5){
      $data["data"] = $this->db->get_where("tblkk_detail", array("md5(id)" => $id_md5))->row();
      $data["nama"] = $this->db->get_where("tblternak", array("idtblternak" => $data["data"]->idtblternak))->row("nama");
      $data['ternak'] = $this->db->get("tblternak")->result();
      $this->load->view("v_ms_kk_ternak", $data);
    }

    function detail($id_md5){
      $data["data"] = $this->db->get_where("tblkk", array("md5(idtblkk)" => $id_md5))->row();
      $data['agama'] = $this->db->get_where("tblagama", array("flag" => '0'))->result();
      $data['krb'] = $this->db->get_where("tblkrb", array("flag" => '0'))->result();
      $data['kelurahan'] = $this->db->get("tblkelurahan")->result();
      $data['ternak'] = $this->db->get_where("tblternak")->result();
      $data['detail'] = $this->_ms->data_kk_detail($id_md5)->result();
      $this->load->view("v_ms_kk_det", $data);
    }

    function proses_anggota(){
      // die(print_r($this->input->post()));
      $action = $this->input->post("action");
      $nama = $this->input->post("nama");
      $ternak = $this->input->post("ternak");
      $jml_ternak = $this->input->post("jml_ternak");
      $status = $this->input->post("status");
      $jenis_kelamin = $this->input->post("jenis_kelamin");
      $ktp = $this->input->post("ktp");
      $pekerjaan = $this->input->post("pekerjaan");
      $agama = $this->input->post("agama");
      $tempat_lahir = $this->input->post("tempat_lahir");
      $tanggal_lahir = date("Y-m-d", strtotime($this->input->post("tanggal_lahir")));
      $status_kawin = $this->input->post("status_kawin");
      $kewarganegaraan = $this->input->post("kewarganegaraan");
      $deskripsi = $this->input->post("deskripsi");
      $type = $this->input->post("type");
      $this->input->post("disabilitas") == '' ? $disabilitas = '0' : $disabilitas = '1';

      $id_md5 = $this->input->post("id");
      $id_kk = $this->db->get_where("tblkk", array("md5(idtblkk)" => $id_md5))->row("idtblkk");
      // die($id_kk);
      $data = array(
        "nama" => $nama,
        "idtblternak" => $ternak,
        "jml_ternak" => $jml_ternak,
        "ktp" => $ktp,
        "tempat_lahir" => $tempat_lahir,
        "tanggal_lahir" => $tanggal_lahir,
        "status" => $status,
        "idtblagama" => $agama,
        "status_kawin" => $status_kawin,
        "pekerjaan" => $pekerjaan,
        "jenis_kelamin" => $jenis_kelamin,
        "kewarganegaraan" => $kewarganegaraan,
        "deskripsi" => $deskripsi,
        "disabilitas" => $disabilitas,
        "create_time" => date("Y-m-d H:i:s"),
      );

      if ($type == '1') { //tambah Anggota keluarga
        if ($action == 'tambah') {
          $data["idtblkk"] = $id_kk; $data["type"] = '1';
          $this->db->insert("tblkk_detail", $data);
          $this->session->set_flashdata('insert', "Data $nama Sukses Di Masukan");
        }else{
          $this->db->where("md5(id)", $id_md5); //jika dia ubah, id_md5 berasal dari id detail;
          $this->db->update("tblkk_detail", $data);
          $id_tblkk = $this->db->get_where("tblkk_detail", array("md5(id)" => $id_md5))->row("idtblkk");
          $id_md5 = md5($id_tblkk); //untuk redirect
          // echo $id_md5.'___'.$id_tblkk;
          // die();
          $this->session->set_flashdata('update', "Data $nama Sukses Di Perbarui");
        }
      }else{ // tambah ternak
        if ($action == 'tambah') {
          $cek = $this->db->get_where("tblkk_detail", array("idtblkk" => $id_kk, 'idtblternak' =>$ternak ))->row();
          if ($cek == array()) {
            $data["idtblkk"] = $id_kk; $data["type"] = '2';
            $this->db->insert("tblkk_detail", $data);
            $this->session->set_flashdata('insert', "Data $nama Sukses Di Masukan");
          }else{
            $jml_ternak = $jml_ternak + $cek->jml_ternak;
            $this->db->where(array("id" => $cek->id, "idtblkk" => $id_kk));
            $this->db->update("tblkk_detail", array("jml_ternak" => $jml_ternak));
            $this->session->set_flashdata('insert', "Data $nama Sukses Di Perbarui");
          }
        }else{
          $this->db->where("md5(id)", $id_md5); //jika dia ubah, id_md5 berasal dari id detail;
          $this->db->update("tblkk_detail", $data);
          $id_tblkk = $this->db->get_where("tblkk_detail", array("md5(id)" => $id_md5))->row("idtblkk");
          $id_md5 = md5($id_tblkk);
          $this->session->set_flashdata('update', "Data $nama Sukses Di Perbarui");
        }
      }


      redirect(base_url("ms_kk/detail/$id_md5"));
      // $this->detail($id_md5);
    }

    function proses_edit_anggota(){
      die(print_r($this->input->post()));
    }

    function active($id){
      $this->db->where('md5(idtblkk)', $id);
      $this->db->update('tblkk', array("flag" => "0"));

      $this->session->set_flashdata('insert', 'Data Sukses di aktivasi');
      redirect(base_url("ms_kk"));
    }


    function proses_edit(){
      // die(print_r($this->input->post()));
      $nama = $this->input->post("nama");
      $kelurahan = $this->input->post("kelurahan");
      $nokk = $this->input->post("nokk");
      $dusun = $this->input->post("desa");
      $jenis_kelamin = $this->input->post("jenis_kelamin");
      $rt = $this->input->post("rt");
      $rw = $this->input->post("rw");
      $kewarganegaraan = $this->input->post("kewarganegaraan");
      $krb = $this->input->post("krb");
      $ktp = $this->input->post("ktp");
      $pekerjaan = $this->input->post("pekerjaan");
      $agama = $this->input->post("agama");
      $tempat_lahir = $this->input->post("tempat_lahir");
      $tanggal_lahir = date("Y-m-d", strtotime($this->input->post("tanggal_lahir")));
      // die($tanggal_lahir);
      $status = $this->input->post("status");
      $status_kawin = $this->input->post("status_kawin");
      $deskripsi = $this->input->post("deskripsi");

      $id = $this->input->post("id");

      $data = array(
        "nokk" => $nokk,
        "nama" => $nama,
        "ktp" => $ktp,
        "tempat_lahir" => $tempat_lahir,
        "tanggal_lahir" => $tanggal_lahir,
        "idtblagama" => $agama,
        "status_kawin" => $status_kawin,
        "pekerjaan" => $pekerjaan,
        "jenis_kelamin" => $jenis_kelamin,
        "kewarganegaraan" => $kewarganegaraan,
        "kelurahan" => $kelurahan,
        "rt" => $rt,
        "rw" => $rw,
        "idtbldusun" => $dusun,
        "status" => $status,
        "deskripsi" => $deskripsi,
        "create_time" => date("Y-m-d H:i:s")
      );

      $this->db->where("md5(idtblkk)", $id);
      $this->db->update("tblkk", $data);

      $this->session->set_flashdata('update', "Data $nama Sukses Di Perbarui");
      redirect(base_url("ms_kk"));
    }

    function delete($id){
      $this->db->where('md5(idtblkk)', $id);
      $this->db->update("tblkk", array("flag" => '1'));

      $this->session->set_flashdata('delete', 'Data Sukses di hapus');
      redirect(base_url("ms_kk"));
    }

    function delete_anggota($id_md5){
      $id_tblkk = $this->db->get_where("tblkk_detail", array("md5(id)" => $id_md5))->row("idtblkk");

      $this->db->where('md5(id)', $id_md5);
      $this->db->delete("tblkk_detail");

      $id_md5 = md5($id_tblkk); //untuk redirect
      $this->session->set_flashdata('delete', 'Data Sukses di hapus');
      redirect(base_url("ms_kk/detail/$id_md5"));
    }
    function delete_ternak($id_md5){
      $id_tblkk = $this->db->get_where("tblkk_detail", array("md5(id)" => $id_md5))->row("idtblkk");

      $this->db->where('md5(id)', $id_md5);
      $this->db->delete("tblkk_detail");

      $id_md5 = md5($id_tblkk); //untuk redirect
      $this->session->set_flashdata('delete', 'Data Sukses di hapus');
      redirect(base_url("ms_kk/detail/$id_md5"));
    }
  }

?>
