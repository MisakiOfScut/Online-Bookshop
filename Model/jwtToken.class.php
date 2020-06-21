<?php
/******************Json Web Token 无状态token****************/
class jwtToken{
    //token头部
    private static $header=array(
        'alg'=>'HS256', //生成signature的算法
        'typ'=>'JWT'  //类型
    );
    
    //生成签名时使用的密钥
    private static $key='123456';
    private static $keyForUser='111111';

    /**
    * 获取jwt token
    * @param array $jwtload jwt载荷  格式如下非必须
    * [
    * 'iss'=>'jwt_admin', //该JWT的签发者
    * 'iat'=>time(), //签发时间
    * 'exp'=>time()+7200, //过期时间
    * 'nbf'=>time()+60, //该时间之前不接收处理该Token
    * 'sub'=>'www.wws.com', //面向的用户
    * 'jti'=>md5(uniqid('JWT').time()) //该Token唯一标识
    * ]
    * @return bool|string
    */
    public static function setToken($payload){    
                
        $base64header=base64_encode(json_encode(self::$header));
        $base64jwtload=base64_encode(json_encode($payload));
        $str = urlencode($base64header.'.'.$base64jwtload); // 通过url转码
        
        //签名(用户和管理员使用不同的key签名，通过这点区分这两个角色)
        if($payload['iss']=='adminWu')
            $token=$str.'.'.self::signature($base64header.'.'.$base64jwtload,self::$key,self::$header['alg']);    
        else{
            $token=$str.'.'.self::signature($base64header.'.'.$base64jwtload,self::$keyForUser,self::$header['alg']);
        } 
        return $token;
    }
    
    /**
    * 验证token是否有效,默认验证exp,nbf,iat时间
    * @param string $Token 需要验证的token
    * @return bool|string
    */
    public static function verifyToken(string $Token)
    {
        $tokens = explode('.', $Token);
        if (count($tokens) != 3)//说明token非header、load、sign三部分组成
            return false;
        
        //list 实现便捷地赋值
        list($base64header, $base64jwtload, $sign) = $tokens;
    
        //获取jwt算法
        $base64decodeheader = json_decode(base64_decode(urldecode($base64header)), JSON_OBJECT_AS_ARRAY);
        if (empty($base64decodeheader['alg']))
            return false;
    
        //获取jwtload    
        $jwtload = json_decode(base64_decode(urldecode($base64jwtload)), JSON_OBJECT_AS_ARRAY);

        //验证签名(用户和管理员使用不同的key验证，通过这点区分这两个角色)
        if($jwtload['iss']=='adminWu'){
            $verifyKey=self::$key;
        }
        else{
            $verifyKey=self::$keyForUser;
        }
        if (self::signature($base64header . '.' . $base64jwtload, $verifyKey, $base64decodeheader['alg']) !== $sign)
            return false;
    
 
        //签发时间大于当前服务器时间验证失败
        if (isset($jwtload['iat']) && $jwtload['iat'] > time())
            return false;
        //过期时间小于当前服务器时间验证失败
        if (isset($jwtload['exp']) && $jwtload['exp'] < time())
            return false;
        //该nbf时间之前不接收处理该Token
        if (isset($jwtload['nbf']) && $jwtload['nbf'] > time())
            return false;
    
        return $jwtload;
    }

    /**
     * HMACSHA256签名  参考https://jwt.io/ 中HMACSHA256签名实现
     * @param string $input 为base64UrlEncode(header).".".base64UrlEncode(payload)
     * @param string $key
     * @param string $alg  算法方式，这里只用了sha256散列
     * @return mixed
     */
    private static function signature(string $input, string $key, string $alg = 'HS256')
    {
        $alg_config=array(
            'HS256'=>'sha256'
        );
        return urlencode(base64_encode(hash_hmac($alg_config[$alg], $input, $key,true)));
    }

}