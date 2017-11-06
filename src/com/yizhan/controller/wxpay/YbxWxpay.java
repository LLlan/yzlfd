package com.yizhan.controller.wxpay;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;
import javax.annotation.Resource;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.yizhan.controller.base.BaseController;
import com.yizhan.controller.wxpay.utils.CommonUtil;
import com.yizhan.controller.wxpay.utils.GetWxOrderno;
import com.yizhan.controller.wxpay.utils.RequestHandler;
import com.yizhan.controller.wxpay.utils.Sha1Util;
import com.yizhan.controller.wxpay.utils.TenpayUtil;
import com.yizhan.entity.information.ZywKeHu;
import com.yizhan.service.information.yibaoxuan.YbxOrderService;
import com.yizhan.service.information.yibaoxuan.YbxShangHuService;
import com.yizhan.util.Const;
import com.yizhan.util.DateUtil;
import com.yizhan.util.PageData;
import com.yizhan.util.PathUtil;
import com.yizhan.util.QRCodeUtil;
import com.yizhan.util.Tools;

@Controller
@RequestMapping("/api/ybxWxpay")
public class YbxWxpay extends BaseController{
	
	//double保留两位小数
	private DecimalFormat df = new DecimalFormat("#0.0000");
	
	@Resource(name="ybxOrderService")
	private YbxOrderService ybxOrderService;
	@Resource(name="ybxShangHuService")
	private YbxShangHuService ybxShangHuService;
	
	@RequestMapping(value="/topay")
	public ModelAndView topay(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception{
		ModelAndView mv=new ModelAndView();
		//获取购买服务的主键ID
        String fuwu_id = request.getParameter("fuwu_id");
        //药商参数
        String xingming = new String(request.getParameter("xingming").getBytes("ISO-8859-1"),"UTF-8");
        String dianhua = new String(request.getParameter("dianhua").getBytes("ISO-8859-1"),"UTF-8");
        String dizhi = new String(request.getParameter("dizhi").getBytes("ISO-8859-1"),"UTF-8");
        String beizhu = new String(request.getParameter("beizhu").getBytes("ISO-8859-1"),"UTF-8");
        String number = request.getParameter("number");
        //商户订单号
      	String out_trade_no = request.getParameter("out_trade_no");
      	//获取客户信息
      	ZywKeHu zywKeHu=(ZywKeHu) session.getAttribute(Const.SESSION_KEHU_USER);
      	//保存临时信息
      	PageData temp=new PageData();
      	temp.put("temp_id", this.get32UUID());
      	temp.put("order_number", out_trade_no);
      	temp.put("fuwu_id", fuwu_id);
      	temp.put("xingming", xingming);
      	temp.put("dianhua", dianhua);
      	temp.put("dizhi", dizhi);
      	temp.put("beizhu", beizhu);
      	temp.put("number", number);
      	temp.put("user_kuhu_fid", zywKeHu.getUser_kuhu_id());
      	
      	ybxOrderService.save_tb_temp_information(temp);
      	
		//网页授权后获取传递的参数
		String code = request.getParameter("code");//获取code,跟据code可以获取openid
		//金额转化为分为单位
		float sessionmoney = Float.parseFloat(request.getParameter("WIDtotal_fee"));
		String finalmoney = String.format("%.2f", sessionmoney);
		finalmoney = finalmoney.replace(".", "");
		int total_fee = Integer.parseInt(finalmoney);
		System.out.println("++++++++++++++++++++++所支付的金额（以分为单位）="+total_fee);
		//商品描述根据情况修改
		String body = "艺宝苑:购买产品";
		
		//商户相关资料 
		String appid = "wx07df4a5caaf79650";//开发者ID
		String appsecret = "063875c0788ef2d5690dda7f70ad3a95";//开发者密码
		String mch_id = "1451208302";//商户号
		String partnerkey = "ylc15541383555ylc888888888888888";
		
		String openid ="";
		String URL = "https://api.weixin.qq.com/sns/oauth2/access_token?appid="+appid+"&secret="+appsecret+"&code="+code+"&grant_type=authorization_code";
		
		JSONObject jsonObject = CommonUtil.httpsRequest(URL, "GET", null);
		if (null != jsonObject) {
			openid = jsonObject.getString("openid");
		}
		
		//随机数 
		String nonce_str = TenpayUtil.getCurrTime().substring(8, TenpayUtil.getCurrTime().length()) + TenpayUtil.buildRandom(4) + "";
		//交易类型
		String trade_type = "JSAPI";
		//订单生成的机器 IP(终端IP)
		String spbill_create_ip = request.getRemoteAddr();
		//这里notify_url是 支付完成后微信发给该链接信息，可以判断会员是否支付成功，改变订单状态等。
		//String notify_url ="http://www.0898yzzx.com/yzlfd/api/wxpay/notify_url";
		String notify_url ="http://lnlcjf.com/yzlfd/api/ybxWxpay/notify_url";
		
		SortedMap<String, String> packageParams = new TreeMap<String, String>();
		packageParams.put("appid", appid);  
		packageParams.put("mch_id", mch_id);  
		packageParams.put("nonce_str", nonce_str);  
		packageParams.put("body", body);  
		packageParams.put("out_trade_no", out_trade_no);  
		
		//这里写的金额为1 分到时修改
		packageParams.put("total_fee", total_fee+"");  
		packageParams.put("spbill_create_ip", spbill_create_ip);  
		packageParams.put("notify_url", notify_url);  
		packageParams.put("trade_type", trade_type);  
		packageParams.put("openid", openid);  

		RequestHandler reqHandler = new RequestHandler(request, response);
		reqHandler.init(appid, appsecret, partnerkey);
		//获取签名
		String sign = reqHandler.createSign(packageParams);
		String xml="<xml>"+
				"<appid>"+appid+"</appid>"+
				"<mch_id>"+mch_id+"</mch_id>"+
				"<nonce_str>"+nonce_str+"</nonce_str>"+
				"<sign>"+sign+"</sign>"+
				"<body><![CDATA["+body+"]]></body>"+
				"<out_trade_no>"+out_trade_no+"</out_trade_no>"+
				"<total_fee>"+total_fee+"</total_fee>"+
				"<spbill_create_ip>"+spbill_create_ip+"</spbill_create_ip>"+
				"<notify_url>"+notify_url+"</notify_url>"+
				"<trade_type>"+trade_type+"</trade_type>"+
				"<openid>"+openid+"</openid>"+
				"</xml>";
		System.out.println("---xml内容为++++++++++++++++++++++--"+xml);
		// 获取package的签名包
		/*String allParameters = "";
		try {
			allParameters =  reqHandler.genPackage(packageParams);
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		String createOrderURL = "https://api.mch.weixin.qq.com/pay/unifiedorder";
		String prepay_id="";
		try {
			prepay_id = new GetWxOrderno().getPayNo(createOrderURL, xml);
			if(prepay_id.equals("")){
				System.out.println("++++++++++++++++++++prepay_id为空+++++++++++++++++++++++");
			}
		} catch (Exception e1) {
			System.out.println("++++++++++++++++++++获取prepay_id时，捕捉异常+++++++++++++++++++++++");
			e1.printStackTrace();
		}
		SortedMap<String, String> finalpackage = new TreeMap<String, String>();
		String timestamp = Sha1Util.getTimeStamp();
		String packages = "prepay_id="+prepay_id;
		finalpackage.put("appId", appid);  
		finalpackage.put("timeStamp", timestamp);  
		finalpackage.put("nonceStr", nonce_str);  
		finalpackage.put("package", packages);  
		finalpackage.put("signType", "MD5");
		String finalsign = reqHandler.createSign(finalpackage);
		System.out.println("+++++++++++++各种信息++++++++++++++++++++++++++++++++appid="+appid+"&timeStamp="+timestamp+"&nonceStr="+nonce_str+"&package="+packages+"&sign="+finalsign);
		mv.addObject("appid", appid);
		mv.addObject("timeStamp", timestamp);
		mv.addObject("nonceStr", nonce_str);
		mv.addObject("packages", packages);//package是关键字，所以这里用packages
		mv.addObject("sign", finalsign);
		mv.setViewName("wxpay/pay");
		return mv;
	}
	//异步接收微信支付结果通知的回调地址
	@RequestMapping(value="/notify_url")
	public void notify_url(HttpServletRequest request,HttpServletResponse response) throws Exception{
		BufferedReader br = new BufferedReader(new InputStreamReader((ServletInputStream)request.getInputStream()));
        String line = null;
        StringBuilder sb = new StringBuilder();
        while((line = br.readLine())!=null){
            sb.append(line);
        }
        //sb为微信返回的xml
        //转换为map
		Map map = GetWxOrderno.doXMLParse(sb.toString());
		System.out.println("=========notify_url+map======="+map);
		
		//验证是否成功
		if(map.get("return_code").equals("SUCCESS")){
			System.out.println("验证成功");
			//验证交易结果是否成功
			if(map.get("result_code").equals("SUCCESS")){
				System.out.println("交易成功");
				PageData pd=new PageData();
				
				String out_trade_no=(String) map.get("out_trade_no");//商户订单编号
				String transaction_id=(String) map.get("transaction_id");//微信支付订单号
				//获取临时信息
				pd.put("order_number", out_trade_no);
				PageData temp=ybxOrderService.get_tb_temp_information(pd);
				//获取服务信息
				PageData tempfuwu=ybxShangHuService.getDataByIdOfService(temp);
				System.out.println("-------tempfuwu--++++++++++++++++++++++++++-------"+tempfuwu);
				//当收到通知进行处理时，首先检查对应业务数据的状态，判断该通知是否已经处理过，如果没有处理过再进行处理，如果处理过直接返回结果成功
				pd.put("order_number", out_trade_no);
				//获取平台技术服务扣除比例对象
				PageData biliData=ybxShangHuService.getDataOfJiShuFuWuBiLi(pd);
				float bili=0;
				if(Tools.notEmpty(biliData.getString("bili_jishufuwu"))){
					bili=Float.parseFloat(biliData.getString("bili_jishufuwu"));
				}
				//服务信息不为空
				if(tempfuwu!=null){
					PageData yaosPd=ybxOrderService.getOrderOfYaoShangByOrderNumber(pd);
					if(yaosPd==null){//说明还未进行处理
						//保存订单信息
						PageData tempyaos=new PageData();
						tempyaos.put("order_yaoshang_id", this.get32UUID());
						tempyaos.put("order_number", out_trade_no);
						tempyaos.put("create_order_time", DateUtil.getTime());
						tempyaos.put("user_kuhu_fid", temp.getString("user_kuhu_fid"));
						tempyaos.put("user_shanghu_fid", tempfuwu.getString("user_shanghu_fid"));
						tempyaos.put("fuwu_name", tempfuwu.getString("fuwu_jibing_name"));
						tempyaos.put("price", df.format(Double.parseDouble(temp.getString("number"))*Double.parseDouble(tempfuwu.get("price").toString())*(1-bili)));
						tempyaos.put("fuwu_introdaction", tempfuwu.getString("jibing_introdaction"));
						tempyaos.put("pay_method", "微信");
						tempyaos.put("pay_number", transaction_id);
						tempyaos.put("order_state", "2");
						tempyaos.put("xingming", temp.getString("xingming"));
						tempyaos.put("dianhua", temp.getString("dianhua"));
						tempyaos.put("dizhi", temp.getString("dizhi"));
						tempyaos.put("beizhu", temp.getString("beizhu"));
						tempyaos.put("number", temp.getString("number"));
						//tempyaos.put("totalPrice", Float.parseFloat(map.get("total_fee").toString())/100);
						tempyaos.put("totalPrice", df.format(Double.parseDouble(temp.getString("number"))*Double.parseDouble(tempfuwu.get("price").toString())));
						
						tempyaos.put("kehuPrice", df.format(Double.parseDouble(temp.getString("number"))*Double.parseDouble(tempfuwu.get("price").toString())));
						tempyaos.put("pingtaiPrice", df.format(Double.parseDouble(temp.getString("number"))*Double.parseDouble(tempfuwu.get("price").toString())*bili));
						tempyaos.put("fuwubili", biliData.getString("bili_jishufuwu"));
						
						ybxOrderService.saveOrderOfYaoShang(tempyaos);
					}
				}
			}else{
				System.out.println("交易失败err_code:"+map.get("err_code"));
			}
		}else{
			System.out.println("验证失败return_msg:"+map.get("return_msg"));
		}
		response.getWriter().write("<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>");
	}
	@RequestMapping(value="/return_url")
	public ModelAndView return_url(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("alipay/alipayreturn");
		return mv;
	}
////////////////////////////////////////非微信内置浏览器进行微信支付//////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value="/topay1")
	public ModelAndView topay1(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception{
		ModelAndView mv=new ModelAndView();
		//获取购买服务的主键ID
        String fuwu_id = request.getParameter("fuwu_id");
        //药商参数
        String xingming = request.getParameter("xingming");
        String dianhua = request.getParameter("dianhua");
        String dizhi = request.getParameter("dizhi");
        String beizhu = request.getParameter("beizhu");
        String number = request.getParameter("number");
        //商户订单号
      	//String out_trade_no = request.getParameter("out_trade_no");
      	String out_trade_no = request.getParameter("WIDout_trade_no");
      	//获取客户信息
      	ZywKeHu zywKeHu=(ZywKeHu) session.getAttribute(Const.SESSION_KEHU_USER);
      	//保存临时信息
      	PageData temp=new PageData();
      	temp.put("temp_id", this.get32UUID());
      	temp.put("order_number", out_trade_no);
      	temp.put("fuwu_id", fuwu_id);
      	temp.put("xingming", xingming);
      	temp.put("dianhua", dianhua);
      	temp.put("dizhi", dizhi);
      	temp.put("beizhu", beizhu);
      	temp.put("number", number);
      	temp.put("user_kuhu_fid", zywKeHu.getUser_kuhu_id());
      	
      	ybxOrderService.save_tb_temp_information(temp);
      	
		//金额转化为分为单位
		float sessionmoney = Float.parseFloat(request.getParameter("WIDtotal_fee"));
		String finalmoney = String.format("%.2f", sessionmoney);
		finalmoney = finalmoney.replace(".", "");
		int total_fee = Integer.parseInt(finalmoney);
		System.out.println("++++++++++++++++++++++所支付的金额（以分为单位）="+total_fee);
		//商品描述根据情况修改
		String body = "艺宝苑:购买产品";
		
		//商户相关资料 
		String appid = "wx07df4a5caaf79650";//开发者ID
		String appsecret = "063875c0788ef2d5690dda7f70ad3a95";//开发者密码
		String mch_id = "1451208302";//商户号
		String partnerkey = "ylc15541383555ylc888888888888888";
		
		//随机数 
		String nonce_str = TenpayUtil.getCurrTime().substring(8, TenpayUtil.getCurrTime().length()) + TenpayUtil.buildRandom(4) + "";
		//交易类型
		String trade_type = "MWEB";
		//String trade_type = "WAP";
		//订单生成的机器 IP(终端IP)
		String spbill_create_ip = request.getRemoteAddr();
		//这里notify_url是 支付完成后微信发给该链接信息，可以判断会员是否支付成功，改变订单状态等。
		String notify_url ="http://www.0898yzzx.com/yzlfd/api/ybxWxpay/notify_url";
		
		SortedMap<String, String> packageParams = new TreeMap<String, String>();
		packageParams.put("appid", appid);  
		packageParams.put("mch_id", mch_id);  
		packageParams.put("nonce_str", nonce_str);  
		packageParams.put("body", body);  
		packageParams.put("out_trade_no", out_trade_no);  
		
		//这里写的金额为1 分到时修改
		packageParams.put("total_fee", total_fee+"");  
		packageParams.put("spbill_create_ip", spbill_create_ip);  
		packageParams.put("notify_url", notify_url);  
		packageParams.put("trade_type", trade_type);  
		//packageParams.put("openid", openid);  

		RequestHandler reqHandler = new RequestHandler(request, response);
		reqHandler.init(appid, appsecret, partnerkey);
		//获取签名
		String sign = reqHandler.createSign(packageParams);
		String xml="<xml>"+
				"<appid>"+appid+"</appid>"+
				"<mch_id>"+mch_id+"</mch_id>"+
				"<nonce_str>"+nonce_str+"</nonce_str>"+
				"<sign>"+sign+"</sign>"+
				"<body><![CDATA["+body+"]]></body>"+
				"<out_trade_no>"+out_trade_no+"</out_trade_no>"+
				"<total_fee>"+total_fee+"</total_fee>"+
				"<spbill_create_ip>"+spbill_create_ip+"</spbill_create_ip>"+
				"<notify_url>"+notify_url+"</notify_url>"+
				"<trade_type>"+trade_type+"</trade_type>"+
				"</xml>";
		System.out.println("---xml内容为++++++++++++++++++++++--"+xml);
		// 获取package的签名包
		/*String allParameters = "";
		try {
			allParameters =  reqHandler.genPackage(packageParams);
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		String createOrderURL = "https://api.mch.weixin.qq.com/pay/unifiedorder";
		String prepay_id="";
		try {
			prepay_id = new GetWxOrderno().getPayNo(createOrderURL, xml);
			if(prepay_id.equals("")){
				System.out.println("++++++++++++++++++++prepay_id为空+++++++++++++++++++++++");
			}
		} catch (Exception e1) {
			System.out.println("++++++++++++++++++++获取prepay_id时，捕捉异常+++++++++++++++++++++++");
			e1.printStackTrace();
		}
		SortedMap<String, String> finalpackage = new TreeMap<String, String>();
		String timestamp = Sha1Util.getTimeStamp();
		String packages = "prepay_id="+prepay_id;
		finalpackage.put("appId", appid);  
		finalpackage.put("timeStamp", timestamp);  
		finalpackage.put("nonceStr", nonce_str);  
		finalpackage.put("package", packages);  
		finalpackage.put("signType", "MD5");
		String finalsign = reqHandler.createSign(finalpackage);
		System.out.println("+++++++++++++各种信息++++++++++++++++++++++++++++++++appid="+appid+"&timeStamp="+timestamp+"&nonceStr="+nonce_str+"&package="+packages+"&sign="+finalsign);
		
		String string1 = "appid="+appid+"&noncestr="+nonce_str+"&package=WAP&prepayid="+prepay_id+"&sign="+finalsign+"&timestamp="+timestamp;
		string1=URLEncoder.encode(string1);
		String string2="weixin://wap/pay?"+string1;
		mv.addObject("deeplink", string2);
		mv.setViewName("wxpay/pay1");
		return mv;
	}
////////////////////////////////////////微信支付 扫码支付 电脑//////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value="/topay_saoma")
	public ModelAndView topay_saoma(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception{
		ModelAndView mv=new ModelAndView();
		//获取购买服务的主键ID
		String fuwu_id = request.getParameter("fuwu_id");
		//药商参数
		String xingming = request.getParameter("xingming");
		String dianhua = request.getParameter("dianhua");
		String dizhi = request.getParameter("dizhi");
		String beizhu = request.getParameter("beizhu");
		String number = request.getParameter("number");
		//商户订单号
		//String out_trade_no = request.getParameter("out_trade_no");
		String out_trade_no = request.getParameter("WIDout_trade_no");
		//获取客户信息
		ZywKeHu zywKeHu=(ZywKeHu) session.getAttribute(Const.SESSION_KEHU_USER);
		//保存临时信息
		PageData temp=new PageData();
		temp.put("temp_id", this.get32UUID());
		temp.put("order_number", out_trade_no);
		temp.put("fuwu_id", fuwu_id);
		temp.put("xingming", xingming);
		temp.put("dianhua", dianhua);
		temp.put("dizhi", dizhi);
		temp.put("beizhu", beizhu);
		temp.put("number", number);
		temp.put("user_kuhu_fid", zywKeHu.getUser_kuhu_id());
		
		ybxOrderService.save_tb_temp_information(temp);
		
		//金额转化为分为单位
		float sessionmoney = Float.parseFloat(request.getParameter("WIDtotal_fee"));
		String finalmoney = String.format("%.2f", sessionmoney);
		finalmoney = finalmoney.replace(".", "");
		int total_fee = Integer.parseInt(finalmoney);
		System.out.println("++++++++++++++++++++++所支付的金额（以分为单位）="+total_fee);
		//商品描述根据情况修改
		String body = "找医网：购买服务";
		
		//商户相关资料 
		String appid = "wx07df4a5caaf79650";//开发者ID
		String appsecret = "063875c0788ef2d5690dda7f70ad3a95";//开发者密码
		String mch_id = "1451208302";//商户号
		String partnerkey = "ylc15541383555ylc888888888888888";
		
		//随机数 
		String nonce_str = TenpayUtil.getCurrTime().substring(8, TenpayUtil.getCurrTime().length()) + TenpayUtil.buildRandom(4) + "";
		//交易类型
		String trade_type = "NATIVE";
		//String trade_type = "WAP";
		//订单生成的机器 IP(终端IP)
		String spbill_create_ip = request.getRemoteAddr();
		//这里notify_url是 支付完成后微信发给该链接信息，可以判断会员是否支付成功，改变订单状态等。
		String notify_url ="http://www.0898yzzx.com/yzlfd/api/ybxWxpay/notify_url";
		
		SortedMap<String, String> packageParams = new TreeMap<String, String>();
		packageParams.put("appid", appid);  
		packageParams.put("mch_id", mch_id);  
		packageParams.put("nonce_str", nonce_str);  
		packageParams.put("body", body);  
		packageParams.put("out_trade_no", out_trade_no);  
		
		//这里写的金额为1 分到时修改
		packageParams.put("total_fee", total_fee+"");  
		packageParams.put("spbill_create_ip", spbill_create_ip);  
		packageParams.put("notify_url", notify_url);  
		packageParams.put("trade_type", trade_type);  
		//packageParams.put("openid", openid);  
		
		RequestHandler reqHandler = new RequestHandler(request, response);
		reqHandler.init(appid, appsecret, partnerkey);
		//获取签名
		String sign = reqHandler.createSign(packageParams);
		String xml="<xml>"+
				"<appid>"+appid+"</appid>"+
				"<mch_id>"+mch_id+"</mch_id>"+
				"<nonce_str>"+nonce_str+"</nonce_str>"+
				"<sign>"+sign+"</sign>"+
				"<body><![CDATA["+body+"]]></body>"+
				"<out_trade_no>"+out_trade_no+"</out_trade_no>"+
				"<total_fee>"+total_fee+"</total_fee>"+
				"<spbill_create_ip>"+spbill_create_ip+"</spbill_create_ip>"+
				"<notify_url>"+notify_url+"</notify_url>"+
				"<trade_type>"+trade_type+"</trade_type>"+
				"</xml>";
		System.out.println("---xml内容为++++++++++++++++++++++--"+xml);
		// 获取package的签名包
		/*String allParameters = "";
		try {
			allParameters =  reqHandler.genPackage(packageParams);
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		String createOrderURL = "https://api.mch.weixin.qq.com/pay/unifiedorder";
		String code_url="";
		try {
			code_url = new GetWxOrderno().getPaycode_url(createOrderURL, xml);
			if(code_url.equals("")){
				System.out.println("++++++++++++++++++++code_url为空+++++++++++++++++++++++");
			}
		} catch (Exception e1) {
			System.out.println("++++++++++++++++++++获取code_url时，捕捉异常+++++++++++++++++++++++");
			e1.printStackTrace();
		}
		System.out.println("==================================code_url="+code_url);
		//生成带logo的新的二维码
		String content=code_url;
		String destPath=Const.FILEPATHIMG+"weixin/zhifu/"+DateUtil.getDays()+"/";
		String imgName=this.get32UUID()+".jpg";
		QRCodeUtil.encode(content, PathUtil.getClasspath()+destPath, imgName, false);
		
		mv.addObject("imgPath", destPath+imgName);
		mv.setViewName("wxpay/saoma");
		return mv;
	}
	
	
	
	
	
	public static void main(String[] args) throws IOException {
		String appid = "wx07df4a5caaf79650";
		//String backUri = "http://192.168.1.88:8080/yzlfd/api/wxpay/abcde.do";
		String backUri = "http://www.0898yzzx.com/yzlfd/api/wxpay/topay?code&state";
		//String backUri = "http://ceshi.ijuying.com/";
		//授权后要跳转的链接所需的参数一般有会员号，金额，订单号之类，
		//最好自己带上一个加密字符串将金额加上一个自定义的key用MD5签名或者自己写的签名,
		//比如 Sign = %3D%2F%CS% 
		String orderNo=appid+Sha1Util.getTimeStamp();
		//backUri = backUri+"?userId=b88001&orderNo="+orderNo+"&describe=test&money=0.01";
		//backUri = backUri+"?orderNo="+orderNo+"&describe=test&money=0.01";
		//URLEncoder.encode 后可以在backUri 的url里面获取传递的所有参数
		backUri = URLEncoder.encode(backUri);
		//scope 参数视各自需求而定，这里用scope=snsapi_base 不弹出授权页面直接授权目的只获取统一支付接口的openid
		String url = "https://open.weixin.qq.com/connect/oauth2/authorize?" +
				"appid=" + appid+
				"&redirect_uri=" +
				 backUri+
				"&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect";
		//String url = "https://open.weixin.qq.com/connect/qrconnect?appid="+appid+"&redirect_uri="+backUri+"&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect";
		System.out.println(url);
	}
}
