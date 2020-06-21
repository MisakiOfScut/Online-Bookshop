<?php
/*    fetch_style, num 0-5
  PDO::FETCH_ASSOC          从结果集中获取以列名为索引的关联数组。
  PDO::FETCH_NUM             从结果集中获取一个以列在行中的数值偏移量为索引的值数组。
  PDO::FETCH_BOTH            这是默认值，包含上面两种数组。
  PDO::FETCH_OBJ               从结果集当前行的记录中获取其属性对应各个列名的一个对象。
  PDO::FETCH_BOUND        使用fetch()返回TRUE，并将获取的列值赋给在bindParm()方法中指 定的相应变量。
  PDO::FETCH_LAZY            创建关联数组和索引数组，以及包含列属性的一个对象，从而可以在这三种接口中任选一种。
*/
class Model extends PDO
    {
      protected $tableName = "";//存储表名
      protected $sql = "";//存储最后执行的SQL语句
      protected $limit = "";//存储limit条件
      protected $order = "";//存储order排序条件
      protected $field = "*";//存储要查询的字段,默认全字段
      protected $where = "";//存储where条件
      protected $allFields = [];//存储当前表的所有字段

      /*** 构造方法 初始化 $tableName 要操作的表名*/
      public function __construct($tableName)
      {
            include("../include/config.php");
            $dbms='mysql';     //数据库类型
            $host=$_CFG['host']; //数据库主机名
            $dbName=$_CFG['db'];    //使用的数据库
            $dsn="$dbms:host=$host;dbname=$dbName";//PDO dsn 语句
            //连接数据库
            parent::__construct($dsn,$_CFG['user'],$_CFG['pwd']);
            //$this->query("set names utf8");
            //存储表名
            $this->tableName = $tableName;
            //获取当前数据表中有哪些字段
            $this->getFields();
      }  
        /** 获取当前表的所有字段    return array 成功则返回一维数组字段*/
        public function getFields()
        {
            //查看当前表结构
            $sql = "desc {$this->tableName}";
            $res = $this->query($sql);//返回pdo对象
          //var_dump($res);
            if ($res) {
                $arr = $res->fetchAll(2);
                //var_dump($arr);
                //从二维数组中取出指定下标的列
                $this->allFields = array_column($arr,"Field");
                return $this->allFields;
            } else {
                die("表名错误");
            }
        }
        /**
         * 添加操作
         * @param array $data 要添加的数组
         * @return int 返回受影响行数
         */
        public function insert($data)
        {
            //判断是否是数组
            if (!is_array($data)) {
                    return $this;
            }
            //判断是否全是非法字段
            if (empty($data)) {
                die("非法字段");
            }
            //过滤非法字段
            foreach($data as $k => $v){
                if (!in_array($k,$this->allFields)) {
                    unset($data[$k]);
                }
            }
            //将数组中的键取出
            $keys = array_keys($data);
            //将数组中取出的键转为字符串拼接
            $key = implode(",",$keys);
            //将数组中的值转化为字符串拼接
            $value = implode("','",$data);
            //准备SQL语句
            $sql = "insert into {$this->tableName} ({$key}) values('{$value}')";
            $this->sql = $sql;
            //执行并发送SQL，返回受影响行数
            return (int)$this->exec($sql);
        }
        /**
         * 删除操作
         * @param string $id 要删除的id
         * @return int 返回受影响行数
         */
    public function delete($id)
    {
      //判断id是否存在
      if (empty($id)) {
        return 0;
      }else{
        $where = "where id={$id}";
      }
      $sql = "delete from {$this->tableName} {$where}";
      $this->sql = $sql;
      //执行并发送SQL,返回受影响行数
      return (int)$this->exec($sql);
    }    
    /**
     * 修改操作
     * @param array $data 要修改的数组
     * @return int 返回受影响行数
     */
    public function update($data)
    {
      //判断是否是数组
      if (!is_array($data)){
        return $this;
      }
      //判断是否全是非法字段
      if (empty($data)) {
        die('全是非法字段');
      }
      $str = "";
      //过滤非法字段
      foreach ($data as $k=>$v) {
        //字段为id时
        if ($k == "id"){
          $this->where = "where id={$v}";
          unset($data[$k]);
          continue;
        }
        //若字段不为id，则过滤后再拼接成set字段
        if (in_array($k, $this->allFields)) {
          $str .= "{$k}='{$v}',";
        } else {
          unset($data[$k]);
        }
      }
      //判断是否传了条件
      if (empty($this->where)) {
        die('请传入修改条件');
      }
      //去除右边的,
      $str = rtrim($str, ',');
      $sql = "update {$this->tableName} set {$str} {$this->where}";
      //echo $sql;
      $this->sql = $sql;
      return (int)$this->exec($sql);
    }
    /**
     * 查询多条数据
     * @return array 成功返回二维数组，失败返回空数组
     */
    public function select()
    {
      $sql = "select {$this->field} from {$this->tableName} {$this->where} {$this->order} {$this->limit}";
      $this->sql = $sql;
      //执行SQL,结果集是一个对象
      $res = $this->query($sql);
      //判断是否查询成功,
      if ($res){
        //成功返回二维数组
        return $res->fetchAll(2);
      }
      //失败返回空数组
      return [];
    }
    /**
     * like条件
     * @param string $stext 要查询的书籍/作者
     * @return array 成功返回二维数组，失败返回空数组
     */
    public function like($stext){
      $this->where("concat(title,author,category) like :stext");
      $sql = "select {$this->field} from {$this->tableName} {$this->where} {$this->order} {$this->limit}";
      $query=$this->prepare($sql);
      $query->bindValue(':stext','%'.$stext.'%',PDO::PARAM_STR);
      
      //执行SQL,结果集是一个对象
      $query->execute();
      $res = $query->fetchAll(2);
      //判断是否查询成功,
      if ($res){
        //成功返回二维数组
        return $res;
      }
      //失败返回空数组
      return [];
    }
    /**
     * 查询一条数组
     * @param string $id 要查询的id
     * @return array 返回一条数据
     */
    public function find($id="")
    {
      //判断是否存在id
      if (empty($id)){
        $where = $this->where;
      }else{
        $where = "where id={$id}";
      }
      $sql = "select {$this->field} from {$this->tableName} {$where} {$this->order} limit 1";
      $this->sql = $sql;
      //执行sql,结果集为对象
      $res = $this->query($sql);
      //判断是否查询成功
      if ($res){
        //成功则返回一条数据(一维数组)
        $result = $res->fetchAll(2);
        return $result[0];
      }
      //失败返回空数组
      return [];
    }
    /**
     * 统计总数目
     * @return int 返回总数
     */
    public function count()
    {
      $sql = "select count(*) as total from {$this->tableName} {$this->where} limit 1";
      $this->sql = $sql;
      //执行SQL,结果集为对象
      $res = $this->query($sql);
      //处理结果集
      if ($res){
       $result = $res->fetchAll(2);
       //var_dump($result);
        return $result[0]["total"];
      }
      return 0;
    }
    /**
     * 设置要查询的字段信息
     * @param string $field 要查询的字段
     * @return object 返回自己，保证连贯操作
     */
    public function field($field)
    {
      //判断字段是否存在
      if (empty($field)){
        return 0;
      }
      $this->field = $field;
      return $this;
    }
    /**
     * 获取最后执行的sql语句
     * @return string sql语句
     */
    public function _sql()
    {
      return $this->sql;
    }
    /**
     * 重置sql语句，使得对象能够复用
     * @return void
     */
    public function cleanQuery()
    {
      $this->sql="";
      $this->limit="";
      $this->order="";
      $this->field="*";
      $this->where="";
      $this->allFields=[];
    }
    /**
     * where条件
     * @param string $where 要输入的where条件
     * @return object 返回自己，保证连贯操作
     */
    public function where($where)
    {
      $this->where = "where ".$where;
      return $this;
    }
    /**
     * order条件
     * @param string $order 要输入的order条件
     * @return object 返回自己，保证连贯操作
     */
    public function order($order)
    {
      $this->order = "order by ".$order;
      return $this;
    }
    /**
     * limit条件
     * @param string $limit 要输入的limit条件
     * @return object 返回自己，保证连贯操作
     */
    public function limit($limit)
    {
      $this->limit = "limit ".$limit;
      return $this;
    }

    /*
    public function last_insert_id()
    {
      $res = $this->lastInsertId();
      if($res){
        return $res;
      }
      else
        return false;
    }
    */
}
?>