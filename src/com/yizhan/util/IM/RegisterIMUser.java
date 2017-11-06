package com.yizhan.util.IM;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

public class RegisterIMUser {
	
	
	public static Map registerUser(String accid) throws ClientProtocolException, IOException{
		// TODO Auto-generated method stub
				DefaultHttpClient httpClient = new DefaultHttpClient();
		        String url = "https://api.netease.im/nimserver/user/create.action";
		        HttpPost httpPost = new HttpPost(url);

		        String appKey = "fa2c6ed28d1e95ef3e51ecef39f0629b";
		        String appSecret = "b8dc7ac744a8";
		        String nonce =  "123453242525112";
		        String curTime = String.valueOf((new Date()).getTime() / 1000L);
		        String checkSum = CheckSumBuilder.getCheckSum(appSecret, nonce ,curTime);//参考 计算CheckSum的java代码

		        // 设置请求的header
		        httpPost.addHeader("AppKey", appKey);
		        httpPost.addHeader("Nonce", nonce);
		        httpPost.addHeader("CurTime", curTime);
		        httpPost.addHeader("CheckSum", checkSum);
		        httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

		        // 设置请求的参数
		        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		        nvps.add(new BasicNameValuePair("accid", accid));
		        httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));

		        // 执行请求
		        HttpResponse response = httpClient.execute(httpPost);
		        String results = EntityUtils.toString(response.getEntity(), "utf-8");
		        Map map = new HashMap();
		        System.out.println("-------------------"+results);
		        String resString = "["+results+"]";   
				
				  JSONArray json = JSONArray.fromObject(resString); // 首先把字符串转成 JSONArray  对象
				  JSONObject job = new JSONObject();
			        if(json.size()>0){
			          for(int i=0;i<json.size();i++){
			             job = json.getJSONObject(i);  // 遍历 jsonarray 数组，把每一个对象转成 json 对象
			             if(job.get("code").equals("200")){
			            	 System.out.println("----info----"+job.get("info"));  // 得到 每个对象中的属性值
			            	 //下一步
			            	 if(!job.get("info").equals("")&&job.get("info")!=null){
							        String rrs = "["+job.get("info").toString()+"]";
									  JSONArray json2 = JSONArray.fromObject(rrs); // 首先把字符串转成 JSONArray  对象
									  JSONObject job2 = new JSONObject();
								        if(json2.size()>0){
								          for(int j=0;j<json2.size();j++){
								             job2 = json2.getJSONObject(j);  // 遍历 jsonarray 数组，把每一个对象转成 json 对象
								             System.out.println(job2.get("token"));  // 得到 每个对象中的属性值
								             System.out.println(job2.get("accid"));  // 得到 每个对象中的属性值
								             map.put("accid", job2.get("accid"));
								             map.put("token", job2.get("token"));
								          }
								         
								        }
						        }
			             }else if(job.get("code").equals("414")){
			            	 map.put("code", "414");
			             }
			            
			          }
			         
			        }
			       
		        
			        // 打印执行结果
			        System.out.println("--------IM返回结果：---------"+results);
		        return map;
		
	}
}
