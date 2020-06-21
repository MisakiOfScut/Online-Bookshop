<?php
require("../include/init.php");

/*$url="http://www.wws.com/adminSys/showlist.php";
$b=explode('/',$url);
foreach( $b as $k){
    echo $b[3],'<br>';
}*/

$a=new Model('booklist');
$data=$a->select();
echo json_encode(array("data"=>$data,"code"=>1));

/*
RewriteEngine on
RewriteCond %{HTTP_REFERER} !^$
RewriteCond %{HTTP_REFERER} !^http://(www\.)?wws.cool(/)?.*$  [NC]
RewriteRule .*\.(gif|jpg|jpeg|bmp|png)$ www.iapolo.com/photo.jpg [R,NC,L]*/