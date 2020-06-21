<?php
require_once('../include/init.php');
class delbookPresenter{
	public function action(array $params){
		//执行操作前检查权限
		$token=$params['tk'];
		$permission=jwtToken::verifyToken($token);
		if(!$permission){
			echo json_encode(403);
			exit;
		}
		
		$id=(int)$params['id'];

		$this->deletebook($id);
	}
	public function deletebook($id){
		
		$del=new BookDescription();

		$result=$del->delete($id);
		
		if($result>0){
			echo json_encode(array("code"=>1));
		}else{
			echo json_encode(array("code"=>0));
		}
	}
}
?>