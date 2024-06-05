<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ms_desa extends MY_Controller {
    public function __construct(){
        parent::__construct();
        // $this->login();
        $this->load->model('ms_model', '_ms');
    }

    public function index()
    {
      $data['akses'] = $this->akses_array;
      $this->load->view('v_ms_desa', $data);
    }

    function tambah(){
      $data['kecamatan'] = $this->db->get("tblkecamatan")->result();
      $this->load->view("v_ms_desa_a", $data);
    }

    public function get_kelurahan(){
      $id_kec = $this->input->post('idkec');

      $json_response = $this->db->get_where('tblkelurahan', array('id_kec'=>$id_kec))->result();
      foreach ($json_response as $rows){
          echo "<option value='$rows->id_kel'> $rows->nama </option>";
      }
    }

    public function get_image(){
      $idtbl = $this->input->post('idtbl');
      $type = $this->input->post('type');
      $lokasi = base_url()."uploads/desa/".$idtbl.'/';
      $x = 1;
      $json_response = $this->db->get_where('tblgalery', array('idtbl'=>$idtbl, "type" => $type))->result();
      foreach ($json_response as $rows){

          $foto = $lokasi.$rows->picture_name;
          echo  "<a class='carousel-item active' href='$foto' target='_blank'>
              	  <img src='$foto' alt='img-$x' style='width:80%;height:50%;'>
              	</a>";
          // echo "<img class='activator' src='$foto' alt='Icon'>";
          $x++;
      }

    }

    function proses_tambah(){
      // print_r($_FILES);
      // echo "<br /><br />";
      // die(print_r($this->input->post()));
      $nama = $this->input->post("nama");
      $alamat = $this->input->post("alamat");
      $kecamatan = $this->input->post("kecamatan");
      $kelurahan = $this->input->post("kelurahan");
      $tlpn = $this->input->post("tlpn_2");
      $penanggung_jawab = $this->input->post("penanggung_jawab");
      $fasilitas = $this->input->post("fasilitas");
      $tampung = $this->input->post("tampung");
      $latitude = $this->input->post("latitude");
      $longitude = $this->input->post("longitude");
      $deskripsi = $this->input->post("keterangan");
      // $radius = $this->input->post("radius");

      $data = array(
        "nama" => $nama, "alamat" => $alamat,
        "kecamatan" => $kecamatan, "kelurahan" => $kelurahan,
        "fasilitas" => $fasilitas,
        "penanggung_jawab" => $penanggung_jawab, "tlpn" => $tlpn,
        "tampung" => $tampung, "latitude" => $latitude, "longitude" => $longitude,
        "deskripsi" => $deskripsi,
        "create_time" => date("Y-m-d"), "create_user" => "coba"
      );
      $this->db->insert("tbldesa", $data);
      $id = $this->db->insert_id();

      if(! $_FILES['foto']['size'][0] == '0' ){
  			//begin upload foto

        $this->load->library('upload');
  			$path = "./uploads/desa/".$id;
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

            $this->upload->initialize($this->set_upload_options($_FILES['foto']['name'], $id));

            if (! $this->upload->do_upload('foto')){
  						$this->session->set_flashdata('delete', $this->upload->display_errors());
              redirect(base_url('Ms_desa'));
            }else{
              $path = pathinfo($_FILES['foto']['name']);
              $extention = $path['extension'];
              $size = $_FILES['foto']['size'];

              $this->db->insert("tblgalery", array(
                'idtbl' => $id,
                "type" => "2",
                'picture_name' => $files['foto']['name'][$i],
                'size' => $size,
                'create_date' => date('Y-m-d H:i:s')
              ));
            }
         }
  		}
      redirect(base_url("ms_desa"));
    }

    function set_upload_options($judul, $folder)
      {
        //upload an image options
        $config = array();
        $config['file_name']     = $judul;
        $config['upload_path']   = './uploads/desa/'.$folder;
        $config['allowed_types'] = 'gif|jpg|png';
        $config['max_size']      = '0';
        $config['overwrite']     = FALSE;

        $this->load->library('upload', $config);
        return $config;
      }

    function edit($id_md5){
      $data['data'] = $this->db->get_where("tbldesa", array("md5(idtbldesa)" => $id_md5) )->row();
      $data['picture'] = $this->db->get_where("tblgalery", array("md5(idtbl)" => $id_md5, "type" => '2'))->result();
      $data['kecamatan'] = $this->db->get("tblkecamatan")->result();
      $data['kelurahan'] = $this->db->get("tblkelurahan")->result();
      $this->load->view("v_ms_desa_e", $data);

    }

    function get_desa(){
      $search = $this->input->post("search")['value'];
      $datax = $this->_ms->get_data($search, "tbldesa")->result();
		  $data = array(); $x = 0;

      foreach ($datax as $rows){
        $row = array();
        $x++;
        $row[] = $rows->nama;
        $row[] = $rows->nama_kecamatan;
        // $row[] = '<a href="#" data-latitude="'.$rows->latitude.'" data-longitude="'.$rows->longitude.'" data-nama="'.$rows->nama.'" class="btn-small btn link_map teal"><i class="right mdi-action-room"></i>Map</a>';
        $row[] = $rows->nama_kelurahan;
        $row[] = $rows->tlpn;
        $row[] = $rows->tampung;
        // $row[] = $rows->radius_merapi.' KM';
        $row[] = $rows->flag == '0' ? 'Aktif' : 'Tidak Aktif';
        $row[6] = '<div style="margin-left: 20px;" class="btn-group">
                <a href="#" data-nama="'.$rows->nama.'" data-idtbl="'.$rows->idtbldesa.'" data-type="2" class="btn-small btn link_foto deep-purple" style="width:3%;"><i class="right mdi-image-photo-camera"></i></a>
                <a href="#" data-latitude="'.$rows->latitude.'" data-longitude="'.$rows->longitude.'" data-nama="'.$rows->nama.'" class="btn-small btn link_map teal" style="width:3%;"><i class="right mdi-action-room"></i></a>';
        if($this->akses_array['update'] == '1'){
        $row[6] .= '<a href="'.base_url().'ms_desa/edit/'.md5($rows->idtbldesa).'" class="blue btn-small btn " style="width:3%;"> <i class="mdi-editor-border-color right"></i></a>';
        }
        if($this->akses_array['delete'] == '1'){
          if ($rows->flag == '0') {
            $row[6] .= '<a href="'.base_url().'ms_desa/delete/'.md5($rows->idtbldesa).'" data-nama="'.$rows->nama.'" data-status="hapus" class="btn-small btn link_delete" style="width:3%;"> <i class="right mdi-navigation-cancel"></i></a> </div>';
          }else{
            $row[6] .= '<a href="'.base_url().'ms_desa/active/'.md5($rows->idtbldesa).'" data-nama="'.$rows->nama.'" data-status="aktif" class="btn-small btn link_delete" style="width:3%;"> <i class="right mdi-navigation-cancel"></i></a> </div>';
          }
        }

        $data[] = $row;
			}

      $output = array(
        "data" => $data
      );

      echo json_encode($output);

    }

    function proses_edit(){
      // print_r($_FILES);
      // die(print_r($this->input->post()));
      $nama = $this->input->post("nama");
      $alamat = $this->input->post("alamat");
      $kecamatan = $this->input->post("kecamatan");
      $kelurahan = $this->input->post("kelurahan");
      $penanggung_jawab = $this->input->post("penanggung_jawab");
      $tlpn = $this->input->post("tlpn");
      $fasilitas = $this->input->post("fasilitas");
      $tampung = $this->input->post("tampung");
      $latitude = $this->input->post("latitude");
      $longitude = $this->input->post("longitude");
      $deskripsi = $this->input->post("keterangan");
      // $radius = $this->input->post("radius");
      $id = $this->input->post("id");

      $data = array(
        "nama" => $nama, "alamat" => $alamat,
        "kecamatan" => $kecamatan, "kelurahan" => $kelurahan,
        "fasilitas" => $fasilitas,
        "penanggung_jawab" => $penanggung_jawab, "tlpn" => $tlpn,
        "tampung" => $tampung, "latitude" => $latitude, "longitude" => $longitude,
        "deskripsi" => $deskripsi,
        "create_time" => date("Y-m-d"), "create_user" => "coba"
      );

      $this->db->where("idtbldesa", $id);
      $this->db->update("tbldesa", $data);

      if(! $_FILES['foto']['size'][0] == '0' ){
  			//begin upload foto

        $this->load->library('upload');
  			$path = "./uploads/desa/".$id;
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

            $this->upload->initialize($this->set_upload_options($_FILES['foto']['name'], $id));

            if (! $this->upload->do_upload('foto')){
  						$this->session->set_flashdata('delete', $this->upload->display_errors());
              redirect(base_url('Ms_desa'));
            }else{
              $path = pathinfo($_FILES['foto']['name']);
              $extention = $path['extension'];
              $size = $_FILES['foto']['size'];

              $this->db->insert("tblgalery", array(
                'idtbl' => $id,
                "type" => "2",
                'picture_name' => $files['foto']['name'][$i],
                'size' => $size,
                'create_date' => date('Y-m-d H:i:s')
              ));
            }
         }
  		}
      $this->session->set_flashdata('update', "Data $nama Sukses Di Perbarui");
      redirect(base_url("ms_desa"));
    }

    function delete($id){
      // die($id);
      $this->db->where('md5(idtbldesa)', $id);
      $this->db->update('tbldesa', array("flag" => "1"));

      $this->session->set_flashdata('delete', 'Data Sukses di hapus');
      redirect(base_url("ms_desa"));
    }

    function active($id){
      // die($id);
      $this->db->where('md5(idtbldesa)', $id);
      $this->db->update('tbldesa', array("flag" => "0"));

      $this->session->set_flashdata('insert', 'Data Sukses di aktivasi');
      redirect(base_url("ms_desa"));
    }

    function delete_pict($id, $id_md5, $name){
      // die($id_md5.'_'.$name);
      // $picture_name = $this->db->get_where("galery_detail", array('id' => $id))->row("picture_name");
      $file = './uploads/desa/'.$id.'/'.$name;
      if(unlink($file)){
        $this->db->where("md5(id)", $id_md5);
        $this->db->delete("tblgalery");
      }else{
        echo "gagal hapus";
      }
       echo '1';
    }


  }

?>
