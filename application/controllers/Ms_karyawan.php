<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ms_karyawan extends MY_Controller {
    public function __construct(){
        parent::__construct();
        $this->load->model('ms_model', '_ms');
    }

    public function index()
    {
        $data['akses'] = $this->akses_array;
        $this->load->view('v_ms_karyawan', $data);
    }

    function proses_tambah(){
     //die(print_r($this->input->post()));
      $nama = $this->input->post("nama");
      $telephone = $this->input->post("telephone");
      $alamat = $this->input->post("alamat");
      $nip = $this->input->post("nip");
      $jabatan = $this->input->post("jabatan");
      $golongan = $this->input->post("golongan");
      $departemen = $this->input->post("departemen");
      $keterangan = $this->input->post("keterangan");
     
      $data = array(
        "nama" => $nama,
        "telephone" => $telephone,
        "alamat" => $alamat,
        "nip"=> $nip,
        "jabatan"=> $jabatan, 
        "golongan"=> $golongan,
        "departemen"=> $departemen, 
        "keterangan" => $keterangan);
        
      $this->db->insert("tblkaryawan", $data);
      $this->session->set_flashdata('insert', "Data $nama Sukses Di Masukan");

      redirect(base_url("ms_karyawan"));
    }

    function get_karyawan(){
      $search = $this->input->post("search")['value'];
      $datax = $this->_ms->get_data($search, "tblkaryawan")->result();
		  $data = array();

      foreach ($datax as $rows){
        $row = array();
        $row[] = $rows->nama;
        $row[] = $rows->telephone;
        $row[] = $rows->alamat;
        $row[] = $rows->nip;
        $row[] = $rows->jabatan;
        $row[] = $rows->golongan;
        $row[] = $rows->departemen;
        $row[] = $rows->keterangan;
        $row[] = $rows->flag == '0' ? 'Aktif' : 'Tidak Aktif';
        if($this->akses_array['update'] == '1'){
          $row[9] = '<a href="#" class="blue btn-small btn btn-edit" data-nama="'.$rows->nama.'" data-telephone="'.$rows->telephone.'" data-alamat="'.$rows->alamat.'" data-nip="'.$rows->nip.'" data-jabatan="'.$rows->jabatan.'" data-golongan="'.$rows->golongan.'" data-departemen="'.$rows->departemen.'" data-keterangan="'.$rows->keterangan.'" data-id="'.md5($rows->idtblkaryawan).'"><i class="mdi-editor-border-color right"></i>&nbsp; Ubah</a>';
        }
        if($this->akses_array['delete'] == '1'){
          if ($rows->flag == '0') {
            $row[9] .= '<a href="'.base_url().'ms_karyawan/delete/'.md5($rows->idtblkaryawan).'" data-nama="'.$rows->nama.'" class="btn-small btn link_delete"><i class="right mdi-navigation-cancel"></i>Hapus</a> </div>';
          }else{
            $row[9] .= '<a href="'.base_url().'ms_karyawan/active/'.md5($rows->idtblkaryawan).'" data-nama="'.$rows->nama.'" data-status="aktif" class="btn-small btn link_delete"> <i class="right mdi-action-done"></i> Aktivasi</a> </div>';
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
      $this->db->where('md5(idtblkaryawan)', $id);
      $this->db->update('tblkaryawan', array("flag" => "0"));

      $this->session->set_flashdata('insert', 'Data Sukses di aktivasi');
      redirect(base_url("ms_karyawan"));
    }


    function proses_edit(){
      $nama = $this->input->post("nama");
      $telephone = $this->input->post("telephone");
      $alamat = $this->input->post("alamat");
      $nip = $this->input->post("nip");
      $jabatan = $this->input->post("jabatan");
      $golongan = $this->input->post("golongan");
      $departemen = $this->input->post("departemen");
      $keterangan = $this->input->post("keterangan");
      $id = $this->input->post("id");

      $data = array("nama" => $nama, 'telephone' => $telephone, 'alamat' => $alamat, 'nip' => $nip,  'jabatan' => $jabatan, 'golongan' => $golongan, 'departemen' => $departemen, "keterangan" => $keterangan);
      $this->db->where("md5(idtblkaryawan)", $id);
      $this->db->update("tblkaryawan", $data);

      $this->session->set_flashdata('update', "Data $nama Sukses Di Perbarui");
      redirect(base_url("ms_karyawan"));
    }

    function delete($id){
      $this->db->where('md5(idtblkaryawan)', $id);
      $this->db->update("tblkaryawan", array("flag" => '1'));

      $this->session->set_flashdata('delete', 'Data Sukses di hapus');
      redirect(base_url("ms_karyawan"));

    }
  }

?>
