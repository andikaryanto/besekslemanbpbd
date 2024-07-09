<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class lp_export extends MY_Controller {
    public function __construct(){
        parent::__construct();
        $this->load->model('Lap_model', '_lap');
    }

    public function index()
    {
      // die(print_r($this->session->userdata));
      $data['bencana'] = $this->db->get_where("tblbencana", array("flag" => '0'))->result();
      $data['kecamatan'] = $this->db->get("tblkecamatan")->result();
      $data['barang'] = $this->db->get_where("tblbarang", array("flag" => '0'))->result();
      $data['gudang'] = $this->db->get_where("tblgudang", array("flag" => '0'))->result();
        $this->load->view('v_lp_export', $data);
    }

    function proses(){
        // die(print_r($this->input->post()));
        // die($id_md5.'___'.$aksi);
        $export = $this->input->post("export");
        $bencana = $this->input->post("bencana");
        $dari = $this->input->post("dari");
        $hingga = $this->input->post("hingga");
        $status = $this->input->post("status");
        $kecamatan = $this->input->post("kecamatan");
        $kelurahan = $this->input->post("kelurahan");

        $status_laporan = $this->input->post("status_laporan");

        switch ($export) {
          case 'bencana':
            switch ($status_laporan) {
              case 'rekap':
                $fileExport = $this->input->post("fileExport");
                $this->laporan_summary($bencana, $status, $dari, $hingga, $kecamatan, $kelurahan, $fileExport);
                break;
              case 'detail':
                $this->laporan_detail($bencana, $status, $dari, $hingga, $kecamatan, $kelurahan);
                break;
            }
            break;
          case 'Data Penduduk':
            $this->laporan_penduduk($kecamatan, $kelurahan);
            break;
          case 'Stok Barang':
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

            break;
          default:
            $this->session->set_flashdata('error', "Tidak ada pilihan");
            redirect(base_url("lp_export"));
            break;
        }
    }

    function coba(){
    $data = $this->_lap->lap_bencana(1);
    $idtbllaporan = ''; $coba = ''; $x = 0;

    foreach ($data->result() as $row){
      $x++;

      $idtbllaporan = $row->idtbllaporan;
      if($idtbllaporan != $coba){
        echo $idtbllaporan.'__'.$coba.'<br />';
      }else{
        $coba = $idtbllaporan;
        echo $row->idtbllaporan.'___'.$x.'<br /><br />';
      }
    }
    die();
    $letters = array();
    $letter = 'W';
    while ($letter !== 'BB') {
        $letters[] = $letter++;
        echo $letter.'<br />';
    }
  }

  function laporan_penduduk($kecamatan, $kelurahan){
    // die($kecamatan.'__'.$kelurahan);
    $data = $this->_lap->data_penduduk($kecamatan, $kelurahan);
    if($data->result() != array()){

        $this->load->library('PHPExcel');
    		$phpExcel = new PHPExcel();
    		$prestasi = $phpExcel->setActiveSheetIndex(0);
    		$phpExcel->getActiveSheet()->getStyle('A5:AZ5')->getFont()->setBold(true);

        $letter = 'B';
        while ($letter !== 'AZ') {
    			$phpExcel->getActiveSheet()->getColumnDimension($letter)->setAutoSize(true);
          $letter++;
    		}
    		$phpExcel->getActiveSheet()->getColumnDimension('A')->setWidth(10);
        $style_bold = array('font' => array('bold' => true,));
        $warna = array('font' => array(
                            'bold' => true,
                            'color' => array('rgb' => '2F4F4F')
                        ),
                        'alignment' => array(
                            'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
                        )
                    );
        $warna2 = array('font' => array(
                            'bold' => true,
                            'color' => array('rgb' => '2F4F4F')
                        ),
                        'fill' => array(
                          'type' => PHPExcel_Style_Fill::FILL_SOLID,
                          'startcolor' => array(
                            'rgb' => 'ADD8E6',
                            ),
                          ),
                        'alignment' => array(
                            'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
                        )
                    );

        if ($kecamatan != '') {
          $nama_kecamatan = $this->db->get_where("tblkecamatan", array("id_kec" => $kecamatan))->row("nama");
        }else{
          $nama_kecamatan = 'Semua';
        }

        if ($kelurahan != '') {
          $nama_kelurahan = $this->db->get_where("tblkelurahan", array("id_kel" => $kelurahan))->row("nama");
        }else{
          $nama_kelurahan = 'Semua';
        }

    	$prestasi->setCellValue('A1', "Data Penduduk");
    	$prestasi->setCellValue('A2', "Kecamatan : $nama_kecamatan");
    	$prestasi->setCellValue('D2', "Kelurahan : $nama_kelurahan");

    	$prestasi->setCellValue('A5', "No");
    	$prestasi->setCellValue('B5', "Kecamatan");
    	$prestasi->setCellValue('C5', "Desa");
    	$prestasi->setCellValue('D5', "Dusun");
    	$prestasi->setCellValue('E5', "KRB");
    	$prestasi->setCellValue('F5', "Radius");
    	$prestasi->setCellValue('G5', "Jumlah KK");
    	$prestasi->setCellValue('H5', "Penduduk (L)");
    	$prestasi->setCellValue('I5', "Penduduk (P)");
    	$prestasi->setCellValue('J5', "Bayi 0-12 bl ");
    	$prestasi->setCellValue('K5', "Balita 1-5 thn");
    	$prestasi->setCellValue('L5', "Anak 5-10 thn");
    	$prestasi->setCellValue('M5', "Dewasa 10-55 thn");
    	$prestasi->setCellValue('N5', "Lansia > 55 thn");
    	$prestasi->setCellValue('O5', "Difabel");
      $data_ternak = $this->db->get_where("tblternak", array("flag" => '0'));
      $count = $data_ternak->num_rows();
      $array_ternak = $data_ternak->result_array();

      $x = 0;
      $letter = 'P';
      while ($letter !== 'AZ') {
        $isi = $letter.'5';
        $prestasi->setCellValue($isi, $array_ternak[$x]['nama']);

        $letter++; $x++;
        if($x == $count){
          break;
        }
      }

    	   $no = 1;
         $id_kel = ''; $id_kec = ''; $idtbldusun = '';
    	   $rowexcel = 6; $jml_kec = 0;
        $id_jml = ''; $sum_desa = '';
        $sum_total = ''; $first_row_desa = '';
        // die(print_r($data->result()));
        foreach ($data->result() as $row){

          if ($id_kel != $row->id_kel) {
            if ($rowexcel != '6') { //jika dia bukan baris pertama pada setiap keluarhan, maka tambahkan jumlah per kelurahan.
              $last_row = $rowexcel - 1;
              $phpExcel->getActiveSheet()->mergeCells("A$rowexcel:F$rowexcel");
              $prestasi->setCellValue('A'.$rowexcel, "Jumlah");
              $letter = 'G';
              while ($letter !== 'P') {
                $rumus = '=SUM('.$letter.$first_row_desa.':'.$letter.$last_row.')';
                $prestasi->setCellValue($letter.$rowexcel, "$rumus");
                $letter++;
              }
              //ternak
              $x = 0;
              $letter = 'P';
              while ($letter !== 'AZ') {
                $rumus = '=SUM('.$letter.$first_row_desa.':'.$letter.$last_row.')';
                $prestasi->setCellValue($letter.$rowexcel, "$rumus");

                $letter++; $x++;
                if($x == $count){
                  break;
                }
              }

              $phpExcel->getActiveSheet()->getStyle("A$rowexcel")->applyFromArray($warna);
              $phpExcel->getActiveSheet()->getStyle("A$rowexcel:AZ$rowexcel")->getFont()->setBold(true);
              $sum_total = $sum_total."$#$".$rowexcel.'; ';
              $rowexcel++; $first_row_desa = '';
            }

            $prestasi->setCellValue('C'.$rowexcel, $row->nama_kel);
            $sum_desa = $rowexcel;
          }

          if ($id_kec != $row->id_kec ) {
            $prestasi->setCellValue('A'.$rowexcel, $no);
            $prestasi->setCellValue('B'.$rowexcel, $row->nama_kec);
            $no++;
          }

          if ($idtbldusun != $row->idtbldusun) {
            if ($first_row_desa == '') {
              $first_row_desa = $rowexcel;
            }
            $prestasi->setCellValue('D'.$rowexcel, $row->nama_dusun);
            $prestasi->setCellValue('E'.$rowexcel, $row->nama_krb);
            $prestasi->setCellValue('F'.$rowexcel, $row->radius_merapi.' Km');
            $prestasi->setCellValue('G'.$rowexcel, $row->jml_kk);
            $prestasi->setCellValue('H'.$rowexcel, $row->jml_lk);
            $prestasi->setCellValue('I'.$rowexcel, $row->jml_pr);
            $prestasi->setCellValue('J'.$rowexcel, $row->usia1);
            $prestasi->setCellValue('K'.$rowexcel, $row->usia2);
            $prestasi->setCellValue('L'.$rowexcel, $row->usia3);
            $prestasi->setCellValue('M'.$rowexcel, $row->usia4);
            $prestasi->setCellValue('N'.$rowexcel, $row->usia5);
            $prestasi->setCellValue('O'.$rowexcel, $row->difabel);

            $x = 0;
            $letter = 'P';
            while ($letter !== 'AZ') {
              $isi = $letter.$rowexcel;
              $prestasi->setCellValue($isi, $this->_lap->sum_ternak($row->idtbldusun, $array_ternak[$x]['idtblternak'])->row("jml"));

              $letter++; $x++;
              if($x == $count){
                break;
              }
            }

          }

    		  $id_kel = $row->id_kel;
    		  $id_kec = $row->id_kec;
          $idtbldusun = $row->idtbldusun;
          $rowexcel++;
    		} //end loop

        $last_row = $rowexcel - 1;
        $phpExcel->getActiveSheet()->mergeCells("A$rowexcel:F$rowexcel");
        $prestasi->setCellValue('A'.$rowexcel, "Jumlah");
        $letter = 'G';
        while ($letter !== 'P') {
          $rumus = '=SUM('.$letter.$first_row_desa.':'.$letter.$last_row.')';
          $prestasi->setCellValue($letter.$rowexcel, "$rumus");
          $letter++;
        }
        //ternak
        $x = 0;
        $letter = 'P';
        while ($letter !== 'AZ') {
          $rumus = '=SUM('.$letter.$first_row_desa.':'.$letter.$last_row.')';
          $prestasi->setCellValue($letter.$rowexcel, "$rumus");

          $letter++; $x++;
          if($x == $count){
            break;
          }
        }
        $phpExcel->getActiveSheet()->getStyle("A$rowexcel")->applyFromArray($warna);
        $phpExcel->getActiveSheet()->getStyle("A$rowexcel:AZ$rowexcel")->getFont()->setBold(true);
        $sum_total = $sum_total."$#$".$rowexcel.'; ';
        $rowexcel++; $first_row_desa = '';

        //TOTAL
        $phpExcel->getActiveSheet()->mergeCells("A$rowexcel:F$rowexcel");
        $prestasi->setCellValue('A'.$rowexcel, "TOTAL");
        $letter = 'G';
        while ($letter !== 'P') {
          $row_total = str_replace("#", $letter, $sum_total);
          $row_total = substr($row_total, 0,-2);
          $rumus = "=SUM($row_total)";
          $validLocale = PHPExcel_Settings::setLocale('es');
          if (!$validLocale) {
              echo 'Unable to set locale to '.$locale." - reverting to en_us<br />\n";
          }
          $internalFormula =
              PHPExcel_Calculation::getInstance()->_translateFormulaToEnglish($rumus);

          $prestasi->setCellValue($letter.$rowexcel, "$internalFormula");
          $letter++;
        }

        //ternak
        $x = 0;
        $letter = 'P';
        while ($letter !== 'AZ') {
          $row_total = str_replace("#", $letter, $sum_total);
          $row_total = substr($row_total, 0,-2);
          $rumus = "=SUM($row_total)";
          $validLocale = PHPExcel_Settings::setLocale('es');
          if (!$validLocale) {
              echo 'Unable to set locale to '.$locale." - reverting to en_us<br />\n";
          }
          $internalFormula =
              PHPExcel_Calculation::getInstance()->_translateFormulaToEnglish($rumus);

          $prestasi->setCellValue($letter.$rowexcel, "$internalFormula");

          $letter++; $x++;
          if($x == $count){
            break;
          }
        }
        $letter = $this->decrementLetter($letter);
        $phpExcel->getActiveSheet()->getStyle("A$rowexcel:"."$letter"."$rowexcel")->applyFromArray($warna2);
        $phpExcel->getActiveSheet()->getStyle("A$rowexcel:O$rowexcel")->getFont()->setBold(true);

        // die();
        $prestasi->setTitle("Laporan KK");
         ob_end_clean();
    		header("Content-Type: application/vnd.ms-excel");
    		header("Content-Disposition: attachment; filename=\"Laporan KK.xls\"");
    		header("Cache-Control: max-age=0");
    		$objWriter = PHPExcel_IOFactory::createWriter($phpExcel, "Excel5");
    		$objWriter->save("php://output");
      }else{
        // die(print_r($data));
        $this->session->set_flashdata('error', "Data Tidak Ada");
        redirect(base_url("lp_export"));
      }
  }

  function laporan_summary($bencana = '', $status = '', $dari = '', $hingga = '', $kecamatan = '', $kelurahan = '', $fileExport = ''){
  $data = $this->_lap->sub_header_bencana($bencana, $status, $dari, $hingga, $kecamatan, $kelurahan);
  if($data->result() != array()){

      switch ($fileExport) {
        case 'pdf':
          //TODO: Export PDF here
          $this->session->set_flashdata('error', "PDF not ready yet");
          redirect(base_url("lp_export"));
          break;
        
        default:
          $this->exportExcelLaporanSummary($data, $bencana, $status, $dari, $hingga, $kecamatan, $kelurahan);
          break;
      }

    }else{
      // die(print_r($data));
      $this->session->set_flashdata('error', "Data Tidak Ada");
      redirect(base_url("lp_export"));
    }
    // exit;
  }

  function exportExcelLaporanSummary($data, $bencana = '', $status = '', $dari = '', $hingga = '', $kecamatan = '', $kelurahan = ''){
    $this->load->library('PHPExcel');
    $phpExcel = new PHPExcel();
    $prestasi = $phpExcel->setActiveSheetIndex(0);
    $phpExcel->getActiveSheet()->getStyle('A6:CZ6')->getFont()->setBold(true);

    $phpExcel->getActiveSheet()->mergeCells('B6:C6');
    $letter = 'B';
    while ($letter !== 'CZ') {
      $phpExcel->getActiveSheet()->getColumnDimension($letter)->setAutoSize(true);
      $letter++;
    }
    $phpExcel->getActiveSheet()->getColumnDimension('A')->setWidth(10);
    $style_bold = array('font' => array('bold' => true,
                                   )
                   );
    $warna = array(
                'fill' => array(
                  'type' => PHPExcel_Style_Fill::FILL_SOLID,
                  'startcolor' => array(
                    'rgb' => 'ADD8E6',
                    ),
                  ),
                  'font' => array('bold' => true)
                );

    if ($kecamatan != '') {
      $nama_kecamatan = $this->db->get_where("tblkecamatan", array("id_kec" => $kecamatan))->row("nama");
    }else{
      $nama_kecamatan = 'Semua';
    }

    if ($kelurahan != '') {
      $nama_kelurahan = $this->db->get_where("tblkelurahan", array("id_kel" => $kelurahan))->row("nama");
    }else{
      $nama_kelurahan = 'Semua';
    }

  $nama_bencana = $this->db->get_where("tblbencana", array("id" => $bencana))->row("nama");
  if ($nama_bencana == '') {
      $nama_bencana = 'Semua Bencana';
  }
  $prestasi->setCellValue('A1', "Rekap Dampak $nama_bencana");
  $prestasi->setCellValue('A2', "Periode : $dari - $hingga");
  $prestasi->setCellValue('A4', "Status : $status");
  $prestasi->setCellValue('A3', "Kecamatan : $nama_kecamatan");
  $prestasi->setCellValue('D3', "Kelurahan : $nama_kelurahan");

  $prestasi->setCellValue('A6', "No");
  $prestasi->setCellValue('B6', "Kecamatan");
  $prestasi->setCellValue('D6', "Total Kejadian");
  // $prestasi->setCellValue('C6', 'Kelurahan');

    $data_bencana = $this->db->get_where("tbldampak", array("flag" => '0'));
    $count = $data_bencana->num_rows();
    $array_bencana = $data_bencana->result_array();
    $x = 0;
    $letter = 'D';
    while ($letter !== 'CZ') {
      $letter++;
      $isi = $letter.'6';
      $prestasi->setCellValue($isi, $array_bencana[$x]['nama']);

      $x++;
      if($x == $count){
        break;
      }
    }

     $no = 1; $id_kec = '';
    $no2 = 1; $id_kel = '';
     $rowexcel = 7; $jml_kec = 0;
    $id_jml = ''; $flag_sum = '';
    $sum_total = '';
    // die(print_r($data->result()));
    $total_kejadian_per_kecamatan = 0;
    $nama_kecamatan_sebelumnya = "";
    foreach ($data->result() as $row){
      // piye logic e wkwkwk, sik  delo
      // 
      if ($id_kec != $row->id_kec) {
      $range_merge_kel = "B".$rowexcel.':'.$letter.$rowexcel;
      $phpExcel->getActiveSheet()->mergeCells($range_merge_kel);
      $prestasi->setCellValue('A'.$rowexcel, $no2);
      $prestasi->setCellValue('B'.$rowexcel, $row->nama_kecamatan);
      $rowexcel++;
      $no2++; $no = 1;
      // echo $id_kel.'___'.$row->id_kel.'<br />';
      }
      // echo $id_kel.'_aas__'.$row->id_kel.'<br />';
      if ($id_kel != $row->id_kel) {
        if ($flag_sum == '') { //ambil flag sum dari row total kejadian per kelurahan paling atas
          $flag_sum = $rowexcel;
        }
        $prestasi->setCellValue('B'.$rowexcel, $no);
        $prestasi->setCellValue('C'.$rowexcel, $row->nama_kelurahan);
        $prestasi->setCellValue('D'.$rowexcel, $row->total);
        $total_kejadian_per_kecamatan += $row->total;

        $letter = 'D';
        $x = 0;
        while ($letter !== 'CZ') {
          $letter++;
          $col = $letter.$rowexcel;
          $jml = $this->_lap->num_detail($row->id_kel, $array_bencana[$x]['idtbldampak'])->row("jml");
          if ($jml == '') {
          $jml = 0;
          }
          $prestasi->setCellValue($col, $jml);

          $x++;
          if($x == $count){
          break;
          }
        }
        // echo $flag_sum.'<br />'; // untuk sum setiap kejadian
        $rowexcel++;
        $row_jumlah_kolom = $rowexcel + $no; 
        //-][00000000\77770]
        // row jumlah e rodo angel sek
        // logic e yo, $row_jumlah_kolom = $rowexcel + jumlah keluarahan ndek data
        //-][00000000\77770];  
        $no++;
        $jml_kec++;
        // echo $jml_kec.'__'.$row->jml_kec.'<br />';
          // if ($jml_kec == $row->jml_kec || $kelurahan != '') { //sub total per kecamatan
          if($nama_kecamatan_sebelumnya != $row->nama_kecamatan) {
            $nama_kecamatan_sebelumnya = $row->nama_kecamatan;
            $cell_subtotal = "B".$row_jumlah_kolom .':C'. $row_jumlah_kolom;
            $phpExcel->getActiveSheet()->mergeCells($cell_subtotal);
            $prestasi->setCellValue('B'.$row_jumlah_kolom, "JUMLAH");

            $letter = 'D'; $x = 0;
            while ($letter !== 'CZ') {
              $isi = $letter.$rowexcel;
              $begin = $letter.$flag_sum;
              $last = $rowexcel - 1;
              $isi2 = '=SUM('.$begin.':'.$letter.$last.")";
              $locale = 'es';
              $validLocale = PHPExcel_Settings::setLocale($locale);
              if (!$validLocale) {
                echo 'Unable to set locale to '.$locale." - reverting to en_us<br />\n";
              }
              $internalFormula =
                PHPExcel_Calculation::getInstance()->_translateFormulaToEnglish($isi2);

              $prestasi->setCellValue($isi,$internalFormula);
              $phpExcel->getActiveSheet()->getStyle($begin.':'.$isi)->getNumberFormat()->setFormatCode('#,##0');

              if($x == $count){
                break;
              }
            $x++; $letter++;
            }
            $set_bold = "A".$rowexcel.':'.$letter.$rowexcel;

            $sum_total = $sum_total."$#$".$rowexcel.'; ';
            $jml_kec = 0;
            $rowexcel++;
            $flag_sum = '';
          }
      }

      $id_kel = $row->id_kel;
      $id_kec = $row->id_kec;

    } //end loop

    //die("asd");
    $phpExcel->getActiveSheet()->mergeCells("A$rowexcel:C$rowexcel");
    $prestasi->setCellValue("A$rowexcel","TOTAL");
    $phpExcel->getActiveSheet()
    ->getStyle("A$rowexcel")
    ->getAlignment()
    ->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

    $letter = 'D'; $x = 0;
    while ($letter !== 'CZ') {
      $isi = $letter.$rowexcel;
      $row_total = str_replace("#", $letter, $sum_total);
      $row_total = substr($row_total, 0,-2);

      $isi2 = "=SUM(".$row_total." )";
      $locale = 'es';
      $validLocale = PHPExcel_Settings::setLocale($locale);
      if (!$validLocale) {
          echo 'Unable to set locale to '.$locale." - reverting to en_us<br />\n";
      }
      $internalFormula =
          PHPExcel_Calculation::getInstance()->_translateFormulaToEnglish($isi2);
      // echo $isi2.'___'.$internalFormula.'<br />';
      $prestasi->setCellValue($isi,$internalFormula);
      if($x == $count){
        break;
      }
      $x++; $letter++;
    }
    $begin = "A".$rowexcel;
    $phpExcel->getActiveSheet()->getStyle($begin.':'.$isi)->getNumberFormat()->setFormatCode('#,##0');
    $phpExcel->getActiveSheet()->getStyle($begin.':'.$isi)->applyFromArray($warna);

    // die();

    $prestasi->setTitle("Laporan Rekap $nama_bencana");
     ob_end_clean();
    header("Content-Type: application/vnd.ms-excel");
    header("Content-Disposition: attachment; filename=\"Laporan Rekap Dampak $nama_bencana $dari - $hingga.xls\"");
    header("Cache-Control: max-age=0");
    $objWriter = PHPExcel_IOFactory::createWriter($phpExcel, "Excel5");
    $objWriter->save("php://output");
  }

	function laporan_detail($bencana, $status, $dari, $hingga, $kecamatan, $kelurahan){

    $data = $this->_lap->lap_bencana($bencana, $status, $dari, $hingga, $kecamatan, $kelurahan);

    if ($data != array()) {
      $this->load->library('PHPExcel');
  		$phpExcel = new PHPExcel();
  		$prestasi = $phpExcel->setActiveSheetIndex(0);
  		 $phpExcel->getActiveSheet()->getStyle('A6:DZ6')->getFont()->setBold(true);

  		$phpExcel->getActiveSheet()->getColumnDimension('A')->setWidth(10);

      $letter = 'B';
      while ($letter !== 'DZ') {
  			$phpExcel->getActiveSheet()->getColumnDimension($letter)->setAutoSize(true);
        $letter++;
  		}

      $warna = array(
                  'fill' => array(
                    'type' => PHPExcel_Style_Fill::FILL_SOLID,
                    'startcolor' => array(
                      'rgb' => 'ADD8E6',
                      ),
                    ),
                  );
  		// $phpExcel->getActiveSheet()->getRowDimension(7)->setRowHeight(35);
  		// $phpExcel->getActiveSheet()->getStyle('A7:AD8')->getAlignment()->setWrapText(true);
      if ($kecamatan != '') {
        $nama_kecamatan = $this->db->get_where("tblkecamatan", array("id_kec" => $kecamatan))->row("nama");
      }else{
        $nama_kecamatan = 'Semua';
      }

      if ($kelurahan != '') {
        $nama_kelurahan = $this->db->get_where("tblkelurahan", array("id_kel" => $kelurahan))->row("nama");
      }else{
        $nama_kelurahan = 'Semua';
      }


  		$prestasi->setCellValue('A1', 'Data Detail Kejadian');
  		$prestasi->setCellValue('A2', "Periode : $dari - $hingga"); $prestasi->setCellValue('A4', "Status : $status");
  		$prestasi->setCellValue('A3', "Kecamatan : $nama_kecamatan");
  		$prestasi->setCellValue('D3', "Kelurahan : $nama_kelurahan");
  		$prestasi->setCellValue('A6', "No");
  		$prestasi->setCellValue('B6', "Hari");
  		$prestasi->setCellValue('C6', 'Tanggal');
  		$prestasi->setCellValue('D6', 'Waktu Kejadian');
      $prestasi->setCellValue('E6', 'Waktu Input');
  		$prestasi->setCellValue('F6', 'Jenis Bencana');
  		$prestasi->setCellValue('G6', 'Dusun');
  		$prestasi->setCellValue('H6', 'RT');
  		$prestasi->setCellValue('I6', 'RW');
  		$prestasi->setCellValue('J6', 'Desa');
  		$prestasi->setCellValue('K6', 'Kecamatan');
  		$prestasi->setCellValue('L6', 'Latitude');
  		$prestasi->setCellValue('M6', 'Longitude');
  		$prestasi->setCellValue('N6', 'Dampak Rangkuman');
  		$prestasi->setCellValue('O6', 'Nama Kepala Keluarga');
  		$prestasi->setCellValue('P6', 'Usia');
  		$prestasi->setCellValue('Q6', 'Nama Anggota');
  		$prestasi->setCellValue('R6', 'Usia');
  		$prestasi->setCellValue('S6', 'Status Keluarga');
      $prestasi->setCellValue('T6', 'Keterangan Korban Jiwa');
  		// $prestasi->setCellValue('T6', 'Lansia');
  		// $prestasi->setCellValue('U6', 'Difabel');
  		// $prestasi->setCellValue('V6', 'Bumil');
  		// $prestasi->setCellValue('W6', 'Nama');
      
      $data_bencana = $this->db->get_where("tbldampak", array("flag" => '0'));
      $count = $data_bencana->num_rows();
      $array_bencana = $data_bencana->result_array();
      $x = 0;
      $letter = 'T';
      while ($letter !== 'DZ') {
        $letter++;
        $isi = $letter.'6';
    		$prestasi->setCellValue($isi, $array_bencana[$x]['nama']);

        $x++;
        if($x == $count){
          break;
        }
      }

  		$no = 1;
  		$rowexcel = 7;
      $idtbllaporan = '';
      // die(print_r($data));
      $array_hari = array(1=>"Senin","Selasa","Rabu","Kamis","Jumat","Sabtu","Minggu");

      foreach ($data->result() as $row){
        $hari = $array_hari[date('N', strtotime($row->tanggal_kejadian))];
        // echo $hari;die;
  			$prestasi->setCellValue('A'.$rowexcel, $no);
        $prestasi->setCellValue('B'.$rowexcel, $hari);
  			$prestasi->setCellValue('C'.$rowexcel, date('d-m-Y', strtotime($row->tanggal_kejadian)));
  			$prestasi->setCellValue('D'.$rowexcel, date('H:i:s', strtotime($row->tanggal_kejadian)));
        $prestasi->setCellValue('E'.$rowexcel, date('d-m-y / H:i:s', strtotime($row->waktu_buat)));
  			$prestasi->setCellValue('F'.$rowexcel, $row->nama_bencana);
  			$prestasi->setCellValue('G'.$rowexcel, $row->nama_dusun);
  			$prestasi->setCellValue('H'.$rowexcel, $row->rt);
  			$prestasi->setCellValue('I'.$rowexcel, $row->rw);
  			$prestasi->setCellValue('J'.$rowexcel, $row->nama_desa);
  			$prestasi->setCellValue('K'.$rowexcel, $row->nama_kecamatan);
  			$prestasi->setCellValue('L'.$rowexcel, $row->latitude);
  			$prestasi->setCellValue('M'.$rowexcel, $row->longitude);
  			$prestasi->setCellValue('N'.$rowexcel, $row->dampak);
  			$prestasi->setCellValue('O'.$rowexcel, "");
  			$prestasi->setCellValue('P'.$rowexcel, "");
  			$prestasi->setCellValue('Q'.$rowexcel, "");
  			$prestasi->setCellValue('R'.$rowexcel, "");
  			$prestasi->setCellValue('S'.$rowexcel, "");
  			$prestasi->setCellValue('T'.$rowexcel, $row->rangkuman_korban);
  			// $prestasi->setCellValue('T'.$rowexcel, "");
  			// $prestasi->setCellValue('U'.$rowexcel, "");
  			// $prestasi->setCellValue('V'.$rowexcel, "");
  			// $prestasi->setCellValue('W'.$rowexcel, "");

        $data_detail = $this->_lap->detail_bencana($row->idtbllaporan);
        $letter = 'U'; $x = 0;
        while ($letter !== 'DZ') {
          $isi = $letter.$rowexcel;
          $prestasi->setCellValue($isi, 0);
          foreach ($data_detail->result() as $rows) {
            if ($rows->idtbldampak == $array_bencana[$x]['idtbldampak']) {
              $prestasi->setCellValue($isi, $rows->jumlah);
            }
          }
          $x++; $letter++;
          if($x == $count){
            break;
          }
        }

        $cek_kk = $this->_lap->header_kk($row->idtbllaporan)->result();
        if ($cek_kk != array()) {
          foreach ($cek_kk as $rows) {
      			$prestasi->setCellValue('O'.$rowexcel, $rows->nama);
      			$prestasi->setCellValue('P'.$rowexcel, $rows->usia);

            $anggota_kk = $this->_lap->detail_kk($rows->idtblkk);
            if ($anggota_kk->result() != array()) {
              $jml_kk = $anggota_kk->num_rows();
              $loop = 1;
              foreach ($anggota_kk->result() as $detail) {
                if ($detail->type == '1') { //manusia
                  $prestasi->setCellValue('Q'.$rowexcel, $detail->nama);
                  $prestasi->setCellValue('R'.$rowexcel, $detail->usia);
                  $prestasi->setCellValue('S'.$rowexcel, $detail->status);
                }else{ //hewan
                  $prestasi->setCellValue('P'.$rowexcel, $detail->nama_ternak);
                  $prestasi->setCellValue('Q'.$rowexcel, "Jumlah Ternak : $detail->jml_ternak");
                  $prestasi->setCellValue('R'.$rowexcel, "Ternak");
                }
                if ($loop != $jml_kk ) {
                  $rowexcel++;
                }
                $loop++;
              }
            }
            $rowexcel++;
          }
        }else{
          $rowexcel++;
        }
  			 $no++;
  		}
      // die('asd');
      $letter = 'U'; $x = 0;
      while ($letter !== 'DZ') {
        $isi = $letter.$rowexcel;
        $begin = $letter.'7';
        $last = $rowexcel - 1;
        $isi2 = '=SUM('.$begin.':'.$letter.$last.")";
        // die($isi2);
        $prestasi->setCellValue($isi,$isi2);
        $phpExcel->getActiveSheet()->getStyle($begin.':'.$isi)->getNumberFormat()->setFormatCode('#,##0');

        $x++; $letter++;
        if($x == $count){
          break;
        }
      }

  		$phpExcel->getActiveSheet()->mergeCells("A$rowexcel:R$rowexcel");
      $prestasi->setCellValue("A$rowexcel","TOTAL");
      $phpExcel->getActiveSheet()
      ->getStyle("A$rowexcel")
      ->getAlignment()
      ->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
      $phpExcel->getActiveSheet()->getStyle("A$rowexcel:AZ$rowexcel")->getFont()->setBold(true);

      $warna_total = "A".$rowexcel.':'.$isi;
      $phpExcel->getActiveSheet()->getStyle($warna_total)->applyFromArray($warna);
  		// print_r($prestasi);
  		// die();

  		$prestasi->setTitle("Laporan Data Kejadian");
  		header("Content-Type: application/vnd.ms-excel");
  		header("Content-Disposition: attachment; filename=\"Laporan Kejadian $dari - $hingga.xls\"");
  		header("Cache-Control: max-age=0");
  		$objWriter = PHPExcel_IOFactory::createWriter($phpExcel, "Excel5");
  		$objWriter->save("php://output");
    }else{
      $this->session->set_flashdata('error', "Data Tidak Ada");
      redirect(base_url("lp_export"));
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
      // $pdf->Cell(280,13, '', 0, 1, 'C', 0, '', 0);
      // $pdf->SetFont('courier','R','11');
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

  function decrementLetter($Alphabet) {
      return chr(ord($Alphabet) - 1);
  }

  }

?>
