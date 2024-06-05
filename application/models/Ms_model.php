<?php
class Ms_model extends CI_Model
{

  function get_data($search, $table, $id = ''){

    $sql = "SELECT * FROM $table ";

    if ($table == 'tblkelurahan') {
      $sql .= " WHERE md5(id_kec) = '$id' ";
    }elseif ($table == 'tblews') {
      $sql = "SELECT a.*, b.nama as nama_kelurahan FROM $table a left join tblkelurahan b on b.id_kel = a.id_kel ";
    }elseif ($table == 'tblperalatanbpbd_item') {
      $sql = "SELECT a.*, b.nama as nama_peralatan FROM $table a left join tblperalatanbpbd b on b.idtblperalatanbpbd = a.idtblperalatanbpbd WHERE md5(a.idtblperalatanbpbd) = '$id'";
    }elseif ($table == 'tblperalatanbpbd_detail') {
      $sql = "SELECT a.*, b.nama as nama_item FROM $table a left join tblperalatanbpbd_item b on b.idtblperalatanbpbd_item = a.idtblperalatanbpbd_item WHERE md5(a.idtblperalatanbpbd_item) = '$id'";
    }elseif ($table == 'tblperalatan_detail') {
      $sql = "SELECT a.*, b.nama as nama_peralatan FROM $table a left join tblperalatan b on b.idtblperalatan = a.idtblperalatan WHERE md5(a.idtblperalatan) = '$id'";
    }elseif ($table == 'tblgudang') {
      $sql = "SELECT a.*, b.nama as nama_kelurahan FROM $table a left join tblkelurahan b on b.id_kel = a.id_kel ";
    }elseif ($table == 'tbldesa') {
      $sql = "SELECT a.*, b.nama as nama_kelurahan, c.nama as nama_kecamatan FROM $table a left join tblkelurahan b on b.id_kel = a.kelurahan left join tblkecamatan c on c.id_kec = a.kecamatan ";
    }elseif ($table == 'tblpotensi') {
      $sql = "SELECT a.*, b.nama as nama_kelurahan, c.nama as nama_kecamatan FROM $table a left join tblkelurahan b on b.id_kel = a.kelurahan left join tblkecamatan c on c.id_kec = a.kecamatan ";
    }elseif ($table == 'tblmenu') {
      $sql = "SELECT a.*, b.menu AS menu_parent, b.`idtblmenu` AS id_parent FROM tblmenu a LEFT JOIN tblmenu b ON b.`idtblmenu` = a.`parent` ";
    }elseif ($table == 'tbluser') {
      $sql = "SELECT a.*, b.nama AS nama_group, b.`idtblgroup` AS id_group FROM tbluser a LEFT JOIN tblgroup b ON b.`idtblgroup` = a.`idtblgroup` ";
    }elseif ($table == 'tblrelawan') {
      $sql = "SELECT a.*, b.nama as nama_kelurahan, c.nama as nama_kecamatan, d.nama as nama_komunitas, e.nama as nama_kecakapan, f.nama as nama_desa FROM $table a left join tblkelurahan b on b.id_kel = a.kelurahan left join tblkecamatan c on c.id_kec = a.kecamatan  left join tblkomunitas d on a.komunitas = d.idtblkomunitas   left join tblkecakapan e on a.kecakapan = e.idtblkecakapan  left join tbldesa f on f.idtbldesa = a.desa  ";
    }elseif($table == 'tbldusun'){
      $sql = "SELECT a.*, b.nama as nama_krb from $table a left join tblkrb b on a.idtblkrb = b.idtblkrb WHERE md5(a.id_kel) = '$id'";
    }elseif ($table == 'tblkegiatan') {
      $sql = "SELECT a.*, b.nama as nama_kelurahan, c.nama as nama_kecamatan, e.nama as nama_desa, d.nama as nama_komunitas FROM $table a left join tblkelurahan b on b.id_kel = a.kelurahan left join tblkecamatan c on c.id_kec = a.kecamatan left join tblkomunitas d on a.komunitas = d.idtblkomunitas left join tbldesa e on e.idtbldesa = a.desa  ";
    }elseif ($table == 'tblabsensi') {
      $sql = "SELECT a.*, b.nama_relawan as nama_relawan, c.nama_kegiatan as nama_kegiatan FROM $table a left join tblrelawan b on b.no_induk = a.no_induk left join tblkegiatan c on c.idtblkegiatan = a.kegiatan ";
    }elseif ($table == 'tblperingatandini') {
      $sql = " select * from $table ORDER BY idperingatan DESC";
    }elseif ($table == 'tbljarak') {
      $sql = " select * from $table";
    }elseif ($table == 'tblkaryawan') {
      $sql = " select * from $table";
	}elseif ($table == 'tblatensi') {
      $sql = " select * from $table";
    } elseif ($table == 'tblpengungsian_detail'){
      $sql = "SELECT a.*, b.nama AS namapengungsian, b.alamat, b. penanggung_jawab, b.tlpn, b.tampungreguler, 
      b.tampungprotokol, b.bilik FROM tblpengungsian_detail a LEFT JOIN tblpengungsian b ON b.idtblpengungsian = a.idtblpengungsian WHERE md5(a.idtblpengungsian) = '$id'";
    }

    if($search != ''){
      if ($table == 'tblkecamatan') {
        $sql .= " WHERE (nama LIKE '%$search%' ESCAPE '!')";
      }else if ($table == 'tblkelurahan') {
        $sql .= " AND (nama LIKE '%$search%' ESCAPE '!')";
      }else if ($table == 'tblbarak') {
        $sql .= " WHERE (nama LIKE '%$search%' OR alamat LIKE '%$search%' OR penanggung_jawab LIKE '%$search%' OR tlpn LIKE '%$search%' OR tampung LIKE '%$search%' OR deskripsi LIKE '%$search%' ESCAPE '!') ";
      }else if ($table == 'tblews') {
        $sql .= " WHERE (nama LIKE '%$search%' OR alamat LIKE '%$search%' OR nama_kelurahan LIKE '%$search%' OR tlpn LIKE '%$search%' OR deskripsi LIKE '%$search%' ESCAPE '!') ";
      }else if ($table == 'tblperalatan_detail'){
        $sql .= " WHERE (nama LIKE '%$search%' OR alamat LIKE '%$search%' OR qty_baik LIKE '%$search%' OR tlpn LIKE '%$search%' OR qty_rusak LIKE '%$search%' ESCAPE '!') ";
      }else if ($table == 'tblmanu'){
        $sql .= " WHERE (menu LIKE '%$search%' OR icon LIKE '%$search%' OR url LIKE '%$search%' OR manu_parent LIKE '%$search%' ESCAPE '!') ";
      }else if ($table == 'tbldesa'){
        $sql .= " WHERE (nama LIKE '%$search%' OR nama_kelurahan LIKE '%$search%' OR nama_kecamatan LIKE '%$search%' OR tampung LIKE '%$search%' OR radius_merapi LIKE '%$search%' ESCAPE '!') ";
      }else if ($table == 'tblpotensi'){
        $sql .= " WHERE (nama LIKE '%$search%' OR nama_kelurahan LIKE '%$search%' OR nama_kecamatan LIKE '%$search%' ESCAPE '!') ";
      }else if ($table == 'tbldusun'){
        $sql .= " WHERE (nama LIKE '%$search%' OR nama_krb LIKE '%$search%' radius_merapi LIKE '%$search%' ESCAPE '!') ";
      }else if ($table == 'tblperingatandini'){
        $sql .= " WHERE (judul LIKE '%$search%' OR keterangan LIKE '%$search%' ESCAPE '!') ";
      }else if ($table == 'tbljarak'){
        $sql .= " WHERE (jarakaman LIKE '%$search%' OR statusaktivitas LIKE '%$search%' ESCAPE '!') ";
      }else if ($table == 'tblkaryawan'){
      $sql .= " WHERE (nama LIKE '%$search%' OR telephone LIKE '%$search%' OR alamat LIKE '%$search%' OR departemen LIKE '%$search%' OR keterangan LIKE '%$search%' ESCAPE '!') ";
      }else if ($table == 'tblpengungsian'){
      $sql .= " WHERE (nama LIKE '%$search%' OR tlpn LIKE '%$search%' OR alamat LIKE '%$search%' OR tampungprotokol LIKE '%$search%' ESCAPE '!') ";
      }else{
        $sql .= " WHERE (nama LIKE '%$search%' OR deskripsi LIKE '%$search%' ESCAPE '!') ";
      }
    }

    $sql .= " limit 0, 100";
    //die($sql);
    return $this->db->query($sql);
  }
  function get_sales($search, $akses_branch = ''){
    $role = $this->session->userdata('role');
    if($role == '1'){
      $sql = "SELECT a.*, b.branch_name FROM tblemployee a
            LEFT JOIN tblbranch b ON b.idtblbranch = a.idtblbranch";

        if($search != ''){
            $sql .= " WHERE";
        }
    }else{
      $sql = "SELECT a.*, b.branch_name FROM tblemployee a
            LEFT JOIN tblbranch b ON b.idtblbranch = a.idtblbranch WHERE a.idtblbranch IN (1402,1401) ";
      if($search != ''){
          $sql .= " AND";
      }
    }

    if($search != ''){
      $sql .= " (a.employee_name LIKE '%$search%' OR a.sales_type LIKE '%$search%' OR a.user_group LIKE '%$search%' OR b.branch_name LIKE '%$search%' ESCAPE '!') ";
    }

    $sql .= " limit 0, 50";
    //die($sql);
    return $this->db->query($sql);
  }

  function get_kejadian($status = '0'){
    $sql = "SELECT a.*, b.nama AS nama_kelurahan, c.nama AS nama_bencana, d.nama as nama_dusun, e.nama AS nama_user, e.telp FROM tbllaporan a
            LEFT JOIN tblkelurahan b ON b.`id_kel` = a.`kelurahan`
            LEFT JOIN tblbencana c ON c.id= a.bencana
            left join tbldusun d on d.idtbldusun = a.dusun
            left join tbluser e on e.idtbluser = a.idtbluser
            WHERE a.flag IN ($status)";
    return $this->db->query($sql);
  }

  function data_kk_detail($id_md5){
    $sql = "SELECT a.*, b.nama as nama_ternak from tblkk_detail a left join tblternak b on a.idtblternak = b.idtblternak
            WHERE md5(a.idtblkk) = '$id_md5'";
    return $this->db->query($sql);
  }
}
