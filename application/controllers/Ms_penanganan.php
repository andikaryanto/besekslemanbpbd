<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class ms_penanganan extends MY_Controller {
    public function __construct(){
        parent::__construct();
        $this->load->model('ms_model', '_ms');
    }

    public function index()
    {
      // die(print_r($this->akses_array));
      $data['akses'] = $this->akses_array;
      $this->load->view('v_ms_penanganan', $data);
    }

    function proses(){
      // die(print_r($this->input->post()));
      $nama = $this->input->post("nama");
      $deskripsi = $this->input->post("deskripsi");
      $who = $this->input->post("idtbluser");
      $aksi = $this->input->post("action");
      $id = $this->input->post("id");

      $data = array(
        "nama" => $nama,
        "deskripsi" => $deskripsi,
        "create_user" => $who,
        "create_time" => date("Y-m-d H:i:s")
      );
      if ($aksi == 'tambah') {
        $this->db->insert("tblpenanganan", $data);
        $this->session->set_flashdata('insert', "Data $nama Sukses Di Masukan");
      }else{
        $this->db->where("idpenanganan", $id);
        $this->db->update("tblpenanganan", $data);
        $this->session->set_flashdata('update', "Data $nama Sukses Di perbarui");
      }

      redirect(base_url("ms_penanganan"));
    }

    function get_penanganan(){
      $search = $this->input->post("search")['value'];
      $datax = $this->_ms->get_data($search, "tblpenanganan")->result();
		  $data = array();
      // die($this->update.'___'.$this->delete);
      foreach ($datax as $rows){
        $row = array();
        $row[] = $rows->nama;
        $row[] = $rows->deskripsi;
        $row[] = $rows->flag == '0' ? 'Aktif' : 'Tidak Aktif';
        if($this->akses_array['update'] == '1'){
          $row[] = '
          <a href="#" class="blue btn-small btn btn-edit" data-nama="'.$rows->nama.'" data-deskripsi="'.$rows->deskripsi.'" data-id="'.md5($rows->idpenanganan).'"><i class="mdi-editor-border-color right"></i>&nbsp; Ubah</a>';
        }
        if($this->akses_array['delete'] == '1'){
          if ($rows->flag == '0') {
            $row[3] .= '<a href="'.base_url().'ms_penanganan/delete/'.md5($rows->idpenanganan).'" data-nama="'.$rows->nama.'" class="btn-small btn link_delete"><i class="right mdi-navigation-cancel"></i>Hapus</a> </div>';
          }else{
            $row[3] .= '<a href="'.base_url().'ms_penanganan/active/'.md5($rows->idpenanganan).'" data-nama="'.$rows->nama.'" data-status="aktif" class="btn-small btn link_delete"> <i class="right mdi-action-done"></i> Aktivasi</a> </div>';
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
      $this->db->where('md5(idpenanganan)', $id);
      $this->db->update('tblpenanganan', array("flag" => "0"));

      $this->session->set_flashdata('insert', 'Data Sukses di aktivasi');
      redirect(base_url("ms_penanganan"));
    }


    function proses_edit(){
      $nama = $this->input->post("nama");
      $deskripsi = $this->input->post("deskripsi");
      $id = $this->input->post("id");

      $data = array("nama" => $nama, "deskripsi" => $deskripsi);
      $this->db->where("md5(idpenanganan)", $id);
      $this->db->update("tblpenanganan", $data);

      $this->session->set_flashdata('update', "Data $nama Sukses Di Perbarui");
      redirect(base_url("ms_penanganan"));
    }

    function delete($id){
      $this->db->where('md5(idpenanganan)', $id);
      $this->db->update("tblpenanganan", array("flag" => '1'));

      $this->session->set_flashdata('delete', 'Data Sukses di hapus');
      redirect(base_url("ms_penanganan"));

    }
  }

?>
