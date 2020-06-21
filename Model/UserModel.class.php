<?php
include_once 'Model.class.php';
class UserModel extends Model{

     // 对密码进行md5编码
    public function encPasswd($p){
    	return md5($p);
    }

    public function register($data){
        if(self::checkUser($data['username']))
            return false;
        // 如果传入了密码则进行编码
    	if($data['pwd']){
    		$data['pwd']=$this->encPasswd($data['pwd']);
        }
        else{
            return false;//密码不能为空
        }
    	return !empty($this->insert($data));
    }

    public function checkUser($username,$pwd=''){
        if($pwd==''){
            return !empty($this->find($username));
        }
        else{
            $this->where('username=\''.$username.'\' and pwd=\''.self::encPasswd($pwd).'\'');
            return !empty($this->find());
        }
    }

    public function getUserDatabyName($username){
        $this->where("username='".$username.'\'');
        return $this->find();
    }

    public function getUserIdbyName($username){
        $this->field('id')->where("username='".$username.'\'');
        return $this->find();
    }

    public function getUserDatabyId($id){
        return $this->find($id);
    }
}
/*
$reg= new UserModel('admin');
$data=array('username'=>"admin1",'pwd'=>'20200101');
$result=$reg->register($data);
var_dump($result);*/

?>