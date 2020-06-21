<?php
require_once('../include/init.php');
class showlistPresenter{
	public function action(array $params){
		$count = $params['pageSize'];
		$params['stext']=urldecode($params['stext']);

		$booklist=new BookDescription();	
			
		if($params['stext']==null){//当前没有搜索内容
			//看看数据库总共有多少条数据，方便分页
			$total = $booklist->count();

			if($total<=$count)
				//$count=$total;//防止sql语句出错
				$params['pageSize']=$total;
			
			$result=$booklist->showlist($params);			
		}
		else{
			$result=$booklist->showlist($params);
			$total=count($result);			
		}
		/*如果是在书店页面的搜索，如果查询到数据太少，可以尝试把两个数组拼接到一起*/
		if($result>0){
			//返回js数据
			echo json_encode(array("code"=>1,"data"=>$result,"total"=>$total));
		}else{
			echo json_encode(array("code"=>2,"data"=>$result,"total"=>$total));
		}
	}
}
?>