package com.yizhan.test;

import java.io.IOException;
import java.math.BigDecimal;
import java.security.MessageDigest;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Map.Entry;

import net.sf.json.JSONObject;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class test {
	
	  //base64算法,解密，加密
    public static String base64Encode(String str){
        BASE64Encoder baseEncode = new BASE64Encoder();
        return baseEncode.encode(str.getBytes());//加密
    }
    

 
	public static void main(String[] args) {
		/*String test = "wa n\tg_p\\te\\tn　g";  
		test = test.replaceAll("\\t|\\\\t|\u0020|\\u3000", "");//去掉空格  
		System.out.println(test);  */
		 /*JSONObject json1=JSONObject.fromObject("{'username' : '11111','clientid' : '','password' : '222222'}");  
	        Map<String, Object> map =json1;  
	        for (Entry<String, Object> entry : map.entrySet()) {  
	            System.out.println(entry.getKey()+"="+entry.getValue());  
	        }     */
		/*SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
			String str=sdf.format(new Date());
			System.out.println(str+(int)((Math.random()*9+1)*100000));*/
		String str1="88856467987894.01";
		String str2="423452345234.0225";
		DecimalFormat df = new DecimalFormat("#0.00");  
		double aa=Double.parseDouble(str1) + Double.parseDouble(str2);
		System.out.println(aa+","+df.format(aa));
		
		 BigDecimal aDouble =new BigDecimal(1.22);
	     System.out.println("construct with a double value: " + aDouble);
	}

}
