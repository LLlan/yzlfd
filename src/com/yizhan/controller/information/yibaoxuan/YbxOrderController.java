package com.yizhan.controller.information.yibaoxuan;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.yizhan.controller.base.BaseController;
import com.yizhan.entity.Page;
import com.yizhan.entity.information.ZywKeHu;
import com.yizhan.service.information.yibaoxuan.YbxKeHuService;
import com.yizhan.service.information.yibaoxuan.YbxOrderService;
import com.yizhan.service.information.yibaoxuan.YbxShangHuService;
import com.yizhan.util.AppUtil;
import com.yizhan.util.Const;
import com.yizhan.util.PageData;

@Controller
@RequestMapping(value="/api/ybxorder")
public class YbxOrderController extends BaseController{

	@Resource(name="ybxOrderService")
	private YbxOrderService ybxOrderService;
	@Resource(name="ybxShangHuService")
	private YbxShangHuService ybxShangHuService;
	@Resource(name="ybxKeHuService")
	private YbxKeHuService ybxKeHuService;
	/**
	 * 点击立即下单，进入确认订单页面，选择支付方式进行付款
	 * type:1-找医生，2-找机构，3-找药商
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toRegin_pay")
	public ModelAndView toRegin_pay() throws Exception{
		logBefore(logger, "--点击立即下单，进入确认订单页面，选择支付方式进行付款--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		PageData tempPd=new PageData();
		pd=this.getPageData();
		//根据服务的主键ID获取对象信息
		tempPd=ybxShangHuService.getDataByIdOfService(pd);
		/*if(tempPd.getString("type").equals("3")){
			int number=Integer.parseInt(pd.getString("number"));
			double price = Double.parseDouble(tempPd.get("price").toString());
			pd.put("price", number*price);
			pd.put("num", number*price*0.1);
		}else{
			double price = Double.parseDouble(tempPd.get("price").toString());
			pd.put("price", tempPd.get("price").toString());
			pd.put("num", price*0.1);
			
		}*/
		int number=Integer.parseInt(pd.getString("number"));
		double price = Double.parseDouble(tempPd.get("price").toString());
		pd.put("price", number*price);
		pd.put("num", number*price*0.1);
		mv.addObject("pd", pd);	
		mv.setViewName("yibaoxuan/kehuduan/user/region/regin_pay");
		return mv;
	}
	
	/**
	 * 后台获取医生订单列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getOrderOfYiShenglistPage")
	public ModelAndView getOrderOfYiShenglistPage(Page page) throws Exception{
		logBefore(logger, "-- 后台获取医生订单列表--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		List<PageData> list=ybxOrderService.getOrderOfYiShenglistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("information/shanghuorder/yishengorder_list");
		return mv;
	}
	/**
	 * 后台获取机构订单列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getOrderOfJiGoulistPage")
	public ModelAndView getOrderOfJiGoulistPage(Page page) throws Exception{
		logBefore(logger, "-- 后台获取机构订单列表--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		List<PageData> list=ybxOrderService.getOrderOfJiGoulistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("information/shanghuorder/jigouorder_list");
		return mv;
	}
	/**
	 * 后台获取药商订单列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getOrderOfYaoShanglistPage")
	public ModelAndView getOrderOfYaoShanglistPage(Page page) throws Exception{
		logBefore(logger, "-- 后台获取药商订单列表--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		List<PageData> list=ybxOrderService.getOrderOfYaoShanglistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("yibaoxuan/shanghuorder/yaoshangorder_list");
		return mv;
	}
	/**
	 * 后台获取客户订单列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getOrderOfKeHulistPage")
	public ModelAndView getOrderOfKeHulistPage(Page page) throws Exception{
		logBefore(logger, "-- 后台获取客户订单列表--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		List<PageData> list=ybxOrderService.getOrderOfKeHulistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("information/kehuorder/kehuorder_list");
		return mv;
	}
	/**
	 * 后台获取医生类收益列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getShouYiOfYiShenglistPage")
	public ModelAndView getShouYiOfYiShenglistPage(Page page) throws Exception{
		logBefore(logger, "-- 后台获取医生类收益列表--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		List<PageData> list=ybxOrderService.getShouYiOfYiShenglistPage(page);
		PageData sum=ybxOrderService.getShouYiOfYiShengSum(pd);
		mv.addObject("pd", pd);
		mv.addObject("sum", sum.get("sum"));
		mv.addObject("list", list);
		mv.setViewName("information/pingtaishouyi/yishengshouyi_list");
		return mv;
	}
	/**
	 * 后台获取机构类收益列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getShouYiOfJiGoulistPage")
	public ModelAndView getShouYiOfJiGoulistPage(Page page) throws Exception{
		logBefore(logger, "-- 后台获取机构类收益列表--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		List<PageData> list=ybxOrderService.getShouYiOfJiGoulistPage(page);
		PageData sum=ybxOrderService.getShouYiOfJiGouSum(pd);
		mv.addObject("pd", pd);
		mv.addObject("sum", sum.get("sum"));
		mv.addObject("list", list);
		mv.setViewName("information/pingtaishouyi/jigoushouyi_list");
		return mv;
	}
	/**
	 * 后台获取药商类收益列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getShouYiOfYaoShanglistPage")
	public ModelAndView getShouYiOfYaoShanglistPage(Page page) throws Exception{
		logBefore(logger, "-- 后台获取药商类收益列表--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		List<PageData> list=ybxOrderService.getShouYiOfYaoShanglistPage(page);
		PageData sum=ybxOrderService.getShouYiOfYaoShangSum(pd);
		mv.addObject("pd", pd);
		mv.addObject("sum", sum.get("sum"));
		mv.addObject("list", list);
		mv.setViewName("yibaoxuan/pingtaishouyi/yaoshangshouyi_list");
		return mv;
	}
	
	/**
	 * 获取虚拟币个数
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getXuNiBiNumber")
	@ResponseBody
	public Object getXuNiBiNumber(HttpSession session) throws Exception{
		logBefore(logger, "-- 获取虚拟币个数--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		ZywKeHu zywKeHu=(ZywKeHu) session.getAttribute(Const.SESSION_KEHU_USER);
		pd.put("user_kuhu_id", zywKeHu.getUser_kuhu_id());
		pd=ybxKeHuService.getDetailByID(pd);
		map.put("xunibi", pd.getString("xunibi"));
		return AppUtil.returnObject(pd, map);
	}
	
	
	
	
}
