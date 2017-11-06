package com.yizhan.controller.rong.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import net.sf.json.JSONObject;

public class GetTokenUtil {

	
	public static JSONObject sendPost(String param) {
	 	//基本属性和签名
	 	//融云
	    //String App_Secret="F9iPYtWrCDn";
	    //String App_Key="k51hidwqk9pxb";
	    String App_Secret="b7vLrf9lKb4KM1";
	    String App_Key="tdrvipksthwo5";
        String Nonce=String.valueOf(Math.floor(Math.random() * 1000000));
        String Timestamp=String.valueOf(System.currentTimeMillis() / 1000);
        String Signature = CodeUtil.hexSHA1(App_Secret + Nonce + Timestamp);
	 
        OutputStreamWriter out = null;
        BufferedReader in = null;
        String result = "";
        try {
            URL realUrl = new URL("http://api.cn.ronghub.com/user/getToken.json");
            HttpURLConnection conn = null;
            /*if(isproxy){//使用代理模式
                @SuppressWarnings("static-access")
                Proxy proxy = new Proxy(Proxy.Type.DIRECT.HTTP, new InetSocketAddress(proxyHost, proxyPort));
                conn = (HttpURLConnection) realUrl.openConnection(proxy);
            }else{
                conn = (HttpURLConnection) realUrl.openConnection();
            }*/
            conn = (HttpURLConnection) realUrl.openConnection();
            // 打开和URL之间的连接
             
            // 发送POST请求必须设置如下两行
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setRequestMethod("POST");    // POST方法
             
             
            // 设置通用的请求属性
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent","Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            
            conn.setRequestProperty("App-Key",App_Key);
            conn.setRequestProperty("Nonce",Nonce);
            conn.setRequestProperty("Timestamp",Timestamp);
            conn.setRequestProperty("Signature",Signature);
            conn.connect();
             
            // 获取URLConnection对象对应的输出流
            out = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");
            // 发送请求参数
            out.write(param);
            // flush输出流的缓冲
            out.flush();
            // 定义BufferedReader输入流来读取URL的响应
            in = new BufferedReader(
                    new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送 POST 请求出现异常！"+e);
            e.printStackTrace();
        }
        //使用finally块来关闭输出流、输入流
        finally{
            try{
                if(out!=null){
                    out.close();
                }
                if(in!=null){
                    in.close();
                }
            }
            catch(IOException ex){
                ex.printStackTrace();
            }
        }
        return JSONObject.fromObject(result);
    } 
}
