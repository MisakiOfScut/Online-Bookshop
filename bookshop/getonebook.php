<?php
require_once('../include/init.php');
class getonebookPresenter{
	public function action($params){
		$bookselect=new BookDescription();
		$result=$bookselect->getOneBookInfo($params['id']);

		if($result>0){
			//返回数据给js
			echo json_encode(array("code"=>1,"data"=>$result));
		}else{
			echo json_encode(array("code"=>2,"data"=>$result));
		}
	}
}
?>