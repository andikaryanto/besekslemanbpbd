<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Get_notif extends CI_Controller {
    //private $elos;

    public function __construct(){
        parent::__construct();
        // $this->load->model('ms_model', '_ms');
        //$this->elos = 'elos';
    }



    public function getinfo(){
    
    $key =  ( isset($_SERVER['HTTP_X_API_KEY']) ? $_SERVER['HTTP_X_API_KEY'] : null );
    if ($key == 'besek02184hdf'){
    
      $idperingatan = $this->input->post('idperingatan');
      
      $kue = "SELECT tblperingatandini.judul,keterangan FROM tblperingatandini where idperingatan = '$idperingatan';";
      $query = $this->db->query($kue);
      if ($query->num_rows() > 0){
        echo $query->row()->judul;
        echo $query->row()->keterangan;
      }else{
        echo 'gagal';
      }
    }else{
      echo 'gagal';
    }
    
  }

  }

?>
