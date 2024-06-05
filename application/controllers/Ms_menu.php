<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ms_menu extends MY_Controller {
    public function __construct(){
        parent::__construct();
        $this->load->model('ms_model', '_ms');
    }

    public function index()
    {
      $data['parent_menu'] = $this->db->get_where("tblmenu", array("parent" => '0'))->result();
      // die(print_r($data));
      $data['akses'] = $this->akses_array;
      $this->load->view('v_ms_menu', $data);
    }

    function proses_tambah(){
      // die(print_r($this->input->post()));
      $nama = $this->input->post("nama");
      $icon = $this->input->post("icon");
      $parent = $this->input->post("parent");
      $url = $this->input->post("url");
      $id = $this->input->post("id");
      $aksi = $this->input->post("action");
      $position = '';

      if ($parent != '') {
        $position = $this->position() + 1;
      }

      $data = array(
        "menu" => $nama,
        "icon" => $icon,
        "parent" => $parent,
        "url" => $url,
        'position' => $position
      );
      if ($aksi == 'tambah') {
        $this->db->insert("tblmenu", $data);
        $this->session->set_flashdata('insert', "Data $nama Sukses Di Masukan");
      }else{
        $this->db->where("md5(idtblmenu)", $id);
        $this->db->update("tblmenu", $data);
        $this->session->set_flashdata('update', "Data $nama Sukses Di perbarui");
      }
      redirect(base_url("ms_menu"));
    }

    function get_menu(){
      $search = $this->input->post("search")['value'];
      $datax = $this->_ms->get_data($search, "tblmenu")->result();
		  $data = array();

      foreach ($datax as $rows){
        $row = array();
        $row[] = $rows->menu;
        $row[] = $rows->icon;
        $row[] = $rows->menu_parent;
        $row[] = $rows->url;
        $row[] = $rows->position;
        $row[] = $rows->flag == '0' ? 'Aktif' : 'Tidak Aktif';
        if($this->akses_array['update'] == '1'){
          $row[6] = '
          <a href="#" class="blue btn-small btn btn-edit" data-menu="'.$rows->menu.'" data-icon="'.$rows->icon.'" data-parent="'.$rows->id_parent.'" data-url="'.$rows->url.'" data-posisi="'.$rows->position.'" data-id="'.md5($rows->idtblmenu).'"><i class="mdi-editor-border-color right"></i>&nbsp; Ubah</a>';
        }
        if($this->akses_array['delete'] == '1'){
          if ($rows->flag == '0') {
            $row[6] .= '<a href="'.base_url().'ms_menu/delete/'.md5($rows->idtblmenu).'" data-nama="'.$rows->menu.'" class="btn-small btn link_delete"><i class="right mdi-navigation-cancel"></i>Hapus</a> </div>';
          }else{
            $row[6] .= '<a href="'.base_url().'ms_menu/active/'.md5($rows->idtblmenu).'" data-nama="'.$rows->menu.'" data-status="aktif" class="btn-small btn link_delete"> <i class="right mdi-action-done"></i> Aktivasi</a> </div>';
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
      $this->db->where('md5(idtblmenu)', $id);
      $this->db->update('tblmenu', array("flag" => "0"));

      $this->session->set_flashdata('insert', 'Data Sukses di aktivasi');
      redirect(base_url("ms_menu"));
    }


    function position(){
      $sql = "SELECT `position` FROM tblmenu WHERE parent = '2' ORDER BY `position` DESC";
      return $this->db->query($sql)->row("position");
    }

    function delete($id){
      $this->db->where('md5(idtblmenu)', $id);
      $this->db->update("tblmenu", array("flag" => '1'));

      $this->session->set_flashdata('delete', 'Data Sukses di hapus');
      redirect(base_url("ms_menu"));

    }
  }

?>
