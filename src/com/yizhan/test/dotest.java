package com.yizhan.test;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import net.coobird.thumbnailator.Thumbnails;

import org.apache.shiro.crypto.hash.SimpleHash;

import com.fusioncharts.database.DBConnection;
import com.weixin.method.staticMethod;
import com.weixin.test.GetUrl;
import com.yizhan.util.DateTimeUtil;
import com.yizhan.util.FileUtil;
import com.yizhan.util.PathUtil;

public class dotest {

	/**
	 * 功能：
	 * 作者：lj
	 * 日期：2017-3-30
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		//String string= "D:\\Apache Software Foundation\\Tomcat 7.0\\webapps\\XiaoQufw\\uploadFiles\\uploadImgs\\appHead\\20170330\\a1d2c807467b4291ac97b004404e9a34.jpg";
		//FileUtil.delFile(string);
		/*HttpServletRequest request = null;
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		System.out.println(basePath);*/
		
		String str1 = "2017-12-5 11:11:11";
		String str2 = "2018-01-04 11:01:21";
		System.out.println(DateTimeUtil.getDistanceDays(str1,str2));
		
	}


	//生成密码
	public static String generatepassword(){
		String password = new SimpleHash("SHA-1", "lfd","0000").toString();
		return password;
	}
	
	
	public static String GetUrl(){
		//String a2=类名.class.getResource("").toString();

		String a3=DBConnection.class.getResource("/").toString();
		String a4=DBConnection.class.getClassLoader().getResource("").toString();

		String t=	(String.valueOf(Thread.currentThread().getContextClassLoader().getResource("").getPath().replaceAll("file:/", "").replaceAll("%20", " ")));
		String path = (String.valueOf(Thread.currentThread().getContextClassLoader().getResource(""))+"../../").replaceAll("file:/", "").replaceAll("%20", " ").trim();
		/*if(path.indexOf(":") != 1){
			path = File.separator + path;
			System.out.println("------"+path);
		}*/
		return path;
	}

}
