package com.yizhan.util.miaodiyun;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;



import org.dom4j.Document;   
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;   
import org.dom4j.Element;   

import com.weixin.method.staticMethod;
import com.yizhan.controller.miaodiyun.httpApiDemo.IndustrySMS;

/**
 * 秒滴云短信接口
 * lj
 */
public class miaodiyunUtil {
	
	/**
	 * 发送短信验证码
	 * 功能：
	 * 作者：lj
	 * 日期：2017-8-15
	 */
	public static String sendMsM(String Tphone){
		String rstring  = IndustrySMS.execute(Tphone);
		//返回结果
		return rstring;
	}
	
	
}

