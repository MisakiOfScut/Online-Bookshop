<?php
//a simple router 不要在本页面产生任何非json格式的输出否则会影响返回的json数据

$uri = $_SERVER["REQUEST_URI"];
//$uri="https://www.wws.cool/showlist?page=1&pageSize=20&stext=";
$arr = parse_url($uri);//解析uri成数组，由host、path、query等等组成
$params = convertUrlQuery($arr['query']);

//$a = explode("?", $uri);
$url = $arr['path'];
$b=explode('/',$url);
$c_name=$b[1];//获得调用的Presenter名称


$adminSysPresenter=array('delbook');
$bookshopPresenter=array('getonebook','showlist');

if(in_array($c_name,$adminSysPresenter)){
    include('../adminSys/'.$c_name.'.php');
}
else if(in_array($c_name,$bookshopPresenter)){
    include('../bookshop/'.$c_name.'.php');
}
$c_name=$c_name."Presenter";
$presenter = new $c_name();
$presenter->action($params);    

    
/**
* 将字符串参数变为数组
* @param $query
* @return array array (size=2) Example below
*         'm' => string 'content' (length=7)
*         'c' => string 'index' (length=5)
*/
function convertUrlQuery($query){
    $queryParts = explode('&', $query);
    $params = array();
    foreach ($queryParts as $param) {
        $item = explode('=', $param);
        $params[$item[0]] = $item[1];
    }
    return $params;
}    
?>