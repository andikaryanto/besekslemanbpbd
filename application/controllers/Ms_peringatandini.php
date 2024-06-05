<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ms_peringatandini extends MY_Controller {
    //private $elos;

    public function __construct(){
        parent::__construct();
        $this->load->model('ms_model', '_ms');
        //$this->elos = 'elos';
    }

    public function index()
    {
      // echo $this->create.'____'.$this->update.'____'.$this->delete;
      // die();
        $data['akses'] = $this->akses_array;
        $this->load->view('v_peringatandini', $data);
    }

    public function proses(){
      // die(print_r($this->input->post()));
      $keterangan = $this->input->post("keterangan");
      $judul = $this->input->post("judul");
      $aksi = $this->input->post("action");
      $id = $this->input->post("id");

      $data = array(
        "judul" => $judul,
        "keterangan" => $keterangan,
        "time_create" => date("Y-m-d H:i:s")
      );
      if ($aksi == 'tambah') {
        $this->db->insert("tblperingatandini", $data);
        $this->session->set_flashdata('insert', "Data $judul Sukses Di Masukan");
		$idperingatan = $this->db->insert_id();
		
        print_r($this->fb_user("BROADCAST BPBD KABUPATEN SLEMAN",substr($judul.' '.$keterangan,0,150),$idperingatan));
      }else{
        $this->db->where("md5(idperingatan)", $id);
        $this->db->update("tblperingatandini", $data);
        $this->session->set_flashdata('update', "Data $judul Sukses Di perbarui");
      }

      redirect(base_url("Ms_peringatandini"));
    }
	
	
	public function blas(){
		$data = array
    (
      'data' =>
      array (
      'title' => "testing",
      'body' => "halo ini body saya",
      'idperingatan' => 0,
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
        print_r($req);
	}
	

    public function fb_user($judul, $keterangan, $idperingatan = 0){
    
    $data = array
    (
      'data' =>
      array (
      'title' => $judul,
      'body' => $keterangan,
      'idperingatan' => $idperingatan,
      'tag'=>"peringatan_dini",
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

    function get_peringatandini(){
      $search = $this->input->post("search")['value'];
      $datax = $this->_ms->get_data($search, "tblperingatandini")->result();
		  $data = array();

      foreach ($datax as $rows){
        $row = array();
        $row[] = $rows->judul;
        $row[] = $rows->keterangan;
        $row[] = $rows->time_create;
        $row[] = $rows->flag == '0' ? 'Aktif' : 'Tidak Aktif';
        $row[] = '';
        if($this->akses_array["update"] == '1'){
          $row[4] .= '<a href="#" class="blue btn-small btn btn-edit" data-judul="'.$rows->judul.'" data-keterangan="'.$rows->keterangan.'" data-id="'.md5($rows->idperingatan).'"><i class="mdi-editor-border-color right"></i>&nbsp; Ubah</a>';
        }
        if($this->akses_array["delete"] == '1' ){
          if ($rows->flag == '0') {
            $row[4] .= '<a href="'.base_url().'Ms_peringatandini/delete/'.md5($rows->idperingatan).'" data-judul="'.$rows->judul.'" class="btn-small btn link_delete"><i class="right mdi-navigation-cancel"></i>Hapus</a> </div>';
          }else{
            $row[4] .= '<a href="'.base_url().'Ms_peringatandini/active/'.md5($rows->idperingatan).'" data-judul="'.$rows->judul.'" data-status="aktif" class="btn-small btn link_delete"> <i class="right mdi-action-done"></i> Aktivasi</a> </div>';
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
      $this->db->where('md5(idperingatan)', $id);
      $this->db->update('tblperingatandini', array("flag" => "0"));

      $this->session->set_flashdata('insert', 'Data Sukses di aktivasi');
      redirect(base_url("Ms_peringatandini"));
    }

    function akses($id){
      $data['akses'] = $this->db->get_where("admin_access", array("md5(idperingatan)" => $id))->result();
      $data['menux'] = $this->db->get_where("tblmenu", array("flag" => "0"))->result();
      $data['id_md5'] = $id;
      // die(print_r($data));
      $this->load->view("v_akses", $data);
    }

    function proses_akses(){
      // die(print_r($this->input->post()));
      $id_md5 = $this->input->post("id_md5");
      $idperingatan = $this->db->get_where("tblperingatandini", array("md5(idperingatan)"=>$id_md5))->row("idperingatan");
      $this->db->where("md5(idperingatan)", $id_md5);
      $this->db->delete("admin_access");

      $x = 0;
      foreach($this->input->post() as $i => $item) {
        $aksi = $i[0];
        if($aksi != 'i'){
          $idtblmenu = substr($i, 1);
          if ($aksi == 'v') {
            $where = 'view';
          }elseif($aksi == 'a'){
            $where = 'add';
          }elseif($aksi == 'e'){
            $where = 'update';
          }elseif($aksi == 'd'){
            $where = 'delete';
          }
          // echo $aksi.'<br />';
          $cek = $this->db->get_where("admin_access", array("idperingatan" => $idperingatan, "idtblmenu" => $idtblmenu))->row();
          if($cek == array()){
            $this->db->insert("admin_access", array(
              'idperingatan' => $idperingatan,
              "idtblmenu" => $idtblmenu,
              $where => "1"
            ));
          }else{
            $this->db->where(array("idperingatan" => $idperingatan, "idtblmenu" => $idtblmenu));
            $this->db->update("admin_access", array($where => "1"));
          }
        }
      }
      // die();
      $this->session->set_flashdata('insert', 'Data akses Berhasil di ubah');
      redirect(base_url("Ms_peringatandini"));

    }



    function delete($id){
      $this->db->where('md5(idperingatan)', $id);
      $this->db->update("tblperingatandini", array("flag" => '1'));

      $this->session->set_flashdata('delete', 'Data Sukses di hapus');
      redirect(base_url("Ms_peringatandini"));

    }
  }

?>
