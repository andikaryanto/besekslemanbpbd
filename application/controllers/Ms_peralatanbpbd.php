<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ms_peralatanbpbd extends MY_Controller {
    public function __construct(){
        parent::__construct();
        // $this->login();
        $this->load->model('ms_model', '_ms');
    }

    public function index()
    {
      // $data['arah'] = 'tblkecamatan';
      $data['table'] = 'tblperalatanbpbd';
      $data['akses'] = $this->akses_array;
      $this->load->view('v_ms_peralatanbpbd', $data);
    }

    function tambah($table, $id = ''){
      $data['table'] = $table;
      $data['idtblperalatanbpbd'] = $idtblperalatanbpbd;
      $this->load->view("v_ms_peralatanbpbd", $data);
    }

    function proses_tambah(){
      // die(print_r($this->input->post()));
      $deskripsi    = $this->input->post("deskripsi");
      $nama         = $this->input->post("nama");
      $who          = $this->session->userdata("idtbluser");

      $data = array(
        "nama"        => $nama,
        "deskripsi"   => $deskripsi,
        "create_by"   => $who,
        "create_date" => date("Y-m-d H:i:s")
      );
      $this->db->insert("tblperalatanbpbd", $data);
      $this->session->set_flashdata('insert', "Data $nama Sukses Di Masukan");

      redirect(base_url("ms_peralatanbpbd"));
    }

    function proses_edit(){
      die(print_r($this->input->post()));
      die(print_r($data));
      $nama      = $this->input->post("nama");
      $deskripsi = $this->input->post("deskripsi");
      $who       = $this->session->userdata("idtbluser");
      $id        = $this->input->post("id");

      $data = array(
        "nama" => $nama, 
        "deskripsi" => $deskripsi, 
        "update_by" => $who, 
        "update_date" => date("Y-m-d H:i:s")
      );
      $this->db->where("md5(idtblperalatanbpbd)", $id);
      $this->db->update("tblperalatanbpbd", $data);
      $this->session->set_flashdata('update', "Data $nama Sukses Di Perbarui");
      redirect(base_url("ms_peralatanbpbd"));
    }

     function proses_tambah_item(){
      // die(print_r($this->input->post()));
      $id = $this->input->post("id");
      $data = $this->db->get_where("tblperalatanbpbd", array("md5(idtblperalatanbpbd)" => $id))->row();
      // die(print_r($data));

      $idtblperalatanbpbd = $data->idtblperalatanbpbd;
      $nama = $this->input->post("nama");
      $merek = $this->input->post("merek");
      $kondisi = $this->input->post("kondisi");
      $sumber = $this->input->post("sumber");
      $tahun = $this->input->post("tahun");
      $deskripsi = $this->input->post("deskripsi");
      $who          = $this->session->userdata("idtbluser");


      $data = array(
        "idtblperalatanbpbd" => $idtblperalatanbpbd,
        "nama" => $nama,
        "merek" => $merek,
        "kondisi" => $kondisi,
        "sumber" => $sumber,
        "tahun" => $tahun,
        "deskripsi" => $deskripsi,
        "create_by" => $who,
        "create_date" => date("Y-m-d H:i:s")
      );
      $this->db->insert("tblperalatanbpbd_item", $data);
      $this->session->set_flashdata('insert', "Data $nama Sukses Di Masukan");

      redirect(base_url("ms_peralatanbpbd/detail/$id"));
    }


    function proses_edit_item(){
      // die(print_r($this->input->post()));
      // die(print_r($data));

      $id = $this->input->post("idtblperalatanbpbd_item");
      $nama = $this->input->post("nama");
      $merek = $this->input->post("merek");
      $kondisi = $this->input->post("kondisi");
      $sumber = $this->input->post("sumber");
      $tahun = $this->input->post("tahun");
      $deskripsi = $this->input->post("deskripsi");
      $who          = $this->session->userdata("idtbluser");


      $data = array(
        "nama" => $nama,
        "merek" => $merek,
        "kondisi" => $kondisi,
        "sumber" => $sumber,
        "tahun" => $tahun,
        "deskripsi" => $deskripsi,
        "update_by" => $who,
        "update_date" => date("Y-m-d H:i:s")
      );
      $this->db->where("md5(idtblperalatanbpbd_item)", $id);
      $this->db->update("tblperalatanbpbd_item", $data);
      $this->session->set_flashdata('update', "Data $nama Sukses Di perbarui");

      redirect(base_url("ms_peralatanbpbd/item/$id"));
    }

    function proses_tambah_detail(){
      // die(print_r($this->input->post()));
      $id = $this->input->post("id");
      $data = $this->db->get_where("tblperalatanbpbd_detail", array("md5(idtblperalatanbpbd_item)" => $id))->row();
      // die(print_r($data));

      $idtblperalatanbpbd_item = $data->idtblperalatanbpbd_item;
      $cek_by = $this->input->post("cek_by");
      $kondisi_awal = $this->input->post("kondisi_awal");
      $kondisi_akhir = $this->input->post("kondisi_akhir");
      $deskripsi = $this->input->post("deskripsi");
      $data = array(
        "idtblperalatanbpbd_item" => $idtblperalatanbpbd_item,
        "cek_by"                  => $cek_by,
        "kondisi_awal"            => $kondisi_awal,
        "kondisi_akhir"           => $kondisi_akhir,
        "deskripsi"               => $deskripsi,
        "cek_date"                => date("Y-m-d H:i:s")
      );
      $this->db->insert("tblperalatanbpbd_detail", $data);
      $this->session->set_flashdata('insert', "Data Sukses Di Masukan");

      redirect(base_url("ms_peralatanbpbd/detail/$id"));
    }

    function get_peralatanbpbd(){
      $search = $this->input->post("search")['value'];
      $datax = $this->_ms->get_data($search, "tblperalatanbpbd")->result();
		  $data = array();

      foreach ($datax as $rows){
        $row = array();
        $row[] = $rows->nama;
        $row[] = $rows->deskripsi;
        $row[] = $rows->flag == '0' ? 'Aktif' : 'Tidak Aktif';
        $row[3] = '<div style="margin-left: 20px;" class="btn-group"> <a href="'.base_url().'ms_peralatanbpbd/item/'.md5($rows->idtblperalatanbpbd).'" class="light-green darken-4 btn-small btn "><i class="mdi-action-trending-up right"></i>&nbsp; Data Peralatan</a>';
        
       if($this->akses_array['update'] == '1'){
        $row[3] .= '<a href="#" class="blue btn-small btn btn-edit" data-nama="'.$rows->nama.'" data-deskripsi="'.$rows->deskripsi.'" data-id="'.md5($rows->idtblperalatanbpbd).'"><i class="mdi-editor-border-color right"></i>&nbsp; Ubah</a>';
        }
        if($this->akses_array['delete'] == '1'){
          if ($rows->flag == '0') {
            $row[3] .= '<a href="'.base_url().'ms_peralatanbpbd/delete/'.md5($rows->idtblperalatanbpbd).'" data-nama="'.$rows->nama.'" class="btn-small btn link_delete"><i class="right mdi-navigation-cancel"></i>Hapus</a> </div>';
          }else{
            $row[3] .= '<a href="'.base_url().'ms_peralatanbpbd/active/'.md5($rows->idtblperalatanbpbd).'" data-nama="'.$rows->nama.'" data-status="aktif" class="btn-small btn link_delete"> <i class="right mdi-action-done"></i> Aktivasi</a> </div>';
          }
        }

        $data[] = $row;
			}

      $output = array(
        "data" => $data
      );

      echo json_encode($output);

    }

    function get_peralatanbpbd_item($id_md5){
      $search     = $this->input->post("search")['value'];
      $datax      = $this->_ms->get_data($search, "tblperalatanbpbd_item", $id_md5)->result();
      $data       = array();

      foreach ($datax as $rows){
        $row = array();
        $row[] = $rows->nama;
        $row[] = $rows->merek;
        $row[] = $rows->kondisi;
        $row[] = $rows->sumber;
        $row[] = $rows->tahun;
        $row[] = $rows->deskripsi;
        $row[] = $rows->flag == '0' ? 'Aktif' : 'Tidak Aktif';
        $row[7] = '<div style="margin-left: 20px;" class="btn-group"> <a href="'.base_url().'ms_peralatanbpbd/detail/'.md5($rows->idtblperalatanbpbd_item).'" class="light-green darken-4 btn-small btn "><i class="mdi-action-trending-up right"></i>&nbsp; Log Peralatan</a>';
        
        if($this->akses_array['update'] == '1'){
        $row[7] .= '<a href="#" class="blue btn-small btn btn-edit" data-nama="'.$rows->nama.'" data-merek="'.$rows->merek.'" data-kondisi="'.$rows->kondisi.'" data-sumber="'.$rows->sumber.'" data-tahun="'.$rows->tahun.'" data-deskripsi="'.$rows->deskripsi.'" data-id="'.md5($rows->idtblperalatanbpbd_item).'"><i class="mdi-editor-border-color right"></i>&nbsp; Ubah</a>';  
        }   

        if ($rows->flag == '0') { 
          $row[7] .= '<a href="'.base_url().'ms_peralatanbpbd/delete_item/'.md5($rows->idtblperalatanbpbd_item).'" data-nama="'.$rows->nama.'" class="btn-small btn link_delete"><i class="right mdi-navigation-cancel"></i>Hapus</a> </div>';
        }else{
          $row[7] .= '<a href="'.base_url().'ms_peralatanbpbd/active_detail/'.md5($rows->idtblperalatanbpbd_item).'" data-nama="'.$rows->nama.'" data-status="aktif" class="btn-small btn link_delete"> <i class="right mdi-action-done"></i> Aktivasi</a> </div>';
        }

        $data[] = $row;
      }

      $output = array(
        "data" => $data
      );

      echo json_encode($output);

    }

    function get_peralatanbpbd_det($id_md5){
      $search = $this->input->post("search")['value'];
      $datax = $this->_ms->get_data($search, "tblperalatanbpbd_detail", $id_md5)->result();
      $data = array();

      foreach ($datax as $rows){
        $row = array();
        $row[] = $rows->cek_date;
        $row[] = $rows->cek_by;
        $row[] = $rows->kondisi_awal;
        $row[] = $rows->kondisi_akhir;
        $row[] = $rows->deskripsi;
        $row[] = $rows->flag == '0' ? 'Aktif' : 'Tidak Aktif';
        $row[] = '<div style="margin-left: 20px;" class="btn-group">
        <a href="#" class="blue btn-small btn btn-edit" data-cek_date="'.$rows->cek_date.'" data-cek_by="'.$rows->cek_by.'" data-kondisi_awal="'.$rows->kondisi_awal.'" data-kondisi_akhir="'.$rows->kondisi_akhir.'" data-deskripsi="'.$rows->deskripsi.'" data-id="'.md5($rows->id).'"><i class="mdi-editor-border-color right"></i>&nbsp; Ubah</a>';
        
        if ($rows->flag == '0') {
          $row[6] .= '<a href="'.base_url().'ms_peralatan/delete_det/'.md5($rows->id).'" data-cek_by="'.$rows->cek_by.'" class="btn-small btn link_delete"><i class="right mdi-navigation-cancel"></i>Hapus</a> </div>';
        }else{
          $row[6] .= '<a href="'.base_url().'ms_peralatan/active_det/'.md5($rows->id).'" data-cek_by="'.$rows->cek_by.'" data-status="aktif" class="btn-small btn link_delete"> <i class="right mdi-action-done"></i> Aktivasi</a> </div>';
        }

        $data[] = $row;
      }

      $output = array(
        "data" => $data
      );

      echo json_encode($output);

    }

    function active($id){
      // die($id);
      $this->db->where('md5(idtblperalatanbpbd)', $id);
      $this->db->update('tblperalatanbpbd', array("flag" => "0"));

      $this->session->set_flashdata('insert', 'Data Sukses di aktivasi');
      redirect(base_url("ms_peralatanbpbd"));
    }

    function active_detail($id){
      $idtblperalatanbpbd = md5($this->db->get_where("tblperalatanbpbd_item", array("md5(id)"=>$id))->row('idtblperalatanbpbd'));
      $this->db->where('md5(id)', $id);
      $this->db->update('tblperalatanbpbd_item', array("flag" => "0"));
      $this->session->set_flashdata('insert', 'Data Sukses di aktivasi');
      redirect(base_url("ms_peralatanbpbd/item/$idtblperalatanbpbd"));
    }

    function active_det($id){
      $idtblperalatanbpbd_item = md5($this->db->get_where("tblperalatanbpbd_detail", array("md5(id)"=>$id))->row('idtblperalatanbpbd_det'));
      $this->db->where('md5(id)', $id);
      $this->db->update('tblperalatanbpbd_detail', array("flag" => "0"));
      $this->session->set_flashdata('insert', 'Data Sukses di aktivasi');
      redirect(base_url("ms_peralatanbpbd/detail/$idtblperalatanbpbd_item"));
    }


    public function item($id_md5){
        $isi = $this->db->get_where("tblperalatanbpbd", array("md5(idtblperalatanbpbd)" => $id_md5))->row();
        $id = $isi->idtblperalatanbpbd;
        $data['id_md5'] =  $id_md5;
        $data['idtblperalatanbpbd_item'] = $id;
        $data['data'] = $isi;
          // echo json_encode($data);
        $this->load->view('v_ms_peralatanbpbd_item', $data);   
    }

    public function detail($id_md5){
        $isi = $this->db->get_where("tblperalatanbpbd_item", array("md5(idtblperalatanbpbd_item)" => $id_md5))->row();
        $id = $isi->idtblperalatanbpbd_item;
        $data['id_md5'] =  $id_md5;
        $data['id'] = $id;
        $data['data'] = $isi;
        //echo json_encode($data);
        $this->load->view('v_ms_peralatanbpbd_detail', $data);  
    }

   
    function delete($id){
      //  die($id.'__'.$table);
      $this->db->where('md5(idtblperalatanbpbd)', $id);
      $this->db->update("tblperalatanbpbd", array("flag" => '1'));

      $this->session->set_flashdata('delete', 'Data Sukses di hapus');
      redirect(base_url("ms_peralatanbpbd"));

    }

    // function delete_item($id){
    //   //  die($id.'__'.$table);
    //   $this->db->where('md5(idtblperalatanbpbd_item)', $id);
    //   $this->db->update("tblperalatanbpbd_item", array("flag" => '1'));

    //   $this->session->set_flashdata('delete', 'Data Sukses di hapus');
    //   redirect(base_url("ms_peralatanbpbd"));

    // }

    function delete_det($id){
      //  die($id.'__'.$table);
      $this->db->where('md5(id)', $id);
      $this->db->update("tblperalatanbpbd_detail", array("flag" => '1'));

      $this->session->set_flashdata('delete', 'Data Sukses di hapus');
      redirect(base_url("ms_peralatanbpbd"));

    }

    function delete_item($id){
      //  die($id.'__'.$table);
      $idtblperalatanbpbd = md5($this->db->get_where("tblperalatanbpbd_item", array("md5(id)"=>$id))->row('idtblperalatanbpbd'));
      // die($id_md5.'___'.$id);
      $this->db->where('md5(id)', $id);
      $this->db->update("tblperalatanbpbd_item", array("flag" => '1'));

      $this->session->set_flashdata('delete', 'Data Sukses di hapus');
      redirect(base_url("ms_peralatanbpbd/detail/$idtblperalatanbpbd"));

    }


  }

?>
