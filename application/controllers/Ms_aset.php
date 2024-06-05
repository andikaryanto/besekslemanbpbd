<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ms_aset extends MY_Controller {
    public function __construct(){
        parent::__construct();
        $this->load->model('ms_model', '_ms');
    }

    public function index()
    {
      $data['akses'] = $this->akses_array;
        $this->load->view('v_ms_aset', $data);
    }

    function proses_tambah(){
      // die(print_r($this->input->post()));
      $deskripsi = $this->input->post("deskripsi");
      $nama = $this->input->post("nama");

      $data = array(
        "nama" => $nama,
        "deskripsi" => $deskripsi,
        "create_date" => date("Y-m-d H:i:s")
      );
      $this->db->insert("tblaset", $data);
      $this->session->set_flashdata('insert', "Data $nama Sukses Di Masukan");

      redirect(base_url("ms_aset"));
    }

    function get_aset(){
      $search = $this->input->post("search")['value'];
      $datax = $this->_ms->get_data($search, "tblaset")->result();
		  $data = array();

      foreach ($datax as $rows){
        $row = array();
        $row[] = $rows->nama;
        $row[] = $rows->deskripsi;
        $row[] = $rows->flag == '0' ? 'Aktif' : 'Tidak Aktif';

        if($this->akses_array['update'] == '1'){
          $row[3] = '
          <a href="#" class="blue btn-small btn btn-edit" data-nama="'.$rows->nama.'" data-deskripsi="'.$rows->deskripsi.'" data-id="'.md5($rows->idtblaset).'"><i class="mdi-editor-border-color right"></i>&nbsp; Ubah</a>';
        }
        if($this->akses_array['delete'] == '1'){
          if ($rows->flag == '0') {
            $row[3] .= '<a href="'.base_url().'ms_aset/delete/'.md5($rows->idtblaset).'" data-nama="'.$rows->nama.'" class="btn-small btn link_delete"><i class="right mdi-navigation-cancel"></i>Hapus</a> </div>';
          }else{
            $row[3] .= '<a href="'.base_url().'ms_aset/active/'.md5($rows->idtblaset).'" data-nama="'.$rows->nama.'" data-status="aktif" class="btn-small btn link_delete"> <i class="right mdi-action-done"></i> Aktivasi</a> </div>';
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
      $this->db->where('md5(idtblaset)', $id);
      $this->db->update('tblaset', array("flag" => "0"));

      $this->session->set_flashdata('insert', 'Data Sukses di aktivasi');
      redirect(base_url("ms_aset"));
    }


    function proses_edit(){
      $nama = $this->input->post("nama");
      $deskripsi = $this->input->post("deskripsi");
      $id = $this->input->post("id");

      $data = array("nama" => $nama, "deskripsi" => $deskripsi);
      $this->db->where("md5(idtblaset)", $id);
      $this->db->update("tblaset", $data);

      $this->session->set_flashdata('update', "Data $nama Sukses Di Perbarui");
      redirect(base_url("ms_aset"));
    }

    function delete($id){
      $this->db->where('md5(idtblaset)', $id);
      $this->db->update("tblaset", array("flag" => '1'));

      $this->session->set_flashdata('delete', 'Data Sukses di hapus');
      redirect(base_url("ms_aset"));

    }
  }

?>
