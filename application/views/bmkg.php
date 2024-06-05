<?php
// LOAD XML DATA CUACA JABOTABEK
$list_cuaca = new SimpleXMLElement('http://data.bmkg.go.id/cuaca_jabodetabek_1.xml', null, true);
$tanggal = $list_cuaca->Tanggal->Mulai;
?>
<table class="table table-hover">
<thead>
<tr style="background-color:#ffd740; color: #000; font-size:16px;">
<th>DAERAH</th>
<th>PAGI</th>
<th>SIANG</th>
<th>MALAM</th>
</tr>
</thead>
<tbody>
<?php foreach($list_cuaca->Isi->Row as $cuaca){ ?>
<tr>
<td><strong><?php echo strtoupper($cuaca->Daerah); ?></strong></td>
<td><strong><?php echo $cuaca->Pagi; ?></strong></td>
<td><strong><?php echo $cuaca->Siang; ?></strong></td>
<td><strong><?php echo $cuaca->Malam; ?></strong></td>
</tr>
<?php } ?>
</tbody>
</table>
