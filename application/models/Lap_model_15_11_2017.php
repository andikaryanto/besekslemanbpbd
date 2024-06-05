<?php
class Lap_model extends CI_Model
{
  function data_kejadian( $flag = '' , $from , $to){
    $sql = "SELECT a.*, b.nama AS nama_kelurahan, c.nama AS nama_bencana, c.icon, c.id, d.picture_name FROM tbllaporan a
            LEFT JOIN tblkelurahan b ON a.kelurahan = b.`id_kel`
            LEFT JOIN tblbencana c ON c.`id` = a.bencana
            LEFT JOIN tbllaporan_galery d ON d.idtbllaporan = a.idtbllaporan";
    if ($flag != '') {
      $sql .= " WHERE a.flag = '$flag' ";
    }
    return $this->db->query($sql);
  }

  function data_penduduk($kecamatan, $kelurahan){

    $sql = "SELECT e.nama AS nama_kec,
            d.`id_kel`, e.`id_kec`, b.`idtbldusun`,
            d.nama AS nama_kel,
            b.nama AS nama_dusun,
            b.idtbldusun,
            f.*,
            b.radius_merapi,
            g.nama AS nama_krb
            FROM tblkk a
            LEFT JOIN tbldusun b ON b.`idtbldusun` = a.`idtbldusun`
            LEFT JOIN tblkelurahan d ON b.`id_kel` = d.`id_kel`
            LEFT JOIN tblkecamatan e ON d.`id_kec` = e.`id_kec`
            LEFT JOIN (
            	SELECT a.idtbldusun, COUNT(a.idtblkk) AS jml_kk, IFNULL(SUM(lk),0) + 1 AS jml_lk , IFNULL(SUM(pr),0) AS jml_pr, IFNULL(SUM(usia1),0) AS usia1,
                   IFNULL(SUM(usia2),0) AS usia2,
          	       IFNULL(SUM(usia3),0) AS usia3, IFNULL(SUM(usia4),0) AS usia4,
                   IFNULL(SUM(usia5),0) AS usia5, IFNULL(SUM(difabel),0) AS difabel FROM tblkk a
            	LEFT JOIN (
            		SELECT idtblkk, COUNT(jenis_kelamin) AS lk FROM tblkk_detail WHERE jenis_kelamin = 'laki-laki'
            		GROUP BY idtblkk
            	) b ON b.idtblkk = a.idtblkk
            	LEFT JOIN (
            		SELECT idtblkk, COUNT(jenis_kelamin) AS pr FROM tblkk_detail WHERE jenis_kelamin = 'perempuan'
            		GROUP BY idtblkk
            	) c ON c.idtblkk = a.idtblkk
            	LEFT JOIN (
            		SELECT idtblkk, COUNT((DATEDIFF(NOW(),tanggal_lahir) /365 )) AS usia1 FROM tblkk_detail
            		WHERE (DATEDIFF(NOW(),tanggal_lahir) /365 ) < 1 GROUP BY idtblkk
            	) d ON d.idtblkk = a.`idtblkk`
            	LEFT JOIN (
            		SELECT idtblkk, COUNT((DATEDIFF(NOW(),tanggal_lahir) /365 )) AS usia2 FROM tblkk_detail
            		WHERE (DATEDIFF(NOW(),tanggal_lahir) /365 ) BETWEEN 1 AND 5 GROUP BY idtblkk
            	) e ON e.idtblkk = a.`idtblkk`
            	LEFT JOIN (
            		SELECT idtblkk, COUNT((DATEDIFF(NOW(),tanggal_lahir) /365 )) AS usia3 FROM tblkk_detail
            		WHERE (DATEDIFF(NOW(),tanggal_lahir) /365 ) BETWEEN 5 AND 10 GROUP BY idtblkk
            	) f ON f.idtblkk = a.`idtblkk`
            	LEFT JOIN (
            		SELECT idtblkk, COUNT((DATEDIFF(NOW(),tanggal_lahir) /365 )) AS usia4 FROM tblkk_detail
            		WHERE (DATEDIFF(NOW(),tanggal_lahir) /365 ) BETWEEN 10 AND 55 GROUP BY idtblkk
            	) g ON g.idtblkk = a.`idtblkk`
            	LEFT JOIN (
            		SELECT idtblkk, COUNT((DATEDIFF(NOW(),tanggal_lahir) /365 )) AS usia5 FROM tblkk_detail
            		WHERE (DATEDIFF(NOW(),tanggal_lahir) /365 ) > 55 GROUP BY idtblkk
            	) h ON h.idtblkk = a.`idtblkk`
            	LEFT JOIN (
            		SELECT idtblkk, COUNT(disabilitas) AS difabel FROM tblkk_detail WHERE disabilitas = '1'
            		GROUP BY idtblkk
            	) i ON i.idtblkk = a.idtblkk
            	GROUP BY a.`idtbldusun`
            ) f ON a.`idtbldusun` = f.idtbldusun
            LEFT JOIN tblkrb g ON g.idtblkrb = b.`idtblkrb`
            WHERE 1 = 1 ";
        if ($kecamatan != '') {
          $sql .= " AND e.id_kec = '$kecamatan'";
        }
        if ($kelurahan != '') {
          $sql .= " AND d.id_kel = '$kelurahan'";
        }

        $sql .= " GROUP BY b.idtbldusun ";

        //die($sql);
      return $this->db->query($sql);
  }

  function data_kejadian_live( $flag = '', $from, $to){
     //die($from.'___'.$to);
    if ($from != '' || $to != '') {

      $dari = date("Y-m-d", strtotime($from));
      $hingga = date("Y-m-d", strtotime($to));
    }else{

      $dari = date("Y-m-d");
      $hingga = $dari;
    }

    $sql = "SELECT a.*, b.nama AS nama_kelurahan, c.nama AS nama_bencana, c.icon, c.id, d.picture_name FROM tbllaporan a
            LEFT JOIN tblkelurahan b ON a.kelurahan = b.`id_kel`
            LEFT JOIN tblbencana c ON c.`id` = a.bencana
            LEFT JOIN tbllaporan_galery d ON d.idtbllaporan = a.idtbllaporan
            WHERE a.create_time between '$dari 00:00:01' AND '$hingga 23:59:59' ";
    if ($flag != '') {
      $sql .= " AND a.flag = '$flag' ";
    }
    // $sql .= " Limit 0,10";
    //die($sql);
    return $this->db->query($sql);
  }

  function rekap_mutasi($gudang, $barang){
    $sql = "SELECT a.*, c.nama AS nama_barang, d.nama AS nama_gudang FROM tr_stok_detail a
            LEFT JOIN tr_stok_header b ON b.`id_stok` = a.`id_stok`
            LEFT JOIN tblbarang c ON c.`idtblbarang` = b.`idtblbarang`
            LEFT JOIN tblgudang d ON d.`idtblgudang` = b.`idtblgudang`
            WHERE a.flag = '0'";
            if($barang != ''){
            $sql .= " AND b.`idtblbarang` IN ($barang)";
            }
            if($gudang != ''){
            $sql .= " AND b.`idtblgudang` IN ($gudang)";
            }
    // die($sql);
    return $this->db->query($sql);
  }

  function summary_stok($gudang, $barang){
    $sql = "SELECT a.*, c.nama AS nama_barang, c.`uom`, d.nama AS nama_gudang,  e.nama AS nama_kelurahan  FROM tr_stok_header a
            LEFT JOIN tblbarang c ON c.`idtblbarang` = a.`idtblbarang`
            LEFT JOIN tblgudang d ON d.`idtblgudang` = a.`idtblgudang`
            LEFT JOIN tblkelurahan e ON e.`id_kel` = d.`id_kel`
            WHERE a.flag = '0'";
            if($barang != ''){
            $sql .= " AND a.`idtblbarang` IN ($barang)";
            }
            if($gudang != ''){
            $sql .= " AND a.`idtblgudang` IN ($gudang)";
            }
    // die($sql);
    return $this->db->query($sql);
  }

  function lap_bencana($bencana, $status, $dari, $hingga, $kecamatan, $kelurahan){
//    die($bencana.'__'.$status.'___'.$dari.'___'.$hingga.'___'.$kecamatan.'___'.$kelurahan);

    $dari = date("Y-m-d", strtotime($dari));
    $hingga = date("Y-m-d", strtotime($hingga));

    $sql = "SELECT
            a.`idtbllaporan`,
            a.`create_time` AS tanggal_kejadian,
            d.`nama` AS nama_bencana,
            a.`dusun`,
            a.`rt`,
            a.`rw`,
            b.`nama` AS nama_desa,
            c.`nama` AS nama_kecamatan,
            a.`latitude`,
            a.`longitude`,
            a.dampak,
            a.rangkuman_korban
            /* e.* */
             FROM tbllaporan a
            LEFT JOIN tblkelurahan b ON b.`id_kel` = a.`kelurahan`
            LEFT JOIN tblkecamatan c ON c.`id_kec` = b.`id_kec`
            LEFT JOIN tblbencana d ON d.`id` = a.`bencana` WHERE a.create_time BETWEEN '$dari 00:00:01' AND '$hingga 23:59:59' ";
      if ($bencana != 'bencana_all' && $bencana != '') {
        $sql .= " AND a.bencana = '$bencana'";
      }
      if ($status != '') {
        $sql .= " AND a.status = '$status'";
      }
      if ($kecamatan != '') {
        $sql .= " AND c.id_kec = '$kecamatan'";
      }
      if ($kelurahan != '') {
        $sql .= " AND a.kelurahan = '$kelurahan'";
      }

    //die($sql);
  return $this->db->query($sql);
  }

  function header_kk($idtbllaporan){
    $sql = "SELECT b.idtblkk, b.nama, TIMESTAMPDIFF(YEAR,b.tanggal_lahir, CURDATE()) AS usia FROM tbllaporan_kk a
            LEFT JOIN tblkk b ON a.`idtblkk` = b.idtblkk
            WHERE a.idtbllaporan = '$idtbllaporan'
    ";
    // echo $sql.'<br /><br />';
    return $this->db->query($sql);
  }

  function detail_kk($idtblkk){
    $sql = "SELECT a.nama, TIMESTAMPDIFF(YEAR,a.tanggal_lahir, CURDATE()) AS usia , b.nama AS nama_ternak, a.type, a.status, a.jml_ternak FROM tblkk_detail a
            LEFT JOIN tblternak b ON b.`idtblternak` = a.idtblternak
            WHERE idtblkk = '$idtblkk' ";
    // echo $sql
    return $this->db->query($sql);
  }

  function detail_bencana($idtbllaporan){
    $sql = "SELECT z.jumlah, z.`idtbllaporan`, z.`idtbldampak`, zz.nama FROM tbllaporan_detail z
            LEFT JOIN tbldampak zz ON zz.idtbldampak = z.`idtbldampak` WHERE z.idtbllaporan = '$idtbllaporan' ";

    return $this->db->query($sql);
  }

  function sub_header_bencana($bencana, $status, $dari, $hingga, $kecamatan, $kelurahan){
    // die($bencana.'__'.$status.'___'.$dari.'___'.$hingga.'___'.$kecamatan.'___'.$kelurahan);

    $dari = date("Y-m-d", strtotime($dari));
    $hingga = date("Y-m-d", strtotime($hingga));

    //die($bencana.'___'.$status.'__'.$dari.'___'.$hingga.'__'.$kecamatan.'_aaaaaa__'.$kelurahan);
    $sql = "SELECT c.id_kec, c.nama AS nama_kecamatan, b.`id_kel`, b.nama AS nama_kelurahan, a.`idtbllaporan`,total, jml_kec FROM tbllaporan a
            LEFT JOIN tblkelurahan b ON b.`id_kel` = a.`kelurahan`
            LEFT JOIN tblkecamatan c ON c.`id_kec` = b.`id_kec`
            LEFT JOIN tbllaporan_detail d ON d.`idtbllaporan` = a.`idtbllaporan`
            LEFT JOIN (
              SELECT idtbllaporan,COUNT(kelurahan) AS total FROM tbllaporan ";
              if ($bencana != 'bencana_all' && $bencana != '') {
                $sql .= " WHERE `bencana` = '$bencana' ";
              }
            $sql .= "GROUP BY kelurahan)
              zz ON a.`idtbllaporan`=zz.idtbllaporan
            LEFT JOIN (
              SELECT id_kec, COUNT(id_kec) AS jml_kec FROM (SELECT
               b.nama, id_kec
              FROM
                tbllaporan a
                LEFT JOIN tblkelurahan b
                  ON b.id_kel = a.kelurahan ";
              if ($bencana != 'bencana_all' && $bencana != '') {
                $sql .= " WHERE `bencana` = '$bencana' ";
              }
              $sql .= "GROUP BY
                b.nama) zz GROUP BY id_kec
            	) xx ON b.`id_kec`=xx.id_kec ";
            if ($bencana != 'bencana_all' && $bencana != '' ) {
              $sql .= " WHERE `bencana` = '$bencana' ";
              $sql .= "AND a.create_time between '$dari 00:00:01' AND '$hingga 23:59:59'";
            }else{
              $sql .= "WHERE a.create_time between '$dari 00:00:01' AND '$hingga 23:59:59'";
            }


      if ($status != '') {
        $sql .= " AND a.status = '$status'";
      }
      if ($kecamatan != '') {
        $sql .= " AND c.id_kec = '$kecamatan'";
      }
      if ($kelurahan != '') {
        $sql .= " AND a.kelurahan = '$kelurahan'";
      }

	$sql .=" GROUP BY id_kel, a.idtbllaporan
          ";
    //$sql = "SELECT c.id_kec, c.nama AS nama_kecamatan, b.`id_kel`, b.nama AS nama_kelurahan, a.`idtbllaporan`,total, jml_kec FROM tbllaporan a LEFT JOIN tblkelurahan b ON b.`id_kel` = a.`kelurahan` LEFT JOIN tblkecamatan c ON c.`id_kec` = b.`id_kec` LEFT JOIN tbllaporan_detail d ON d.`idtbllaporan` = a.`idtbllaporan` LEFT JOIN (SELECT idtbllaporan,COUNT(kelurahan) AS total FROM tbllaporan WHERE `bencana` = '1' GROUP BY kelurahan) zz ON a.`idtbllaporan`=zz.idtbllaporan LEFT JOIN ( SELECT id_kec, COUNT(id_kec) AS jml_kec FROM (SELECT b.nama, id_kec FROM tbllaporan a LEFT JOIN tblkelurahan b ON b.id_kel = a.kelurahan WHERE a.`bencana` = '1' GROUP BY b.nama) zz GROUP BY id_kec ) xx ON b.`id_kec`=xx.id_kec WHERE a.`bencana` = '1' AND a.create_time between '2017-09-01 00:00:01' AND '2017-11-03 23:59:59' GROUP BY id_kel, a.idtbllaporan";
    // die($sql);
    return $this->db->query($sql);
  }

  function num_detail($kel, $idtbldampak){
    $sql = "SELECT SUM(jumlah) AS jml FROM
            tbllaporan_detail a
            LEFT JOIN tbllaporan b ON b.idtbllaporan = a.`idtbllaporan`
            WHERE kelurahan = '$kel' AND idtbldampak = '$idtbldampak'
            ";
    return $this->db->query($sql);
  }
}
