<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Main extends CI_Controller {
	protected $range = '';

	public function __construct(){

			parent::__construct();
			// $this->load->library('security');
			$this->load->library('filter');
	}

	public function index()
	{

		$filter 	= new filter();
		$from 		= $filter->clean($this->input->get("dari"));
		$to 			= $filter->clean($this->input->get("hingga"));

		$range = $from.' - '.$to;
		$this->load->model("Lap_model", "_lap");
		$data["data"] = $this->_lap->data_kejadian_live('1', $from, $to)->result();
		$data['range'] = $range;
		$data['jarak'] = $this->db->get("tbljarak")->result()[0];
		$this->load->view('v_main', $data);
	}

	// public function

	function tambah(){
		$data['kelurahan'] = $this->db->get("tblkelurahan")->result();
		$data['bencana'] = $this->db->get_where("tblbencana", array("flag" => '0'))->result();
		$this->load->view("v_laporan", $data);
	}

	function edit($id = null){
		$data['kelurahan'] = $this->db->get("tblkelurahan")->result();
		$data['dusun'] = $this->db->get("tbldusun")->result();
		$data['bencana'] = $this->db->get_where("tblbencana", array("flag" => '0'))->result();
		$data['dampak'] = $this->db->get_where("tbldampak", array("flag" => '0'))->result();
		$data['kk'] = $this->db->get_where("tblkk", array("flag" => '0'))->result();
		$data['data'] = $this->sql_data_edit($id)->row_array();
		$data['detail_kk'] = $this->sql_detail_kk($id)->result();
		$data['detail_data'] = $this->sql_detail($id)->result();

		$this->load->view("v_laporan_manual_e", $data);
	}

	function tambah_manual(){
		// die(print_r($this->session->userdata));
		$data['kelurahan'] = $this->db->get("tblkelurahan")->result();
		$data['bencana'] = $this->db->get_where("tblbencana", array("flag" => '0'))->result();
		$data['dampak'] = $this->db->get_where("tbldampak", array("flag" => '0'))->result();
		$data['kk'] = $this->db->get_where("tblkk", array("flag" => '0'))->result();
		$this->load->view("v_laporan_manual", $data);
	}

	function icon(){
		$this->load->view("icon");
	}

	public function get_desa(){
		$id_kel = $this->input->post('idkel');

		$json_response = $this->db->get_where('tbldusun', array('id_kel'=>$id_kel))->result();
		foreach ($json_response as $rows){
				echo "<option value='$rows->idtbldusun'> $rows->nama </option>";
		}
	}

	 function proses_tambah(){
		 // die(print_r($this->input->post()));
		 //print_r($this->input->post());

		 $this->isi_header();
		

		$this->session->set_flashdata('insert', "Laporan Sukses Di Input");
    redirect(base_url('Main/tambah'));
	}

	private function isi_header(){
		$filter = new filter();
		//die(print_r($this->input->post()));
		$nir				= $filter->clean($this->input->post("nir"));
		$nama				= $filter->clean($this->input->post("nama"));
		$notelp				= $filter->clean($this->input->post("notelp"));
		$kelurahan			= $filter->clean($this->input->post("kelurahan"));
		$dusun				= $filter->clean($this->input->post("dusun"));
		$bencana			= $filter->clean($this->input->post("bencana"));
		$rt					= $filter->clean($this->input->post("rt"));
		$rw					= $filter->clean($this->input->post("rw"));
		$dampak				= $filter->clean($this->input->post("dampak"));
		$time				= $this->input->post("tgl_kejadian"); //jika pakai filter, : akan hilang
		$datetime			= $time.':00';
		$latitude			= $this->input->post("latitude");
		$longitude			= $this->input->post("longitude");
		$who				= $this->session->userdata("idtbluser");
		$user				= $this->session->userdata("idtbluser");

		$foto				= $_FILES['foto'];
		$video				= $_FILES['video'];
		// die($nir);
		$data = array(
			"nir"			=> $nir, 				"nama" 			=> $nama,
			"notelp" 		=> $notelp,				"kelurahan" 	=> $kelurahan,
			"dusun" 		=> $dusun,				"bencana"		=> $bencana,    		
			"rt" 			=> $rt,					"rw"			=> $rw,   				
			"dampak"		=> $dampak,         	'latitude' 		=> $latitude,			
			"longitude"		=> $longitude, 			"create_time"	=> date("Y-m-d H:i:s"), 
			"create_by"		=> $who,				"tgl_kejadian"  => $datetime,
			"idtbluser"		=> $user
		);
		$this->db->insert("tbllaporan", $data);
		$idtbllaporan		= $this->db->insert_id();

		if(! $_FILES['foto']['size'][0] == '0' ){
			//begin upload foto

      $this->load->library('upload');
			// print_r($_FILES['foto']);
			// die(print_r($this->upload->data()));
			$path = "./uploads/kejadian/";
			if(!is_dir($path)) //create the folder if it's not already exists
			{
			 mkdir($path, 0755, TRUE);
			}

			$files = $_FILES;
			$x = count($_FILES['foto']['name']);
			for($i = 0; $i < $x; $i++){
          $_FILES['foto']['name'] = $files['foto']['name'][$i];
          $_FILES['foto']['type'] = $files['foto']['type'][$i];
          $_FILES['foto']['tmp_name'] = $files['foto']['tmp_name'][$i];
          $_FILES['foto']['error'] = $files['foto']['error'][$i];
          $_FILES['foto']['size'] = $files['foto']['size'][$i];

          $this->upload->initialize($this->set_upload_options($_FILES['foto']['name'], $idtbllaporan));

          if (! $this->upload->do_upload('foto')){
						$this->session->set_flashdata('delete', $this->upload->display_errors().'_'.$files['foto']['type'][$i]);
            redirect(base_url('Main/tambah'));
          }else{
            $path = pathinfo($_FILES['foto']['name']);
            $extention = $path['extension'];
            $size = $_FILES['foto']['size'];

            $this->db->insert("tbllaporan_galery", array(
              'idtbllaporan' => $idtbllaporan,
              'picture_name' => $files['foto']['name'][$i],
              'size' => $size,
							'type' => '1',
              'create_date' => date('Y-m-d H:i:s')
            ));
          }
       }
		}

		if(! $_FILES['video']['size'] == '0' ){
				$uploadFile = $_FILES['video'];
        $extractFile = pathinfo($uploadFile['name']);
        $newName = str_replace(" ", "_", $uploadFile['name']);
				$place                   = "./uploads/kejadian/";
        $upload_path             = $place;
        $config['upload_path']   = $upload_path;
        $config['file_name']     = $newName;
        $config['allowed_types'] = '*';
        // $config['max_size']  = '200000000';
        $config['overwrite']     = true;
        //die(print_r($config));
        $this->load->library('upload', $config);
        $this->upload->initialize($config);

        if (! $this->upload->do_upload('video'))
        {
            $this->session->set_flashdata('error', $this->upload->display_errors()."please edit article : '$title', to reupload photo");
            redirect(base_url("Main/tambah"));
        }
        else
        {
					$size = $_FILES['video']['size'];

					$this->db->insert("tbllaporan_galery", array(
						'idtbllaporan' => $idtbllaporan,
						'picture_name' => $newName,
						'size' => $size,
						'type' => '2',
						'create_date' => date('Y-m-d H:i:s')
					));
        }
		}
		
		@file_get_contents('http://localhost/firebase.php?m=com.becana.sleman&message='.$nama);
		return $idtbllaporan;
	}

	function proses_manual(){

		// die(print_r($this->input->post()));
		$idtbllaporan = $this->isi_header();
		$status = $this->input->post("status");
		$dampak = $this->input->post("dampak");
		$kerusakan = $this->input->post("kerusakan");
		$jumlah = $this->input->post("jumlah");

		$rangkuman_korban = $this->input->post("rangkuman_korban");

		$kk = $this->input->post("kk");

		$this->db->where("idtbllaporan", $idtbllaporan);
		$this->db->update("tbllaporan", array("flag" => '1', 'status' => $status, 'dampak' => $dampak, 'rangkuman_korban' => $rangkuman_korban));

		$jml_kerusakan = count($kerusakan);
		$jml_kk = count($kk);
		$jml_progres= count($progres);
		$jml_bantuan= count($bantuan);
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
		if ($jml_progres > 0) {
			for($x = 0; $x < $jml_kerusakan; $x++){
				$this->db->insert("tbllaporan_detail", array(
					"idtbllaporan" => $idtbllaporan,
					"idprogres" => $kerusakan[$x],
					"create_time" => date("Y-m-d H:i:s")
				));
			}
		}
		if ($jml_bantuan > 0) {
			for($x = 0; $x < $jml_bantuan; $x++){
				$this->db->insert("tbllaporan_bantuan", array(
					"idtbllaporan" => $idtbllaporan,
					"idtblbarang" => $bantuan[$x],
					"jumlah" => $jumlah[$x],
					"waktu" => date("Y-m-d H:i:s")
				));
			}
		}

		$this->session->set_flashdata('insert', "Data Sukses Di proses");
		redirect(base_url("main/tambah_manual"));
	}

	function proses_manual_e(){
		// print_r($this->session->userdata);
		// die(print_r($this->input->post()));
		$filter = new filter();

		$nir					= $filter->clean($this->input->post("nir"));
		$nama					= $filter->clean($this->input->post("nama"));
		$notelp					= $filter->clean($this->input->post("notelp"));
		$datetime				= $this->input->post("tgl_kejadian"); //jika pakai filter, : akan hilang
		$kelurahan				= $filter->clean($this->input->post("kelurahan"));
		$dusun					= $filter->clean($this->input->post("dusun"));
		$bencana				= $filter->clean($this->input->post("bencana"));
		$rt						= $filter->clean($this->input->post("rt"));
		$rw						= $filter->clean($this->input->post("rw"));
		$latitude				= $this->input->post("latitude");
		$longitude				= $this->input->post("longitude");
		$idtbllaporan			= $this->input->post("idtbllaporan");
		$status 				= $this->input->post("status");
		$dampak 				= $this->input->post("dampak");
		$kerusakan 				= $this->input->post("kerusakan");
		$jumlah 				= $this->input->post("jumlah");
		$rangkuman_korban 		= $this->input->post("rangkuman_korban");
		$kk 					= $this->input->post("kk");
		$who					= $this->session->userdata("idtbluser");
		$kondisi				= $this->input->post("kondisi");
		


		if ($kondisi == 'nyata') {
			$flag = '1';
		}elseif ($kondisi == 'palsu') {
			$flag = '2';
		}else{
			$flag = '0';
		}

		$data = array(
			"nir"					=> $nir, "nama" => $nama, "notelp" => $notelp,
			"tgl_kejadian" 	=> $datetime, "kelurahan" 	=> $kelurahan, "dusun" => $dusun,
			"bencana"			=> $bencana, "rt" => $rt,
			"rw"					=> $rw, 'latitude' => $latitude,
			"flag" => $flag, 'nama' => $nama, 'status' => $status,
			'dampak' => $dampak, 'rangkuman_korban' => $rangkuman_korban,
			"longitude"		=> $longitude, "update_time" => date("Y-m-d H:i:s"),
			"update_by" => $who
		);

		$this->db->where("idtbllaporan", $idtbllaporan);
		$this->db->update("tbllaporan", $data);

      	$foto					= $_FILES['foto'];
		$video					= $_FILES['video'];

		if (isset($_FILES['foto'])) {
			if(! $_FILES['foto']['size'][0] == '0' ){
				//begin upload foto

	      $this->load->library('upload');
				$path = "./uploads/kejadian/";
				if(!is_dir($path)) //create the folder if it's not already exists
				{
				 mkdir($path, 0755, TRUE);
				}

				$files = $_FILES;
				$x = count($_FILES['foto']['name']);
				for($i = 0; $i < $x; $i++){
	          $_FILES['foto']['name'] = $files['foto']['name'][$i];
	          $_FILES['foto']['type'] = $files['foto']['type'][$i];
	          $_FILES['foto']['tmp_name'] = $files['foto']['tmp_name'][$i];
	          $_FILES['foto']['error'] = $files['foto']['error'][$i];
	          $_FILES['foto']['size'] = $files['foto']['size'][$i];

	          $this->upload->initialize($this->set_upload_options($_FILES['foto']['name'], $idtbllaporan));

	          if (! $this->upload->do_upload('foto')){
							$this->session->set_flashdata('delete', $this->upload->display_errors().'_'.$files['foto']['type'][$i]);
	            redirect(base_url('Main/tambah'));
	          }else{
	            $path = pathinfo($_FILES['foto']['name']);
	            $extention = $path['extension'];
	            $size = $_FILES['foto']['size'];

	            $this->db->insert("tbllaporan_galery", array(
	              'idtbllaporan' => $idtbllaporan,
	              'picture_name' => $files['foto']['name'][$i],
	              'size' => $size,
								'type' => '1',
	              'create_date' => date('Y-m-d H:i:s')
	            ));
	          }
	       }
			}
		}

		if (isset($_FILES['video'])) {
			if(! $_FILES['video']['size'] == '0' ){
					$uploadFile = $_FILES['video'];
	        $extractFile = pathinfo($uploadFile['name']);
	        $newName = str_replace(" ", "_", $uploadFile['name']);
					$place                   = "./uploads/kejadian/";
	        $upload_path             = $place;
	        $config['upload_path']   = $upload_path;
	        $config['file_name']     = $newName;
	        $config['allowed_types'] = '*';
	        // $config['max_size']  = '200000000';
	        $config['overwrite']     = true;
	        //die(print_r($config));
	        $this->load->library('upload', $config);
	        $this->upload->initialize($config);

	        if (! $this->upload->do_upload('video'))
	        {
	            $this->session->set_flashdata('error', $this->upload->display_errors()."please edit article : '$title', to reupload photo");
	            redirect(base_url("Main/tambah"));
	        }
	        else
	        {
						$size = $_FILES['video']['size'];

						$this->db->insert("tbllaporan_galery", array(
							'idtbllaporan' => $idtbllaporan,
							'picture_name' => $newName,
							'size' => $size,
							'type' => '2',
							'create_date' => date('Y-m-d H:i:s')
						));
	        }
			}
		}

		$this->session->set_flashdata('insert', "Data Sukses Di proses");
		redirect(base_url("tr_approval"));
	}

	function set_upload_options($judul, $folder)
    {
      //upload an image options
			$judul = str_replace(" ", "_", $judul);
      $config = array();
      $config['file_name']     = $judul;
      $config['upload_path']   = './uploads/kejadian/';
      $config['allowed_types'] = 'gif|jpg|png|jpeg|JPEG';
      $config['max_size']      = '0';
      $config['overwrite']     = FALSE;

      $this->load->library('upload', $config);
      return $config;
    }

	function trial_map(){
		$this->load->view("map");
	}

	function sql_data_edit($id){
		$sql = "SELECT a.*, GROUP_CONCAT(b.idgalery) idgalery, GROUP_CONCAT(b.picture_name) picture_name, GROUP_CONCAT(b.type) 'type' FROM `tbllaporan` a
					LEFT JOIN `tbllaporan_galery` b
					ON a.idtbllaporan = b.idtbllaporan where md5(a.idtbllaporan) = '$id'
					GROUP BY a.idtbllaporan;";
					// die($sql);
		return $this->db->query($sql);
	}

	function sql_detail_kk($id){
		$sql = "SELECT a.*, b.nama AS nama_kk FROM tbllaporan_kk a
						LEFT JOIN tblkk b ON b.`idtblkk` = a.`idtblkk`
						WHERE MD5(idtbllaporan) = '$id';";

		return $this->db->query($sql);
	}
	function sql_detail($id){
		$sql = "SELECT a.*, b.nama AS nama_dampak FROM tbllaporan_detail a
						LEFT JOIN tbldampak b ON b.`idtbldampak` = a.`idtbldampak`
						WHERE MD5(idtbllaporan) = '$id'";
		return $this->db->query($sql);
	}

	function delete_pict($id, $name){
		//die($id.'_'.$name);
		// $picture_name = $this->db->get_where("galery_detail", array('id' => $id))->row("picture_name");
		$file = './kejadian/'.$name;
		if(unlink($file)){
			$this->db->where("idtbllaporan", $id);
			$this->db->where("picture_name", $name);
			$this->db->delete("tbllaporan_galery");
		}else{
			echo "gagal hapus";
		}
		 echo '1';
	}
}
