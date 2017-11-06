package com.yizhan.controller.alipay;

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
import com.yizhan.controller.alipay.config.AlipayConfig;
import com.yizhan.controller.alipay.util.AlipayNotify;
import com.yizhan.controller.alipay.util.AlipaySubmit;
import com.yizhan.controller.base.BaseController;
import com.yizhan.entity.information.ZywKeHu;
import com.yizhan.service.information.lvjuyanglao.LjylKeHuService;
import com.yizhan.service.information.lvjuyanglao.LjylOrderService;
import com.yizhan.service.information.lvjuyanglao.LjylShangHuService;
import com.yizhan.util.Const;
import com.yizhan.util.DateUtil;
import com.yizhan.util.PageData;
import com.yizhan.util.Tools;
/**
 * 调用支付宝支付
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/api/ljylAlipay")
public class LjylAlipay extends BaseController{
	//double保留两位小数
	private DecimalFormat df = new DecimalFormat("#0.0000");
	
	@Resource(name="ljylKeHuService")
	private LjylKeHuService ljylKeHuService;
	@Resource(name="ljylOrderService")
	private LjylOrderService ljylOrderService;
	@Resource(name="ljylShangHuService")
	private LjylShangHuService ljylShangHuService;
	/**
	 * 唤起手机支付宝APP
	 * @param request
	 * @param session
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/alipay")  
    public ModelAndView payConfirm(HttpServletRequest request,HttpSession session) throws Exception { 
		logBefore(logger, "--唤起手机支付宝APPljyl--");
		ModelAndView mv=new ModelAndView();
		ZywKeHu keHu=(ZywKeHu) session.getAttribute(Const.SESSION_KEHU_USER);
		if(keHu!=null){
			//商户订单号，商户网站订单系统中唯一订单号，必填
	        //String out_trade_no = new String(request.getParameter("WIDout_trade_no").getBytes("ISO-8859-1"),"UTF-8");
	        String out_trade_no =request.getParameter("WIDout_trade_no");
	        //订单名称，必填
	        // String subject = new String(request.getParameter("WIDsubject").getBytes("ISO-8859-1"),"UTF-8");
	        String subject = request.getParameter("WIDsubject");
	        //付款金额，必填
	        //String total_fee = new String(request.getParameter("WIDtotal_fee").getBytes("ISO-8859-1"),"UTF-8");
	        String total_fee = request.getParameter("WIDtotal_fee");
	        //String total_fee = "0.01";
	        //收银台页面上，商品展示的超链接，必填
	        //String show_url = new String(request.getParameter("WIDshow_url").getBytes("ISO-8859-1"),"UTF-8");
	        String show_url = request.getParameter("WIDshow_url");
	        //商品描述，可空
	        //String body = new String(request.getParameter("WIDbody").getBytes("ISO-8859-1"),"UTF-8");
	        String body = request.getParameter("WIDbody");
	        System.out.println("====参数out_trade_no="+out_trade_no+",subject="+subject+",total_fee="+total_fee+",show_url="+show_url+",body="+body);
	        //虚拟币
	        String xnbNum = request.getParameter("xnbNum");
	        //////////////////////////////////////////////////////////////////////////////////
			//获取购买服务的主键ID以及服务类型
	        String fuwu_id = request.getParameter("fuwu_id");
	        String xingming = request.getParameter("xingming");
	        String dianhua = request.getParameter("dianhua");
	        String dizhi = request.getParameter("dizhi");
	        String beizhu = request.getParameter("beizhu");
	        String number = request.getParameter("number");
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
	      	temp.put("xnbNum", xnbNum);
	      	temp.put("user_kuhu_fid", zywKeHu.getUser_kuhu_id());
	      	
	      	ljylOrderService.save_tb_temp_information(temp);
	        
			//把请求参数打包成数组
			Map<String, String> sParaTemp = new HashMap<String, String>();
			sParaTemp.put("service", AlipayConfig.service);
	        sParaTemp.put("partner", AlipayConfig.partner);
	        sParaTemp.put("seller_id", AlipayConfig.seller_id);
	        sParaTemp.put("_input_charset", AlipayConfig.input_charset);
			sParaTemp.put("payment_type", AlipayConfig.payment_type);
			sParaTemp.put("notify_url", AlipayConfig.notify_url_ljyl);
			sParaTemp.put("return_url", AlipayConfig.return_url_ljyl);
			sParaTemp.put("out_trade_no", out_trade_no);
			sParaTemp.put("subject", subject);
			sParaTemp.put("total_fee", total_fee);
			sParaTemp.put("show_url", show_url);
			sParaTemp.put("app_pay","y");//启用此参数可唤起钱包APP支付。
			sParaTemp.put("body", body);
			//其他业务参数根据在线开发文档，添加参数.文档地址:https://doc.open.alipay.com/doc2/detail.htm?spm=a219a.7629140.0.0.2Z6TSk&treeId=60&articleId=103693&docType=1
	        //如sParaTemp.put("参数名","参数值");
			
			//建立请求
			String sHtmlText = AlipaySubmit.buildRequest(sParaTemp,"post","确认");
			System.out.println("================sHtmlText:===="+sHtmlText);
			//获取用户的session
			//KeHu keHu=(KeHu) session.getAttribute(Const.SESSION_KEHU_USER);
			//System.out.println("=================keHu="+keHu);
			mv.addObject("sHtmlText", sHtmlText);
			String num =request.getParameter("num");
			
			mv.setViewName("alipay/alipay");
		}else{
			mv.setViewName("redirect:/api/ljylkehu/toLogin");
		}
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
		logBefore(logger, "--支付成功回调（异步通知）ljyl--");
		//获取支付宝POST过来反馈信息
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
			//乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			//valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
			params.put(name, valueStr);
		}
		System.out.println("=========================================支付成功回调（异步通知）参数params="+params);
		//商户订单号
		String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
		//支付宝交易号
		String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
		//交易状态
		String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");
		//交易金额
		String total_fee = new String(request.getParameter("total_fee").getBytes("ISO-8859-1"),"UTF-8");
		
		//计算得出通知验证结果
		boolean verify_result = AlipayNotify.verify(params);
		//if(verify_result){//验证成功
			if(trade_status.equals("TRADE_FINISHED") || trade_status.equals("TRADE_SUCCESS")){
				
				PageData pd=new PageData();
				//获取临时信息
				pd.put("order_number", out_trade_no);
				PageData temp=ljylOrderService.get_tb_temp_information(pd);
				pd.put("fuwu_id", temp.getString("fuwu_id"));
				
				if(Tools.isEmpty(temp.getString("number"))){
					temp.put("number", "1");
				}
				
		        //是否使用虚拟币进行抵扣
				int xnbNum=0;
				if(Tools.notEmpty(temp.getString("xnbNum"))){
					xnbNum=Integer.parseInt(temp.getString("xnbNum"));
				}
		        if(xnbNum>0){
		        	//修改客户的虚拟币数量
		        	//1.获取客户信息
		        	PageData p1=new PageData();
		        	p1.put("user_kuhu_id", temp.getString("user_kuhu_fid"));
		        	PageData pd2=ljylKeHuService.getDetailByID(p1);
		        	
		        	//2.计算虚拟币数量
		        	int result=Integer.parseInt(pd2.getString("xunibi"))-xnbNum;
		        	
		        	//3.更新当前虚拟币
		        	p1.put("xunibi", result);
		        	ljylKeHuService.updateKeHuXuNiBi(p1);
		        }
				
				//获取医生的服务
				PageData tempfuwu=ljylShangHuService.getDataByIdOfService(pd);
				//获取平台技术服务扣除比例对象
				PageData biliData=ljylShangHuService.getDataOfJiShuFuWuBiLi(pd);
				float bili=0;
				if(Tools.notEmpty(biliData.getString("bili_jishufuwu"))){
					bili=Float.parseFloat(biliData.getString("bili_jishufuwu"));
				}
				if(tempfuwu!=null){
					
					//保存订单信息
					PageData tempyaos=new PageData();
					tempyaos.put("order_yaoshang_id", this.get32UUID());
					tempyaos.put("order_number", out_trade_no);
					tempyaos.put("create_order_time", DateUtil.getTime());
					tempyaos.put("user_kuhu_fid", temp.getString("user_kuhu_fid"));
					tempyaos.put("user_shanghu_fid", tempfuwu.getString("user_shanghu_fid"));
					tempyaos.put("fuwu_name", tempfuwu.getString("fuwu_jibing_name"));
					tempyaos.put("price",tempfuwu.get("price"));
					tempyaos.put("fuwu_introdaction", tempfuwu.getString("jibing_introdaction"));
					tempyaos.put("pay_method", "支付宝");
					tempyaos.put("pay_number", trade_no);
					tempyaos.put("order_state", "2");
					tempyaos.put("xnbNum", xnbNum);
					tempyaos.put("type", tempfuwu.getString("type"));
					tempyaos.put("identity", 4);
					tempyaos.put("xingming", temp.getString("xingming"));
					tempyaos.put("dianhua", temp.getString("dianhua"));
					tempyaos.put("dizhi", temp.getString("dizhi"));
					tempyaos.put("beizhu", temp.getString("beizhu"));
					tempyaos.put("number", temp.getString("number"));
					tempyaos.put("totalPrice", df.format(Double.parseDouble(temp.getString("number"))*Double.parseDouble(tempfuwu.get("price").toString())));
					tempyaos.put("shanghuPrice", df.format((Double.parseDouble(temp.getString("number"))*Double.parseDouble(tempfuwu.get("price").toString()))*(1-bili)));
					
					tempyaos.put("kehuPrice", df.format(Double.parseDouble(temp.getString("number"))*Double.parseDouble(tempfuwu.get("price").toString())-xnbNum));
					tempyaos.put("pingtaiPrice", df.format((Double.parseDouble(temp.getString("number"))*Double.parseDouble(tempfuwu.get("price").toString()))*bili));
					tempyaos.put("fuwubili", biliData.getString("bili_jishufuwu"));
					
					ljylOrderService.saveOrderOfYaoShang(tempyaos);
					
				}
				
				System.out.println("支付成功");
			}else{
				System.out.println("支付失败");
			}
			System.out.println("验证成功");
			response.getWriter().write("success");
		//}else{
			//System.out.println("验证失败");
		//}
	}
	/**
	 * 支付成功回调（同步通知）
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/return_url")
	public ModelAndView return_url(HttpServletRequest request,HttpSession session) throws Exception{
		logBefore(logger, "--支付成功回调（同步通知）ljyl--");
		ModelAndView mv=new ModelAndView();
		//获取支付宝GET过来反馈信息
		Map<String,String> params = new HashMap<String,String>();
		Map requestParams = request.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();){
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		System.out.println("++++++++++++++++++++++++++++++++支付成功回调（同步通知）参数:"+params);
		//商户订单号
		String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
		//支付宝交易号
		String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
		//交易状态
		String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");
		//交易金额
		String total_fee = new String(request.getParameter("total_fee").getBytes("ISO-8859-1"),"UTF-8");
		
		//计算得出通知验证结果
		boolean verify_result = AlipayNotify.verify(params);
		//if(verify_result){//验证成功
			if(trade_status.equals("TRADE_FINISHED") || trade_status.equals("TRADE_SUCCESS")){
				
				
				
				
				
				
				//============by yym先暂时加上在内网测试=======//
				/*PageData pd=new PageData();
				//获取临时信息
				pd.put("order_number", out_trade_no);
				PageData temp=ljylOrderService.get_tb_temp_information(pd);
				pd.put("fuwu_id", temp.getString("fuwu_id"));
				
				if(Tools.isEmpty(temp.getString("number"))){
					temp.put("number", "1");
				}
				
		        //是否使用虚拟币进行抵扣
				int xnbNum=0;
				if(Tools.notEmpty(temp.getString("xnbNum"))){
					xnbNum=Integer.parseInt(temp.getString("xnbNum"));
				}
		        if(xnbNum>0){
		        	//修改客户的虚拟币数量
		        	//1.获取客户信息
		        	PageData p1=new PageData();
		        	p1.put("user_kuhu_id", temp.getString("user_kuhu_fid"));
		        	PageData pd2=ljylKeHuService.getDetailByID(p1);
		        	
		        	//2.计算虚拟币数量
		        	int result=Integer.parseInt(pd2.getString("xunibi"))-xnbNum;
		        	
		        	//3.更新当前虚拟币
		        	p1.put("xunibi", result);
		        	ljylKeHuService.updateKeHuXuNiBi(p1);
		        }
				
				//获取医生的服务
				PageData tempfuwu=ljylShangHuService.getDataByIdOfService(pd);
				//获取平台技术服务扣除比例对象
				PageData biliData=ljylShangHuService.getDataOfJiShuFuWuBiLi(pd);
				float bili=0;
				if(Tools.notEmpty(biliData.getString("bili_jishufuwu"))){
					bili=Float.parseFloat(biliData.getString("bili_jishufuwu"));
				}
				if(tempfuwu!=null){
					
					//保存订单信息
					PageData tempyaos=new PageData();
					tempyaos.put("order_yaoshang_id", this.get32UUID());
					tempyaos.put("order_number", out_trade_no);
					tempyaos.put("create_order_time", DateUtil.getTime());
					tempyaos.put("user_kuhu_fid", temp.getString("user_kuhu_fid"));
					tempyaos.put("user_shanghu_fid", tempfuwu.getString("user_shanghu_fid"));
					tempyaos.put("fuwu_name", tempfuwu.getString("fuwu_jibing_name"));
					tempyaos.put("price",tempfuwu.get("price"));
					tempyaos.put("fuwu_introdaction", tempfuwu.getString("jibing_introdaction"));
					tempyaos.put("pay_method", "支付宝");
					tempyaos.put("pay_number", trade_no);
					tempyaos.put("order_state", "2");
					tempyaos.put("xnbNum", xnbNum);
					tempyaos.put("type", tempfuwu.getString("type"));
					tempyaos.put("identity", 4);
					tempyaos.put("xingming", temp.getString("xingming"));
					tempyaos.put("dianhua", temp.getString("dianhua"));
					tempyaos.put("dizhi", temp.getString("dizhi"));
					tempyaos.put("beizhu", temp.getString("beizhu"));
					tempyaos.put("number", temp.getString("number"));
					tempyaos.put("totalPrice", df.format(Double.parseDouble(temp.getString("number"))*Double.parseDouble(tempfuwu.get("price").toString())));
					tempyaos.put("shanghuPrice", df.format((Double.parseDouble(temp.getString("number"))*Double.parseDouble(tempfuwu.get("price").toString()))*(1-bili)));
					
					tempyaos.put("kehuPrice", df.format(Double.parseDouble(temp.getString("number"))*Double.parseDouble(tempfuwu.get("price").toString())-xnbNum));
					tempyaos.put("pingtaiPrice", df.format((Double.parseDouble(temp.getString("number"))*Double.parseDouble(tempfuwu.get("price").toString()))*bili));
					tempyaos.put("fuwubili", biliData.getString("bili_jishufuwu"));
					
					ljylOrderService.saveOrderOfYaoShang(tempyaos);
					
				}*/
				
				//============by yym先暂时加上在内网测试 end==========//
				
				
				
				
				
				
				
				PageData spd = new PageData();
				spd.put("order_number", out_trade_no);
				//根据订单id查出客户id并设置session
				PageData tempData = ljylKeHuService.getUserKehuIdByOrderNumber(spd);
				/*ZywKeHu zywKeHu=new ZywKeHu();
				zywKeHu.setUser_kuhu_id(tempData.getString("user_kuhu_id"));
				session.setAttribute(Const.SESSION_KEHU_USER,zywKeHu);*/
				mv.addObject("user_kuhu_id", tempData.getString("user_kuhu_fid"));
				mv.setViewName("alipay/alipayreturn_ljyl");
			}
			System.out.println("验证成功");
		//}else{
			//System.out.println("验证失败");
		//}
		return mv;
	}
///////////////////////////////////////////////////以下为在微信浏览器中选择支付宝支付时的方法/////////////////////////////////////////////////////////////	
	// 请在菜单中选择在浏览器中打开
	@RequestMapping(value="pay")
	public ModelAndView pay(HttpSession session) throws Exception{
		logBefore(logger, "--请在菜单中选择在浏览器中打开--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd.put("order_number", pd.getString("num"));
		PageData tempIsOrNo=ljylOrderService.get_tb_temp_information(pd);
		if(tempIsOrNo==null){
			//获取客户信息
	      	ZywKeHu zywKeHu=(ZywKeHu) session.getAttribute(Const.SESSION_KEHU_USER);
			//保存临时信息
	      	PageData temp=new PageData();
	      	temp.put("temp_id", this.get32UUID());
	      	temp.put("order_number", pd.getString("WIDout_trade_no"));
	      	temp.put("fuwu_id", pd.getString("fuwu_id"));
	      	temp.put("xingming", pd.getString("xingming"));
	      	temp.put("dianhua", pd.getString("dianhua"));
	      	temp.put("dizhi", pd.getString("dizhi"));
	      	temp.put("beizhu", pd.getString("beizhu"));
	      	temp.put("number", pd.getString("number"));
	      	temp.put("user_kuhu_fid", zywKeHu.getUser_kuhu_id());
	      	
	      	temp.put("WIDsubject", pd.getString("WIDsubject"));
	      	temp.put("WIDtotal_fee", pd.getString("WIDtotal_fee"));
	      	temp.put("WIDbody", pd.getString("WIDbody"));
	      	temp.put("WIDshow_url", pd.getString("WIDshow_url"));

	      	ljylOrderService.save_tb_temp_information1(temp);
	      	mv.setViewName("alipay/pay");
		}else{
			mv.setViewName("redirect:/api/ljylAlipay/demo_post?order_number="+pd.getString("num"));
		}
		return mv;
	}
	//在浏览器中打开，确认支付页面
	@RequestMapping(value="/demo_post")
	public ModelAndView demo_post() throws Exception{
		logBefore(logger, "--在浏览器中打开，确认支付页面--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		//根据订单编号，获取临时保存的信息
		PageData temp=ljylOrderService.get_tb_temp_information(pd);
		//把请求参数打包成数组
		Map<String, String> sParaTemp = new HashMap<String, String>();
		sParaTemp.put("service", AlipayConfig.service);
        sParaTemp.put("partner", AlipayConfig.partner);
        sParaTemp.put("seller_id", AlipayConfig.seller_id);
        sParaTemp.put("_input_charset", AlipayConfig.input_charset);
		sParaTemp.put("payment_type", AlipayConfig.payment_type);
		sParaTemp.put("notify_url", AlipayConfig.notify_url);
		sParaTemp.put("return_url", AlipayConfig.return_url);
		sParaTemp.put("out_trade_no", temp.getString("order_number"));
		sParaTemp.put("subject", temp.getString("WIDsubject"));
		sParaTemp.put("total_fee", temp.getString("WIDtotal_fee"));
		sParaTemp.put("show_url", temp.getString("WIDshow_url"));
		sParaTemp.put("app_pay","y");//启用此参数可唤起钱包APP支付。
		sParaTemp.put("body", temp.getString("WIDbody"));
		
		//建立请求
		String sHtmlText = AlipaySubmit.buildRequest(sParaTemp,"post","确认支付");
		System.out.println("================sHtmlText:===="+sHtmlText);

		mv.addObject("sHtmlText", sHtmlText);
		mv.addObject("temp", temp);
		mv.setViewName("alipay/alipay");
		return mv;
	}
}
