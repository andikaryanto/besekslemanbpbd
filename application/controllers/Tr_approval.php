<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Tr_approval extends MY_Controller {
    public function __construct(){
        parent::__construct();
        $this->load->model('ms_model', '_ms');
    }

    public function index()
    {
        // $data['kejadian'] = $this->_ms->get_kejadian()->result();
        $data['akses'] = $this->akses_array;
        // die(print_r($data))
        $this->load->view('v_tr_approval', $data);
    }

    public function get_image(){
      $id = $this->input->post('idtbl');
      $data = $this->db->get_where("tbllaporan", array("md5(idtbllaporan)"=> $id))->row();

      $id_nonmd5 = $data->idtbllaporan;
      $lokasi = base_url()."uploads/kejadian/";
      $x = 1;
      $json_response = $this->db->get_where('tbllaporan_galery', array('md5(idtbllaporan)'=>$id))->result();
      foreach ($json_response as $rows){

          $foto = $lokasi.$rows->picture_name;
          if($rows->type == '1'){
          echo  "<a class='carousel-item active' href='$foto' target='_blank'>
                  <img src='$foto' alt='img-$x' style='width:80%;height:50%;'>
                </a>";
          }else{
          echo  "
          <video id='video' width='100%' height='100%' controls><source src='$foto' type='video/mp4' /></video>
          ";

          }
          $x++;
      }
    }

    function get_data(){
      $status = $this->input->post("status");
      $data = $this->_ms->get_kejadian($status)->result();
      // print_r($data);
      // die($status);
      echo json_encode($data);
    }

    function proses($id_md5, $aksi){
        // die($id_md5.'___'.$aksi);

        //revisi 26-10-2017 penambahan aksi jika approval
        if($aksi != '1'){
          $this->db->where("md5(idtbllaporan)", $id_md5);
          $this->db->update("tbllaporan", array("flag" => $aksi));
          $this->session->set_flashdata('insert', "Data Sukses Di Ubah");
          redirect(base_url("Tr_approval"));
        }else{
          $data['dampak'] = $this->db->get_where("tbldampak", array("flag" => '0'))->result();
          $data['kejadian'] = $this->data_kejadian($id_md5)->row();
          $data['kk'] = $this->db->get_where("tblkk", array("flag" => '0'))->result();
          // die(print_r($data));
          $this->load->view("v_tr_approval_det", $data);
        }
    }

    function proses_detail(){
      // die(print_r($this->input->post()));
      $status = $this->input->post("status");
      $dampak = $this->input->post("dampak");
      $idtbllaporan = $this->input->post("idtbllaporan");
      $kerusakan = $this->input->post("kerusakan");
      $jumlah = $this->input->post("jumlah");


      $rangkuman_korban = $this->input->post("rangkuman_korban");

      $kk = $this->input->post("kk");

      $this->db->where("idtbllaporan", $idtbllaporan);
      $this->db->update("tbllaporan", array("flag" => '1', 'status' => $status, 'dampak' => $dampak, 'rangkuman_korban' => $rangkuman_korban));

      $jml_kerusakan = count($kerusakan);
      $jml_kk = count($kk);
      if ($jml_kerusakan > 0) {
        for($x = 0; $x < $jml_kerusakan; $x++){
          $this->db->insert("tbllaporan_detail", array(
            "idtbllaporan" => $idtbllaporan,
            "idtbldampak" => $kerusakan[$x],
            "jumlah" => $jumlah[$x],
            "create_time" => date("Y-m-d H:i:s")
          ));
        }
      }
      if ($jml_kk > 0) {
        for($x = 0; $x < $jml_kk; $x++){
          $this->db->insert("tbllaporan_kk", array(
            "idtbllaporan" => $idtbllaporan,
            "idtblkk" => $kk[$x],
            "create_time" => date("Y-m-d H:i:s")
          ));
        }
      }

      $this->session->set_flashdata('insert', "Data Sukses Di proses");
      redirect(base_url("Tr_approval"));
    }

    function data_kejadian($id_md5){
      $sql = "SELECT a.*, b.nama AS nama_kelurahan, c.nama AS nama_bencana, d.nama AS nama_user, d.telp FROM tbllaporan a
              LEFT JOIN tblkelurahan b ON b.`id_kel` = a.`kelurahan`
              LEFT JOIN tblbencana c ON c.id= a.bencana
              LEFT JOIN tbluser d on d.idtbluser=a.idtbluser
              WHERE md5(a.idtbllaporan) = '$id_md5'";
              // die($sql);
      return $this->db->query($sql);
    }

  }

?>
