<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ms_dampak extends MY_Controller {
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
        $this->load->view('v_ms_dampak', $data);
    }

    function proses(){
      // die(print_r($this->input->post()));
      $satuan = $this->input->post("satuan");
      $nama = $this->input->post("nama");
      $aksi = $this->input->post("action");
      $id = $this->input->post("id");

      $data = array(
        "nama" => $nama,
        "satuan" => $satuan,
        "create_date" => date("Y-m-d H:i:s")
      );
      if ($aksi == 'tambah') {
        $this->db->insert("tbldampak", $data);
        $this->session->set_flashdata('insert', "Data $nama Sukses Di Masukan");
      }else{
        $this->db->where("idtbldampak", $id);
        $this->db->update("tbldampak", $data);
        $this->session->set_flashdata('update', "Data $nama Sukses Di perbarui");
      }

      redirect(base_url("ms_dampak"));
    }

    function get_dampak(){
      $search = $this->input->post("search")['value'];
      $datax = $this->_ms->get_data($search, "tbldampak")->result();
		  $data = array();

      foreach ($datax as $rows){
        $row = array();
        $row[] = $rows->nama;
        $row[] = $rows->satuan;
        $row[] = $rows->flag == '0' ? 'Aktif' : 'Tidak Aktif';
        $row[] = '';
        if($this->akses_array["update"] == '1'){
          $row[3] .= '<a href="#" class="blue btn-small btn btn-edit" data-nama="'.$rows->nama.'" data-satuan="'.$rows->satuan.'" data-id="'.md5($rows->idtbldampak).'"><i class="mdi-editor-border-color right"></i>&nbsp; Ubah</a>';
        }
        if($this->akses_array["delete"] == '1' ){
          if ($rows->flag == '0') {
            $row[3] .= '<a href="'.base_url().'ms_dampak/delete/'.md5($rows->idtbldampak).'" data-nama="'.$rows->nama.'" class="btn-small btn link_delete"><i class="right mdi-navigation-cancel"></i>Hapus</a> </div>';
          }else{
            $row[3] .= '<a href="'.base_url().'ms_dampak/active/'.md5($rows->idtbldampak).'" data-nama="'.$rows->nama.'" data-status="aktif" class="btn-small btn link_delete"> <i class="right mdi-action-done"></i> Aktivasi</a> </div>';
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
      $this->db->where('md5(idtbldampak)', $id);
      $this->db->update('tbldampak', array("flag" => "0"));

      $this->session->set_flashdata('insert', 'Data Sukses di aktivasi');
      redirect(base_url("ms_dampak"));
    }

    function akses($id){
      $data['akses'] = $this->db->get_where("admin_access", array("md5(idtbldampak)" => $id))->result();
      $data['menux'] = $this->db->get_where("tblmenu", array("flag" => "0"))->result();
      $data['id_md5'] = $id;
      // die(print_r($data));
      $this->load->view("v_akses", $data);
    }

    function proses_akses(){
      // die(print_r($this->input->post()));
      $id_md5 = $this->input->post("id_md5");
      $idtbldampak = $this->db->get_where("tbldampak", array("md5(idtbldampak)"=>$id_md5))->row("idtbldampak");
      $this->db->where("md5(idtbldampak)", $id_md5);
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
          $cek = $this->db->get_where("admin_access", array("idtbldampak" => $idtbldampak, "idtblmenu" => $idtblmenu))->row();
          if($cek == array()){
            $this->db->insert("admin_access", array(
              'idtbldampak' => $idtbldampak,
              "idtblmenu" => $idtblmenu,
              $where => "1"
            ));
          }else{
            $this->db->where(array("idtbldampak" => $idtbldampak, "idtblmenu" => $idtblmenu));
            $this->db->update("admin_access", array($where => "1"));
          }
        }
      }
      // die();
      $this->session->set_flashdata('insert', 'Data akses Berhasil di ubah');
      redirect(base_url("ms_dampak"));

    }



    function delete($id){
      $this->db->where('md5(idtbldampak)', $id);
      $this->db->update("tbldampak", array("flag" => '1'));

      $this->session->set_flashdata('delete', 'Data Sukses di hapus');
      redirect(base_url("ms_dampak"));

    }
  }

?>
