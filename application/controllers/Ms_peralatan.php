<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ms_peralatan extends MY_Controller {
    public function __construct(){
        parent::__construct();
        // $this->login();
        $this->load->model('ms_model', '_ms');
    }

    public function index()
    {
      // $data['arah'] = 'tblkecamatan';
      $data['table'] = 'tblperalatan';
      $data['akses'] = $this->akses_array;
      $this->load->view('v_ms_peralatan', $data);
    }

    function tambah($table, $id = ''){
      $data['table'] = $table;
      $data['id'] = $id;
      $this->load->view("v_ms_peralatan_a", $data);
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
      $this->db->insert("tblperalatan", $data);
      $this->session->set_flashdata('insert', "Data $nama Sukses Di Masukan");

      redirect(base_url("ms_peralatan"));
    }

    function get_peralatan(){
      $search = $this->input->post("search")['value'];
      $datax = $this->_ms->get_data($search, "tblperalatan")->result();
		  $data = array();

      foreach ($datax as $rows){
        $row = array();
        $row[] = $rows->nama;
        $row[] = $rows->deskripsi;
        $row[] = $rows->flag == '0' ? 'Aktif' : 'Tidak Aktif';
        $row[3] = '<div style="margin-left: 20px;" class="btn-group"> <a href="'.base_url().'ms_peralatan/detail/'.md5($rows->idtblperalatan).'" class="light-green darken-4 btn-small btn "><i class="mdi-action-trending-up right"></i>&nbsp; Pemilik</a>';
        
        if($this->akses_array['update'] == '1'){
        $row[3] .= '<a href="#" class="blue btn-small btn btn-edit" data-nama="'.$rows->nama.'" data-deskripsi="'.$rows->deskripsi.'" data-id="'.md5($rows->idtblperalatan).'"><i class="mdi-editor-border-color right"></i>&nbsp; Ubah</a>';
        }
        if($this->akses_array['delete'] == '1'){
          if ($rows->flag == '0') {
            $row[3] .= '<a href="'.base_url().'ms_peralatan/delete/'.md5($rows->idtblperalatan).'" data-nama="'.$rows->nama.'" class="btn-small btn link_delete"><i class="right mdi-navigation-cancel"></i>Hapus</a> </div>';
          }else{
            $row[3] .= '<a href="'.base_url().'ms_peralatan/active/'.md5($rows->idtblperalatan).'" data-nama="'.$rows->nama.'" data-status="aktif" class="btn-small btn link_delete"> <i class="right mdi-action-done"></i> Aktivasi</a> </div>';
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
      $this->db->where('md5(idtblperalatan)', $id);
      $this->db->update('tblperalatan', array("flag" => "0"));

      $this->session->set_flashdata('insert', 'Data Sukses di aktivasi');
      redirect(base_url("ms_peralatan"));
    }

    function active_detail($id){
      $idtblperalatan = md5($this->db->get_where("tblperalatan_detail", array("md5(id)"=>$id))->row('idtblperalatan'));
      $this->db->where('md5(id)', $id);
      $this->db->update('tblperalatan_detail', array("flag" => "0"));
      $this->session->set_flashdata('insert', 'Data Sukses di aktivasi');
      redirect(base_url("ms_peralatan/detail/$idtblperalatan"));
    }

    function get_peralatan_det($id_md5){
      $search = $this->input->post("search")['value'];
      $datax = $this->_ms->get_data($search, "tblperalatan_detail", $id_md5)->result();
		  $data = array();

      foreach ($datax as $rows){
        $row = array();
        $row[] = $rows->nama;
        $row[] = $rows->alamat;
        $row[] = $rows->qty_baik;
        $row[] = $rows->qty_rusak;
        $row[] = $rows->tlpn;
        $row[] = $rows->flag == '0' ? 'Aktif' : 'Tidak Aktif';
        $row[] = '<div style="margin-left: 20px;" class="btn-group">
        <a href="#" class="blue btn-small btn btn-edit" data-nama="'.$rows->nama.'" data-alamat="'.$rows->alamat.'" data-qty-baik="'.$rows->qty_baik.'" data-qty-rusak="'.$rows->qty_rusak.'" data-tlpn="'.$rows->tlpn.'" data-id="'.md5($rows->id).'"><i class="mdi-editor-border-color right"></i>&nbsp; Ubah</a>';
        if ($rows->flag == '0') {
          $row[6] .= '<a href="'.base_url().'ms_peralatan/delete_detail/'.md5($rows->id).'" data-nama="'.$rows->nama.'" class="btn-small btn link_delete"><i class="right mdi-navigation-cancel"></i>Hapus</a> </div>';
        }else{
          $row[6] .= '<a href="'.base_url().'ms_peralatan/active_detail/'.md5($rows->id).'" data-nama="'.$rows->nama.'" data-status="aktif" class="btn-small btn link_delete"> <i class="right mdi-action-done"></i> Aktivasi</a> </div>';
        }

        $data[] = $row;
			}

      $output = array(
        "data" => $data
      );

      echo json_encode($output);

    }

    function proses_edit(){
      die(print_r($this->input->post()));
      $nama = $this->input->post("nama");
      $deskripsi = $this->input->post("deskripsi");
      $id = $this->input->post("id");

      $data = array("nama" => $nama, "deskripsi" => $deskripsi);
      $this->db->where("md5(idtblperalatan)", $id);
      $this->db->update("tblperalatan", $data);

      $this->session->set_flashdata('update', "Data $nama Sukses Di Perbarui");
      redirect(base_url("ms_peralatan"));
    }

    function delete($id){
      //  die($id.'__'.$table);
      $this->db->where('md5(idtblperalatan)', $id);
      $this->db->update("tblperalatan", array("flag" => '1'));

      $this->session->set_flashdata('delete', 'Data Sukses di hapus');
      redirect(base_url("ms_peralatan"));

    }

    public function detail($id_md5)
    {
        $isi = $this->db->get_where("tblperalatan", array("md5(idtblperalatan)" => $id_md5))->row();
        $id = $isi->idtblperalatan;
        $data['id_md5'] =  $id_md5;
        $data['id'] = $id;
        $data['data'] = $isi;
        $this->load->view('v_ms_peralatan_det', $data);
    }

    function proses_tambah_detail(){
      // die(print_r($this->input->post()));
      $id = $this->input->post("id");
      $data = $this->db->get_where("tblperalatan", array("md5(idtblperalatan)" => $id))->row();
      // die(print_r($data));

      $idtblperalatan = $data->idtblperalatan;
      $alamat = $this->input->post("alamat");
      $nama = $this->input->post("nama");
      $qty_baik = $this->input->post("qty_baik");
      $qty_rusak = $this->input->post("qty_rusak");
      $tlpn = $this->input->post("tlpn");


      $data = array(
        "idtblperalatan" => $idtblperalatan,
        "nama" => $nama,
        "qty_baik" => $qty_baik,
        "qty_rusak" => $qty_rusak,
        "tlpn" => $tlpn,
        "alamat" => $alamat,
        "create_date" => date("Y-m-d H:i:s")
      );
      $this->db->insert("tblperalatan_detail", $data);
      $this->session->set_flashdata('insert', "Data $nama Sukses Di Masukan");

      redirect(base_url("ms_peralatan/detail/$id"));
    }

    function proses_edit_detail(){
      // die(print_r($this->input->post()));
      // die(print_r($data));

      $id = $this->input->post("id");
      $alamat = $this->input->post("alamat");
      $nama = $this->input->post("nama");
      $qty_baik = $this->input->post("qty_baik");
      $qty_rusak = $this->input->post("qty_rusak");
      $tlpn = $this->input->post("tlpn");


      $data = array(
        "nama" => $nama,
        "qty_baik" => $qty_baik,
        "qty_rusak" => $qty_rusak,
        "tlpn" => $tlpn,
        "alamat" => $alamat,
        "create_date" => date("Y-m-d H:i:s")
      );
      $this->db->where("md5(id)", $id);
      $this->db->update("tblperalatan_detail", $data);
      $this->session->set_flashdata('update', "Data $nama Sukses Di perbarui");

      redirect(base_url("ms_peralatan/detail/$id"));
    }


    function delete_detail($id){
      //  die($id.'__'.$table);
      $idtblperalatan = md5($this->db->get_where("tblperalatan_detail", array("md5(id)"=>$id))->row('idtblperalatan'));
      // die($id_md5.'___'.$id);
      $this->db->where('md5(id)', $id);
      $this->db->update("tblperalatan_detail", array("flag" => '1'));

      $this->session->set_flashdata('delete', 'Data Sukses di hapus');
      redirect(base_url("ms_peralatan/detail/$idtblperalatan"));

    }


  }

?>
