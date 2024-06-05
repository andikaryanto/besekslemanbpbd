<?php

class filter{

    var $char;

    var $cleanval;

    public function clean($val){
        $char = array ('/','\\',',','#',':',';','\'','"',"'",'[',']','{','}',')','(','|','`','~','!','%','$','^','&','*','=','?','+','DROP','TABLE',
            'INSERT','UPDATE','CREATE','SET');


	$cleanval = str_replace($char, '', trim($val));
	return $cleanval;

    }

}


?>
