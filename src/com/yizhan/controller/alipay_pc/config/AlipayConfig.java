package com.yizhan.controller.alipay_pc.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2017062107537882";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCOIKBy7gnr+btY3ffh2A47jQVW0b3zGs3aGKMgKmWfdhMmc5C4C7W7CA1J08DVGbJnzY6Yra9a1jGypotnj4FNUVTsQBZiqib/FIV8Ixto8Hx7KgDjabxg+UTHK/ffllJNq5NbgRSokXqZchYxGqdqxsAUVrAawYncxTikavQoElOm3t1oRiiEt+3tXhiwqXVae63xivLlf4O9VS5SJyyKIz1oaUjKMetWhxiagHM0C6hTo76WCJTQhMzqO3md/pgpBAl7dgLymiPDA96YaJJJj/JEnXzHq1YBKgvk52lDIJAgX23QVrPx/ESNtIIfcTF11zt6mi16Bxc7IAC1lpNDAgMBAAECggEANGP2gScZ5TBzTPjVjRy1cmIzW6OJH3n7868tQogeWb+Oo5fp+s3mOYFoVJSH+oW0a+sr6z/q6dMXEsGtlYkiorueUE/3cHtEULbh1bajPfWYDVaYaTvqwtxf7ANbJcIlqJfcg9h7IwAtby7M22D14bhNybGCzPoWtZjFnmYGhlZcPDpNo95tiIQrOj4Y/2GgaW14roS+Cgefx3thyNDjEhlN38KRglozU1oUUlr7VMum8rWqbZKmp+xK996PQcSJvPWiaYtytogeDx+4/G4H5m7h0LoNm/9qkWrhBIFmbhsbx2N8JU+UJlCIGWP/gYoSpToAiI8S6Au5fPdf5nKFkQKBgQDkA6uVwRu6PVc2VCv0ypKqLHBFI72z/RL6npPlkAmUl/QkN2U7qvlNBsjJ71cnxfQDU8GXYuR5yFMQ+PvjFBpXHQRXQ1nCJjFc/fIZzxaTFROHlF2j/VW3+YJI2JKkT0pSND5l19lMuRzX6ZAX91gbh/DDwADidQ92bIyHM9+VVQKBgQCfklh0iiaUcFk9DSzvQkaGOaj2huoggf9z/9eWfru+ML5++VsvznRjayyqutojm/duwsED4LT2fOCYRX+v973FeJo/gXwcJ5OEoci2ZOoZ8lpgeioI68R0dcNUl7J6e5EhTjNY9wfIhijK/zCXc+Q58euT8/7sStuX+6VqpteGNwKBgQDHs2s5eutE/2p929SvzigMQWWHOJlypalUtUTFX5T0fu3GNnpEeydjzhhXvHbyD876hwXcCDIhc1FFYTyDktzLBVAC+asIfxjm4EeFUTntUh1LtqcY9M15l18DXCN7IzLtsnIgEp9wMgTQGfEo/Go/mp1FZMmhjXMgfkvKMqWVDQKBgFyEz4CScRfzo+n/76Oxe45rdAmr46eBeAlbtzXsuRHm1Sxti29GdrkF9NnwiHXJAkdX5+1FpeacNORUt1nhfEg4SsazXrA8Sg3Gd8c473qnx7rUWfbeLAOSG/S6F6NobZcv7hmQ8RRUpOY924CUkyj9mScpew6pwHR4VUpm/eM1AoGAKSj5dKtMxn7rseKhcLO5jyxnxctFApdwESPo9nNfjIt/cq9CuHesycN0JSdZDjn2cu3l8x8t1bR00DxAMUHzomTTkPekqV0ylGbmvngaVZKqlmZj02eNzjHRU9gy8DRrFbyIOZOvq9rlLxX6EIaPeuX070pHt0XWIe5HegrM8EM=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key  = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmip4EnNvSyW9JFT1mWrtegnTL0RCY1z0o5ScITLBkZK/niK2UxG5RWKEFJsVmb3fxdb1IL5pPkNrNl6dk7JwSgu98QPSV/h1b+My1iVpEc6ccw5zDQ6cUbjJvk38gcDjeV5CZe93usTkeEGo++5l+f3jof9PWOb7kS5VrtrhGzrQb/vyeG9pDNEIB58yqYJEIG2eRGAc5gS6k1jqJ3bUayZwpdWab3q6WdPrRDFbSpNM+0et4NHPbevtuqpR1uBmabQoj0ox8oI9NWnk6WN0IFN8kLq1Q88FQys0Ga++0Ln/hQ/U7cX2AK8vOBRzE+9IzMuyPFU7YjXVSq9WumbS6wIDAQAB";
	
	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	//public static String notify_url = "http://192.168.1.88:8080/yzlfd/api/pc_alipay/notify_url";
	public static String notify_url = "http://www.0898yzzx.com/yzlfd/api/pc_alipay/notify_url";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	//public static String return_url = "http://192.168.1.88:8080/yzlfd/api/pc_alipay/return_url";
	public static String return_url = "http://www.0898yzzx.com/yzlfd/api/pc_alipay/return_url";

	// 签名方式
	//public static String sign_type = "RSA2";
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipay.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

