package com.yizhan.controller.information.lvjuyanglao;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yizhan.controller.base.BaseController;
import com.yizhan.entity.Page;
import com.yizhan.entity.information.ZywKeHu;
import com.yizhan.service.information.lvjuyanglao.LjylKeHuService;
import com.yizhan.service.information.lvjuyanglao.LjylShangHuService;
import com.yizhan.util.AppUtil;
import com.yizhan.util.Const;
import com.yizhan.util.DateUtil;
import com.yizhan.util.FileUpload;
import com.yizhan.util.GetPinyin;
import com.yizhan.util.MD5;
import com.yizhan.util.PageData;
import com.yizhan.util.PathUtil;
import com.yizhan.util.QRCodeUtil;
import com.yizhan.util.SmsUtil;
import com.yizhan.util.Tools;
import com.yizhan.util.TwoDimensionCode;
import com.yizhan.util.miaodiyun.miaodiyunUtil;
/**
 * 找医网客户端控制器
 * @类名称： KeHuController
 *
 */
@Controller
@RequestMapping(value="/api/ljylkehu")
public class LjylKeHuController extends BaseController{

	@Resource(name="ljylKeHuService")
	private LjylKeHuService ljylKeHuService;
	//@Resource(name="shangHuService")
	//private ShangHuService shangHuService;
	@Resource(name="ljylShangHuService")
	private LjylShangHuService ljylShangHuService;

	/**
	 * 中转站页面
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/transfer")
	public ModelAndView transfer() throws Exception {
		logBefore(logger, "---中转站--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("lvjuyanglao/kehuduan/transfer");
		return mv;
	}
	
	
	/**
	 * 评价记录列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/pingjiajilu")
	public ModelAndView pingjiajilu() throws Exception {
		logBefore(logger, "---评价记录列表--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> list = ljylKeHuService.pingjiajiluList(pd);
		mv.addObject("list", list);
		mv.setViewName("lvjuyanglao/kehuduan/user/region/pingjiaRecord");
		return mv;
	}
	
	/*
	 * h5立即咨询页面跳转引导
	 */
	@RequestMapping(value = "/myqq")
	public ModelAndView myqq() throws Exception {
		logBefore(logger, "--h5立即咨询--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("lvjuyanglao/kehuduan/user/region/lijizixun");
		return mv;
	}
	
	@RequestMapping(value = "/shangjiaRegister")
	public ModelAndView shangjiaRegister() throws Exception {
		logBefore(logger, "--客户端注册成为商家--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("lvjuyanglao/kehuduan/user/region/shangjiaRegister");
		return mv;
	}

	/**
	 * 去下载apk页面
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/goDownAPK")
	public ModelAndView goDownAPK(HttpServletRequest request) throws Exception{
		logBefore(logger, "---去下载apk页面---");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		String apks[]=Tools.readTxtFile("admin/config/apkURL.txt").split(",yizhan,");
	    for(int i=0;i<apks.length;i++){
	    	//System.out.println(apks[i]);
	    	pd.put("andriod_kehu", apks[0]);
	    	pd.put("andriod_shanghu",apks[1]);
	    	pd.put("ios_kehu", apks[2]);
	    	pd.put("ios_shanghu", apks[3]);
	    } 
	    mv.addObject("pd", pd);
		mv.setViewName("lvjuyanglao/kehuduan/downAPK");
		return mv;
	}
	
	
	@RequestMapping(value = "/goDownShangjiaAPK")
	public ModelAndView goDownShangjiaAPK(HttpServletRequest request) throws Exception{
		logBefore(logger, "---去下载商家apk页面---");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		String apks[]=Tools.readTxtFile("admin/config/apkURL.txt").split(",yizhan,");
		for(int i=0;i<apks.length;i++){
			pd.put("andriod_kehu", apks[0]);
			pd.put("andriod_shanghu",apks[1]);
		} 
		mv.addObject("pd", pd);
		mv.setViewName("lvjuyanglao/kehuduan/user/region/downShangjiaAPK");
		return mv;
	}
	

	/**
	 * 分享二维码
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/fenxiangEwm")
	public ModelAndView fenxiangEwm(HttpServletRequest request) throws Exception {
		logBefore(logger, "---分享二维码--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		PageData pds = new PageData();
		pd = this.getPageData();
		if(Tools.notEmpty(pd.getString("amp;type"))){
			pd.put("type", pd.getString("amp;type"));
		}
		
		if(pd.getString("type").equals("1")){
			pd =  ljylKeHuService.fenxiangEwm(pd);
			pds.put("ewmImg", BaseController.getPath(request)+pd.get("erweima_img"));
		}else{
			pd =  ljylKeHuService.fenxiangEwms(pd);
			pds.put("ewmImg", BaseController.getPath(request)+pd.get("erWeiMaImg"));
		}
		
		mv.addObject("pds", pds);
		mv.setViewName("lvjuyanglao/kehuduan/user/fenxiangEwmImg");
		return mv;
	}
	
	
	
	
	/**
	 * 进入个人中心-现金金额-申请提现页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toTixian")
	public ModelAndView toTixian() throws Exception{
		logBefore(logger, "--进入个人中心-现金金额-申请提现页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd = this.getPageData();
			//pd.put("user_kehu_id", getSessionUser().getUser_kuhu_id());
			//pd=shangHuService.getDataById(pd);
			mv.addObject("xianjinAmount", pd.get("money"));
			mv.setViewName("lvjuyanglao/kehuduan/apply_cash");
		}else{
			mv.setViewName("redirect:/api/ljylkehu/toLogin");
		}
		return mv;
	}
	
	
	/**
	 * 进入个人中心-现金金额-申请提现页面-点击确认提现
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/submitXianJinAmountApply")
	public ModelAndView submitXianJinAmountApply() throws Exception{
		logBefore(logger, "--进入个人中心-现金金额-申请提现页面-点击确认提现--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd=this.getPageData();
			//获取商户信息
			PageData kehuPd=new PageData();
			kehuPd.put("user_kehu_id", getSessionUser().getUser_kuhu_id());
			kehuPd=ljylKeHuService.getMoneyBykehuID(kehuPd);
			
			pd.put("user_fid", getSessionUser().getUser_kuhu_id());
			pd.put("withdraw_cash_id", this.get32UUID());
			pd.put("serial_number", getserial_number());
			pd.put("shenqing_time", DateUtil.getTime());
			pd.put("state", "2");
			pd.put("type", "1");
			float balance_amount=(float) (Double.parseDouble(kehuPd.get("money").toString())-Double.parseDouble(pd.get("amount").toString()));
			pd.put("balance_amount", balance_amount);
			
			//保存提现申请记录
			ljylShangHuService.saveWithDrawCash(pd);
			
			//更新现金金额
			kehuPd.put("money", balance_amount);
			kehuPd.put("user_kehu_id", getSessionUser().getUser_kuhu_id());
			ljylKeHuService.updateMoneyBykehuID(kehuPd);
			mv.setViewName("redirect:/api/ljylkehu/myMoney");
		}else{
			mv.setViewName("redirect:/api/ljylkehu/toLogin");
		}
		return mv;
	}
	
	/**
	 * 进入个人中心-现金金额-提现申请记录页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toXianJinAmountApplyRecord")
	public ModelAndView toXianJinAmountApplyRecord() throws Exception{
		logBefore(logger, "--进入客户端个人中心-现金金额-申请记录页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd=this.getPageData();
			pd.put("user_fid", getSessionUser().getUser_kuhu_id());
			//获取提现申请记录
			List<PageData> list=ljylShangHuService.getWithDrawCashList(pd);
			mv.addObject("list", list);
			mv.setViewName("lvjuyanglao/cash_amount/applyRecord");
			mv.setViewName("lvjuyanglao/shanghuduan/cash_amount/applyRecord");
		}else{
			mv.setViewName("redirect:/api/ljylkehu/toLogin");
		}
		return mv;
	}
	
	
	/**
	 * 进入个人中心-现金金额-申请记录-账单详情页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toXianJinAmountApplyRecordDetail")
	public ModelAndView toXianJinAmountApplyRecordDetail() throws Exception{
		logBefore(logger, "--进入个人中心-现金金额-申请记录-账单详情页面--");
		ModelAndView mv=new ModelAndView();
			PageData pd=new PageData();
			pd=this.getPageData();
			pd=ljylShangHuService.getWithDrawCashById(pd);
			mv.addObject("pd", pd);
			mv.setViewName("lvjuyanglao/cash_amount/mingxi");
			return mv;
	}
	
	
	
	/**
	 * ajax根据地区查询医生列表
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getDoctorListByAddress")
	@ResponseBody
	public Object getDoctorListByAddress() throws Exception{
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		Map map = new HashMap();
		pd = this.getPageData();
		map.put("kehu_userId", getSessionUser().getUser_kuhu_id());
		map.put("kehu_userName", getSessionUser().getUserName());
		//List<PageData> doctorList =  ljylKeHuService.getDoctorListByAddress(pd);
		List<PageData> doctorList =  ljylKeHuService.getyishengList(pd);
		map.put("doctorList", doctorList);
		return AppUtil.returnObject(pd, map);
		
	}
	
	
	/**
	 * 访问登录页
	 * @return
	 */
	@RequestMapping(value="/login_toLogin")
	public ModelAndView login_toLogin()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME_LJYL)); //读取系统名称
		mv.setViewName("system/admin/login2");
		mv.addObject("flag","2");
		mv.addObject("pd",pd);
		return mv;
	}
	
	@RequestMapping(value="/getDiseaseListByZimu")
	@ResponseBody
	public Object getDiseaseByZimu() throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		Map map = new HashMap();
		System.out.println("---------"+pd.get("zimu"));
		List<PageData> diseaseList = ljylKeHuService.getDiseaseListByZimu(pd);
		map.put("diseaseList", diseaseList);
		map.put("respCode", "01");
		return AppUtil.returnObject(pd, map);
	}
	
	
	/**
	 * 疑难杂症h5根据字母查数据
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-19
	 */
	@RequestMapping(value="/getYnzzListByZimu")
	@ResponseBody
	public Object getYnzzListByZimu() throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		Map map = new HashMap();
		System.out.println("---------"+pd.get("zimu"));
		List<PageData> diseaseList = ljylKeHuService.getYnzzListByZimu(pd);
		map.put("diseaseList", diseaseList);
		map.put("respCode", "01");
		return AppUtil.returnObject(pd, map);
	}
	
	
	/**
	 *  发弹幕 发消息
	 * @return
	 */
	@RequestMapping(value="/sendBarrage")
	public ModelAndView barrage(){
		logBefore(logger, "--测试聊天--");
		ModelAndView mv=new ModelAndView();
		mv.setViewName("lvjuyanglao/kehuduan/barrage/sendMessage");
		return mv;
	}
	
	
	
	/**
	 *  找医网客户端 进入首页 -去首页
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/index")
	public ModelAndView index(Page page) throws Exception{
		logBefore(logger, "--找医网客户端进入首页--");
		ModelAndView mv=new ModelAndView();
		PageData pd  = new PageData();
		Page page2 = new Page();
		PageData pd2  = new PageData();
		pd = this.getPageData();
		
		//设置新闻参数
		pd.put("category", "1");
		pd.put("tp", "2");
		page.setPd(pd);
		//设置公告参数
		pd2.put("category", "2");
		pd2.put("tp", "2");
		page2.setPd(pd2);
		if(isSession()){
			//用于登录成功提示
			mv.addObject("tag", pd.get("tag"));
			mv.addObject("respCode", "01");
			mv.addObject("msg", "session有效");
			
			pd.put("kehu_userId", getSessionUser().getUser_kuhu_id());
			pd.put("kehu_userName", getSessionUser().getUserName());
			mv.addObject("pd", pd);
		}else{
			mv.addObject("respCode", "00");
			mv.addObject("msg", "session失效");
		}
		
		
		//轮播图列表
		pd.put("tidImg", "1");
		List<PageData> bannerList = ljylKeHuService.getBannerImagesList(pd);
		mv.addObject("bannerList", bannerList);
		//医生列表
		pd.put("type", 4);
		List<PageData> yishengList = ljylKeHuService.getyishengList(pd);
		Collections.shuffle(yishengList);
		mv.addObject("yishengList", yishengList);
		
		//疾病列表
		List<PageData> jibinglist = ljylShangHuService.getjibinglistPage(page);
		mv.addObject("jibinglist", jibinglist);
		
		//新闻列表
		List<PageData> xinwenlist=ljylShangHuService.getnewsandnoticelistPage(page);
		mv.addObject("xinwenlist", xinwenlist);
		
		//公告列表
		List<PageData> gonggaolist=ljylShangHuService.getnewsandnoticelistPage(page2);
		mv.addObject("gonggaolist", gonggaolist);
		
		//名著列表
		List<PageData> mingzhulist=ljylShangHuService.getMingzhuList(page2);
		mv.addObject("mingzhulist", mingzhulist);
		
		//药商列表
		pd.put("type", 6);
		List<PageData> yaoshangList = ljylKeHuService.getyishengList(pd);
		Collections.shuffle(yaoshangList);
		mv.addObject("yaoshangList", yaoshangList);
		//机构列表
		pd.put("type", 5);
		List<PageData> jigouList = ljylKeHuService.getyishengList(pd);
		Collections.shuffle(jigouList);
		mv.addObject("jigouList", jigouList);
		mv.addObject("twoDimensioncode_id", pd.get("twoDimensioncode_id"));
		mv.setViewName("lvjuyanglao/kehuduan/index");
		return mv;
	}
	
	
	
	/**
	 * 首页-查看常见疾病详情
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/showChangjianjibingDetailByID")
	public ModelAndView showChangjianjibingDetailByID() throws Exception{
		logBefore(logger, "--常见疾病详情--");
		ModelAndView mv=new ModelAndView();
		PageData pd  = new PageData();
		pd = this.getPageData();
		PageData cjjbData = ljylKeHuService.showChangjianjibingDetailByID(pd);
		mv.addObject("cjjbData", cjjbData);
		mv.setViewName("lvjuyanglao/kehuduan/news/changjianjibingDetail");
		return mv;
	}
	
	
	/**
	 * 首页-查看疑难杂症详情
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/showYnzzDetailByID")
	public ModelAndView showYnzzDetailByID() throws Exception{
		logBefore(logger, "--疑难杂症详情页--");
		ModelAndView mv=new ModelAndView();
		PageData pd  = new PageData();
		pd = this.getPageData();
		PageData cjjbData = ljylKeHuService.showYnzzDetailByID(pd);
		mv.addObject("cjjbData", cjjbData);
		mv.setViewName("lvjuyanglao/kehuduan/news/ynzzDetail");
		return mv;
	}
	
	
	/**
	 * 首页-查看新闻详情
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getXinwenDetail")
	public ModelAndView getXinwenDetail() throws Exception{
		logBefore(logger, "--查看新闻或公告详情--");
		ModelAndView mv=new ModelAndView();
		PageData pd  = new PageData();
		pd = this.getPageData();
		PageData xgData  = ljylKeHuService.getXinwenDetail(pd);
		mv.addObject("xgData",xgData);
		mv.setViewName("lvjuyanglao/kehuduan/news/artical");
		return mv;
	}
	
	
	
	
	
	/**
	 * 首页-查看医生详情
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getYishengDetail")
	public ModelAndView getYishengDetail(HttpSession session) throws Exception{
		logBefore(logger, "--查看医生详情--");
		ModelAndView mv=new ModelAndView();
		PageData pd  = new PageData();
		pd = this.getPageData();
		if(isSession()){
			//用于登录成功提示
			mv.addObject("respCode", "01");
			mv.addObject("msg", "session有效");
			//医生详情列表
			PageData xqData  = ljylKeHuService.getYishengDetail(pd);
			mv.addObject("xqData",xqData);
			
			//服务列表
			List<PageData> fuwuList = ljylKeHuService.getyishengFuwuList(pd);
			mv.addObject("fuwuList",fuwuList);
			
			//案例列表
			//List<PageData> anliList = ljylKeHuService.getyishengAnliList(pd);
			//mv.addObject("anliList",anliList);
			ZywKeHu zywKeHu = (ZywKeHu)session.getAttribute(Const.SESSION_KEHU_USER);
			mv.addObject("kehu_userId", zywKeHu.getUser_kuhu_id());
			mv.addObject("kehu_userName", zywKeHu.getUserName());
		}else{
			mv.addObject("respCode", "00");
			mv.addObject("msg", "session失效");
		}
		mv.addObject("pd", pd);
		mv.addObject("name", new String(pd.getString("name").getBytes("iso-8859-1"),"utf-8"));
		mv.setViewName("lvjuyanglao/kehuduan/user/region/regin_info");
		return mv;
	}
	
	/**
	 * 首页-查看医生案例详情
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getyishengAnliDetail")
	public ModelAndView getyishengAnliDetail() throws Exception{
		logBefore(logger, "--查看医生案例详情--");
		ModelAndView mv=new ModelAndView();
		PageData pd  = new PageData();
		pd = this.getPageData();
		PageData anliData  = ljylKeHuService.getYishengAnliDetail(pd);
		mv.addObject("anliData",anliData);
		mv.setViewName("lvjuyanglao/kehuduan/user/region/case_detail");
		return mv;
	}
	
	
	/**
	 * 底栏-发布需求-需求大厅页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/fabuxuqiuList")
	public ModelAndView fabuxuqiuList() throws Exception{
		logBefore(logger, "--需求大厅--");
		ModelAndView mv=new ModelAndView();
		PageData pd  = new PageData();
		pd = this.getPageData();
		if(isSession()){
			//用于登录成功提示
			mv.addObject("tag", pd.get("tag"));
			mv.addObject("respCode", "01");
			mv.addObject("msg", "session有效");
			Subject currentUser = SecurityUtils.getSubject();  
			Session session = currentUser.getSession();
			ZywKeHu zywKeHu=(ZywKeHu) session.getAttribute(Const.SESSION_KEHU_USER);
			
			pd.put("user_kuhu_fid", zywKeHu.getUser_kuhu_id());
			List<PageData> xuqiuList  = ljylKeHuService.selectXuqiuList(pd);
			List reslutList = new ArrayList<PageData>();
		String imgs[] = new String[0];
		for(int i =0;i<xuqiuList.size();i++){
			List<PageData> imgList = new ArrayList<PageData>();
			PageData pd2  = new PageData();
			pd2.put("xuqiu_id", xuqiuList.get(i).get("xuqiu_id"));
			pd2.put("sex", xuqiuList.get(i).get("sex"));
			pd2.put("age", xuqiuList.get(i).get("age"));
			pd2.put("patient_name", xuqiuList.get(i).get("patient_name"));
			pd2.put("disease", xuqiuList.get(i).get("disease"));
			pd2.put("phone", xuqiuList.get(i).get("phone"));
			pd2.put("fabu_time", xuqiuList.get(i).get("fabu_time"));
			pd2.put("symptom", xuqiuList.get(i).get("symptom"));
			pd2.put("address", xuqiuList.get(i).get("address"));
			if(Tools.notEmpty(xuqiuList.get(i).get("img_url").toString())){
				 imgs = xuqiuList.get(i).get("img_url").toString().split(",");
			}else{
				imgs=new String[0];
			}
			 for(int j=0;j<imgs.length;j++){
				 PageData pd21  = new PageData();
				 if(imgs[j].equals("")){
					 pd21.put("img_url", "");
				 }else{
					 pd21.put("img_url", imgs[j]);
				 }
				 imgList.add(pd21);
			}
			pd2.put("imgList", imgList);
		
			reslutList.add(pd2);
		}
			mv.addObject("reslutList", reslutList);
		}else{
			mv.addObject("respCode", "00");
			mv.addObject("msg", "session失效");
		}
		mv.setViewName("lvjuyanglao/kehuduan/release/releaseZone");
		return mv;
	}
	
	
	/*
	@RequestMapping(value="/yishengList")
	public ModelAndView yishengList() throws Exception{
		logBefore(logger, "--医生列表--");
		ModelAndView mv=new ModelAndView();
		PageData pd  = new PageData();
		pd = this.getPageData();
		List<PageData> yishengList =  ljylKeHuService.getyishengList(pd);
		mv.addObject("yishengList", yishengList);
		mv.setViewName("lvjuyanglao/kehuduan/user/region/regin_home1.jsp");
		return mv;
	}
	
	*/
	
	
	
	
	/**
	 * 底栏-发布需求--去发布需求页面
	 * @return
	 */
	@RequestMapping(value="/fabuxuqiu")
	public ModelAndView fabuxuqiu(){
		logBefore(logger, "--发布需求--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			//用于登录成功提示
			mv.addObject("respCode", "01");
			mv.addObject("msg", "session有效");
			mv.addObject("actionMsg", "saveXuqiu");
		}else{
			mv.addObject("respCode", "00");
			mv.addObject("msg", "session失效");
		}
		mv.setViewName("lvjuyanglao/kehuduan/release/releaseNeeds");
		return mv;
	}
	
	
	/**
	 * 编辑需求
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/tofabuxuqiu")
	public ModelAndView tofabuxuqiu() throws Exception{
		logBefore(logger, "--发布需求--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		if(isSession()){
			//用于登录成功提示
			mv.addObject("respCode", "01");
			mv.addObject("msg", "session有效");
			pd=ljylKeHuService.getDataOfXuQiuById(pd);
			pd.put("sheng", pd.getString("address").split(" ")[0]);
			pd.put("shi", pd.getString("address").split(" ")[1]);
			mv.addObject("pd", pd);
			mv.addObject("actionMsg", "updateXuqiu");
			//获取需求图片
			PageData pd1=new PageData();
			pd1.put("xuqiu_fid", pd.getString("xuqiu_id"));
			List<PageData> imgList=ljylKeHuService.getImgsByXuqiuID(pd1);
			mv.addObject("imgList", imgList);
		}else{
			mv.addObject("respCode", "00");
			mv.addObject("msg", "session失效");
		}
		mv.setViewName("lvjuyanglao/kehuduan/release/releaseNeeds");
		return mv;
	}
	@RequestMapping(value="/deleteXuQiuImgById")
	@ResponseBody
	public Object deleteXuQiuImgById() throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		ljylKeHuService.deleteXuQiuImgById(pd);
		return AppUtil.returnObject(pd, map);
	}
 	@RequestMapping(value="/updateXuqiu")
	public ModelAndView updateXuqiu(
			@RequestParam(required=false) MultipartFile[] imgFile,
			@RequestParam(required=false) String symptom,
			@RequestParam(required=false) String xuqiu_id,
			@RequestParam(required=false) String patient_name,
			@RequestParam(required=false) String disease,
			@RequestParam(required=false) String phone,
			@RequestParam(required=false) String sex,
			@RequestParam(required=false) String age,
			@RequestParam(required=false) String address,
			@RequestParam(required=false) String type
			) throws Exception{
		logBefore(logger, "--保存需求--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//获取session中的用户信息
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		ZywKeHu zywKeHu=(ZywKeHu) session.getAttribute(Const.SESSION_KEHU_USER);
		
		String xuqiuFilePath = "xuqiu/";
		String ffile = DateUtil.getDays()+"/", fileName = "";
		//System.out.println("--------第一个对象-------"+imgFile[0]);
		//System.out.println("--------长度-------"+imgFile.length);
		if(imgFile.length>0 && imgFile[0].getSize()!=0){
			//删除图片
			//pd.put("xuqiu_fid", xuqiu_id);
			//ljylKeHuService.deleteXuQiuImg(pd);
			System.out.println("-------图片对象----"+imgFile[0].getContentType());
				for(int i=0;i<imgFile.length;i++){
					String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + xuqiuFilePath + ffile;		//文件上传路径
					fileName = FileUpload.fileUp(imgFile[i], filePath, this.get32UUID());	
					System.out.println("================进来了========");
					//添加到数据库
					pd.put("xuqiu_img_id", this.get32UUID());
					pd.put("xuqiu_fid", xuqiu_id);
					pd.put("img_url", Const.FILEPATHIMG + xuqiuFilePath  + ffile + fileName);
					ljylKeHuService.saveXuqiuImgs(pd);
				}
			
		}
		pd.put("xuqiu_id", xuqiu_id);
		pd.put("symptom", symptom);
		pd.put("patient_name", patient_name);
		pd.put("disease", disease);
		pd.put("phone", phone);
		pd.put("sex", sex);
		pd.put("age", age);
		pd.put("address", address);
		pd.put("type", type);
		pd.put("fabu_time", DateUtil.getTime());
		ljylKeHuService.updateXuqiu(pd);
		
		mv.setViewName("redirect:/api/ljylkehu/fabuxuqiuList");
		return mv;
	}
	
	@RequestMapping(value="/deleteXuQiu")
	public ModelAndView deleteXuQiu() throws Exception{
		
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		ljylKeHuService.deleteXuQiu(pd);
		mv.setViewName("redirect:/api/ljylkehu/fabuxuqiuList");		
		return mv;
	}
	
	/**
	 * 发布需求-保存需求
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/saveXuqiu")
	public ModelAndView saveXuqiu(
			@RequestParam(required=false) MultipartFile[] imgFile,
			@RequestParam(required=false) String symptom,
			@RequestParam(required=false) String patient_name,
			@RequestParam(required=false) String disease,
			@RequestParam(required=false) String phone,
			@RequestParam(required=false) String sex,
			@RequestParam(required=false) String age,
			@RequestParam(required=false) String address,
			@RequestParam(required=false) String type
			) throws Exception{
		logBefore(logger, "--保存需求--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//获取session中的用户信息
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		ZywKeHu zywKeHu=(ZywKeHu) session.getAttribute(Const.SESSION_KEHU_USER);
		
		String xuqiu_id = this.get32UUID();
		String xuqiuFilePath = "xuqiu/";
		String ffile = DateUtil.getDays()+"/", fileName = "";
		System.out.println("--------第一个对象-------"+imgFile[0]);
		System.out.println("--------长度-------"+imgFile.length);
		if(imgFile.length>0 && imgFile[0].getSize()!=0){
			System.out.println("-------图片对象----"+imgFile[0].getContentType());
				for(int i=0;i<imgFile.length;i++){
					if(imgFile[i]!=null && !imgFile[i].isEmpty()){
						String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + xuqiuFilePath + ffile;		//文件上传路径
						fileName = FileUpload.fileUp(imgFile[i], filePath, this.get32UUID());	
						System.out.println("================进来了========");
						//添加到数据库
						pd.put("xuqiu_img_id", this.get32UUID());
						pd.put("xuqiu_fid", xuqiu_id);
						pd.put("img_url", Const.FILEPATHIMG + xuqiuFilePath  + ffile+"/" + fileName);
						ljylKeHuService.saveXuqiuImgs(pd);
					}
				}
		}else{
			System.out.println("=======图片文件为空======");
		}
		pd.put("xuqiu_id", xuqiu_id);
		pd.put("symptom", symptom);
		pd.put("patient_name", patient_name);
		pd.put("disease", disease);
		pd.put("phone", phone);
		pd.put("sex", sex);
		pd.put("age", age);
		pd.put("address", address);
		pd.put("type", type);
		pd.put("user_kuhu_fid", zywKeHu.getUser_kuhu_id());
		pd.put("fabu_time", DateUtil.getTime());
		ljylKeHuService.saveXuqiu(pd);
		
		mv.setViewName("redirect:/api/ljylkehu/fabuxuqiuList");
		return mv;
	}
	
	
	
	/**
	 * 首页-疑难杂症
	 * @return
	 */
	@RequestMapping(value="/yinanzazheng")
	public ModelAndView yinanzazheng(){
		logBefore(logger, "--疑难杂症列表--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			//用于登录成功提示
			mv.addObject("respCode", "01");
			mv.addObject("msg", "session有效");
		}else{
			mv.addObject("respCode", "00");
			mv.addObject("msg", "session失效");
		}
		mv.setViewName("lvjuyanglao/kehuduan/disease/yinanzazheng");
		return mv;
	}
	/**
	 * 底栏-常见疾病
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/changjianjibing")
	public ModelAndView changjianjibing() throws Exception{
		logBefore(logger, "--常见疾病--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		if(isSession()){
			//用于登录成功提示
			mv.addObject("respCode", "01");
			mv.addObject("msg", "session有效");
		}else{
			mv.addObject("respCode", "00");
			mv.addObject("msg", "session失效");
		}
		List<PageData> diseaseList = ljylKeHuService.getDiseaseListByZimu(pd);
		mv.addObject("diseaseList", diseaseList);
		mv.setViewName("lvjuyanglao/kehuduan/disease/changjianDisease");
		return mv;
	}
	
	
	
	/**
	 * 底栏-联系我们
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/connectUs")
	public ModelAndView connectUs() throws Exception{
		logBefore(logger, "--联系我们--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//用于登录成功提示
		mv.addObject("respCode", "01");
		mv.addObject("msg", "session有效");
		pd=ljylShangHuService.getDataOfContactUs(pd);
		mv.addObject("pd", pd);
		mv.setViewName("lvjuyanglao/kehuduan/contact/connect");
		return mv;
	}
	
	
	/**
	 * 底栏-会员中心
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/huiyuanzhongxin")
	public ModelAndView huiyuanzhongxin() throws Exception{
		logBefore(logger, "--会员中心--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		PageData pd2 = new PageData();
		pd= this.getPageData();
		System.out.println("-----------------------------------"+pd.getString("order_state"));
		
		
		if(isSession()){
			//用于登录成功提示
			mv.addObject("respCode", "01");
			mv.addObject("msg", "session有效");
			Subject currentUser = SecurityUtils.getSubject();  
			Session session = currentUser.getSession();
			ZywKeHu zywKeHu =(ZywKeHu)session.getAttribute(Const.SESSION_KEHU_USER);
			pd.put("user_kuhu_id", zywKeHu.getUser_kuhu_id());
			pd2.put("order_state", pd.getString("order_state"));
			pd2.put("user_kuhu_fid", zywKeHu.getUser_kuhu_id());
			pd = ljylKeHuService.getDetailByID(pd);
			mv.addObject("pd", pd);
			
			if(Tools.isEmpty(pd2.getString("order_state"))){
				pd2.put("order_state", "2");
			}else{
				pd2.put("order_state", pd2.getString("order_state"));
			}
			
			//查用户订单
			//List<PageData> yishengOrderList =  ljylKeHuService.getYishengOrderList(pd2);
			List<PageData> yaoshangOrderList =  ljylKeHuService.getYaoshangOrderList(pd2);
			//List<PageData> jigouOrderList =  ljylKeHuService.getjigouOrderList(pd2);
			//mv.addObject("yishengOrderList", yishengOrderList);
			mv.addObject("yaoshangOrderList", yaoshangOrderList);
			//mv.addObject("jigouOrderList", jigouOrderList);
			mv.addObject("order_state", pd2.get("order_state"));
			mv.addObject("user_kehu_id", zywKeHu.getUser_kuhu_id());
			
			
			/*pd.put("user_kuhu_fid", zywKeHu.getUser_kuhu_id());
			List<PageData> taskList =  ljylKeHuService.getTimingTaskList(pd);
			for(int i=0;i<taskList.size();i++){
				String str1 = taskList.get(i).getString("create_order_time");
				String str2 = DateUtil.getTime();
				long day =  DateTimeUtil.getDistanceDays(str1, str2);
				if(day>=7){
					System.out.println("==========进来了========");
					mv.setViewName("redirect:/api/zywkehu/yijiuzhen.do?tt=2&shanghu_price="+taskList.get(i).get("shanghu_price")+"&price="+taskList.get(i).get("price")+"&user_kehu_id="+taskList.get(i).get("user_kuhu_fid")+"&user_shanghu_id="+taskList.get(i).get("user_shanghu_fid")+"&type="+taskList.get(i).get("type"));                             
				}else{
					System.out.println("==========进来了2222========");
					
				}
			}*/
		}else{
			mv.addObject("respCode", "00");
			mv.addObject("msg", "session失效");
			
		}
		mv.setViewName("lvjuyanglao/kehuduan/user/waitDo");
		return mv;
	}
	
	/**
	 * 底栏-会员中心-我的金额
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/myMoney")
	public ModelAndView myMoney() throws Exception{
		logBefore(logger, "--我的金额--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		ZywKeHu zywKeHu =(ZywKeHu)session.getAttribute(Const.SESSION_KEHU_USER);
		pd.put("user_kuhu_id", zywKeHu.getUser_kuhu_id());
		pd = ljylKeHuService.getDetailByID(pd);
		mv.addObject("pd", pd);
		mv.setViewName("lvjuyanglao/kehuduan/cash_home");
		return mv;
	}
	
	/**
	 * 会员中心-我的金额-查询分销提成所得金额记录
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/fenxiaoMoney")
	public ModelAndView fenxiaoMoney() throws Exception{
		logBefore(logger, "--查询分销提成所得金额记录--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		ZywKeHu zywKeHu =(ZywKeHu)session.getAttribute(Const.SESSION_KEHU_USER);
		pd.put("user_fid", zywKeHu.getUser_kuhu_id());
		pd.put("type", "1");
		List<PageData> fenxiaoMoneyList =  ljylKeHuService.selectFenxiaoMoenyList(pd);
		mv.addObject("fenxiaoMoneyList", fenxiaoMoneyList);
		mv.setViewName("lvjuyanglao/kehuduan/fenxiaoMoenyRecord");
		return mv;
	}
	
	/**
	 * 底栏-会员中心-个人资料
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/gerenziliao")
	public ModelAndView gerenziliao() throws Exception{
		logBefore(logger, "--个人资料--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		ZywKeHu zywKeHu =(ZywKeHu)session.getAttribute(Const.SESSION_KEHU_USER);
		pd.put("user_kuhu_id", zywKeHu.getUser_kuhu_id());
		pd = ljylKeHuService.getDetailByID(pd);
		mv.addObject("pd", pd);
		mv.setViewName("lvjuyanglao/kehuduan/user/gerenZiliao");
		return mv;
	}
	
	
	/**
	 * 底栏-首页-新闻-更多
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/xinwenList")
	public ModelAndView xinwenList() throws Exception{
		logBefore(logger, "--新闻-更多--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		System.out.println("----------------"+pd.getString("category"));
		//公告列表
		List<PageData> gonggaolist=ljylKeHuService.getnewsandnoticeList(pd);
		mv.addObject("gonggaolist", gonggaolist);
		mv.setViewName("lvjuyanglao/kehuduan/news/news");
		return mv;
	}
	
	/**
	 * 底栏-首页-公告-更多
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/gonggaoList")
	public ModelAndView gonggaoList() throws Exception{
		logBefore(logger, "--公告-更多--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		System.out.println("----------------"+pd.getString("category"));
		//公告列表
		List<PageData> gonggaolist=ljylKeHuService.getnewsandnoticeList(pd);
		mv.addObject("gonggaolist", gonggaolist);
		mv.setViewName("lvjuyanglao/kehuduan/gonggao/gonggao");
		return mv;
	}
	
	/**
	 * 根据父类id找子类 --找医生-科类
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-17
	 */
	@RequestMapping(value="/getkeleiListByParentID")
	@ResponseBody
	public Object getkeleiListByParentID() throws Exception{
		PageData pd = new PageData();
		Map map = new HashMap();
		pd = this.getPageData();
		//存在session
		List<PageData> keleiList =  ljylKeHuService.getkeleiListByParentID(pd);
		map.put("respCode", "01");
		map.put("keleiList", keleiList);
		return AppUtil.returnObject(pd, map);
	}
	
	
	
	/**
	 *  进入找机构页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/gojigou")
	public ModelAndView gojigou(Page page) throws Exception{
		logBefore(logger, "--进入找机构页面--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(isSession()){
			//用于登录成功提示
			mv.addObject("respCode", "01");
			mv.addObject("msg", "session有效");
		}else{
			mv.addObject("respCode", "00");
			mv.addObject("msg", "session失效");
		}
		List<PageData> jigouList = ljylKeHuService.getjigouList(pd);
		List<PageData> listType = ljylKeHuService.getjigouTypeList(page);
		mv.addObject("jigouList", jigouList);
		mv.addObject("listType", listType);
		mv.addObject("pd", pd);
		mv.setViewName("lvjuyanglao/kehuduan/user/region/regin_home_jigou");
		return mv;
	}
	
	
	/**
	 *  进入找药商页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goYaoshang")
	public ModelAndView goYaoshang() throws Exception{
		logBefore(logger, "--进入找药商页面--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(isSession()){
			//用于登录成功提示
			mv.addObject("respCode", "01");
			mv.addObject("msg", "session有效");
		}else{
			mv.addObject("respCode", "00");
			mv.addObject("msg", "session失效");
		}
		List<PageData> yaoshangList = ljylKeHuService.getYaoshangList(pd);
		mv.addObject("yaoshangList", yaoshangList);
		mv.addObject("pd", pd);
		mv.setViewName("lvjuyanglao/kehuduan/user/region/regin_home_yaoshang");
		return mv;
	}
	
	
	
	/**
	 *  进入找医生页面 按地区找医生
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goDoctor")
	public ModelAndView goDoctor() throws Exception{
		logBefore(logger, "--进入找医生页面  按地区找医生--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(isSession()){
			//用于登录成功提示
			mv.addObject("tag", pd.get("tag"));
			mv.addObject("respCode", "01");
			mv.addObject("msg", "session有效");
			mv.addObject("kehu_userId", getSessionUser().getUser_kuhu_id());
			mv.addObject("kehu_userName", getSessionUser().getUserName());
		}else{
			mv.addObject("respCode", "00");
			mv.addObject("msg", "session失效");
		}
		if(Tools.notEmpty(pd.getString("ttag"))){
			pd.put("ttag", pd.getString("ttag"));
		}
		//List<PageData> ParentkeleiList = ljylKeHuService.getkeleiList(pd);
		List<PageData> yishengList = ljylKeHuService.getyishengList(pd);
		//mv.addObject("ParentkeleiList", ParentkeleiList);
		mv.addObject("yishengList", yishengList);
		mv.addObject("pd", pd);
	
		mv.setViewName("lvjuyanglao/kehuduan/user/region/regin_home1");
		return mv;
	}
	
	/**
	 *  按问题找医生
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goDoctor2")
	public ModelAndView goDoctor2() throws Exception{
		logBefore(logger, "--进入找医生页面--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> yishengList = ljylKeHuService.getyishengList(pd);
		mv.addObject("yishengList", yishengList);
		mv.setViewName("lvjuyanglao/kehuduan/user/region/regin_home1");
		return mv;
	}
	
	
	/**
	 *  进入医生详情资料页面
	 * @return
	 */
	@RequestMapping(value="/getDetailByDoctorID")
	public ModelAndView getDetailByDoctorID(){
		logBefore(logger, "--进入医生详情资料页面--");
		ModelAndView mv=new ModelAndView();
		mv.setViewName("lvjuyanglao/kehuduan/user/region/regin_info");
		return mv;
	}

	/**
	 *  保存个人资料信息
	 * @return
	 * @throws Exception 
	 *  	方式一：使用ModelAndView
        	return new ModelAndView("redirect:/");
        	这样可以重定向到toList这个方法
        	方式二：返回String
            return "redirect:/ toList "; 
	 */
	@RequestMapping(value="/saveGerenziliao")
	@ResponseBody
	public Object saveGerenziliao() throws Exception{
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		Map map = new HashMap();
		pd = this.getPageData();
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		ZywKeHu zywKeHu =(ZywKeHu)session.getAttribute(Const.SESSION_KEHU_USER);
		
		pd.put("user_kuhu_id", zywKeHu.getUser_kuhu_id());
		ljylKeHuService.updateGerenInfo(pd);
		map.put("respCode", "01");
		return AppUtil.returnObject(pd, map);
		
	}
	
	
	/**
	 *  忘记密码
	 * @return
	 */
	@RequestMapping(value="/wangjimima")
	public ModelAndView wangjimima(){
		logBefore(logger, "--忘记密码--");
		ModelAndView mv=new ModelAndView();
		mv.setViewName("lvjuyanglao/kehuduan/registerVIP/searchPass");
		return mv;
	}
	
	
	/**
	 *  输入验证码通过后-输入新密码页面
	 * @return
	 */
	@RequestMapping(value="/xinmima")
	public ModelAndView xinmima(){
		logBefore(logger, "-新密码页面--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd =this.getPageData();
		mv.addObject("pd", pd);
		mv.setViewName("lvjuyanglao/kehuduan/registerVIP/newPass");
		return mv;
	}
	
	/**
	 * 执行修改密码
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/updatePassword")
	@ResponseBody
	public Object updatePassword(HttpServletRequest request) throws Exception{
		logBefore(logger, "--执行修改密码--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		String newPassword = pd.getString("newPassword");
		String md5Password = MD5.md5(newPassword);
		String phone = pd.getString("phone");
		pd.put("loginPassword", md5Password);
		pd.put("phone", phone);
		ljylKeHuService.updatePassword(pd);
		map.put("respCode", "01");
		return AppUtil.returnObject(pd, map);
	}
	
	
	
	/**
	 *  找医网客户端进入注册页面
	 * @return
	 */
	@RequestMapping(value="/toRegister")
	public ModelAndView toRegister(){
		logBefore(logger, "--从官网进入注册页面--");
		ModelAndView mv=new ModelAndView();
		mv.setViewName("lvjuyanglao/kehuduan/registerVIP/register");
		return mv;
	}
	
	/**
	 *  找医网客户端进入注册页面
	 * @return
	 */
	@RequestMapping(value="/toRegister2")
	public ModelAndView toRegister2(){
		logBefore(logger, "--扫码进入注册页面--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		System.out.println("--------推荐人主键id-----------"+pd.get("twoDimensioncode_id"));
		System.out.println("--------推荐人类型-----------"+pd.get("type"));
		
		pd.put("twoDimensioncode_id", pd.get("twoDimensioncode_id"));
		pd.put("type", pd.get("type"));
		mv.addObject("pd", pd);
		mv.setViewName("lvjuyanglao/kehuduan/registerVIP/register2");
		return mv;
	}
	

	/**
	 *  退出 注销
	 * @return
	 */
	@RequestMapping(value="/tuichu")
	public ModelAndView tuichu(){
		logBefore(logger, "--退出注销--");
		ModelAndView mv=new ModelAndView();
		//销毁session
		removeSession();
		mv.setViewName("redirect:/api/ljylkehu/index");
		return mv;
	}
	
	/**
	 *  发送验证码
	 * @return
	 */
	@RequestMapping(value="/sendMSM")
	@ResponseBody
	public Object sendMSM(){
		logBefore(logger, "--发送验证码--");
		ModelAndView mv=new ModelAndView();
		Map map  = new HashMap();
		PageData pd = new PageData();
		pd = this.getPageData();
		String phone = pd.getString("phone");
		if(Tools.notEmpty(phone)){
			String resultCode  = miaodiyunUtil.sendMsM(phone);
			if(Tools.notEmpty(resultCode)){
				map.put("respCode", "01");
				map.put("yanzhengma", resultCode);
			}
		}else{
			map.put("respCode", "00");
		}
	
		return AppUtil.returnObject(pd, map);
	}
	
	
	/**
	 * 去评价
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/gopj")
	public ModelAndView gopj()throws Exception {
		logBefore(logger, "---去评价--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd=this.getPageData();
		mv.addObject("pd", pd);
		mv.setViewName("lvjuyanglao/kehuduan/user/pingjia");
		return mv;
	}
	
	
	@RequestMapping(value = "/savePingjia")
	public ModelAndView savePingjia()throws Exception{
		logBefore(logger, "---保存评价--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd=this.getPageData();
		pd.put("pj_id", this.get32UUID());
		pd.put("pj_time", DateUtil.getTime());
		ljylKeHuService.savePingjia(pd);
		
		ljylKeHuService.updateYaoshangFlagState(pd);
		/*if(pd.get("identity").equals("1")){
			ljylKeHuService.updateYishengFlagState(pd);
		}else if(pd.get("identity").equals("3")){
			ljylKeHuService.updateYaoshangFlagState(pd);
		}else{
			ljylKeHuService.updatejigouFlagState(pd);
		}*/
		mv.addObject("pd", pd);
		mv.setViewName("redirect:/api/ljylkehu/huiyuanzhongxin.do");
		return mv;
	}
	
	
	
	
	/**
	 * 找医网客户端注册  官网注册的
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/register")
	@ResponseBody
	public Object register(HttpServletRequest request) throws Exception{
		logBefore(logger, "--找医网客户端注册--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		PageData pdUserName=new PageData();
		pdUserName = this.getPageData();
		pdUserName.put("userName", pd.getString("userName"));
		pdUserName.put("phone", pd.getString("phone"));
		//根据用户名或者手机号查询对象信息
		PageData tempUserName=ljylKeHuService.getDataByUserName(pdUserName);
		PageData tempPhone=ljylKeHuService.getDataByPhone(pdUserName);
		
		//获取后台设置的注册送积分
		PageData zhuceJifenData = ljylShangHuService.getDataOfJiFenZhuCe(pd);
		//客户主键id
		String respCode = "00";
		String respMsg="";
		String user_kuhu_id = this.get32UUID();
		if(tempUserName!=null && tempPhone!=null){//该用户名已经存在
			respMsg="该用户已经注册";
		}
		else if(tempUserName!=null){
			respMsg="该用户已经注册";
		}else if(tempPhone!=null){
			respMsg="该手机已经注册";
		}
		else{
			//验证码错误
			if(!pd.get("fhyzm").equals(pd.get("yzm"))){
				respMsg = "验证码输入错误";
			}else{
			
		/*		//生成二维码
				String path="uploadFiles/twoDimensionCode/" + this.get32UUID() + ".png";
				String filePath=PathUtil.getClasspath() + path;
				String encoderContent = BaseController.getPath(getRequest())+"api/zywkehu/toRegister2.do?type=1&twoDimensioncode_id="+user_kuhu_id;                       
				TwoDimensionCode.encoderQRCode(encoderContent, filePath, "png");*/
				
				//生成带logo的新的二维码
				
				//生成二维码
				//使用默认的头像作为每一个二维码的logo图片
				String logoPath=PathUtil.getClasspath() + "static/lvjuyanglao/images/ill.png";
				String filePath="uploadFiles/uploadImgs/kehu/eweima/" + DateUtil.getDays()+"/";
				String imgName = this.get32UUID() + ".png";
				//二维码内容
				String encoderContent = BaseController.getPath(getRequest())+"api/ljylkehu/toRegister2.do?type=1&twoDimensioncode_id="+user_kuhu_id;                       
				//生成带有logo图标二维码图片
				QRCodeUtil.encode(encoderContent, logoPath, PathUtil.getClasspath()+filePath, imgName, true);
				
				pd.put("user_kuhu_id", user_kuhu_id);
				pd.put("loginPassword", MD5.md5(pd.getString("password")));
				pd.put("payPassword", "");
				pd.put("phone", pd.get("phone"));
				pd.put("headImg_url", "");
				pd.put("userName", pd.get("userName"));
				pd.put("realName", "");
				pd.put("identityCard", "");
				pd.put("birthday", "");
				pd.put("sex", "");
				pd.put("age", "");
				pd.put("address", "");
				pd.put("registerTime", DateUtil.getTime());
				pd.put("last_login_time", "");
				pd.put("ip", request.getRemoteHost());
				pd.put("status", "1");//1  使用中  0 已注销
				pd.put("bz", "会员用户");
				pd.put("jifen", zhuceJifenData.get("jifen_zhuce_number"));
				pd.put("erweima_img", filePath+imgName);
				pd.put("guquan", ljylShangHuService.getDataOfGuQuan(pd).get("guquan_number"));
				pd.put("xunibi", ljylShangHuService.getDataOfXuNiBi(pd).get("xunibi_number"));
				ljylKeHuService.saveKeHu(pd);
				respCode="01";
				respMsg="注册成功";
				
				//默认保存一条数据到分销表中，主键作为顶级id
				PageData djpd = new PageData();
				djpd.put("fenxiao_id", this.get32UUID());
				djpd.put("dingji_id", user_kuhu_id);
				djpd.put("yiji_id", "");
				djpd.put("erji_id", "");
				djpd.put("type", "1");
				ljylKeHuService.saveFenXiao(djpd);
				
			}
		}
		map.put("twoDimensioncode_id", user_kuhu_id);
		map.put("respCode", respCode);
		map.put("respMsg", respMsg);
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 找医网客户端  去登录页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toLogin")
	public ModelAndView toLogin(){
		logBefore(logger, "--找医网客户端进入登录页面 去登录--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd =this.getPageData();
		mv.addObject("pd",pd);
		mv.setViewName("lvjuyanglao/kehuduan/registerVIP/login");
		return mv;
	}
	
	
	/**
	 * 找医网客户端  个人信息
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/gerenInfo")
	public ModelAndView gerenInfo(){
		logBefore(logger, "--找医网客户端进入登录页面 去登录--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd= this.getPageData();
		System.out.println("------------------------------"+pd.get("user_kuhu_id"));
		pd.put("user_kuhu_id", pd.get("user_kuhu_id"));
		mv.addObject("pd", pd);
		mv.setViewName("lvjuyanglao/kehuduan/user/zhiliao");
		return mv;
	}
	
	/**
	 * 注册成为商户引导说明
	 * 功能：
	 * 作者：lj
	 * 日期：2017-8-1
	 */
	@RequestMapping(value="/registerSH")
	public ModelAndView registerSH(){
		logBefore(logger, "--注册成为商户引导说明--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd= this.getPageData();
		mv.setViewName("lvjuyanglao/kehuduan/user/registerSH");
		return mv;
	}
	/**
	 * h5分享二维码返回页面并提示
	 * 功能：
	 * 作者：lj
	 * 日期：2017-8-14
	 */
	@RequestMapping(value="/fxewm")
	public ModelAndView fxewm(){
		logBefore(logger, "--分享二维码--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd= this.getPageData();
		mv.addObject("tag", pd.get("tag"));
		mv.setViewName("lvjuyanglao/kehuduan/user/erweima");
		return mv;
	}
	
	
	/**
	 * 找医网客户端  我的二维码
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/myEwm")
	public ModelAndView myEwm(HttpServletRequest request) throws Exception{
		logBefore(logger, "--找医网客户端进入我的二维码--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd= this.getPageData();
		pd.put("user_kuhu_id", pd.get("user_kuhu_id"));
		PageData pdsData = ljylKeHuService.getErweimaImgById(pd);
		mv.addObject("pd", pd);
		pdsData.put("fxEwm", BaseController.getPath(request)+pdsData.get("erweima_img"));
		mv.addObject("pdsData", pdsData);
		mv.setViewName("lvjuyanglao/kehuduan/user/erweima");
		return mv;
	}
	
	
	
	
	/**
	 * 找医网客户端  我的团队
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/myTeam")
	public ModelAndView myTeam(){
		logBefore(logger, "--找医网客户端进入我的团队--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.addObject("pd", pd);
		mv.setViewName("lvjuyanglao/kehuduan/user/myteam");
		return mv;
	}
	
	
	
	/**
	 * 找医网客户端  我的一级团队
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getYijiTeamList")
	public ModelAndView myYijiTeam() throws Exception{
		logBefore(logger, "--我的一级团队--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		PageData rpd = new PageData();
		pd = this.getPageData();
		
		List<PageData> yijiList = ljylKeHuService.getYijiTeamList(pd);
		rpd = ljylKeHuService.getYijiTeamListCount(pd);
		mv.addObject("rpd", rpd);
		mv.addObject("yijiList", yijiList);
		mv.setViewName("lvjuyanglao/kehuduan/user/first_team");
		return mv;
	}
	
	/**
	 * 找医网客户端  我的二级团队
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getErjiTeamList")
	public ModelAndView getErjiTeamList() throws Exception{
		logBefore(logger, "--我的二级团队--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		PageData rpd = new PageData();
		pd = this.getPageData();
		
		List<PageData> ErjiList = ljylKeHuService.getErjiTeamList(pd);
		rpd= ljylKeHuService.getErjiTeamListCount(pd);
		mv.addObject("rpd", rpd);
		mv.addObject("ErjiList", ErjiList);
		mv.setViewName("lvjuyanglao/kehuduan/user/two_team");
		return mv;
	}
	
	/**
	 * 找医网客户端  我的积分
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/myJifen")
	public ModelAndView myJifen() throws Exception{
		logBefore(logger, "--找医网客户端进入我的积分--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("user_kuhu_id", getSessionUser().getUser_kuhu_id());
		PageData jifenData = ljylKeHuService.getMyjifen(pd);
		//获取积分兑换股权的信息
		PageData tempPd=ljylShangHuService.getDataOfJiFenHuanGuQuan(pd);
		
		pd.put("jifen_num", tempPd.getString("jifen_num"));
		pd.put("guquan_num", tempPd.getString("guquan_num"));
		mv.addObject("pd", pd);
		mv.addObject("jifenData", jifenData);
		mv.setViewName("lvjuyanglao/kehuduan/user/mineJifen");
		return mv;
	}
	/**
	 * 积分换股权操作
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/jiFenHuanGuQuan")
	@ResponseBody
	public Object jiFenHuanGuQuan() throws Exception{
		logBefore(logger, "--积分换股权操作--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		if(isSession()){
			//获取我的积分
			pd.put("user_kehu_id", getSessionUser().getUser_kuhu_id());
			pd=ljylKeHuService.getjgDataById(pd);
			pd.put("user_kehu_id", getSessionUser().getUser_kuhu_id());
			//获取积分兑换股权的信息
			PageData tempPd=ljylShangHuService.getDataOfJiFenHuanGuQuan(pd);
			
			//更新积分和股权信息
			pd.put("jifen", Integer.parseInt(pd.get("jifen").toString()) - Integer.parseInt(tempPd.get("jifen_num").toString()));
			pd.put("guquan", Double.parseDouble(pd.get("guquan").toString()) + Double.parseDouble(tempPd.get("guquan_num").toString()));
			ljylKeHuService.updateJiFenAndGuQuan(pd);
			
			map.put("respCode", "01");
		}else{
			map.put("respCode", "00");
		}
		return AppUtil.returnObject(pd, map);
	}
	
	
	/**
	 * 找医网客户端  我的股权
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/myGuquan")
	public ModelAndView myGuquan() throws Exception{
		logBefore(logger, "--找医网客户端进入我的股权--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		PageData ppData = ljylKeHuService.getGuquanAndXunibi(pd);
		mv.addObject("ppData", ppData);
		mv.setViewName("lvjuyanglao/kehuduan/user/myGuquan");
		return mv;
	}
	/**
	 * 找医网客户端  我的虚拟币
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/myXunibi")
	public ModelAndView myXunibi() throws Exception{
		logBefore(logger, "--找医网客户端进入我的股权--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		PageData ppData = ljylKeHuService.getGuquanAndXunibi(pd);
		mv.addObject("ppData", ppData);
		mv.setViewName("lvjuyanglao/kehuduan/user/myXunibi");
		return mv;
	}
	
	
	
	
	
	/**
	 * 找医网客户端  我的积分
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/myOrder")
	public ModelAndView myOrder() throws Exception{
		logBefore(logger, "--找医网客户端进入我的订单--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		PageData jifenData = ljylKeHuService.getMyjifen(pd);
		mv.addObject("jifenData", jifenData);
		mv.setViewName("lvjuyanglao/kehuduan/user/myjifen");
		return mv;
	}
	
	
	
	
	/**
	 *  找医网客户登录
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/login")
	@ResponseBody
	public Object login(HttpSession session) throws Exception{
		logBefore(logger, "--找医网客户登录--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		PageData tempPd=new PageData();
		String respCode = "";
		String respMsg="";
		String twoDimensioncode_id = "";
		if(isNumeric(pd.getString("userName"))){
			//电话号码方式
			tempPd.put("phone", pd.getString("userName"));
		}else{
			//用户名方式
			tempPd.put("userName", pd.getString("userName"));
		}
	
		tempPd.put("loginPassword", MD5.md5(pd.getString("password")));
		PageData tempData=ljylKeHuService.getDataByUserNameAndPassword(tempPd);
		PageData ispd= ljylKeHuService.isExistUser(tempPd);
		if(ispd==null){
			 respCode = "02";
			 respMsg="该用户未注册";
		}else if(tempData!=null){
			twoDimensioncode_id=pd.getString("twoDimensioncode_id");
			respCode="01";
			respMsg="登录成功";
			ZywKeHu zywKeHu=new ZywKeHu();
			zywKeHu.setUser_kuhu_id(tempData.getString("user_kuhu_id"));
			zywKeHu.setPhone(tempData.getString("phone"));
			zywKeHu.setUserName(tempData.getString("userName"));
			session.setAttribute(Const.SESSION_KEHU_USER,zywKeHu);
			pd.put("currentTime", DateUtil.getTime());
			pd.put("user_kuhu_id", tempData.getString("user_kuhu_id"));
			ljylKeHuService.updateLastLoginTime(pd);
			
			//该操作是为了只有一个身份登录
			session.removeAttribute(Const.SESSION_SHANGHU_USER);
			
		}else{
			 respCode = "00";
			 respMsg="用户名或密码错误";
			
		}
		map.put("respCode", respCode);
		map.put("respMsg", respMsg);
		map.put("twoDimensioncode_id", twoDimensioncode_id);
		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 找医网客户端获取短信验证码
	 * @return
	 */
	@RequestMapping(value="/getSms")
	@ResponseBody
	public Object getSms(){
		logBefore(logger, "--找医网客户端获取短信验证码--");
		PageData pd = new PageData();
		pd= this.getPageData();
		Map<String,String> map = new HashMap<String,String>();
		String phone = pd.getString("phone");
		map = SmsUtil.sendMsM(phone);
		map.put("phone", phone);
		if(map.size()>0){
			map.put("reqCode", "01");
		}else{
			map.put("reqCode", "00");
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 判断一串字符串中是否含有非数字字符
	 * 无：返回TRUE
	 * 有：返回FALSE
	 * @param str
	 * @return
	 */
	public boolean isNumeric(String str) {
		for (int i = str.length(); --i >= 0;) {
			if (!Character.isDigit(str.charAt(i))) {
				return false;
			}
		}
		return true;
	}
	
	/**
	 * 判断session是否存在
	 * 存在：返回TRUE
	 * 反之：返回FALSE
	 * @return
	 */
	public boolean isSession(){
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		ZywKeHu zywKeHu=(ZywKeHu) session.getAttribute(Const.SESSION_KEHU_USER);
		if(zywKeHu==null){
			return false;
		}
		return true;
	}
	
	/**
	 * 退出 销毁session
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-6
	 */
	public void removeSession(){
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		session.removeAttribute(Const.SESSION_KEHU_USER);
	}
	
	/**
	 * 商户端分享二维码注册
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-10
	 */
	public String registerShanghu(HttpServletRequest request,PageData pd) throws Exception{
		logBefore(logger, "--扫码商户注册--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pdUserName=new PageData();
		pdUserName.put("userName", pd.getString("userName"));
		pdUserName.put("identity", pd.getString("identity"));
		PageData pdPhone=new PageData();
		pdPhone.put("phone", pd.getString("phone"));
		pdPhone.put("identity", pd.getString("identity"));
		//根据用户名或者手机号查询对象信息
		PageData tempUserName=ljylShangHuService.getDataByNameOrPhone(pdUserName);
		PageData tempPhone=ljylShangHuService.getDataByNameOrPhone(pdPhone);
		//
		String respCode = "00";
		String respMsg="";
		if(tempUserName!=null){//该用户名已经存在
			respMsg="该用户名已经存在";
		}else{
			if(tempPhone!=null){//该手机号已经注册
				respMsg="该手机号已经注册";
			}else{
				respCode="01";
				respMsg="注册成功";
				String user_shanghu_id=this.get32UUID();
				//生成二维码
				String path="uploadFiles/twoDimensionCode/" + this.get32UUID() + ".png";
				String filePath=PathUtil.getClasspath() + path;
				String encoderContent = BaseController.getPath(getRequest())+"api/ljylkehu/toRegister2.do?type=2&twoDimensioncode_id="+user_shanghu_id;
				TwoDimensionCode.encoderQRCode(encoderContent, filePath, "png");
				
				pd.put("user_shanghu_id", user_shanghu_id);//主键ID
				pd.put("erWeiMaImg", path);//主键ID
				pd.put("renZhengState", "3");//认证状态，3-待认证
				pd.put("loginPassword", MD5.md5(pd.getString("loginPassword")));//密码
				pd.put("registerTime", DateUtil.getTime());//注册时间	
				pd.put("last_login_time", DateUtil.getTime());//最近登陆时间	
				pd.put("ip", request.getRemoteHost());//ip地址	
				pd.put("status", "1");//1 使用中 0 已停用
				pd.put("bz", "app用户");
				//获取注册送积分
				PageData tempData=ljylShangHuService.getDataOfJiFenZhuCe(pd);
				pd.put("integral", tempData.get("jifen_zhuce_number"));
				ljylShangHuService.saveShangHu(pd);
			}
		}
		return respCode;
	}

	
	
	/**
	 * 找医网客户端注册 通过分享的二维码注册的 执行分销
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/ew_register")
	@ResponseBody
	public Object ew_register(HttpServletRequest request) throws Exception{
		logBefore(logger, "--通过二维码注册--");
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		//1是客户 2是医生
		String type = pd.getString("type");
		
		PageData pdUserName=new PageData();
		pdUserName = this.getPageData();
		pdUserName.put("userName", pd.getString("userName"));
		pdUserName.put("phone", pd.getString("phone"));
		//根据用户名或者手机号查询对象信息
		PageData tempUserName=ljylKeHuService.getDataByUserName(pdUserName);
		PageData tempPhone=ljylKeHuService.getDataByPhone(pdUserName);
		
		//获取后台设置的注册送积分
		PageData zhuceJifenData = ljylShangHuService.getDataOfJiFenZhuCe(pd);
		//客户主键id
		String user_kuhu_id = this.get32UUID();
		String respCode = "00";
		String respMsg="";
		//type=1 是客户注册
				if(tempUserName!=null && tempPhone!=null){//该用户名已经存在
					respMsg="该用户已经注册";
				}
				else if(tempUserName!=null){
					respMsg="该用户已经注册";
				}else if(tempPhone!=null){
					respMsg="该手机已经注册";
				}
				else{
					//验证码错误
					if(!pd.get("fhyzm").equals(pd.get("yzm"))){
						respMsg = "验证码输入错误";
					}else{
						
							//生成二维码
							//使用默认的头像作为每一个二维码的logo图片
							String logoPath=PathUtil.getClasspath() + "static/lvjuyanglao/images/ill.png";
							String filePath="uploadFiles/uploadImgs/kehu/eweima/" + DateUtil.getDays()+"/";
							String imgName = this.get32UUID() + ".png";
							//二维码内容
							String encoderContent = BaseController.getPath(getRequest())+"api/ljylkehu/toRegister2.do?type=1&twoDimensioncode_id="+user_kuhu_id;                       
							//生成带有logo图标二维码图片
							QRCodeUtil.encode(encoderContent, logoPath, PathUtil.getClasspath()+filePath, imgName, true);
							//生成带有logo图标二维码图片
							QRCodeUtil.encode(encoderContent, filePath, imgName, true);
							
							
							//String imgPath=BaseController.getPath(getRequest())+logoPath;
							//TwoDimensionCode.encoderQRCode(encoderContent, filePath, "png");
							pd.put("user_kuhu_id", user_kuhu_id);
							pd.put("loginPassword", MD5.md5(pd.getString("password")));
							pd.put("payPassword", "");
							pd.put("phone", pd.get("phone"));
							pd.put("headImg_url", "");
							pd.put("userName", pd.get("userName"));
							pd.put("realName", "");
							pd.put("identityCard", "");
							pd.put("birthday", "");
							pd.put("sex", "");
							pd.put("age", "");
							pd.put("address", "");
							pd.put("registerTime", DateUtil.getTime());
							pd.put("last_login_time", "");
							pd.put("ip", request.getRemoteHost());
							pd.put("status", "1");//1  使用中  0 已注销
							pd.put("bz", "会员用户");
							pd.put("jifen", zhuceJifenData.get("jifen_zhuce_number"));
							pd.put("erweima_img", filePath+imgName);
							//获取注册送虚拟币
							pd.put("xunibi", ljylShangHuService.getDataOfXuNiBi(pd).get("xunibi_number"));
							//获取注册送股权
							pd.put("guquan", ljylShangHuService.getDataOfGuQuan(pd).get("guquan_number"));
							ljylKeHuService.saveKeHu(pd);
							respCode="01";
							respMsg="注册成功";
							
						/*	
							//默认保存一条数据到分销表中，主键作为顶级id
							PageData djpd = new PageData();
							djpd.put("fenxiao_id", this.get32UUID());
							djpd.put("dingji_id", user_kuhu_id);
							djpd.put("yiji_id", "");
							djpd.put("erji_id", "");
							djpd.put("type", "1");
							ljylKeHuService.saveFenXiao(djpd);*/
					}
				}
				
		
		
				//-------------------------------分销----------------------------------//
				//
				//先查二级表，
				//1.如果二级为空，则去查一级表， 如果一级还为空，则必然是顶级用户
				//2.如果二级不为空，则表示该用户是二级用户，（通过他的推荐进来的用户即成为2级，他的推荐人成为1级）
				
				/** 从低级往高级查
				 *1. 二级不为空。二级得100积分，一级得50积分（如果二级为空，再去查一级）
				 *2. 一级不为空。一级得100，顶级得50积分（一级不为空则update被推荐人为二级，如果一级为空，则它必然是顶级,则执行第3步操作）
				 *3. 顶级不为空。顶级得100（顶级不为空，则update被推荐人为一级）
				 * 
				 * 
				 * 
				 * ******************************************/
				/********************************************/
		//fenxiao_id,
		//dingji_id,
		//yiji_id,
		//erji_id,
		//查出积分
		//获取到后台设置的积分 返回pd
		PageData jifenPd = ljylKeHuService.getjifen(pd);
		PageData pds = new PageData();
		System.out.println("---------aaa---------"+pd.getString("twoDimensioncode_id"));
		System.out.println("---------type---------"+pd.getString("type"));
		//推荐人id
		String tjr_user_id = pd.getString("twoDimensioncode_id");
		pds.put("taget_id", tjr_user_id);
		pds.put("user_kuhu_id", tjr_user_id);
		
		//注册成功才执行分销
		if(respCode.equals("01")){
			//医生端分销后面再加
			//2是医生分销
			/*if(type.equals("2")){
				
				
			}else{*/
		
		
		//根据条件是二级id查到结果
		PageData pdall2 = ljylKeHuService.chaErji(pds);
		if(pdall2!=null){
			System.out.println("=================他是二级哦=================");
			//如果推荐人是二级用户，插入一条新的数据到分销表中（即升级），推荐人升为1级，被推荐人为2级,原来的1级提为顶级
			PageData p1 = new PageData();
			p1.put("fenxiao_id", this.get32UUID());
			p1.put("dingji_id", pdall2.get("yiji_id"));
			p1.put("yiji_id", pdall2.get("erji_id"));
			p1.put("erji_id", user_kuhu_id);
			p1.put("type", "1");
			//插入新的数据到分销表中（因为是二级推荐的，所以要升级了）
			ljylKeHuService.saveFenXiao(p1);
			
			//---获取推荐人原来的积分+分销所得的积分=总积分（重新设置进去）
			PageData pjf = new PageData();
			//一级推荐人的积分
			pjf.put("user_kuhu_id", pdall2.get("yiji_id"));
			PageData yi_jifenData = ljylKeHuService.getMyjifen(pjf);
			//二级推荐人的积分
			pjf.put("user_kuhu_id", pdall2.get("erji_id"));
			PageData er_jifenData = ljylKeHuService.getMyjifen(pjf);
			//一级推荐人的原积分
			String yi_yjifen = yi_jifenData.getString("jifen");
			//顶级推荐人的原积分
			String er_yjifen = er_jifenData.getString("jifen");
			
			//预设置积分
			String sjifen =jifenPd.getString("fx1_num");
			String sjifen2 =jifenPd.getString("fx2_num");
			//总积分
			int jf1 = Integer.parseInt(er_yjifen)+Integer.parseInt(sjifen);
			int jf2 = Integer.parseInt(yi_yjifen)+Integer.parseInt(sjifen2);
			//获取积分赋值进去
			//二级推荐人得多数 --100分
			//修改积分
			PageData pp = new PageData();
			pp.put("jifen", jf1+"");
			pp.put("tjr_user_id", pdall2.get("erji_id"));
			ljylKeHuService.updateJifenByEwmRegister(pp);
			//一级推荐人得少数 --50分
			pp.put("jifen", jf2+"");
			pp.put("tjr_user_id", pdall2.get("yiji_id"));
			ljylKeHuService.updateJifenByEwmRegister(pp);
			
		}else{
			//查一级
			PageData pdall1 = ljylKeHuService.chaYiji(pds);
			if(pdall1!=null){
				System.out.println("=================他是一级哦=================");
				PageData p0 = new PageData();
				p0.put("yiji_id", pdall1.get("yiji_id"));
				PageData pd0_rs = ljylKeHuService.selectErjiByYiji(p0);
				//如果二级字段等于空  则更新二级字段
				if(pd0_rs.get("erji_id").equals("")){
					PageData p01 = new PageData();
					p01.put("tag_id",user_kuhu_id);
					p01.put("yiji_id", pdall1.get("yiji_id"));
					ljylKeHuService.updateErji(p01);
					
					//2是医生
					if(type.equals("2")){
						System.out.println("-----------------type=2------------------");
						//---获取推荐人原来的积分+分销所得的积分=总积分（重新设置进去）
						PageData pjf = new PageData();
						//一级推荐人的积分
						pjf.put("user_kuhu_id", pdall1.get("yiji_id"));
						PageData yi_jifenData = ljylKeHuService.getMyjifen(pjf);
					
						//顶级推荐人的积分
						pjf.put("user_shanghu_id", pdall1.get("dingji_id"));
						//获取医生的积分
						PageData ding_jifenData = ljylShangHuService.getShangHuJifen(pjf);
						//一级推荐人的原积分
						String yi_yjifen = yi_jifenData.getString("jifen");
						//顶级推荐人的原积分
						String ding_yjifen = ding_jifenData.getString("jifen");
						//预设置积分
						String sjifen =jifenPd.getString("fx1_num");//100
						String sjifen2 =jifenPd.getString("fx2_num");//50
						//总积分
						int jf1 = Integer.parseInt(yi_yjifen)+Integer.parseInt(sjifen);
						int jf2 = Integer.parseInt(ding_yjifen)+Integer.parseInt(sjifen2);
						//获取积分赋值进去
						//一级推荐人得多数 --100分
						//修改积分 
						PageData pp = new PageData();
						pp.put("jifen", jf1+"");
						pp.put("tjr_user_id", pdall1.get("yiji_id"));
						ljylKeHuService.updateJifenByEwmRegister(pp);
						//顶级推荐人得少数 --50分
						pp.put("jifen", jf2+"");
						pp.put("tjr_user_id", pdall1.get("dingji_id"));
						ljylShangHuService.updateJifenToShanghu(pp);
					}else{
						System.out.println("-----------------type=1------------------");
						//---获取推荐人原来的积分+分销所得的积分=总积分（重新设置进去）
						PageData pjf = new PageData();
						//一级推荐人的积分
						pjf.put("user_kuhu_id", pdall1.get("yiji_id"));
						PageData yi_jifenData = ljylKeHuService.getMyjifen(pjf);
						
						//顶级推荐人的积分
						pjf.put("user_kuhu_id", pdall1.get("dingji_id"));
						PageData ding_jifenData = ljylKeHuService.getMyjifen(pjf);
						/**
						 * 	///////////////////////////****注意******!!!!!/////////////////////////////////////////
						 */
						///////////////////如果顶级是医生 ding_jifenData必然等于null/////////////////////////
						if(ding_jifenData==null||ding_jifenData.getString("jifen").equals("")){
							 ding_jifenData = ljylShangHuService.getShangHuJifen(pjf);
						}
						//一级推荐人的原积分
						String yi_yjifen = yi_jifenData.getString("jifen");
						//顶级推荐人的原积分
						String ding_yjifen = ding_jifenData.getString("jifen");
						//预设置积分
						String sjifen =jifenPd.getString("fx1_num");//100
						String sjifen2 =jifenPd.getString("fx2_num");//50
						//总积分
						int jf1 = Integer.parseInt(yi_yjifen)+Integer.parseInt(sjifen);
						int jf2 = Integer.parseInt(ding_yjifen)+Integer.parseInt(sjifen2);
						
						
						//获取积分赋值进去
						//一级推荐人得多数 --100分
						//修改积分 
						PageData pp = new PageData();
						pp.put("jifen", jf1+"");
						pp.put("tjr_user_id", pdall1.get("yiji_id"));
						ljylKeHuService.updateJifenByEwmRegister(pp);
						//顶级推荐人得少数 --50分
						pp.put("jifen", jf2+"");
						pp.put("tjr_user_id", pdall1.get("dingji_id"));
						ljylKeHuService.updateJifenByEwmRegister(pp);
					}
				}else{
					//表示这个一级用户已经存在一个二级用户了，则新增一条数据，还是这个一级用户下的二级用户（平行数据）
					PageData p02 = new PageData();
					p02.put("fenxiao_id", this.get32UUID());
					p02.put("dingji_id", pdall1.get("dingji_id"));
					p02.put("yiji_id",  pdall1.get("yiji_id"));
					p02.put("erji_id", user_kuhu_id);
					p02.put("type","1");
					ljylKeHuService.insertErji(p02);
					
					//2是医生
					if(type.equals("2")){
						System.out.println("-----------------type=2------------------");
						//---获取推荐人原来的积分+分销所得的积分=总积分（重新设置进去）
						PageData pjf = new PageData();
						//一级推荐人的积分
						pjf.put("user_kuhu_id", pdall1.get("yiji_id"));
						PageData yi_jifenData = ljylKeHuService.getMyjifen(pjf);
					
						//顶级推荐人的积分
						pjf.put("user_shanghu_id", pdall1.get("dingji_id"));
						//获取医生的积分
						PageData ding_jifenData = ljylShangHuService.getShangHuJifen(pjf);
						//一级推荐人的原积分
						String yi_yjifen = yi_jifenData.getString("jifen");
						//顶级推荐人的原积分
						String ding_yjifen = ding_jifenData.getString("jifen");
						//预设置积分
						String sjifen =jifenPd.getString("fx1_num");//100
						String sjifen2 =jifenPd.getString("fx2_num");//50
						//总积分
						int jf1 = Integer.parseInt(yi_yjifen)+Integer.parseInt(sjifen);
						int jf2 = Integer.parseInt(ding_yjifen)+Integer.parseInt(sjifen2);
						//获取积分赋值进去
						//一级推荐人得多数 --100分
						//修改积分 
						PageData pp = new PageData();
						pp.put("jifen", jf1+"");
						pp.put("tjr_user_id", pdall1.get("yiji_id"));
						ljylKeHuService.updateJifenByEwmRegister(pp);
						//顶级推荐人得少数 --50分
						pp.put("jifen", jf2+"");
						pp.put("tjr_user_id", pdall1.get("dingji_id"));
						ljylShangHuService.updateJifenToShanghu(pp);
						
					}else{
						System.out.println("-----------------type=1------------------");
						//---获取推荐人原来的积分+分销所得的积分=总积分（重新设置进去）
						PageData pjf = new PageData();
						//一级推荐人的积分
						pjf.put("user_kuhu_id", pdall1.get("yiji_id"));
						PageData yi_jifenData = ljylKeHuService.getMyjifen(pjf);
						
						//顶级推荐人的积分
						pjf.put("user_kuhu_id", pdall1.get("dingji_id"));
						PageData ding_jifenData = ljylKeHuService.getMyjifen(pjf);
						/**
						 * 	///////////////////////////****注意******!!!!!/////////////////////////////////////////
						 */
						//////////////////如果顶级是医生 ding_jifenData必然等于null/////////////////
						if(ding_jifenData==null||ding_jifenData.getString("jifen").equals("")){
							 ding_jifenData = ljylShangHuService.getShangHuJifen(pjf);
						}
						//一级推荐人的原积分
						String yi_yjifen = yi_jifenData.getString("jifen");
						//顶级推荐人的原积分
						String ding_yjifen = ding_jifenData.getString("jifen");
						//预设置积分
						String sjifen =jifenPd.getString("fx1_num");//100
						String sjifen2 =jifenPd.getString("fx2_num");//50
						//总积分
						int jf1 = Integer.parseInt(yi_yjifen)+Integer.parseInt(sjifen);
						int jf2 = Integer.parseInt(ding_yjifen)+Integer.parseInt(sjifen2);
						//获取积分赋值进去
						//一级推荐人得多数 --100分
						//修改积分 
						PageData pp = new PageData();
						pp.put("jifen", jf1+"");
						pp.put("tjr_user_id", pdall1.get("yiji_id"));
						ljylKeHuService.updateJifenByEwmRegister(pp);
						//顶级推荐人得少数 --50分
						pp.put("jifen", jf2+"");
						pp.put("tjr_user_id", pdall1.get("dingji_id"));
						ljylKeHuService.updateJifenByEwmRegister(pp);
					}
				} 
				
			}else{
				//2是医生
				if(type.equals("2")){
					PageData pdall12 = ljylKeHuService.chaDingji(pds);
					System.out.println("=====================医生它是顶级哦=====================");
					//是顶级，则要更新一级字段，先判断该顶级下有没有一级用户
					PageData p0 = new PageData();
					p0.put("dingji_id", pdall12.get("dingji_id"));
					PageData pd_dingji = ljylKeHuService.selectYijiByDingji(p0);
					//不等于空 则表示该顶级用户已经有了一级用户
					if(!pd_dingji.get("yiji_id").equals("")){
						System.out.println("----------------医生一级字段不是空的---------------------");
						//不为空，则表示该顶级用户已经存在至少一个一级用户，则需新增。（平行数据）
						PageData p02 = new PageData();
						p02.put("fenxiao_id", this.get32UUID());
						p02.put("dingji_id", pdall12.get("dingji_id"));
						p02.put("yiji_id",  user_kuhu_id);
						p02.put("erji_id", "");
						p02.put("type","1");
						ljylKeHuService.insertYiji(p02);
						
						//修改医生的积分
						PageData pjf = new PageData();
						pjf.put("user_shanghu_id", pdall12.get("dingji_id"));
						PageData jifenData = ljylShangHuService.getShangHuJifen(pjf);
						//原积分
						String yjifen = jifenData.getString("jifen");
						//预设置积分
						String sjifen =jifenPd.getString("fx1_num");
						//总积分
						int jf = Integer.parseInt(yjifen)+Integer.parseInt(sjifen);
						//获取积分赋值进去
						//一级推荐人得多数 --100分
						pjf.put("jifen", jf+"");
						pjf.put("tjr_user_id", pdall12.get("dingji_id"));
						//修改医生的积分
						ljylShangHuService.updateJifenToShanghu(pjf);
						
					}else{
						System.out.println("----------------医生一级字段是空的---------------------");
						PageData p01 = new PageData();
						p01.put("tag_id", user_kuhu_id);
						p01.put("dingji_id", pdall12.get("dingji_id"));
						ljylKeHuService.updateYiji(p01);
						
						//修改积分
						PageData pjf = new PageData();
						pjf.put("user_shanghu_id", pdall12.get("dingji_id"));
						PageData jifenData = ljylShangHuService.getShangHuJifen(pjf);
						//原积分
						String yjifen = jifenData.getString("jifen");
						//预设置积分
						String sjifen =jifenPd.getString("fx1_num");
						//总积分
						int jf = Integer.parseInt(yjifen)+Integer.parseInt(sjifen);
						
						PageData pp = new PageData();
						//获取积分赋值进去
						//级推荐人得多数 --100分
						pp.put("jifen", jf+"");
						pp.put("tjr_user_id", pdall12.getString("dingji_id"));
						//修改医生的积分
						ljylShangHuService.updateJifenToShanghu(pp);
						
					}
				//客户
				}else{
					PageData pdall12 = ljylKeHuService.chaDingji(pds);
					System.out.println("=====================客户它是顶级哦=====================");
					//是顶级，则要更新一级字段，先判断该顶级下有没有一级用户
					PageData p0 = new PageData();
					p0.put("dingji_id", pdall12.get("dingji_id"));
					PageData pd_dingji = ljylKeHuService.selectYijiByDingji(p0);
					//不等于空 则表示该顶级用户已经有了一级用户
					if(!pd_dingji.get("yiji_id").equals("")){
						System.out.println("----------------一级字段不是空的---------------------");
						//不为空，则表示该顶级用户已经存在至少一个一级用户，则需新增。（平行数据）
						PageData p02 = new PageData();
						p02.put("fenxiao_id", this.get32UUID());
						p02.put("dingji_id", pdall12.get("dingji_id"));
						p02.put("yiji_id",  user_kuhu_id);
						p02.put("erji_id", "");
						p02.put("type","1");
						ljylKeHuService.insertYiji(p02);
						
						//修改积分
						//修改积分
						PageData pjf = new PageData();
						pjf.put("user_kuhu_id", pdall12.get("dingji_id"));
						PageData jifenData = ljylKeHuService.getMyjifen(pjf);
						//原积分
						String yjifen = jifenData.getString("jifen");
						//预设置积分
						String sjifen =jifenPd.getString("fx1_num");
						//总积分
						int jf = Integer.parseInt(yjifen)+Integer.parseInt(sjifen);
						//获取积分赋值进去
						//一级推荐人得多数 --100分
						pjf.put("jifen", jf+"");
						pjf.put("tjr_user_id", pdall12.get("dingji_id"));
						ljylKeHuService.updateJifenByEwmRegister(pjf);
						
					}else{
						System.out.println("----------------一级字段是空的---------------------");
						PageData p01 = new PageData();
						p01.put("tag_id", user_kuhu_id);
						p01.put("dingji_id", pdall12.get("dingji_id"));
						ljylKeHuService.updateYiji(p01);
						
						//修改积分
						PageData pjf = new PageData();
						pjf.put("user_kuhu_id", pdall12.get("dingji_id"));
						PageData jifenData = ljylKeHuService.getMyjifen(pjf);
						//原积分
						String yjifen = jifenData.getString("jifen");
						//预设置积分
						String sjifen =jifenPd.getString("fx1_num");
						//总积分
						int jf = Integer.parseInt(yjifen)+Integer.parseInt(sjifen);
						
						PageData pp = new PageData();
						//获取积分赋值进去
						//级推荐人得多数 --100分
						pp.put("jifen", jf+"");
						pp.put("tjr_user_id", pdall12.getString("dingji_id"));
						ljylKeHuService.updateJifenByEwmRegister(pp);
						
					}
				}
				
			}
		}
	//}// if type end
	}//if respCode="01" end
		map.put("respCode", respCode);
		map.put("respMsg", respMsg);
		map.put("twoDimensioncode_id", pd.getString("twoDimensioncode_id"));
		return AppUtil.returnObject(pd, map);
	}
	
	
	
	///////////////////////////////疑难杂症后台功能////////////////////////////////	
	
	/**
	 * 获取常见疾病列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getjibinglistPage")
	public ModelAndView getjibinglistPage(Page page) throws Exception {
		logBefore(logger, "---后台获取疑难杂症列表--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> list = ljylShangHuService.getjibinglistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("changjianjibing/changjianjibing_list");
		return mv;
	}
	/**
	 * 判断该疾病名称是否存在
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/isNameOfJiBingExistence")
	@ResponseBody
	public Object isNameOfJiBingExistence() throws Exception{
		logBefore(logger, "---判断该疾病名称是否存在--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		PageData tempPd=ljylShangHuService.getJiBingByName(pd);
		String reqCode="00";
		String reqMsg="该疾病名称已存在";
		if(tempPd==null){
			reqCode="01";
			reqMsg="该疾病名称不存在";
		}
		map.put("reqCode", reqCode);
		map.put("reqMsg", reqMsg);
		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 进入常见疾病添加页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/toAddJiBing")
	public ModelAndView toAddJiBing() {
		logBefore(logger, "---进入常见疾病添加页--");
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "insertJiBing");
		mv.setViewName("changjianjibing/changjianjibing_edit");
		return mv;
	}
	
	/**
	 * 根据首字母获取疾病名称
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getJiBingListByLetter")
	@ResponseBody
	public Object getJiBingListByLetter() throws Exception{
		logBefore(logger, "---根据首字母获取疾病名称--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		List<PageData> list=ljylShangHuService.getJiBingListByLetter(pd);
		map.put("list", list);
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 添加常见疾病
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertJiBing")
	public ModelAndView insertJiBing()throws Exception {
		logBefore(logger, "---添加常见疾病--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd=this.getPageData();
		pd.put("changjianjibing_id", this.get32UUID());
		pd.put("addTime", DateUtil.getTime());
		pd.put("pinyin", GetPinyin.getPingYin(pd.getString("jibing_name")));
		ljylShangHuService.insertJiBing(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 进入常见疾病编辑页
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/toEditJiBing")
	public ModelAndView toEditJiBing() throws Exception {
		logBefore(logger, "---进入常见疾病编辑页--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = ljylShangHuService.getJiBingById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "updateJiBing");
		mv.setViewName("changjianjibing/changjianjibing_edit");
		return mv;
	}

	/**
	 * 修改常见疾病
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateJiBing")
	public ModelAndView updateJiBing()throws Exception {
		logBefore(logger, "---修改常见疾病--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd=this.getPageData();
		pd.put("addTime", DateUtil.getTime());
		pd.put("pinyin", GetPinyin.getPingYin(pd.getString("jibing_name")));
		ljylShangHuService.updateJiBing(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 根据ID删除指定对象(常见疾病)的信息
	 * 
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteJiBingById")
	public void deleteJiBingById(PrintWriter writer) throws Exception {
		logBefore(logger, "---根据ID删除指定对象(常见疾病)的信息--");
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<String, Object>();
		pd = this.getPageData();
		String id[] = pd.getString("ids").split(",");
		List<String> ids = new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			ids.add(id[i]);
		}
		map.put("ids", ids);
		ljylShangHuService.deleteJiBingById(map);
		writer.close();
	}
	
	
	
	//------------------------疑难杂症后台功能------------------------------//
	
	/**
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getYnzzlistPage")
	public ModelAndView getYnzzlistPage(Page page) throws Exception {
		logBefore(logger, "---获取疑难杂症列表--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> list =ljylKeHuService.getYnzzlistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("ynzz/ynzz_list");
		return mv;
	}
	
	/**
	 * 判断该疾病名称是否存在
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getNameByID")
	@ResponseBody
	public Object getNameByID() throws Exception{
		logBefore(logger, "---判断该疾病名称是否存在--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		PageData tempPd=ljylKeHuService.getNameByID(pd);
		String reqCode="00";
		String reqMsg="该疾病名称已存在";
		if(tempPd==null){
			reqCode="01";
			reqMsg="该疾病名称不存在";
		}
		map.put("reqCode", reqCode);
		map.put("reqMsg", reqMsg);
		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 进入常见疾病添加页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/toAddYnzz")
	public ModelAndView toAddYnzz() {
		logBefore(logger, "---去添加疑难杂症页面--");
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "insertYnzz");
		mv.setViewName("ynzz/ynzz_edit");
		return mv;
	}
	
/*	@RequestMapping(value="/getJiBingListByLetter")
	@ResponseBody
	public Object getJiBingListByLetter() throws Exception{
		logBefore(logger, "---根据首字母获取疾病名称--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		List<PageData> list=ljylShangHuService.getJiBingListByLetter(pd);
		map.put("list", list);
		return AppUtil.returnObject(pd, map);
	}*/
	
	/**
	 * 添加疑难杂症
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertYnzz")
	public ModelAndView insertYnzz()throws Exception {
		logBefore(logger, "---添加疑难杂症--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd=this.getPageData();
		pd.put("ynzz_id", this.get32UUID());
		pd.put("add_time", DateUtil.getTime());
		pd.put("ynzz_pinyin", GetPinyin.getPingYin(pd.getString("ynzz_name")));
		ljylKeHuService.saveYnzz(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 进入常见疾病编辑页
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/toEditYnzz")
	public ModelAndView toEditYnzz() throws Exception {
		logBefore(logger, "---进入常见疾病编辑页--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = ljylKeHuService.getNameByID(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "updateYnzz");
		mv.setViewName("ynzz/ynzz_edit");
		return mv;
	}

	/**
	 * 修改常见疾病
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateYnzz")
	public ModelAndView updateYnzz()throws Exception {
		logBefore(logger, "---修改疑难杂症--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd=this.getPageData();
		pd.put("add_time", DateUtil.getTime());
		pd.put("ynzz_pinyin", GetPinyin.getPingYin(pd.getString("ynzz_name")));
		System.out.println("-----------------"+pd.getString("context"));
		ljylKeHuService.updateYnzzByID(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 根据ID删除指定对象(常见疾病)的信息
	 * 
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteYnzzById")
	public void deleteYnzzById(PrintWriter writer) throws Exception {
		logBefore(logger, "---根据ID删除指定对象(疑难杂症)的信息--");
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<String, Object>();
		pd = this.getPageData();
		String id[] = pd.getString("ids").split(",");
		List<String> ids = new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			ids.add(id[i]);
		}
		map.put("ids", ids);
		ljylKeHuService.deleteYnzzById(map);
		writer.close();
	}
	
	/**
	 * 判断该疾病名称是否存在
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getYnzzByName")
	@ResponseBody
	public Object getYnzzByName() throws Exception{
		logBefore(logger, "---判断该疑难杂症名称是否存在--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		PageData tempPd=ljylKeHuService.getYnzzByName(pd);
		String reqCode="00";
		String reqMsg="该疑难杂症名称已存在";
		if(tempPd==null){
			reqCode="01";
			reqMsg="该名称不存在";
		}
		map.put("reqCode", reqCode);
		map.put("reqMsg", reqMsg);
		return AppUtil.returnObject(pd, map);
	}
	
	
	/////----------h5-----------/////////
	
	/**
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getYnzzList")
	public ModelAndView getYnzzList(Page page) throws Exception {
		logBefore(logger, "---获取疑难杂症列表--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> list =ljylKeHuService.getYnzzList(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("lvjuyanglao/kehuduan/disease/ynzzList");
		return mv;
	}
	
	/**
	 * 获取机构类型列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getjigouList")
	public ModelAndView getjigoulistPage(Page page) throws Exception {
		logBefore(logger, "---获取机构类型列表--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> list = ljylKeHuService.getjigouTypeList(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("system/jigoutype/jigoutype_list");
		return mv;
	}
	
	/**
	 * 已就诊
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/yijiuzhen")
	public ModelAndView yijiuzhen(Page page) throws Exception {
		logBefore(logger, "---点击已就诊操作---");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		PageData rpd = ljylKeHuService.getAmountById(pd);
		if(rpd!=null){
			//成交金额
			double cjAmount =Double.parseDouble(rpd.get("chengjiaoAmount").toString());
			//现金金额
			double xjAmount = Double.parseDouble(rpd.get("xianjinAmount").toString());
			
			double chengjiaoAmount = cjAmount+Double.parseDouble(pd.getString("shanghu_price"));
			double xianjinAmount =   xjAmount+Double.parseDouble(pd.getString("shanghu_price"));
			PageData pdset = new PageData();
			pdset.put("chengjiaoAmount", chengjiaoAmount);
			pdset.put("xianjinAmount", xianjinAmount);
			pdset.put("user_shanghu_id", pd.get("user_shanghu_id"));
			//修改商户的金额
			ljylKeHuService.updateAmountById(pdset);
		}
		pd.put("complete_time", DateUtil.getTime());
		/*if(pd.get("type").equals("1")){
			//修改医生订单状态
			ljylKeHuService.updateYishengOrderState(pd);
		}else if(pd.get("type").equals("3")){
			//修改药商订单状态
			ljylKeHuService.updateYaoshangOrderState(pd);
		}else{
			//修改机构订单状态
			ljylKeHuService.updatejigouOrderState(pd);
		}*/
		ljylKeHuService.updateYaoshangOrderState(pd);
		//==================================购买服务分销提成begin============================================//
		
		//得到客户id
		String user_kehu_id = pd.getString("user_kehu_id");
		PageData pds = new PageData();
		pds.put("user_kehu_id", user_kehu_id);
		//根据二级id查出顶级和一级
		PageData erjiResult= ljylKeHuService.selectIsErji(pds);
		//查出分销提成的比例
		PageData tichenBili= ljylKeHuService.selectFenXiaoTichen(pds);
		//获取平台技术服务扣除比例对象
		PageData biliData=ljylShangHuService.getDataOfJiShuFuWuBiLi(pd);
		
		//交易总金额
		double zprice =Double.parseDouble(pd.getString("price"));
		zprice = zprice * Double.parseDouble(biliData.getString("bili_jishufuwu"));
		if(erjiResult!=null){
			System.out.println("-------------提成分销该用户是二级-------------");
			//一级得的提成金额(直接人)
			double yijiprice = zprice*Double.parseDouble(tichenBili.getString("bili_fenxiao1"));
			//传入一级人的id,查出一级人的金额
			pds.put("user_kehu_id", erjiResult.get("yiji_id"));
			PageData yijimoney = ljylKeHuService.getMoneyBykehuID(pds);
			
			PageData upd = new PageData();
			upd.put("money", Double.parseDouble(yijimoney.get("money").toString()) + yijiprice);
			upd.put("user_kehu_id", pds.get("user_kehu_id"));
			ljylKeHuService.updateMoneyBykehuID(upd);
			
			//保存客户或者商户的分销提成金额记录
			PageData pdTc = new PageData();
			pdTc.put("tichen_id", this.get32UUID());
			pdTc.put("user_fid", upd.get("user_kehu_id"));
			pdTc.put("fenxiao_name", "一级分销");
			pdTc.put("money", yijiprice);
			pdTc.put("type", 1);
			pdTc.put("insert_time", DateUtil.getTime());
			ljylKeHuService.insertTichenMoneyRecord(pdTc);
			
			//============================计算顶级分销人的提成==============================///
			//顶级得的提成金额（间接人）
			double dingjiprice = zprice*Double.parseDouble(tichenBili.getString("bili_fenxiao2"));
			PageData pdding = new PageData();
			//传入顶级人的id,查出顶级人的金额
			pdding.put("user_kehu_id", erjiResult.get("dingji_id"));
			PageData dingjimoney = ljylKeHuService.getMoneyBykehuID(pdding);
			//表示顶级分销人是客户
			if(dingjimoney!=null){
				PageData upd2 = new PageData();
				upd2.put("money", Double.parseDouble(dingjimoney.get("money").toString()) + dingjiprice);
				upd2.put("user_kehu_id", pdding.get("user_kehu_id"));
				ljylKeHuService.updateMoneyBykehuID(upd2);
				//保存客户或者商户的分销提成金额记录
				PageData pdTc2 = new PageData();
				pdTc2.put("tichen_id", this.get32UUID());
				pdTc2.put("user_fid", upd2.get("user_kehu_id"));
				pdTc2.put("fenxiao_name", "二级分销");
				pdTc2.put("money", dingjiprice);
				pdTc2.put("type", 1);
				pdTc2.put("insert_time", DateUtil.getTime());
				ljylKeHuService.insertTichenMoneyRecord(pdTc2);
			}else{
				//表示这个顶级分销人是商户
				PageData dingji = new PageData();
				//传入顶级人的id,查出顶级人的金额
				dingji.put("user_shanghu_id", erjiResult.get("dingji_id"));
				PageData shangHuMoney = ljylKeHuService.getMoneyByShangHuID(dingji);
				PageData upd_shanghu = new PageData();
				upd_shanghu.put("money", Double.parseDouble(shangHuMoney.get("money").toString()) + dingjiprice);
				upd_shanghu.put("user_shanghu_id", pdding.get("user_kehu_id"));
				ljylKeHuService.updateMoneyBykehuID(upd_shanghu);
				
				//保存客户或者商户的分销提成金额记录
				PageData pdTc2 = new PageData();
				pdTc2.put("tichen_id", this.get32UUID());
				pdTc2.put("user_fid", upd_shanghu.get("user_shanghu_id"));
				pdTc2.put("fenxiao_name", "二级分销");
				pdTc2.put("money", dingjiprice);
				pdTc2.put("type", 2);
				pdTc2.put("insert_time", DateUtil.getTime());
				ljylKeHuService.insertTichenMoneyRecord(pdTc2);
			}
			
			
		}else{
			//查一级数据
			PageData yijiData = ljylKeHuService.selectIsYiji(pds);
			if(yijiData!=null){
				System.out.println("-------------提成分销该用户是一级-------------");
				//顶级得的提成金额（直接人）
				double dingjiprice = zprice*Double.parseDouble(tichenBili.getString("bili_fenxiao1"));
				PageData pdding = new PageData();
				//传入顶级人的id,查出顶级人的金额
				pdding.put("user_kehu_id", yijiData.get("dingji_id"));
				PageData dingjimoney = ljylKeHuService.getMoneyBykehuID(pdding);
					//不为空表示这个顶级是客户，为空表示是商户（因为传的是客户的id所以查不到数据）
					if(dingjimoney!=null){
						PageData upd2 = new PageData();
						upd2.put("money", Double.parseDouble(dingjimoney.get("money").toString()) + dingjiprice);
						upd2.put("user_kehu_id", pdding.get("user_kehu_id"));
						ljylKeHuService.updateMoneyBykehuID(upd2);
						
						//保存客户或者商户的分销提成金额记录
						PageData pdTc2 = new PageData();
						pdTc2.put("tichen_id", this.get32UUID());
						pdTc2.put("user_fid", upd2.get("user_kehu_id"));
						pdTc2.put("fenxiao_name", "一级分销");
						pdTc2.put("money", dingjiprice);
						pdTc2.put("type", 1);
						pdTc2.put("insert_time", DateUtil.getTime());
						ljylKeHuService.insertTichenMoneyRecord(pdTc2);
					}else{
						//表示这个顶级是商户
						PageData dingji = new PageData();
						//传入顶级人的id,查出顶级人的金额
						dingji.put("user_shanghu_id", yijiData.get("dingji_id"));
						PageData shangHuMoney = ljylKeHuService.getMoneyByShangHuID(dingji);
						PageData upd_shanghu = new PageData();
						upd_shanghu.put("money", Double.parseDouble(shangHuMoney.get("money").toString()) + dingjiprice);
						upd_shanghu.put("user_shanghu_id", pdding.get("user_kehu_id"));
						ljylKeHuService.updateMoneyBykehuID(upd_shanghu);
						
						//保存客户或者商户的分销提成金额记录
						PageData pdTc2 = new PageData();
						pdTc2.put("tichen_id", this.get32UUID());
						pdTc2.put("user_fid", upd_shanghu.get("user_shanghu_id"));
						pdTc2.put("fenxiao_name", "一级分销");
						pdTc2.put("money", dingjiprice);
						pdTc2.put("type", 2);
						pdTc2.put("insert_time", DateUtil.getTime());
						ljylKeHuService.insertTichenMoneyRecord(pdTc2);
						
					}
			}
				
		}

		//==================================购买服务分销提成end============================================//
		
		mv.addObject("pd", pd);
		/*if(pd.get("tt").equals("2")){
			mv.setViewName("redirect:/api/zywkehu/huiyuanzhongxin");
		}*/
		mv.setViewName("redirect:/api/ljylkehu/huiyuanzhongxin");
		return mv;
	}
	
	//TODO 聊天接口
	/***
	 * 根据用户id获取用户头像和用户名 接口
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-28
	 */
	@RequestMapping(value="/getKehuHeadImgAnduserName")
	@ResponseBody
	public Object getKehuHeadImgAnduserName(HttpServletRequest request) throws Exception{
		PageData pd  = new PageData();
		pd = this.getPageData();
		Map map = new HashMap();
		if(Tools.isEmpty(pd.getString("user_kehu_id"))){
			map.put("respMsg", "user_kehu_id不能为空");
		}else{
			PageData rpd = ljylKeHuService.getKehuHeadImgAnduserName(pd);
			if(rpd!=null){
				map.put("respCode", "01");
				map.put("user_kuhu_id", rpd.get("user_kuhu_id"));
				map.put("headImg_url", BaseController.getPath(request) + "static/lvjuyanglao/images/ill.png");
				map.put("realName", rpd.get("realName"));
			}else{
				map.put("respCode", "00");
				map.put("respMsg", "未查询到相关数据");
			}
		}
		return AppUtil.returnObject(pd, map);
	}
	
	
	/**
	 * 根据商户id获取用户头像和姓名
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-28
	 */
	@RequestMapping(value="/getShanghuHeadImgAnduserName")
	@ResponseBody
	public Object getShanghuHeadImgAnduserName(HttpServletRequest request) throws Exception{
		PageData pd  = new PageData();
		pd = this.getPageData();
		Map map = new HashMap();
		
		if(Tools.isEmpty(pd.getString("user_shanghu_id"))){
			map.put("respMsg", "user_shanghu_id不能为空");
		}else{
			PageData rpd = ljylKeHuService.getShanghuHeadImgAnduserName(pd);
			if(rpd!=null){
				map.put("respCode", "01");
				map.put("user_shanghu_id", rpd.get("user_shanghu_id"));
				map.put("headImg_url", BaseController.getPath(request) + rpd.get("headImg"));
				map.put("realName", rpd.get("youName"));
			}else{
				map.put("respCode", "00");
				map.put("respMsg", "未查询到相关数据");
			}
		}
	
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 创建session
	 * @param session
	 */
	@RequestMapping(value="/createSession")
	public void createSession(HttpSession session){
		logBefore(logger, "---创建session--");
		PageData tempData  = new PageData();
		tempData = this.getPageData();
		ZywKeHu zywKeHu=new ZywKeHu();
		zywKeHu.setUser_kuhu_id(tempData.getString("user_kuhu_id"));
		session.setAttribute(Const.SESSION_KEHU_USER,zywKeHu);
	}
	
	/**
	 * 获取客户session对象
	 * @return
	 */
	public ZywKeHu getSessionUser(){
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		ZywKeHu zywKeHu=(ZywKeHu) session.getAttribute(Const.SESSION_KEHU_USER);
		return zywKeHu;
	}
	
	/**
	 * 获取流水号
	 * @return
	 */
	public String getserial_number(){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String serial_number=sdf.format(new Date())+(int)((Math.random()*9+1)*100000);
		return serial_number;
	}
	
	
	
}
