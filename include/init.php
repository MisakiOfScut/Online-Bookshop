<?php
// 初始化当前的绝对路径
// 换成正斜线是因为 win/linux都支持正斜线,而linux不支持反斜线
define('ROOT',str_replace('\\','/',dirname(dirname(__FILE__))) . '/');

require("../Model/Model.class.php");
require ("../Model/UserModel.class.php");
require "../Model/jwtToken.class.php";
require "../Model/BookDescriptionModel.class.php";
// 开启session
session_start();
