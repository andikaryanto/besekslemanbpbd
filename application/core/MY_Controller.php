<?php
class  MY_Controller  extends  CI_Controller  {

  protected $create = '0';
  protected $update = '0';
  protected $delete = '0';
  protected $akses_array = array();

  public function __construct(){
      parent::__construct();
      $url = $this->uri->segment(1);
      // die(print_r($this->session->userdata));
      $group = $this->session->userdata("group");
      $idtblmenu = $this->db->get_where("tblmenu", array("url" => $url))->row();
      // echo $idtblmenu;
      $akses = $this->db->get_where("admin_access", array("idtblgroup" => $group, "idtblmenu" => $idtblmenu->idtblmenu))->row();
      // die($group.'___'.$idtblmenu->idtblmenu.'++'.$url);
      // die(print_r($akses));
      if ($akses != '') {
        if($akses->view != '0'){
          // $this->create = $akses->add;
          // $this->update = $akses->update;
          // $this->delete = $akses->delete;
          $this->akses_array = array(
            "view" => $akses->view,
            "create" => $akses->add,
            "update" => $akses->update,
            "delete" => $akses->delete
          );
          //print_r($this->akses_array);
        }else{
          $this->session->set_flashdata("error", "Anda Tidak Memiliki Akses $idtblmenu->menu");
          redirect(base_url("login"));
        }
      }else{
        $this->session->set_flashdata("error", "Anda Tidak Memiliki Akses $idtblmenu->menu");
        redirect(base_url("login"));
      }
  }
}



?>
