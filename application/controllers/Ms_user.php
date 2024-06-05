<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ms_user extends MY_Controller {
    public function __construct(){
        parent::__construct();
        $this->load->model('ms_model', '_ms');
    }

    public function index()
    {
      $data['akses'] = $this->akses_array;
      $data['groups'] = $this->db->get_where("tblgroup", array("flag" => '0'))->result();
      // die(print_r($data));
        $this->load->view('v_ms_user', $data);
    }

    function proses_tambah(){
      //die(print_r($this->input->post()));
      $nama = $this->input->post("nama");
      $email = $this->input->post("email");
      $password = $this->input->post("password");
      $repass = $this->input->post("repass");
      $id = $this->input->post("id");
      $aksi = $this->input->post("action");
	  $group = $this->input->post("group");

      $cek_email = $this->db->get_where("tbluser", array("email" => $email))->num_rows();
      if($cek_email == '0'){
        $data = array(
          "nama" => $nama,
          "email" => $email,
          "password" => md5($password),
		  "idtblgroup" => $group,
          "create_date" => date("Y-m-d H:i:s")
        );
        if ($aksi == 'tambah') {
          if ($password != $repass) {
            $this->session->set_flashdata('error', "password tidak sama");
          }else{
            $this->db->insert("tbluser", $data);
            $this->session->set_flashdata('insert', "Data $nama Sukses Di Masukan");
          }
        }else{
          $this->db->where("idtbluser", $id);
          $this->db->update("tbluser", $data);
          $this->session->set_flashdata('update', "Data $nama Sukses Di perbarui");
        }
      }else{
        $this->session->set_flashdata('error', "Email $email Sudah ada");
      }

      redirect(base_url("ms_user"));
    }

    function get_user(){
      $search = $this->input->post("search")['value'];
      $datax = $this->_ms->get_data($search, "tbluser")->result();
		  $data = array();

      foreach ($datax as $rows){
        $row = array();
        $row[] = $rows->nama;
        $row[] = $rows->email;
        $row[] = $rows->nama_group;
        $row[] = $rows->flag == '0' ? 'Aktif' : 'Tidak Aktif';
        if($this->akses_array['update'] == '1'){
          $row[4] = '
          <a href="#" class="blue btn-small btn btn-edit" data-nama="'.$rows->nama.'"  data-group="'.$rows->idtblgroup.'" data-email="'.$rows->email.'" data-id="'.md5($rows->idtbluser).'"><i class="mdi-editor-border-color right"></i>&nbsp; Ubah</a>';
        }
        if($this->akses_array['delete'] == '1'){
          if ($rows->flag == '0') {
            $row[4] .= '<a href="'.base_url().'ms_user/delete/'.md5($rows->idtbluser).'" data-nama="'.$rows->nama.'" class="btn-small btn link_delete"><i class="right mdi-navigation-cancel"></i>Hapus</a> </div>';
          }else{
            $row[4] .= '<a href="'.base_url().'ms_user/active/'.md5($rows->idtbluser).'" data-nama="'.$rows->nama.'" data-status="aktif" class="btn-small btn link_delete"> <i class="right mdi-action-done"></i> Aktivasi</a> </div>';
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
      $this->db->where('md5(idtbluser)', $id);
      $this->db->update('tbluser', array("flag" => "0"));

      $this->session->set_flashdata('insert', 'Data Sukses di aktivasi');
      redirect(base_url("ms_user"));
    }


    function proses_edit(){
      $nama = $this->input->post("nama");
      $email = $this->input->post("email");
      $id = $this->input->post("id");
	  $group = $this->input->post("group");

      $data = array("nama" => $nama, "idtblgroup" => $group, "email" => $email);
      $this->db->where("md5(idtbluser)", $id);
      $this->db->update("tbluser", $data);

      $this->session->set_flashdata('update', "Data $nama Sukses Di Perbarui");
      redirect(base_url("ms_user"));
    }

    function delete($id){
      $this->db->where('md5(idtbluser)', $id);
      $this->db->update("tbluser", array("flag" => '1'));

      $this->session->set_flashdata('delete', 'Data Sukses di hapus');
      redirect(base_url("ms_user"));

    }

    function logoff(){
      $this->session->sess_destroy();
      redirect(base_url('login'));
    }
  }

?>
