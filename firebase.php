<?php

// $action=$_GET["Action"];

$action = 'M';


$pwdd = $_GET["m"];

if($pwdd == 'com.becana.sleman'){

switch ($action) {
    Case "M":
        // $r=$_GET["r"];
        // $t=$_GET["t"];
        // $m=$_GET["m"];
		$t = "Laporan Baru";
		$m = $_GET['message'];
		$r='agus';
       
        $j=json_decode(notify($r, $t, $m));
		
		print_r(json_decode(notify($r, $t, $m)));die;
		
       
        $succ=0;
        $fail=0;
       
        $succ=$j->{'success'};
        $fail=$j->{'failure'};
       
        print "Success: " . $succ . "<br>";
        print "Fail   : " . $fail . "<br>";
       
        break;
   
   
default:
        print json_encode ("Error: Function not defined ->" . $action);
}

}else{
	echo "Password salah";
	
}

function notify ($r, $t, $m)
    {
    // API access key from Google API's Console
        if (!defined('API_ACCESS_KEY')) define( 'API_ACCESS_KEY', 'AAAA0-NerMk:APA91bEAfNEYDQKNYnGKnRcLyO6LAHVgmF3XYkxtEVhWRHZJg1ptROO4IC3lHS7lyIXLi2oG2X_uLkoB8trSI4UkMRzwl7Zj5fEExjhb_Dv6DKtuCIxWrxxpXaA6_KkCE4dzlN9r5osb');
        $tokenarray = array($r);
        // prep the bundle
        $msg = array
        (
            'title'     => $t,
            'body'     => $m,
			'MyKey1'       => 'MyData1',
            'MyKey2'       => 'MyData2',
           
        );
        $fields = array
        (
           
			 'to'       => "/topics/general",
             'data'            => $msg
        );
        
        $headers = array
        (
            'Authorization: key=' . API_ACCESS_KEY,
            'Content-Type: application/json'
        );
        
        $ch = curl_init();
        curl_setopt( $ch,CURLOPT_URL, 'fcm.googleapis.com/fcm/send' );
        curl_setopt( $ch,CURLOPT_POST, true );
        curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers );
        curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true );
        curl_setopt( $ch,CURLOPT_SSL_VERIFYPEER, false );
        curl_setopt( $ch,CURLOPT_POSTFIELDS, json_encode( $fields ) );
        $result = curl_exec($ch );
        curl_close( $ch );
        return $result;
    }


?>