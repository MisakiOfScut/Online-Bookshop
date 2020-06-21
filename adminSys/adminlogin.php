<?php
    include '../include/init.php';
    $logindata=array(
        'username'=>$_POST['username'],
        'pwd'=>$_POST['pwd']
        //,'token'=>$_POST['token']
    );
    $adminlogin= new loginPresenter();
    $adminlogin->verify($logindata);
    
    class loginPresenter{
        public function verify(array $logindata){
            $loginSumbit= new UserModel('admin');
            $result=$loginSumbit->checkUser($logindata['username'],$logindata['pwd']);
            if($result){
                $payload= array(
                    'iss'=>'adminWu', //该JWT的签发者
                    'iat'=>time(), //签发时间
                    'exp'=>time()+7200, //过期时间
                    'nbf'=>time()+10, //该时间之前不接收处理该Token
                    'sub'=>'www.wws.com', //面向的用户
                    'jti'=>md5(uniqid($logindata['username']).time()) //该Token唯一标识
                );
                $token=jwtToken::setToken($payload);
                echo json_encode(array('tk'=>$token,'code'=>1));
            }
            else
                echo json_encode(array('code'=>0));
        }
    }

?>