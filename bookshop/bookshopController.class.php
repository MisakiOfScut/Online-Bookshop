<?
/**********************************文件暂时作废******************************************/
require_once('../include/init.php');

class bookshopController{
   /**
    * 主页-书籍列表
    * @param void
    * @echo homeList
    */
    public function homeList(){
        $homeList=new BookDescription();
        $homeList->setTableName("homeList");
        $homeList->select();
        echo json_encode($homeList);
    }
    /**
    * 搜索页-搜索内容
    * @param array $params 搜索内容&页面参数
    * @echo array(pageNum,bookinfo) 返回总页数&书籍展示信息
    */
    public function viewBook($params){
        $booklist=new BookDescription();
        $pageNum=$booklist->countPage($params['stexts']);
        $bookinfo=$booklist->showlist($params);
        echo json_encode(array("pageNum"=>$pageNum,"bookinfo"=>$bookinfo));
    }
    /**
    * 详情页页-书籍内容
    * @param array $params 书籍id
    * @echo array(bookDetails) 返回书籍详细信息
    */
    public function showDetails($params){
        $bookDetails=new BookDescription();
        $result=$bookDetails->getOneBookInfo($params['id']);
        echo json_encode(array("bookDetails"=>$result));
    }


}