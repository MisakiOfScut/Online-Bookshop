<?php
include_once 'Model.class.php';

class BookDescription extends Model{
    private $tablename='booklist';
    private $filecode=1;

    public function __construct()
    {
        parent::__construct($this->tablename);
    }
    /**
    * 获取某本书的信息
    * @param int $id 书的id
    * @return result 返回信息
    */
    public function getOneBookInfo($id){
        $this->cleanQuery();
        $result=$this->find($id);
        if($result>0){
            return $result;
        }else{
            return null;
        }        
    }
    /**
    * 搜索页获取一页书的显示信息
    * @param array $params 页面参数
    * 'page'=> int 当前页
    * 'stext'=> string 搜索信息
    * 'pageSize'=> string 页面有多少本书
    * ]
    * @return result 返回信息id,title,author,price/null
    */
    public function showlist(array $params){
        $this->cleanQuery();

        $pagesize=$params['pageSize'];
        //根据前台数据计算查询书目位置
        $offset=($params['page']-1)*$pagesize;
        
        $this->order('id');
        $this->limit("$offset,$pagesize");

        $result=$this->like($params['stext']);

        if($result>0)
            return $result;
        else
            return null;
    }
   /**
    * 搜索页-搜索内容页数
    * @param array $params 搜索内容&页面参数
    * @return pageNum 返回总页数
    */
    public function countPage(array $params){
        $this->cleanQuery();
        $this->order('id');
        $this->field('id');
        $result=$this->like($params['stext']);
        return count($result)/$params['pagesize'];
    }

    /**
     * insertBookInfo function
     * @param array $book
     * @param array $FILES
     * @return array("code"=>1,"filecode"=>$this->filecode)
     */
    public function insertBookInfo(array $book,array $FILES){
        $filedir=$this->setFile($FILES);

        /******************将数据写入数据库*********************/
        $book['filedir']=$filedir;
        $result=$this->insert($book);

        if($result>0)
            return(array("code"=>1,"filecode"=>$this->filecode));
        else 
            return(array("code"=>0,"filecode"=>$this->filecode));
    }

    /**
     * modifyBookInfo function
     * @param array $book
     * @param array $FILES
     * @return array("code"=>1,"filecode"=>$this->filecode)
     */
    public function modifyBookInfo(array $book,array $FILES){
        $filedir=$this->setFile($FILES);

        /******************将数据写入数据库*********************/
        /*文件路径不为空说明修改过了，给data数组新增键值*/
        if($filedir!=""){
            $book['filedir']=$filedir;
        }
        //$modbook=new Model("booklist");
        $result=$this->update($book);

        if($result>0)
            return(array("code"=>1,"filecode"=>$this->filecode));
        else 
            return(array("code"=>0,"filecode"=>$this->filecode));

    }

    /**
     * setFile function
     * @param array $FILES
     * @return string $filedir
     */
    public function setFile(array $FILES){
        $filedir="";

        $allowedExt =array("gif","jepg","jpg","png");
        $temp=explode('.',$FILES["name"]);
        $extension=end($temp);//get file's ext

        if (($FILES["type"]=="image/gif"
        ||$FILES["type"]=="image/jpeg"
        ||$FILES["type"]=="image/jpg"
        ||$FILES["type"]=="image/png"
        ||$FILES["type"]=="image/xpng")
        &&($FILES["size"]<512000)
        &&in_array($extension,$allowedExt)) {
            if ($FILES["error"]>0) {
                $this->filecode=101;
            }
            else{
                //check file if exist?
                if (file_exists("../data/img/".$FILES["name"])) {
                    $this->filecode=2;
                    $filedir="../data/img/".$FILES["name"];
                }
                else{
                    move_uploaded_file($FILES["tmp_name"],"../data/img/".$FILES["name"]);
                    //$this->resize_image($FILES["name"],"../data/img/".$FILES["name"],400,300);
                    if (!file_exists("../data/img/".$FILES["name"])) {
                        $this->filecode=102;
                    }
                    else                      
                        $filedir="../data/img/".$FILES["name"];
                }
            }
        }
        else{
            $this->filecode=100;
        }

        return $filedir;
    }

    /**
    * 搜索页-搜索内容页数
    * @param string $tablename 
    * @return array("code"=>1,"filecode"=>self::$filecode)
    */
    public function setTableName($tablename){
        $this->cleanQuery();
        $this->tableName=$tablename;
    }
}