<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Test_peringatan extends CI_Controller {
    // public function __construct(){
        // parent::__construct();
        // $this->load->model('ms_model', '_ms');
    // }

    public function index()
    {
      //die(print_r($this->akses_array));
       //$data['akses'] = $this->akses_array;
       $this->load->view('v_peringatandini', $data);
    }
	
	public function kirim_user(){
		
		//this input post
		//$isi = "ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>ini dalah peringatan dini bagi anda <strong> tong tong tod </strong>";
		$judul=$this->input->post("judul");
		$keterangan = $this->input->post("keterangan");
		
		
		
		$data = array(
			'judul'=>$judul,
			'keterangan' => $keterangan,
			'time_create' => date('Y-m-d H:i:s')
		);
		
		$this->db->insert('tblperingatandini',$data);
		$idperi = $this->db->insert_id();
		
		print_r($this->fb_user("peringatan dini",substr($judul,$keterangan,0,150),$idperi));
	}


	
	 public function fb_user($judul, $keterangan, $idperi){
		

		$data = array
		(
		  'data' =>
		  array (
			'title' => $judul,
			'body' => $keterangan,
			'idperi' => $idperi,
		  ),
		  'to' => '/topics/user',
		  'priority' => 'high',
		);
		
		
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Authorization: key= AAAA0-NerMk:APA91bEAfNEYDQKNYnGKnRcLyO6LAHVgmF3XYkxtEVhWRHZJg1ptROO4IC3lHS7lyIXLi2oG2X_uLkoB8trSI4UkMRzwl7Zj5fEExjhb_Dv6DKtuCIxWrxxpXaA6_KkCE4dzlN9r5osb',
            'Content-Type: application/json',
            ));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));

        $req = curl_exec($ch);
        curl_close($ch);
        return $req;
    }
	
	
	public function getinfo(){
		
		$key =  ( isset($_SERVER['HTTP_X_API_KEY']) ? $_SERVER['HTTP_X_API_KEY'] : null );
		if ($key == 'besek02184hdf'){
		
			$idperi = $this->input->post('idperi');
			
			$kue = "SELECT tblperingatandini.judul,keterangan FROM tblperingatandini where idperingatan = '$idperi';";
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
