<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Firebase {
		// protected $cfg = array();
		
		
		
		
        public function fb_user($iduser = array(), $judul, $isi){
		
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Authorization: key= AAAA0-NerMk:APA91bEAfNEYDQKNYnGKnRcLyO6LAHVgmF3XYkxtEVhWRHZJg1ptROO4IC3lHS7lyIXLi2oG2X_uLkoB8trSI4UkMRzwl7Zj5fEExjhb_Dv6DKtuCIxWrxxpXaA6_KkCE4dzlN9r5osb',
            'Content-Type: application/json',
            ));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode(array(
            'topics/user' => $iduser,
            'data' => array(
                'title' => $judul,
                'body' => $isi,
                'body' => $isi,
                ),
            )));

        $req = curl_exec($ch);
        curl_close($ch);
        return $req;
    }
}