<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ms_group extends MY_Controller {
    //private $elos;

    public function __construct(){
        parent::__construct();
        $this->load->model('ms_model', '_ms');
        //$this->elos = 'elos';
    }

    public function index()
    {
      // echo $this->create.'____'.$this->update.'____'.$this->delete;
      // die();
        $data['akses'] = $this->akses_array;
        $this->load->view('v_ms_group', $data);
    }

    function proses(){
      // die(print_r($this->input->post()));
      $deskripsi = $this->input->post("deskripsi");
      $nama = $this->input->post("nama");
      $aksi = $this->input->post("action");
      $id = $this->input->post("id");

      $data = array(
        "nama" => $nama,
        "deskripsi" => $deskripsi,
        "create_date" => date("Y-m-d H:i:s")
      );
      if ($aksi == 'tambah') {
        $this->db->insert("tblgroup", $data);
        $this->session->set_flashdata('insert', "Data $nama Sukses Di Masukan");
      }else{
        $this->db->where("idtblgroup", $id);
        $this->db->update("tblgroup", $data);
        $this->session->set_flashdata('update', "Data $nama Sukses Di perbarui");
      }

      redirect(base_url("ms_group"));
    }

    function get_group(){
      $search = $this->input->post("search")['value'];
      $datax = $this->_ms->get_data($search, "tblgroup")->result();
		  $data = array();

      foreach ($datax as $rows){
        $row = array();
        $row[] = $rows->nama;
        $row[] = $rows->deskripsi;
        $row[] = $rows->flag == '0' ? 'Aktif' : 'Tidak Aktif';
        $row[] = '<a href="'.base_url().'ms_group/akses/'.md5($rows->idtblgroup).'" class="light-green darken-4 btn-small btn"><i class="mdi-action-account-child right"></i>&nbsp; Hak Akses</a>';
        if($this->akses_array["update"] == '1'){
          $row[3] .= '<a href="#" class="blue btn-small btn btn-edit" data-nama="'.$rows->nama.'" data-deskripsi="'.$rows->deskripsi.'" data-id="'.md5($rows->idtblgroup).'"><i class="mdi-editor-border-color right"></i>&nbsp; Ubah</a>';
        }
        if($this->akses_array["delete"] == '1' ){
          if ($rows->flag == '0') {
            $row[3] .= '<a href="'.base_url().'ms_group/delete/'.md5($rows->idtblgroup).'" data-nama="'.$rows->nama.'" class="btn-small btn link_delete"><i class="right mdi-navigation-cancel"></i>Hapus</a> </div>';
          }else{
            $row[3] .= '<a href="'.base_url().'ms_group/active/'.md5($rows->idtblgroup).'" data-nama="'.$rows->nama.'" data-status="aktif" class="btn-small btn link_delete"> <i class="right mdi-action-done"></i> Aktivasi</a> </div>';
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
      $this->db->where('md5(idtblgroup)', $id);
      $this->db->update('tblgroup', array("flag" => "0"));

      $this->session->set_flashdata('insert', 'Data Sukses di aktivasi');
      redirect(base_url("ms_group"));
    }

    function akses($id){
      $data['akses'] = $this->db->get_where("admin_access", array("md5(idtblgroup)" => $id))->result();
      $data['menux'] = $this->db->get_where("tblmenu", array("flag" => "0"))->result();
      $data['id_md5'] = $id;
      // die(print_r($data));
      $this->load->view("v_akses", $data);
    }

    function proses_akses(){
      // die(print_r($this->input->post()));
      $id_md5 = $this->input->post("id_md5");
      $idtblgroup = $this->db->get_where("tblgroup", array("md5(idtblgroup)"=>$id_md5))->row("idtblgroup");
      $this->db->where("md5(idtblgroup)", $id_md5);
      $this->db->delete("admin_access");

      $x = 0;
      foreach($this->input->post() as $i => $item) {
        $aksi = $i[0];
        if($aksi != 'i'){
          $idtblmenu = substr($i, 1);
          if ($aksi == 'v') {
            $where = 'view';
          }elseif($aksi == 'a'){
            $where = 'add';
          }elseif($aksi == 'e'){
            $where = 'update';
          }elseif($aksi == 'd'){
            $where = 'delete';
          }
          // echo $aksi.'<br />';
          $cek = $this->db->get_where("admin_access", array("idtblgroup" => $idtblgroup, "idtblmenu" => $idtblmenu))->row();
          if($cek == array()){
            $this->db->insert("admin_access", array(
              'idtblgroup' => $idtblgroup,
              "idtblmenu" => $idtblmenu,
              $where => "1"
            ));
          }else{
            $this->db->where(array("idtblgroup" => $idtblgroup, "idtblmenu" => $idtblmenu));
            $this->db->update("admin_access", array($where => "1"));
          }
        }
      }
      // die();
      $this->session->set_flashdata('insert', 'Data akses Berhasil di ubah');
      redirect(base_url("ms_group"));

    }



    function delete($id){
      $this->db->where('md5(idtblgroup)', $id);
      $this->db->update("tblgroup", array("flag" => '1'));

      $this->session->set_flashdata('delete', 'Data Sukses di hapus');
      redirect(base_url("ms_group"));

    }
  }

?>
