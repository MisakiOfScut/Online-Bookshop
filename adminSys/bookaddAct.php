<?php
require("../include/init.php");

$token=$_POST['tk'];
$book=array(
    'title'=>$_REQUEST['title'],
    'author'=>$_REQUEST['author'],
    'category'=>$_REQUEST['category'],
    'introduction'=>$_REQUEST['introduction'],
    'filedir'=>"",
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

$bookadd=new bookaddActPresenter();
$bookadd->insertBookInfo($book,$FILES,$token);

class bookaddActPresenter{

    public function insertBookInfo(array $book,array $FILES,$token){
        $permission=jwtToken::verifyToken($token);
        if(!$permission){
            echo json_encode(403);
            exit;
        }        
        $bookaddAct=new BookDescription();
        echo json_encode($bookaddAct->insertBookInfo($book,$FILES));
    }
}

?>