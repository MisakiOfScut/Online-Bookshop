<?php
require_once('../include/init.php');

$token=$_POST['tk'];

$book=array(
    'id'=>$_REQUEST['id'],
    'title'=>$_REQUEST['title'],
    'author'=>$_REQUEST['author'],
    'category'=>$_REQUEST['category'],
    'introduction'=>$_REQUEST['introduction'],
    'price'=>$_REQUEST['price'],
    'quantity'=>$_REQUEST['quantity']
);

$FILES=array(
    "name"=>$_FILES["file"]["name"],
    "tmp_name"=>$_FILES["file"]["tmp_name"],
    "type"=>$_FILES["file"]["type"],
    "size"=>$_FILES["file"]["size"],
    "error"=>$_FILES["file"]["error"]
);

$modbook=new modifyBookPresenter();
$modbook->modifyBookInfo($book,$FILES,$token);

class modifyBookPresenter{
    public function modifyBookInfo(array $book, array $FILES,$token){
        $permission=jwtToken::verifyToken($token);
        if(!$permission){
            echo json_encode(403);
            exit;
        }        
        $bookaddAct=new BookDescription();
        echo json_encode($bookaddAct->modifyBookInfo($book,$FILES));
    }
}


?>