package com.yizhan.test;

import java.util.Map;

import com.yizhan.controller.wxpay.utils.GetWxOrderno;



public class Getxml {

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {

		
		String xml="<xml>"+
				"<appid>"+1+"</appid>"+
				"<mch_id>"+2+"</mch_id>"+
				"<nonce_str>"+3+"</nonce_str>"+
				"<sign>"+4+"</sign>"+
				"<body><![CDATA["+5+"]]></body>"+
				"<out_trade_no>"+6+"</out_trade_no>"+
				"<total_fee>"+7+"</total_fee>"+
				"<spbill_create_ip>"+8+"</spbill_create_ip>"+
				"<notify_url>"+9+"</notify_url>"+
				"<trade_type>"+0+"</trade_type>"+
				"<openid>"+11+"</openid>"+
				"</xml>";
		Map map = GetWxOrderno.doXMLParse(xml);
		if(map.get("appid").equals("1")){
			System.out.println(1);
		}
	}
}
