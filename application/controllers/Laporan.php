<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Laporan extends MY_Controller {
  public function __construct(){
      parent::__construct();
      $this->load->model('lap_model', '_lap');
  }

  public function index()
  {
      // $data['kejadian'] = $this->_ms->get_kejadian()->result();
      $data['barang'] = $this->db->get_where("tblbarang", array("flag" => '0'))->result();
      $data['gudang'] = $this->db->get_where("tblgudang", array("flag" => '0'))->result();
      $this->load->view('v_laporan_pdf', $data);
  }

  public function proses(){
    // die(print_r($this->input->post()));
    $jenis = $this->input->post("jenis");
    $barang = $this->input->post("barang");
    $gudang = $this->input->post("gudang");

    switch ($jenis) {
      case '1':
        $this->kartu_stok($barang, $gudang);
        break;
      case '2':
        $this->summary_stok($barang, $gudang);
        break;
    }
  }

  private function kartu_stok($barang, $gudang){
    // die($barang.'___'.$gudang);
    // print_r($barang);
    // die();
    if ($barang != array()) {
      $barang = implode(",", $barang);
    }
    if($gudang != array()){
      $gudang = implode(",", $gudang);
    }
    // die($barang);
    $data = $this->_lap->rekap_mutasi($gudang, $barang)->result();

		if($data != array()){
  		$judul = 'Laporan Kartu Stok';
  		$this->load->library('Pdf');
  		$pdf = new Pdf('L', 'mm', 'A4', true, 'UTF-8', false);
		  $pdf->judul = $judul;
		 
		  // set document information
		  $pdf->SetCreator(PDF_CREATOR);
		  $pdf->SetAuthor('Propan');
		  $pdf->SetTitle($judul);
		  $pdf->SetSubject('Laporan Stok');
		  $pdf->SetKeywords('BPBD, PDF, Sleman, Laporan');
	
		  // set default header data
		  $pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE, PDF_HEADER_STRING);
	
		  // set header and footer fonts
		  $pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
		  $pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));
	
		  // set default monospaced font
		  $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
	
		  // set margins
		  $pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
		  $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
		  $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);
	
		  // set auto page breaks
		  $pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
	
		  // set image scale factor
		  $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
	
		  $pdf->SetDisplayMode('real', 'default');
  		$pdf->AddPage('L', 'A4');
  		$fill=false;
  		$height = '6';
  		$col = array('25','65','15','20','35','30','40','47');//Lebarnya total 280, tinggal sesuaikan saja panjang 190

        $pdf->Ln(2);
  		$pdf->Cell(280,13, $judul, 0, 1, 'C', 0, '', 0);
  		$pdf->SetFont('courier','R','11');
  		// $pdf->Cell(280,5, 'Periode : '.$start.' - '.$end, 0, 1, 'C', 0, '', 0);
  		$pdf->SetFont('courier','B','9');
  		$pdf->SetFillColor(236,235,230); //main RGB aja

  		$pdf->Cell($col[0],$height, 'Tanggal', 'LTR', 0, 'C', 1, '', 0);
  		$pdf->Cell($col[1],$height, 'Nama Barang', 'LTR', 0, 'C', 1, '', 0);
  		$pdf->Cell($col[2],$height, 'Status', 'LTR', 0, 'C', 1, '', 0);
  		$pdf->Cell($col[3],$height, 'Qty', 'LTR', 0, 'C', 1, '', 0);
  		$pdf->Cell($col[4],$height, 'Gudang', 'LTR', 0, 'C', 1, '', 0);
  		$pdf->Cell($col[5],$height, 'Penerima', 'LTR', 0, 'C', 1, '', 0);
      $pdf->Cell($col[6]+$col[7],$height, 'Keterangan', 'LTR', 1, 'C', 1, '', 0);



  		foreach($data as $row){
  			// print_r($row);
  			$pdf->SetFont('courier','R','8');
  			$pdf->SetFillColor(255,255,255);

  			 $pdf->Cell($col[0],$height, date('d-m-Y', strtotime($row->create_time)), 'LT', 0, 'C', 1, '', 0);
  			 $pdf->Cell($col[1],$height, $row->nama_barang , 'LT', 0, 'LC', 1, '', 0);
  			 $pdf->Cell($col[2],$height, $row->status == '1' ? 'IN' : "OUT", 'LT', 0, 'C', 1, '', 0);
  			 $pdf->Cell($col[3],$height, number_format($row->stok,0,",","."), 'LT', 0, 'R', 1, '', 0);
  			 $pdf->Cell($col[4],$height, $row->nama_gudang, 'LT', 0, 'L', 1, '', 0);
  			 $pdf->Cell($col[5],$height, $row->penerima, 'LT', 0, 'L', 1, '', 0);
  			 $pdf->Cell($col[6]+$col[7],$height, $row->keterangan, 'LTR', 1, 'L', 1, '', 0);



  			if ( $pdf->gety() > 195) {

    			$pdf->Cell(280,13, $judul, 0, 1, 'C', 0, '', 0);
    			$pdf->SetFont('courier','R','11');
    			$pdf->Cell(280,5, 'Periode : '.$start.' - '.$end, 0, 1, 'C', 0, '', 0);
    			$pdf->SetFont('courier','B','9');
    			$pdf->SetFillColor(236,235,230); //main RGB aja

      		$pdf->Cell($col[0],$height, 'Tanggal', 'LTR', 0, 'C', 1, '', 0);
      		$pdf->Cell($col[1],$height, 'Nama Barang', 'LTR', 0, 'C', 1, '', 0);
      		$pdf->Cell($col[2],$height, 'Status', 'LTR', 0, 'C', 1, '', 0);
      		$pdf->Cell($col[3],$height, 'Qty', 'LTR', 0, 'C', 1, '', 0);
      		$pdf->Cell($col[4],$height, 'Gudang', 'LTR', 0, 'C', 1, '', 0);
      		$pdf->Cell($col[5],$height, 'Penerima', 'LTR', 0, 'C', 1, '', 0);
          $pdf->Cell($col[6]+$col[7],$height, 'Keterangan', 'LTR', 1, 'C', 1, '', 0);
  			}

  		}


			 $pdf->Cell($col[0],$height, '', 'T', 0, 'L', 1, '', 0);
			 $pdf->Cell($col[1],$height, '' , 'T', 0, 'LC', 1, '', 0);
			 $pdf->Cell($col[2],$height, '', 'T', 0, 'L', 1, '', 0);
			 $pdf->Cell($col[3],$height, '', 'T', 0, 'R', 1, '', 0);
			 $pdf->Cell($col[4],$height, '', 'T', 0, 'R', 1, '', 0);
			 $pdf->Cell($col[5],$height, '', 'T', 0, 'R', 1, '', 0);
			 $pdf->Cell($col[6],$height, '', 'T', 0, 'R', 1, '', 0);
			 $pdf->Cell($col[7],$height, '', 'T', 1, 'R', 1, '', 0);


				// $pdf->Cell($col[0],$height, 'tanda tangan', 'LT', 1, 'C', 1, '', 0);

				$pdf->Output('kartu_stok.pdf', 'I');
		}else{
			$this->session->set_flashdata('error', 'Data kosong');
			redirect(base_url('laporan'));
		}
  }

  private function summary_stok($barang, $gudang){

      // die($barang.'___'.$gudang);
      if ($barang != '') {
        $barang = implode(",", $barang);
      }
      if($gudang != ''){
        $gudang = implode(",", $gudang);
      }
      $data = $this->_lap->summary_stok($gudang, $barang)->result();

		if($data != array()){
  		$judul = 'Laporan Summary Stok';
  		$this->load->library('Pdf');
  		$pdf = new Pdf('L', 'mm', 'A4', true, 'UTF-8', false);
		  $pdf->judul = $judul;
		 
		  // set document information
		  $pdf->SetCreator(PDF_CREATOR);
		  $pdf->SetAuthor('Propan');
		  $pdf->SetTitle($judul);
		  $pdf->SetSubject('Laporan Stok');
		  $pdf->SetKeywords('BPBD, PDF, Sleman, Laporan');
	
		  // set default header data
		  $pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE, PDF_HEADER_STRING);
	
		  // set header and footer fonts
		  $pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
		  $pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));
	
		  // set default monospaced font
		  $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
	
		  // set margins
		  $pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
		  $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
		  $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);
	
		  // set auto page breaks
		  $pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
	
		  // set image scale factor
		  $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
	
		  $pdf->SetDisplayMode('real', 'default');
  		$pdf->AddPage('L', 'A4');
  		$fill=false;
  		$height = '6';
  		$col = array('25','65','15','20','35','30','40','47');//Lebarnya total 280, tinggal sesuaikan saja panjang 190

      $pdf->Ln(2);
  		$pdf->Cell(280,13, $judul, 0, 1, 'C', 0, '', 0);
  		$pdf->SetFont('courier','R','11');
  		// $pdf->Cell(280,5, 'Periode : '.$start.' - '.$end, 0, 1, 'C', 0, '', 0);
  		$pdf->SetFont('courier','B','9');
  		$pdf->SetFillColor(236,235,230); //main RGB aja

  		$pdf->Cell($col[1],$height, 'Nama Barang', 'LTR', 0, 'C', 1, '', 0);
      $pdf->Cell($col[0],$height, 'Satuan', 'LTR', 0, 'C', 1, '', 0);
  		$pdf->Cell($col[3],$height, 'Qty Akhir', 'LTR', 0, 'C', 1, '', 0);
  		$pdf->Cell($col[2]+$col[4],$height, 'Gudang', 'LTR', 0, 'C', 1, '', 0);
  		$pdf->Cell($col[5]+$col[6]+$col[7],$height, 'Kelurahan', 'LTR', 1, 'C', 1, '', 0);

  		foreach($data as $row){
  			// print_r($row);
  			$pdf->SetFont('courier','R','8');
  			$pdf->SetFillColor(255,255,255);

         $pdf->Cell($col[1],$height, $row->nama_barang , 'LT', 0, 'LC', 1, '', 0);
  			 $pdf->Cell($col[0],$height, $row->uom, 'LT', 0, 'L', 1, '', 0);
         $pdf->Cell($col[3],$height, number_format($row->sisa_stok,0,",","."), 'LT', 0, 'C', 1, '', 0);
  			 $pdf->Cell($col[2]+$col[4],$height, $row->nama_gudang, 'LT', 0, 'L', 1, '', 0);
  			 $pdf->Cell($col[5]+$col[6]+$col[7],$height, $row->nama_kelurahan, 'LTR', 1, 'L', 1, '', 0);

  			if ( $pdf->gety() > 195) {

    			$pdf->Cell(280,13, $judul, 0, 1, 'C', 0, '', 0);
    			$pdf->SetFont('courier','R','11');
    			$pdf->SetFont('courier','B','9');
    			$pdf->SetFillColor(236,235,230); //main RGB aja

          $pdf->Cell($col[1],$height, 'Nama Barang', 'LTR', 0, 'C', 1, '', 0);
          $pdf->Cell($col[0],$height, 'Satuan', 'LTR', 0, 'C', 1, '', 0);
      		$pdf->Cell($col[3],$height, 'Qty Akhir', 'LTR', 0, 'C', 1, '', 0);
      		$pdf->Cell($col[2]+$col[4],$height, 'Gudang', 'LTR', 0, 'C', 1, '', 0);
      		$pdf->Cell($col[5]+$col[6]+$col[7],$height, 'Kelurahan', 'LTR', 1, 'C', 1, '', 0);
  			}

  		}


			 $pdf->Cell($col[0],$height, '', 'T', 0, 'L', 1, '', 0);
			 $pdf->Cell($col[1],$height, '' , 'T', 0, 'LC', 1, '', 0);
			 $pdf->Cell($col[2],$height, '', 'T', 0, 'L', 1, '', 0);
			 $pdf->Cell($col[3],$height, '', 'T', 0, 'R', 1, '', 0);
			 $pdf->Cell($col[4],$height, '', 'T', 0, 'R', 1, '', 0);
			 $pdf->Cell($col[5],$height, '', 'T', 0, 'R', 1, '', 0);
			 $pdf->Cell($col[6],$height, '', 'T', 0, 'R', 1, '', 0);
			 $pdf->Cell($col[7],$height, '', 'T', 1, 'R', 1, '', 0);


				// $pdf->Cell($col[0],$height, 'tanda tangan', 'LT', 1, 'C', 1, '', 0);

				$pdf->Output('kartu_stok.pdf', 'I');
		}else{
			$this->session->set_flashdata('error', 'Data kosong');
			redirect(base_url('laporan'));
		}
  }
}
