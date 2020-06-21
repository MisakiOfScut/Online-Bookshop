<?php
/**************连接数据库（已弃用改用Model类）****************/ 
require("config.php");
try{
    $conn=new mysqli($_CFG['host'],$_CFG['user'],$_CFG['pwd'],$_CFG['db'],3306);
    if (!$conn) {
        throw new Exception('connect mysql failed!');
    }else{
        $q="set names utf8;";
        $result=$conn->query($q);
    }
}
catch( Exception $e){
    die('连接mysql失败');
}
?>