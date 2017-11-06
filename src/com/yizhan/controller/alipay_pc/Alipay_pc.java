package com.yizhan.controller.alipay_pc;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.yizhan.controller.alipay_pc.config.AlipayConfig;
import com.yizhan.controller.base.BaseController;
import com.yizhan.service.information.zhaoyiwang.OrderService;
import com.yizhan.service.information.zhaoyiwang.ShangHuService;
import com.yizhan.util.DateUtil;
import com.yizhan.util.PageData;

@Controller
@RequestMapping("/api/pc_alipay")
public class Alipay_pc extends BaseController{
	//double保留两位小数
	private DecimalFormat df = new DecimalFormat("#0.0000");
	@Resource(name="shangHuService")
	private ShangHuService shangHuService;
	@Resource(name="orderService")
	private OrderService orderService;
	
	@RequestMapping(value="/index")
	public ModelAndView index(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("alipay_pc/index");
		return mv;
	}
	
	@RequestMapping(value="/alipay")
	public ModelAndView pc_alipay(HttpServletRequest request) throws Exception{
		ModelAndView mv=new ModelAndView();
		
		//获得初始化的AlipayClient
		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
		
		//设置请求参数8
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
		alipayRequest.setReturnUrl(AlipayConfig.return_url);
		alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
		
		//商户订单号，商户网站订单系统中唯一订单号，必填
		String out_trade_no = DateUtil.getOrderNumber();
		//付款金额，必填
		String total_amount = request.getParameter("WIDtotal_amount");
		//订单名称，必填
		//String subject = new String(request.getParameter("WIDsubject").getBytes("ISO-8859-1"),"UTF-8");
		String subject = "找医网:购买服务";
		//商品描述，可空
		//String body = new String(request.getParameter("WIDbody").getBytes("ISO-8859-1"),"UTF-8");
		String body ="";
		//客户ID
		String user_kuhu_id = request.getParameter("user_kuhu_id");
		
		
		//获取购买服务的主键ID以及服务类型
        String fuwu_id = request.getParameter("fuwu_id");
        String xingming = request.getParameter("xingming");
        String dianhua = request.getParameter("dianhua");
        String dizhi = request.getParameter("dizhi");
        String beizhu = request.getParameter("beizhu");
        String number = request.getParameter("number");
        
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
      	temp.put("user_kuhu_fid", user_kuhu_id);
      	
      	orderService.save_tb_temp_information(temp);
		
		
		alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
				+ "\"total_amount\":\""+ total_amount +"\"," 
				+ "\"subject\":\""+ subject +"\"," 
				+ "\"body\":\""+ body +"\"," 
				+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
		
		//若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
		//alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
		//		+ "\"total_amount\":\""+ total_amount +"\"," 
		//		+ "\"subject\":\""+ subject +"\"," 
		//		+ "\"body\":\""+ body +"\"," 
		//		+ "\"timeout_express\":\"10m\"," 
		//		+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
		//请求参数可查阅【电脑网站支付的API文档-alipay.trade.page.pay-请求参数】章节
		
		//请求
		String result = alipayClient.pageExecute(alipayRequest).getBody();
		
		//输出
		mv.addObject("sHtmlText", result);
		mv.setViewName("alipay_pc/alipay_pc");
		return mv;
	}
	/**
	 * 支付成功回调（异步通知）
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/notify_url")
	public void notify_url(HttpServletRequest request,HttpServletResponse response) throws Exception{
		logBefore(logger, "--支付成功回调（异步通知）--");
		//支付宝返回的参数
		Map<String,String> params = new HashMap<String,String>();
		Map<String,String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用
			//valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		System.out.println("++++++++++++++++++++++++++++++++pc异步通知参数:"+params);
		boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名

		if(signVerified) {//验证成功
			//商户订单号
			String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
			//支付宝交易号
			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
			//交易状态
			String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");
			if(trade_status.equals("TRADE_FINISHED") || trade_status.equals("TRADE_SUCCESS")){

				PageData pd=new PageData();
				//获取临时信息
				pd.put("order_number", out_trade_no);
				PageData temp=orderService.get_tb_temp_information(pd);
				pd.put("fuwu_id", temp.getString("fuwu_id"));
				//获取医生的服务
				PageData tempfuwu=shangHuService.getDataByIdOfService(pd);
				//获取平台技术服务扣除比例对象
				PageData biliData=shangHuService.getDataOfJiShuFuWuBiLi(pd);
				if(tempfuwu!=null){
					if(tempfuwu.getString("type").equals("1")){//1-医生2.机构3-药商
						//1.创建订单
						//创建医生类订单
						PageData tempyis=new PageData();
						tempyis.put("order_yisheng_id", this.get32UUID());
						tempyis.put("order_number", out_trade_no);
						tempyis.put("create_order_time", DateUtil.getTime());
						tempyis.put("fuwu_jibing_name", tempfuwu.getString("fuwu_jibing_name"));
						tempyis.put("jibing_introdaction", tempfuwu.getString("jibing_introdaction"));
						tempyis.put("price", df.format(Float.parseFloat(tempfuwu.get("price").toString())*(1-Float.parseFloat(biliData.getString("bili_jishufuwu")))));
						tempyis.put("pay_method", "支付宝");
						tempyis.put("pay_number", trade_no);
						tempyis.put("order_state", "2");
						tempyis.put("user_kuhu_fid", temp.getString("user_kuhu_fid"));
						tempyis.put("user_shanghu_fid", tempfuwu.getString("user_shanghu_fid"));
						
						tempyis.put("kehuPrice", tempfuwu.get("price").toString());
						tempyis.put("pingtaiPrice", df.format(Float.parseFloat(tempfuwu.get("price").toString())*Float.parseFloat(biliData.getString("bili_jishufuwu"))));
						tempyis.put("fuwubili", biliData.getString("bili_jishufuwu"));
						
						orderService.saveOrderOfYiSheng(tempyis);
					}else if(tempfuwu.getString("type").equals("2")){
						//保存订单信息
						PageData tempjig=new PageData();
						tempjig.put("order_jigou_id", this.get32UUID());
						tempjig.put("order_number", out_trade_no);
						tempjig.put("create_order_time", DateUtil.getTime());
						tempjig.put("fuwu_name", tempfuwu.getString("fuwu_jibing_name"));
						tempjig.put("fuwu_introdaction", tempfuwu.getString("jibing_introdaction"));
						tempjig.put("price", df.format(Float.parseFloat(tempfuwu.get("price").toString())*(1-Float.parseFloat(biliData.getString("bili_jishufuwu")))));
						tempjig.put("pay_method", "支付宝");
						tempjig.put("pay_number", trade_no);
						tempjig.put("order_state", "2");
						tempjig.put("user_kuhu_fid", temp.getString("user_kuhu_fid"));
						tempjig.put("user_shanghu_fid", tempfuwu.getString("user_shanghu_fid"));
						
						tempjig.put("kehuPrice", tempfuwu.get("price").toString());
						tempjig.put("pingtaiPrice", df.format(Float.parseFloat(tempfuwu.get("price").toString())*Float.parseFloat(biliData.getString("bili_jishufuwu"))));
						tempjig.put("fuwubili", biliData.getString("bili_jishufuwu"));
						
						orderService.saveOrderOfJiGou(tempjig);
					}else{
						//保存订单信息
						PageData tempyaos=new PageData();
						tempyaos.put("order_yaoshang_id", this.get32UUID());
						tempyaos.put("order_number", out_trade_no);
						tempyaos.put("create_order_time", DateUtil.getTime());
						tempyaos.put("user_kuhu_fid", temp.getString("user_kuhu_fid"));
						tempyaos.put("user_shanghu_fid", tempfuwu.getString("user_shanghu_fid"));
						tempyaos.put("fuwu_name", tempfuwu.getString("fuwu_jibing_name"));
						tempyaos.put("price", df.format(Double.parseDouble(temp.getString("number"))*Double.parseDouble(tempfuwu.get("price").toString())*(1-Float.parseFloat(biliData.getString("bili_jishufuwu")))));
						tempyaos.put("fuwu_introdaction", tempfuwu.getString("jibing_introdaction"));
						tempyaos.put("pay_method", "支付宝");
						tempyaos.put("pay_number", trade_no);
						tempyaos.put("order_state", "2");
						tempyaos.put("xingming", temp.getString("xingming"));
						tempyaos.put("dianhua", temp.getString("dianhua"));
						tempyaos.put("dizhi", temp.getString("dizhi"));
						tempyaos.put("beizhu", temp.getString("beizhu"));
						tempyaos.put("number", temp.getString("number"));
						tempyaos.put("totalPrice", df.format(Double.parseDouble(temp.getString("number"))*Double.parseDouble(tempfuwu.get("price").toString())));
						
						tempyaos.put("kehuPrice", df.format(Double.parseDouble(temp.getString("number"))*Double.parseDouble(tempfuwu.get("price").toString())));
						tempyaos.put("pingtaiPrice", df.format(Double.parseDouble(temp.getString("number"))*Double.parseDouble(tempfuwu.get("price").toString())*Float.parseFloat(biliData.getString("bili_jishufuwu"))));
						tempyaos.put("fuwubili", biliData.getString("bili_jishufuwu"));
						
						orderService.saveOrderOfYaoShang(tempyaos);
					}
				}
				System.out.println("支付成功");
			}else{
				System.out.println("支付失败");
			}
			response.getWriter().write("success");
			System.out.println("success");
		}else {//验证失败
			System.out.println("fail");
		}
	}
	/**
	 * 支付成功回调（同步通知）
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/return_url")
	public ModelAndView return_url(HttpServletRequest request,HttpSession session) throws Exception{
		logBefore(logger, "--支付成功回调（同步通知）--");
		ModelAndView mv=new ModelAndView();
		//获取支付宝GET过来反馈信息
		Map<String,String> params = new HashMap<String,String>();
		Map<String,String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		System.out.println("++++++++++++++++++++++++++++++++pc同步通知参数:"+params);
		boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名

		//——请在这里编写您的程序（以下代码仅作参考）——
		if(signVerified) {
			//商户订单号
			String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
			//支付宝交易号
			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
			//付款金额
			String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");
			
			PageData resultData=new PageData();
			resultData.put("out_trade_no", out_trade_no);
			resultData.put("trade_no", trade_no);
			resultData.put("total_amount", total_amount);
			
			mv.addObject("resultData", resultData);
			
			//获取临时信息
			PageData pd=new PageData();
			pd.put("order_number", out_trade_no);
			PageData temp=orderService.get_tb_temp_information(pd);
			pd.put("fuwu_id", temp.getString("fuwu_id"));
			//获取医生的服务
			PageData tempfuwu=shangHuService.getDataByIdOfService(pd);
			
			mv.addObject("tempfuwu", tempfuwu);
		}else {
			System.out.println("验签失败");
		}
		mv.setViewName("alipay_pc/result_pay");
		return mv;
	}
}
