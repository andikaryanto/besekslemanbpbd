<?php
  class Logoff extends CI_Controller{

      function off(){
          $this->session->sess_destroy();
          redirect(base_url('login'));
      }
  }

?>
