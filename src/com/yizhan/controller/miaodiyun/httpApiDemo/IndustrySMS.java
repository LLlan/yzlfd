package com.yizhan.controller.miaodiyun.httpApiDemo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.yizhan.controller.miaodiyun.httpApiDemo.common.Config;
import com.yizhan.controller.miaodiyun.httpApiDemo.common.HttpUtil;


/**
 * 验证码通知短信接口
 * 
 * @ClassName: IndustrySMS
 * @Description: 验证码通知短信接口
 *
 */
public class IndustrySMS
{
	private static String operation = "/industrySMS/sendSMS";

	private static String accountSid = Config.ACCOUNT_SID;
	
	//您的验证码为{1}，如非本人操作，请忽略此短信。
	/**
	 * 验证码通知短信
	 */
	public static String execute(String toPhone)
	{
		//生成6位随机验证码
		int mobile_code = (int)((Math.random()*9+1)*100000);
		String smsContent = "【时逸仁】您的验证码为"+mobile_code+"，如非本人操作，请忽略此短信。";
		
		String url = Config.BASE_URL + operation;
		String body = "accountSid=" + accountSid + "&to=" + toPhone + "&smsContent=" + smsContent
				+ HttpUtil.createCommonParam();
		
		// 提交请求
		String result = HttpUtil.post(url, body);
		System.out.println("result:" + System.lineSeparator() + result);
		//使用JSONArray
		//获得jsonArray的第一个元素
		result = "["+result+"]";
		JSONArray jsonArray = JSONArray.fromObject(result);
		Object o=jsonArray.get(0);
		JSONObject jsonObject2=JSONObject.fromObject(o);
		String successCode = jsonObject2.get("respCode").toString();
		String yzmString="";
		if(successCode.equals("00000")){
			yzmString = mobile_code+"";
		}
		return yzmString;
	}
	
}
