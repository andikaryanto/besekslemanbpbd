<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ms_akses extends MY_Controller {
    public function __construct(){
        parent::__construct();
        $this->load->model('ms_model', '_ms');
    }

    public function index()
    {
        // $data['kejadian'] = $this->_ms->get_kejadian()->result();
        $data['group'] = $this->db->get_where("tblgroup", array("flag" => '0'))->result();
        $this->load->view('v_tr_keluar_masuk', $data);
    }

    function proses(){
        // die(print_r($this->input->post()));
        // die($id_md5.'___'.$aksi);
        $gudang = $this->input->post('gudang');
        $barang = $this->input->post("barang");
        $qty = $this->input->post("qty");
        $jenis = $this->input->post("jenis");
        $nama = $this->input->post("nama");
        $keterangan = $this->input->post("keterangan");


        $cek_stok_header = $this->db->get_where("tr_stok_header", array("idtblgudang" => $gudang, "idtblbarang" => $barang))->row();

        if ($cek_stok_header != array()) { // ada stok
          $sisa_stok = $cek_stok_header->sisa_stok;

          if ($jenis == '1') { //masuk
            $stok_akhir = $sisa_stok + $qty;
          }else{ //keluar
            $stok_akhir = $sisa_stok - $qty;
          }
          $this->db->where("id_stok", $cek_stok_header->id_stok);
          $this->db->update("tr_stok_header", array("sisa_stok" => $stok_akhir));
          $id_stok = $cek_stok_header->id_stok;
        }else{
          $this->db->insert("tr_stok_header", array(
            "idtblgudang" => $gudang,
            "idtblbarang" => $barang,
            "sisa_stok" => $qty,
            "create_time" => date("Y-m-d H:i:s")
          ));
          $id_stok = $this->db->insert_id();
        }

        if($jenis == '2'){
          $qty = -abs($qty);
        }

        $stok_detail = array(
          "id_stok" => $id_stok,
          "stok" => $qty,
          "status" => $jenis,
          "keterangan" => $keterangan,
          "penerima" => $nama,
          "create_time" => date("Y-m-d  H:i:s")
        );
        $this->db->insert("tr_stok_detail", $stok_detail);

        $this->session->set_flashdata('insert', "Data Stok Sukses Di masukan");
        redirect(base_url("Tr_keluar_masuk"));
    }

  }

?>
