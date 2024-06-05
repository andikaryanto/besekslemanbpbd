<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ms_instansi extends MY_Controller {
    public function __construct(){
        parent::__construct();
        $this->load->model('ms_model', '_ms');
    }

    public function index()
    {
        $data['akses'] = $this->akses_array;
        $this->load->view('v_ms_instansi', $data);
    }

    function proses_tambah(){
      // die(print_r($this->input->post()));
      $deskripsi = $this->input->post("deskripsi");
      $nama = $this->input->post("nama");
      $alamat = $this->input->post("alamat");
      $telp = $this->input->post("telp");

      $data = array(
        "nama" => $nama,
        "deskripsi" => $deskripsi,
        "tlpn" => $telp,
        "alamat" => $alamat,
        "create_date" => date("Y-m-d H:i:s")
      );
      $this->db->insert("tblinstansi", $data);
      $this->session->set_flashdata('insert', "Data $nama Sukses Di Masukan");

      redirect(base_url("ms_instansi"));
    }

    function get_instansi(){
      $search = $this->input->post("search")['value'];
      $datax = $this->_ms->get_data($search, "tblinstansi")->result();
		  $data = array();

      foreach ($datax as $rows){
        $row = array();
        $row[] = $rows->nama;
        $row[] = $rows->tlpn;
        $row[] = $rows->alamat;
        $row[] = $rows->deskripsi;
        $row[] = $rows->tampil == '0' ? 'Aktif' : 'Tidak Aktif';
        $row[] = $rows->flag == '1' ? 'Tampil' : 'Tidak Tampil';
        if($this->akses_array['update'] == '1'){
          $row[6] = '<a href="#" class="blue btn-small btn btn-edit" data-nama="'.$rows->nama.'" data-deskripsi="'.$rows->deskripsi.'" data-alamat="'.$rows->alamat.'" data-tlpn="'.$rows->tlpn.'" data-id="'.md5($rows->idtblinstansi).'"><i class="mdi-editor-border-color right"></i>&nbsp; Ubah</a>';
        }
         if($this->akses_array['delete'] == '1'){
          if ($rows->tampil == '0') {
            $row[6] .= '<a href="'.base_url().'ms_instansi/delet/'.md5($rows->idtblinstansi).'" data-nama="'.$rows->nama.'" data-status="hapus" class="btn-small btn link_delet"><i class="right mdi-navigation-cancel"></i>Hapus</a> </div>';
          }else{
            $row[6] .= '<a href="'.base_url().'ms_instansi/aktip/'.md5($rows->idtblinstansi).'" data-nama="'.$rows->nama.'" data-status="aktif" class="btn-small btn link_delet"> <i class="right mdi-action-done"></i> Aktivasi</a> </div>';
          }
        }
        if($this->akses_array['delete'] == '1'){
          if ($rows->flag == '1') {
            $row[6] .= '<a href="'.base_url().'ms_instansi/delete/'.md5($rows->idtblinstansi).'" data-nama="'.$rows->nama.'" data-status="sembunyi" class="btn-small btn link_delete"><i class="right mdi-navigation-cancel"></i>Sembunyi</a> </div>';
          }else{
            $row[6] .= '<a href="'.base_url().'ms_instansi/active/'.md5($rows->idtblinstansi).'" data-nama="'.$rows->nama.'" data-status="tampil" class="btn-small btn link_delete"> <i class="right mdi-action-done"></i> Tampil</a> </div>';
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
      $this->db->where('md5(idtblinstansi)', $id);
      $this->db->update('tblinstansi', array("flag" => "1"));

      $this->session->set_flashdata('insert', 'Data Sukses di Tampilkan');
      redirect(base_url("ms_instansi"));
    }

    function aktip($id){
      $this->db->where('md5(idtblinstansi)', $id);
      $this->db->update('tblinstansi', array("tampil" => "0"));

      $this->session->set_flashdata('insert', 'Data Sukses di aktivasi');
      redirect(base_url("ms_instansi"));
    }



    function proses_edit(){
      $nama = $this->input->post("nama");
      $deskripsi = $this->input->post("deskripsi");
      $tlpn = $this->input->post("telp");
      $alamat = $this->input->post("alamat");
      $id = $this->input->post("id");

      $data = array("nama" => $nama, "deskripsi" => $deskripsi, 'tlpn' => $tlpn, 'alamat' => $alamat);
      $this->db->where("md5(idtblinstansi)", $id);
      $this->db->update("tblinstansi", $data);

      $this->session->set_flashdata('update', "Data $nama Sukses Di Perbarui");
      redirect(base_url("ms_instansi"));
    }

    function delete($id){
      $this->db->where('md5(idtblinstansi)', $id);
      $this->db->update("tblinstansi", array("flag" => '0'));

      $this->session->set_flashdata('Sembunyi', 'Data Sukses di Sembunyikan');
      redirect(base_url("ms_instansi"));

    }

    function delet($id){
      $this->db->where('md5(idtblinstansi)', $id);
      $this->db->update("tblinstansi", array("tampil" => '1'));

      $this->session->set_flashdata('delet', 'Data Sukses di hapus');
      redirect(base_url("ms_instansi"));

    }
  }

?>
