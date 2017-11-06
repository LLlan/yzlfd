package com.yizhan.test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.yizhan.util.IM.CheckSumBuilder;

public class TestIM {

	/**
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-13
	 * @throws IOException 
	 * @throws ParseException 
	 */
	public static void main(String[] args) throws ParseException, IOException {
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
        nvps.add(new BasicNameValuePair("accid", "a124"));
        httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));

        // 执行请求
        HttpResponse response = httpClient.execute(httpPost);
        String resString = EntityUtils.toString(response.getEntity(), "utf-8");
       // JSONObject a = new JSONObject(resString); 
        
        JSONArray json = JSONArray.fromObject(resString); // 首先把字符串转成 JSONArray  对象
        if(json.size()>0){
          for(int i=0;i<json.size();i++){
            JSONObject job = json.getJSONObject(i);  // 遍历 jsonarray 数组，把每一个对象转成 json 对象
            System.out.println(job.get("token")+"=") ;  // 得到 每个对象中的属性值
          }
        }
        // 打印执行结果
        System.out.println(EntityUtils.toString(response.getEntity(), "utf-8"));
        System.out.println(EntityUtils.toString(response.getEntity(), "utf-8"));

	}

}
