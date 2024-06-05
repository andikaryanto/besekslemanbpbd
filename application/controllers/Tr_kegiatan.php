<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Tr_kegiatan extends MY_Controller {
    public function __construct(){
        parent::__construct();
        // $this->login();
        $this->load->model('ms_model', '_ms');
    }

    public function index()
    {
      $data['akses'] = $this->akses_array;
      $this->load->view('v_tr_kegiatan', $data);
    }

    function tambah(){
      $data['kecamatan'] = $this->db->get("tblkecamatan")->result();
      $data['komunitas'] = $this->db->get("tblkomunitas")->result();
      // $data['kegiatan'] = $this->db->get("tblkegiatan")->result();
      $this->load->view("v_tr_kegiatan_a", $data);
    }

    public function get_kelurahan(){
      $id_kec = $this->input->post('idkec');

      $json_response = $this->db->get_where('tblkelurahan', array('id_kec'=>$id_kec))->result();
      foreach ($json_response as $rows){
          echo "<option value='$rows->id_kel'> $rows->nama </option>";
      }
    }

    public function get_dusun(){
     // $id_kec = $this->input->post('idkec');
      $id_kel = $this->input->post('idkel');

      $json_response = $this->db->get_where('tbldusun', array('kelurahan'=>$id_kel))->result();
      foreach ($json_response as $rows){
          echo "<option value='$rows->idtbldusun'> $rows->nama </option>";
      }
    }


    public function get_image(){
      $idtbl = $this->input->post('idtbl');
      $type = $this->input->post('type');
      $lokasi = base_url()."uploads/kegiatan/".$idtbl.'/';
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
      $nama_kegiatan = $this->input->post('nama_kegiatan');
      $tema = $this->input->post('tema');
      $lokasi = $this->input->post('lokasi');
      $alamat = $this->input->post('alamat');
      $komunitas = $this->input->post('komunitas');
      $kecamatan = $this->input->post('kecamatan');
      $kelurahan = $this->input->post('kelurahan');
      $desa = $this->input->post('desa');
      $provinsi = $this->input->post('provinsi');
      $tanggal_kegiatan = date("Y-m-d", strtotime($this->input->post("tanggal_kegiatan")));
      $penanggung_jawab = $this->input->post('penanggung_jawab');
      $ket = $this->input->post('ket');


      $data = array(
        'nama_kegiatan' => $nama_kegiatan,
        'tema' => $tema,
        'lokasi' => $lokasi,
        'alamat' => $alamat,
        'komunitas' => $komunitas,
        'kecamatan' => $kecamatan,
        'kelurahan' => $kelurahan,
        'desa' => $desa,
        'provinsi' => $provinsi,
        'tanggal_kegiatan' => $tanggal_kegiatan,
        'penanggung_jawab' => $penanggung_jawab,
        'ket' => $ket,
      );
      echo json_encode($data);
      $this->db->insert("tblkegiatan", $data);
      $idtblkegiatan		= $this->db->insert_id();

      redirect(base_url("tr_kegiatan"));
    }

    function set_upload_options($judul, $folder)
      {
        //upload an image options
        $config = array();
        $config['file_name']     = $judul;
        $config['upload_path']   = './uploads/kegiatan/'.$folder;
        $config['allowed_types'] = 'gif|jpg|png';
        $config['max_size']      = '0';
        $config['overwrite']     = FALSE;

        $this->load->library('upload', $config);
        return $config;
      }

    function edit($id_md5){
      $data['data'] = $this->db->get_where("tblkegiatan", array("md5(idtblkegiatan)" => $id_md5) )->row_array();
      $data['picture'] = $this->db->get_where("tblgalery", array("md5(idtbl)" => $id_md5, "type" => '1'))->result();
      $data['kecamatan'] = $this->db->get("tblkecamatan")->result();
      $data['kelurahan'] = $this->db->get("tblkelurahan")->result();
      $data['komunitas'] = $this->db->get("tblkomunitas")->result();
      $this->load->view("v_tr_kegiatan_e", $data);

    }

    function get_kegiatan(){
      $search = $this->input->post("search")['value'];
      $datax = $this->_ms->get_data($search, "tblkegiatan")->result();
		  $data = array(); $x = 0;
      // die(json_encode($datax));

      foreach ($datax as $rows){
        $row = array();
        $x++;
        $row[] = $rows->idtblkegiatan;
        $row[] = $rows->nama_kegiatan;
        $row[] = $rows->nama_komunitas;
        $row[] = $rows->tema;
        $row[] = $rows->lokasi;
        $row[] = $rows->alamat;
        $row[] = $rows->nama_kelurahan;
        $row[] = $rows->nama_kecamatan;
        $row[] = $rows->nama_desa;
        $row[] = $rows->tanggal_kegiatan;
        $row[] = $rows->penanggung_jawab;
        $row[] = $rows->ket;

        $row[12] = '';
        if($this->akses_array['update'] == '1'){
          $row[12] .= '<a href="'.base_url().'tr_kegiatan/edit/'.md5($rows->idtblkegiatan).'" class="blue btn-small btn " style="width:3%;"> <i class="mdi-editor-border-color right"></i></a>';
        }
        if($this->akses_array['delete'] == '1'){
          $row[12] .= '<a href="'.base_url().'tr_kegiatan/delete/'.md5($rows->idtblkegiatan).'" data-nama="'.$rows->nama_kegiatan.'" data-status="hapus" class="btn-small btn link_delete" style="width:3%;"> <i class="right mdi-navigation-cancel"></i></a> </div>';
        }

        $data[] = $row;
			}

      $output = array(
        "data" => $data
      );

      echo json_encode($output);

    }

    function proses_edit(){
      $nama_kegiatan = $this->input->post('nama_kegiatan');
      $tema = $this->input->post('tema');
      $lokasi = $this->input->post('lokasi');
      $alamat = $this->input->post('alamat');
      $komunitas = $this->input->post('komunitas');
      $kecamatan = $this->input->post('kecamatan');
      $kelurahan = $this->input->post('kelurahan');
      $desa = $this->input->post('desa');
      $provinsi = $this->input->post('provinsi');
      $tanggal_kegiatan = date("Y-m-d", strtotime($this->input->post("tanggal_kegiatan")));
      $penanggung_jawab = $this->input->post('penanggung_jawab');
      $ket = $this->input->post('ket');
      $idtblkegiatan = $this->input->post("idtblkegiatan");

      $data = array(
        'nama_kegiatan' => $nama_kegiatan,
        'tema' => $tema,
        'lokasi' => $lokasi,
        'alamat' => $alamat,
        'komunitas' => $komunitas,
        'kecamatan' => $kecamatan,
        'kelurahan' => $kelurahan,
        'desa' => $desa,
        'provinsi' => $provinsi,
        'tanggal_kegiatan' => $tanggal_kegiatan,
        'penanggung_jawab' => $penanggung_jawab,
        'ket' => $ket,
      );
      $this->db->where("idtblkegiatan", $idtblkegiatan);
      $this->db->update("tblkegiatan", $data);

      $this->session->set_flashdata('update', "Data $nama Sukses Di Perbarui");
      redirect(base_url("tr_kegiatan"));
    }

    function delete($id){
      // die($id);
      $this->db->where('md5(idtblkegiatan)', $id);
      $this->db->delete('tblkegiatan');
      // $this->db->update('tblkegiatan', array("flag" => "1"));

      $this->session->set_flashdata('delete', 'Data Sukses di hapus');
      redirect(base_url("tr_kegiatan"));
    }

    function active($id){
      // die($id);
      $this->db->where('md5(idtblkegiatan)', $id);
      $this->db->update('tblkegiatan', array("flag" => "0"));

      $this->session->set_flashdata('insert', 'Data Sukses di aktivasi');
      redirect(base_url("tr_kegiatan"));
    }

    function delete_pict($id, $id_md5, $name){
      // die($id_md5.'_'.$name);
      // $picture_name = $this->db->get_where("galery_detail", array('id' => $id))->row("picture_name");
      $file = './uploads/kegiatan/'.$id.'/'.$name;
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
