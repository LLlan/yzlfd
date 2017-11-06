package com.yizhan.controller.information.lvjuyanglao;

import java.io.File;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.yizhan.entity.information.ShangHu;
import com.yizhan.service.information.lvjuyanglao.LjylKeHuService;
import com.yizhan.service.information.lvjuyanglao.LjylOrderService;
import com.yizhan.service.information.lvjuyanglao.LjylShangHuService;
import com.yizhan.util.AppUtil;
import com.yizhan.util.Const;
import com.yizhan.util.DateTimeUtil;
import com.yizhan.util.DateUtil;
import com.yizhan.util.FileUpload;
import com.yizhan.util.FileUtil;
import com.yizhan.util.GetPinyin;
import com.yizhan.util.MD5;
import com.yizhan.util.PageData;
import com.yizhan.util.PathUtil;
import com.yizhan.util.QRCodeUtil;
import com.yizhan.util.Tools;
import com.yizhan.util.miaodiyun.miaodiyunUtil;

@Controller
@RequestMapping(value="/api/ljylshangHu")
public class LjylShangHuController extends BaseController{

	@Resource(name="ljylShangHuService")
	private LjylShangHuService ljylShangHuService;
	@Resource(name="ljylOrderService")
	private LjylOrderService ljylOrderService;
	@Resource(name="ljylKeHuService")
	private LjylKeHuService ljylKeHuService;
	
	/**
	 * 商户注册协议
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getXieYi")
	public ModelAndView getXieYi(){
		logBefore(logger, "--商户注册协议--");
		ModelAndView mv=new ModelAndView();
		PageData pData=new PageData();
		pData=this.getPageData();
		if(pData.getString("type").equals("1")){
			mv.setViewName("information/zhaoyiwang/xieyi/kehuxieyi");
		}else{
			mv.setViewName("information/zhaoyiwang/xieyi/shanghuxieyi");
		}
		return mv;
	}
	
	
	/**
	 * 我的团队
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/myTeam")
	public ModelAndView myTeam(){
		logBefore(logger, "--进入我的团队--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			mv.setViewName("information/zhaoyiwang/myteam");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入需求大厅
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toRelease")
	public ModelAndView toRelease() throws Exception{
		logBefore(logger, "--进入需求大厅--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		if(isSession()){
			/*if(getSessionUser().getIdentity().equals("1")){
				pd.put("type", "找医生");
			}else if(getSessionUser().getIdentity().equals("2")){
				pd.put("type", "找机构");
			}else{
				pd.put("type", "找药商");
			}*/
			List list=new ArrayList<PageData>();
			List<PageData> list1=ljylShangHuService.getxuqiuList(pd);
			for(PageData tempPd:list1){
				PageData dataPd=new PageData();
				dataPd.put("user_kuhu_fid", tempPd.getString("user_kuhu_fid"));
				dataPd.put("patient_name", tempPd.getString("patient_name"));
				dataPd.put("sex", tempPd.getString("sex"));
				dataPd.put("age", tempPd.getString("age"));
				dataPd.put("address", tempPd.getString("address"));
				dataPd.put("phone", tempPd.getString("phone"));
				dataPd.put("disease", tempPd.getString("disease"));
				dataPd.put("symptom", tempPd.getString("symptom"));
				List<PageData> tempList=ljylShangHuService.getxuqiuimgList(tempPd);
				dataPd.put("xuqiuImgList", tempList);
				list.add(dataPd);
			}
			mv.addObject("searchName", pd.getString("searchName"));
			mv.addObject("list", list);
			//by yym 
			mv.addObject("shanghu_name", getSessionUser().getUserName());
			mv.addObject("shanghu_id", getSessionUser().getUser_shanghu_id());
			mv.setViewName("lvjuyanglao/shanghuduan/release/releaseZone");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入联系我们
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toContact")
	public ModelAndView toContact() throws Exception{
		logBefore(logger, "--进入联系我们--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd.put("state", "1");
			pd=ljylShangHuService.getDataOfContactUs(pd);
			mv.addObject("pd", pd);
			mv.addObject("shanghu_userId", getSessionUser().getUser_shanghu_id());
			mv.addObject("shanghu_name", getSessionUser().getUserName());
			mv.setViewName("lvjuyanglao/shanghuduan/contact/connect");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-现金金额-申请记录(我的银行卡)-添加银行卡-选择银行卡第五步：在最终确认页面进行最终确认
	 * @return
	 */
	@RequestMapping(value="/toXianJinAmountApplyAddBlankCard5")
	public ModelAndView toXianJinAmountApplyAddBlankCard5(){
		logBefore(logger, "--进入个人中心-现金金额-申请记录(我的银行卡)-添加银行卡-选择银行卡第五步：在最终确认页面进行最终确认--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			mv.setViewName("information/zhaoyiwang/cash_amount/add_bank4(待确定)");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-现金金额-申请记录(我的银行卡)-添加银行卡-选择银行卡第四步：最终确认页面
	 * @return
	 */
	@RequestMapping(value="/toXianJinAmountApplyAddBlankCard4")
	public ModelAndView toXianJinAmountApplyAddBlankCard4(){
		logBefore(logger, "--进入个人中心-现金金额-申请记录(我的银行卡)-添加银行卡-选择银行卡第四步：最终确认--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			mv.setViewName("information/zhaoyiwang/cash_amount/add_bank4");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-现金金额-申请记录(我的银行卡)-添加银行卡-选择银行卡第三步：获取并输入短信验证码页面
	 * @return
	 */
	@RequestMapping(value="/toXianJinAmountApplyAddBlankCard3")
	public ModelAndView toXianJinAmountApplyAddBlankCard3(){
		logBefore(logger, "--进入个人中心-现金金额-申请记录(我的银行卡)-添加银行卡-选择银行卡第三步：获取并输入短信验证码--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			mv.setViewName("information/zhaoyiwang/cash_amount/add_bank3");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-现金金额-申请记录(我的银行卡)-添加银行卡-选择银行卡第二步：输入手机号页面
	 * @return
	 */
	@RequestMapping(value="/toXianJinAmountApplyAddBlankCard2")
	public ModelAndView toXianJinAmountApplyAddBlankCard2(){
		logBefore(logger, "--进入个人中心-现金金额-申请记录(我的银行卡)-添加银行卡-选择银行卡第二步：输入手机号--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			mv.setViewName("information/zhaoyiwang/cash_amount/add_bank2");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-现金金额-申请记录(我的银行卡)-添加银行卡-选择银行卡第一步：输入卡号页面
	 * @return
	 */
	@RequestMapping(value="/toXianJinAmountApplyAddBlankCard1")
	public ModelAndView toXianJinAmountApplyAddBlankCard1(){
		logBefore(logger, "--进入个人中心-现金金额-申请记录(我的银行卡)-添加银行卡-选择银行卡第一步：输入卡号--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			mv.setViewName("information/zhaoyiwang/cash_amount/add_bank1");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
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
		mv.setViewName("lvjuyanglao/shanghuduan/cash_amount/mingxi");
		return mv;
	}
	/**
	 * 进入个人中心-现金金额-申请记录页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toXianJinAmountApplyRecord")
	public ModelAndView toXianJinAmountApplyRecord() throws Exception{
		logBefore(logger, "--进入商户端个人中心-现金金额-申请记录页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd=this.getPageData();
			pd.put("user_fid", getSessionUser().getUser_shanghu_id());
			//获取提现申请记录
			List<PageData> list=ljylShangHuService.getWithDrawCashList(pd);
			mv.addObject("list", list);
			System.out.println("+++++++++++++++++++++++++++++++list++"+list);
			mv.setViewName("lvjuyanglao/shanghuduan/cash_amount/applyRecord");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-现金金额-我的银行卡页面
	 * @return
	 */
	@RequestMapping(value="/toXianJinAmountMyBlankCard")
	public ModelAndView toXianJinAmountMyBlankCard(){
		logBefore(logger, "--进入个人中心-现金金额-我的银行卡页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			mv.setViewName("information/zhaoyiwang/cash_amount/add_bank0");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-现金金额-申请提现-选择银行卡页面
	 * @return
	 */
	@RequestMapping(value="/toXianJinAmountApplySelectBankCard")
	public ModelAndView toXianJinAmountApplySelectBankCard(){
		logBefore(logger, "--进入个人中心-现金金额-申请提现-选择银行卡页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			mv.setViewName("information/zhaoyiwang/cash_amount/select_bank");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-现金金额-申请提现-提现时忘记支付密码第三步：最终步骤，确认操作
	 * @return
	 */
	@RequestMapping(value="/toXianJinAmountApplyMissPassword3")
	public ModelAndView toXianJinAmountApplyMissPassword3(){
		logBefore(logger, "--进入个人中心-现金金额-申请提现-提现时忘记支付密码第三步：最终步骤，确认操作--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			mv.setViewName("information/zhaoyiwang/cash_amount/newcode(待确定)");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-现金金额-申请提现-提现时忘记支付密码第二步：输入新密码和确认密码
	 * @return
	 */
	@RequestMapping(value="/toXianJinAmountApplyMissPassword2")
	public ModelAndView toXianJinAmountApplyMissPassword2(){
		logBefore(logger, "--进入个人中心-现金金额-申请提现-提现时忘记支付密码第二步：输入新密码和确认密码--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			mv.setViewName("information/zhaoyiwang/cash_amount/newcode");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-现金金额-申请提现-提现时忘记支付密码第一步：获取短信验证码
	 * @return
	 */
	@RequestMapping(value="/toXianJinAmountApplyMissPassword1")
	public ModelAndView toXianJinAmountApplyMissPassword1(){
		logBefore(logger, "--进入个人中心-现金金额-申请提现-提现时忘记支付密码第一步：获取短信验证码--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			mv.setViewName("information/zhaoyiwang/cash_amount/setcode");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
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
			PageData shanghuPd=new PageData();
			shanghuPd.put("user_shanghu_id", getSessionUser().getUser_shanghu_id());
			shanghuPd=ljylShangHuService.getDataById(shanghuPd);
			
			pd.put("user_fid", getSessionUser().getUser_shanghu_id());
			pd.put("withdraw_cash_id", this.get32UUID());
			pd.put("serial_number", getserial_number());
			pd.put("shenqing_time", DateUtil.getTime());
			pd.put("state", "2");
			pd.put("type", "2");
			float balance_amount=(float) (Double.parseDouble(shanghuPd.get("xianjinAmount").toString())-Double.parseDouble(pd.get("amount").toString()));
			pd.put("balance_amount", balance_amount);
			
			//保存提现申请记录
			ljylShangHuService.saveWithDrawCash(pd);
			
			//更新现金金额
			shanghuPd.put("xianjinAmount", balance_amount);
			ljylShangHuService.updateXianJinAmount(shanghuPd);
			mv.setViewName("redirect:/api/ljylshangHu/toPersonXianJinAmount");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-现金金额-申请提现页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toXianJinAmountApply")
	public ModelAndView toXianJinAmountApply() throws Exception{
		logBefore(logger, "--进入个人中心-现金金额-申请提现页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd.put("user_shanghu_id", getSessionUser().getUser_shanghu_id());
			pd=ljylShangHuService.getDataById(pd);
			mv.addObject("xianjinAmount", pd.get("xianjinAmount"));
			mv.setViewName("lvjuyanglao/shanghuduan/cash_amount/apply_cash");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-现金金额页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toPersonXianJinAmount")
	public ModelAndView toPersonXianJinAmount() throws Exception{
		logBefore(logger, "--进入个人中心-现金金额页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd.put("user_shanghu_id", getSessionUser().getUser_shanghu_id());
			pd=ljylShangHuService.getDataById(pd);
			mv.addObject("pd", pd);
			mv.setViewName("lvjuyanglao/shanghuduan/cash_amount/cash_home");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-我的二维码页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toPersonMy2WeiMa")
	public ModelAndView toPersonMy2WeiMa() throws Exception{
		logBefore(logger, "--进入个人中心-我的二维码页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd.put("user_shanghu_id", getSessionUser().getUser_shanghu_id());
			pd=ljylShangHuService.getDataById(pd);
			mv.addObject("pd", pd);
			mv.setViewName("information/zhaoyiwang/2Dnum");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-我的订单页面（以及订单页面中的2-待执行，1-已完成）
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toPersonMyOrder")
	public ModelAndView toPersonMyOrder() throws Exception{
		logBefore(logger, "--进入个人中心-我的订单页面（以及订单页面中的待执行，已完成）--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd.put("order_state", "2");
			pd.put("user_shanghu_fid", getSessionUser().getUser_shanghu_id());
			List<PageData> list=new ArrayList<PageData>();
			list=ljylOrderService.getOrderOfYaoShang(pd);
			/*if(getSessionUser().getIdentity().equals("1")){
				list=ljylOrderService.getOrderOfYiSheng(pd);
			}else if(getSessionUser().getIdentity().equals("2")){
				list=ljylOrderService.getOrderOfJiGou(pd);
			}else{
				list=ljylOrderService.getOrderOfYaoShang(pd);
			}*/
			mv.addObject("list", list);
			mv.addObject("identity", getSessionUser().getIdentity());
			mv.setViewName("lvjuyanglao/shanghuduan/my_order");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-我的订单页面-2待执行，1已完成
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/personMyOrderYesOrNo")
	@ResponseBody
	public Object personMyOrderYesOrNo() throws Exception{
		logBefore(logger, "--进入个人中心-我的订单页面-2待执行，1已完成--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		String reqCode="00";
		String reqMsg="未登录";
		if(isSession()){
			reqCode="01";
			reqMsg="已登录";
			//页面传值order_state
			pd.put("user_shanghu_fid", getSessionUser().getUser_shanghu_id());
			List<PageData> list=new ArrayList<PageData>();
			/*if(getSessionUser().getIdentity().equals("1")){
				list=ljylOrderService.getOrderOfYiSheng(pd);
			}else if(getSessionUser().getIdentity().equals("2")){
				list=ljylOrderService.getOrderOfJiGou(pd);
			}else{
				list=ljylOrderService.getOrderOfYaoShang(pd);
			}*/
			list=ljylOrderService.getOrderOfYaoShang(pd);
			map.put("list", list);
			map.put("identity", getSessionUser().getIdentity());
		}
		map.put("reqCode", reqCode);
		map.put("reqMsg", reqMsg);
		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 进入个人中心-我的服务-编辑页面-点击保存操作
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/updatePersonMyService")
	public ModelAndView updatePersonMyService(
			@RequestParam(required=false) MultipartFile headImgFile,
			String fuwu_jibing_name,
			String price,
			String fuwu_id,
			String jibing_introdaction
			) throws Exception{
		logBefore(logger, "--进入个人中心-我的服务-编辑页面-点击保存操作--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData dataPd=new PageData();
			dataPd.put("fuwu_id", fuwu_id);
			//根据ID获取对象信息
			PageData pd=ljylShangHuService.getDataByIdOfService(dataPd);
			if(headImgFile!=null && !headImgFile.isEmpty()){
				//原有头像如果存在，则删除
				if(Tools.notEmpty(pd.getString("headImg"))){
					FileUtil.delFile(PathUtil.getClasspath()+pd.getString("headImg"));
				}
				String timeFolder=DateUtil.getDays(),headImgFileName="";
				String path=Const.FILEPATHIMG + "shangHu/" + "headImg/" + timeFolder + "/";
				String filePath=PathUtil.getClasspath() + path;
				headImgFileName=FileUpload.fileUp(headImgFile, filePath, this.get32UUID());
				dataPd.put("headImg", path+headImgFileName);
			}else{
				dataPd.put("headImg", pd.getString("headImg"));
			}
			dataPd.put("addTime", DateUtil.getTime());
			dataPd.put("fuwu_jibing_name", fuwu_jibing_name);
			dataPd.put("price", price);
			dataPd.put("jibing_introdaction", jibing_introdaction);
			ljylShangHuService.updateService(dataPd);
			mv.setViewName("redirect:/api/ljylshangHu/toPersonMyService");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-我的服务-删除服务
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/deletePersonMyService")
	public ModelAndView deletePersonMyService() throws Exception{
		logBefore(logger, "--进入个人中心-我的服务-删除服务--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd=this.getPageData();
			ljylShangHuService.deleteService(pd);
			mv.setViewName("redirect:/api/ljylshangHu/toPersonMyService");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-我的服务-编辑页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toPersonMyServiceEdit")
	public ModelAndView toPersonMyServiceEdit() throws Exception{
		logBefore(logger, "--进入个人中心-我的服务-编辑页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd=this.getPageData();
			pd=ljylShangHuService.getDataByIdOfService(pd);
			mv.addObject("pd", pd);
			mv.addObject("titleMsg", "编辑产品");
			
			if(getSessionUser().getIdentity().equals("1")){
				mv.addObject("msg", "updatePersonMyService");
				mv.setViewName("lvjuyanglao/shanghuduan/addFuwu");
			}else{
				mv.addObject("msg", "updatePersonMyService1");
				mv.setViewName("lvjuyanglao/shanghuduan/add_service");
			}
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-我的服务-添加页面-点击保存操作
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/savePersonMyServiceAdd")
	public ModelAndView savePersonMyServiceAdd(
			@RequestParam(required=false) MultipartFile headImgFile,
			String fuwu_jibing_name,
			String price,
			String type,
			String jibing_introdaction
			) throws Exception{
		logBefore(logger, "--进入个人中心-我的服务-添加页面-点击保存操作--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			//上传图片
			String timeFolder=DateUtil.getDays(),headImgFileName="";
			String path=Const.FILEPATHIMG + "shangHu/" + "headImg/" + timeFolder + "/";
			String filePath=PathUtil.getClasspath() + path;
			headImgFileName=FileUpload.fileUp(headImgFile, filePath, this.get32UUID());
			pd.put("headImg", path+headImgFileName);
			
			pd.put("fuwu_id", this.get32UUID());
			pd.put("fuwu_jibing_name", fuwu_jibing_name);
			pd.put("price", price);
			pd.put("jibing_introdaction", jibing_introdaction);
			pd.put("addTime", DateUtil.getTime());
			pd.put("type", type);
			pd.put("user_shanghu_fid", getSessionUser().getUser_shanghu_id());
			ljylShangHuService.saveService(pd);
			mv.setViewName("redirect:/api/ljylshangHu/toPersonMyService");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 保存医生服务
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/updatePersonMyService1")
	public ModelAndView updatePersonMyService1() throws Exception{
		logBefore(logger, "--保存医生服务--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData dataPd=new PageData();
			dataPd=this.getPageData();
			dataPd.put("addTime", DateUtil.getTime());
			dataPd.put("headImg", "");
			ljylShangHuService.updateService(dataPd);
			mv.setViewName("redirect:/api/ljylshangHu/toPersonMyService");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-我的服务-添加页面-点击服务疾病-进入常见服务疾病页面-点击疾病返回添加服务页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/backToPersonMyServiceAdd")
	public ModelAndView backToPersonMyServiceAdd() throws Exception{
		logBefore(logger, "--进入个人中心-我的服务-添加页面-点击服务疾病-进入常见服务疾病页面-点击疾病返回添加服务页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd=this.getPageData();
			PageData tempPd=ljylShangHuService.getDataByIdOfService(pd);
			tempPd.put("fuwu_jibing_name", pd.getString("fuwu_jibing_name"));
			mv.addObject("pd",tempPd);
			if(pd.getString("mark").equals("add")){
				mv.addObject("titleMsg", "添加服务");
			}else{
				mv.addObject("titleMsg", "编辑服务");
			}
			mv.addObject("msg", "updatePersonMyService1");
			mv.setViewName("information/zhaoyiwang/add_service");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-我的服务-添加页面-点击服务疾病-进入常见服务疾病页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toPersonMyServiceAddJiBing")
	public ModelAndView toPersonMyServiceAddJiBing() throws Exception{
		logBefore(logger, "--进入个人中心-我的服务-添加页面-点击服务疾病-进入常见服务疾病页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd=this.getPageData();
			String fuwu_id=this.get32UUID();
			String mark="edit";
			if(pd.getString("msg").equals("savePersonMyServiceAdd")){
				//执行一步操作
				if(Tools.isEmpty(pd.getString("price"))){
					pd.put("price", 0);
				}
				pd.put("fuwu_id", fuwu_id);
				pd.put("addTime", DateUtil.getTime());
				pd.put("type", getSessionUser().getIdentity());
				pd.put("user_shanghu_fid", getSessionUser().getUser_shanghu_id());
				ljylShangHuService.saveService(pd);
				mark="add";
			}else if(pd.getString("msg").equals("updatePersonMyService1")){
				PageData temp1=new PageData();
				temp1.put("fuwu_id", pd.getString("fuwu_id"));
				temp1.put("addTime", DateUtil.getTime());
				temp1.put("fuwu_jibing_name", pd.getString("fuwu_jibing_name"));
				temp1.put("jibing_introdaction", pd.getString("jibing_introdaction"));
				if(Tools.isEmpty(pd.getString("price"))){
					temp1.put("price", 0);
				}
				temp1.put("price", pd.getString("price"));
				temp1.put("headImg", "");
				ljylShangHuService.updateService(temp1);
			}
			//查询疾病（默认查询字母a的疾病）
			PageData pd1=new PageData();
			pd1.put("letter", "a");
			List<PageData> list=ljylShangHuService.getJiBingListByLetter(pd1);
			//返回初始疾病集合
			mv.addObject("list", list);
			mv.addObject("fuwu_id", pd.getString("fuwu_id"));
			mv.addObject("mark", mark);
			mv.setViewName("information/zhaoyiwang/changjianDisease");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-我的服务-添加页面
	 * @return
	 */
	@RequestMapping(value="/toPersonMyServiceAdd")
	public ModelAndView toPersonMyServiceAdd(){
		logBefore(logger, "--进入个人中心-我的服务-添加页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd=this.getPageData();
			mv.addObject("titleMsg", "添加产品");
			mv.addObject("msg", "savePersonMyServiceAdd");
			mv.addObject("pd", pd);
			if(getSessionUser().getIdentity().equals("1")){
				mv.setViewName("lvjuyanglao/shanghuduan/addFuwu");
			}else{
				mv.setViewName("information/zhaoyiwang/add_service");
			}
			
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-我的服务页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toPersonMyService")
	public ModelAndView toPersonMyService() throws Exception{
		logBefore(logger, "--进入个人中心-我的服务页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd.put("user_shanghu_fid", getSessionUser().getUser_shanghu_id());
			List<PageData> serviceList=ljylShangHuService.getServiceList(pd);
			if(serviceList!=null && !serviceList.isEmpty()){
				for (int i = 0; i < serviceList.size(); i++) {
					PageData tempPd=serviceList.get(i);
					if (Tools.isEmpty(tempPd.getString("jibing_introdaction"))
							|| Tools.isEmpty(tempPd.getString("fuwu_jibing_name"))
							|| Tools.isEmpty(tempPd.get("price").toString())) {
						ljylShangHuService.deleteService(tempPd);
						serviceList.remove(tempPd);
					}
				}
			}
			mv.addObject("type", getSessionUser().getIdentity());
			mv.addObject("serviceList", serviceList);
			mv.setViewName("lvjuyanglao/shanghuduan/my_service");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-我的积分页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toPersonMyJiFen")
	public ModelAndView toPersonMyJiFen() throws Exception{
		logBefore(logger, "--进入个人中心-我的积分页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			//获取我的积分
			PageData pd=new PageData();
			pd.put("user_shanghu_id", getSessionUser().getUser_shanghu_id());
			pd=ljylShangHuService.getDataById(pd);
			//获取积分兑换股权的信息
			PageData tempPd=ljylShangHuService.getDataOfJiFenHuanGuQuan(pd);
			
			pd.put("jifen_num", tempPd.getString("jifen_num"));
			pd.put("guquan_num", tempPd.getString("guquan_num"));
			mv.addObject("pd", pd);
			mv.setViewName("information/zhaoyiwang/mineJifen");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
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
			pd.put("user_shanghu_id", getSessionUser().getUser_shanghu_id());
			pd=ljylShangHuService.getDataById(pd);
			//获取积分兑换股权的信息
			PageData tempPd=ljylShangHuService.getDataOfJiFenHuanGuQuan(pd);
			
			DecimalFormat df = new DecimalFormat("#0.00000");  
			//更新积分和股权信息
			pd.put("integral", Integer.parseInt(pd.get("integral").toString()) - Integer.parseInt(tempPd.get("jifen_num").toString()));
			pd.put("guquan", df.format(Double.parseDouble(pd.get("guquan").toString()) + Double.parseDouble(tempPd.get("guquan_num").toString())));
			ljylShangHuService.updateJiFenAndGuQuan(pd);
			
			map.put("respCode", "01");
		}else{
			map.put("respCode", "00");
		}
		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 进入个人中心-我的股权页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toPersonMyGuQuan")
	public ModelAndView toPersonMyGuQuan() throws Exception{
		logBefore(logger, "--进入个人中心-我的股权页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd.put("user_shanghu_id", getSessionUser().getUser_shanghu_id());
			pd=ljylShangHuService.getDataById(pd);
			mv.addObject("pd", pd);
			mv.setViewName("information/zhaoyiwang/myGuQuan");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-我的虚拟币页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toPersonMyXuNiBi")
	public ModelAndView toPersonMyXuNiBi() throws Exception{
		logBefore(logger, "--进入个人中心-我的虚拟币页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd.put("user_shanghu_id", getSessionUser().getUser_shanghu_id());
			pd=ljylShangHuService.getDataById(pd);
			mv.addObject("pd", pd);
			mv.setViewName("information/zhaoyiwang/myXuNiBi");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-成交金额-成交记录页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toChengJiaoInformation")
	public ModelAndView toChengJiaoInformation() throws Exception{
		logBefore(logger, "--进入个人中心-成交金额-成交记录页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd=this.getPageData();
			pd.put("user_shanghu_fid", getSessionUser().getUser_shanghu_id());
			List<PageData> list=new ArrayList<PageData>();
			/*if(getSessionUser().getIdentity().equals("1")){
				list=ljylShangHuService.getChengJiaoJiLuList(pd);
			}else if(getSessionUser().getIdentity().equals("2")){
				list=ljylShangHuService.getChengJiaoJiLuList1(pd);
			}else{
				list=ljylShangHuService.getChengJiaoJiLuList2(pd);
			}*/
			list=ljylShangHuService.getChengJiaoJiLuList2(pd);
			mv.addObject("list", list);
			mv.addObject("identity", getSessionUser().getIdentity());
			mv.setViewName("lvjuyanglao/shanghuduan/chengjiaoRecord");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-成交金额页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toPersonShangHuMoney")
	public ModelAndView toPersonShangHuMoney() throws Exception{
		logBefore(logger, "--进入个人中心-成交金额页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd.put("user_shanghu_id", getSessionUser().getUser_shanghu_id());
			pd=ljylShangHuService.getDataById(pd);
			mv.addObject("pd", pd);
			mv.setViewName("lvjuyanglao/shanghuduan/shanghuMoney");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-申请开店页面-提交申请
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/savePersonApplyStore")
	public ModelAndView savePersonApplyStore(
			@RequestParam(required=false) MultipartFile[] imgFile,
			String shenqingMethod
			) throws Exception{
		logBefore(logger, "--进入个人中心-申请开店页面-提交申请--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			System.out.println("=========================上传店内环境图的个数为："+imgFile.length);
			//自定义头像的保存路径
			String  imgfolder = Const.FILEPATHIMG + "shangHu/apply/" + DateUtil.getDays() + "/";
			String filePath = PathUtil.getClasspath() + imgfolder;	//文件上传路径
			//执行上传操作,获取文件名
			
			if(imgFile.length>0 && imgFile[0].getSize()!=0){
				for (int i = 0; i < imgFile.length; i++) {
					if(imgFile[i]!=null && !imgFile[i].isEmpty()){
						PageData tPd=new PageData();
						tPd.put("imgpath_apply_id", this.get32UUID());
						tPd.put("shenqingMethod", shenqingMethod);
						tPd.put("user_shanghu_fid", getSessionUser().getUser_shanghu_id());
						String imgName = FileUpload.fileUp(imgFile[i], filePath, this.get32UUID());
						tPd.put("imgPath", imgfolder + imgName);
						ljylShangHuService.saveApplyImgPath(tPd);
					}
				}
			}else{
				
			}
			//改变认证状态以及开店认证申请时间
			PageData temp=new PageData();
			temp.put("user_shanghu_id", getSessionUser().getUser_shanghu_id());
			temp.put("identity", getSessionUser().getIdentity());
			temp.put("renZhengState", "2");
			temp.put("renZhengApplyTime", DateUtil.getTime());
			ljylShangHuService.updateStateAndTime(temp);
			mv.setViewName("redirect:/api/ljylshangHu/toPersonCenter");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-申请开店页面
	 * @return
	 */
	@RequestMapping(value="/toPersonApplyStore")
	public ModelAndView toPersonApplyStore(){
		logBefore(logger, "--进入个人中心-申请开店页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			mv.setViewName("lvjuyanglao/shanghuduan/applyStore");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-设置-案例-添加页面-点击保存
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/saveSettingExampleAdd")
	public ModelAndView saveSettingExampleAdd(
			@RequestParam(required=false) MultipartFile imgPathFile,
			String title,
			String detailContent
			) throws Exception{
		logBefore(logger, "--进入个人中心-设置-案例-添加页面-点击保存--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			
			String path=Const.FILEPATHIMG + "shangHu/" + "headImg/" + DateUtil.getDays() + "/";
			String filePath=PathUtil.getClasspath() + path;
			String imgPathFileName=FileUpload.fileUp(imgPathFile, filePath, this.get32UUID());
			pd.put("imgPath", path+imgPathFileName);
			
			pd.put("title", title);
			pd.put("detailContent", detailContent);
			pd.put("anli_zhanshi_id", this.get32UUID());
			pd.put("addTime", DateUtil.getTime());
			pd.put("user_shanghu_fid", getSessionUser().getUser_shanghu_id());
			ljylShangHuService.saveAnLiInformation(pd);
			mv.setViewName("redirect:/api/shangHu/toSettingExample");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-设置-案例-添加页面
	 * @return
	 */
	@RequestMapping(value="/toSettingExampleAdd")
	public ModelAndView toSettingExampleAdd(){
		logBefore(logger, "--进入个人中心-设置-案例-添加页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			mv.addObject("titleMsg", "添加案例");
			mv.addObject("msg", "saveSettingExampleAdd");
			mv.setViewName("information/zhaoyiwang/addExample");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-设置-案例-编辑页面-点击保存
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/saveSettingExampleEdit")
	public ModelAndView saveSettingExampleEdit(
			@RequestParam(required=false) MultipartFile imgPathFile,
			String title,
			String detailContent,
			String anli_zhanshi_id
			) throws Exception{
		logBefore(logger, "--进入个人中心-设置-案例-编辑页面-点击保存--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd.put("anli_zhanshi_id", anli_zhanshi_id);
			pd=ljylShangHuService.getAnLiDataById(pd);
			
			if(imgPathFile!=null && !imgPathFile.isEmpty()){
				String path=Const.FILEPATHIMG + "shangHu/" + "headImg/" + DateUtil.getDays() + "/";
				String filePath=PathUtil.getClasspath() + path;
				String imgPathFileName=FileUpload.fileUp(imgPathFile, filePath, this.get32UUID());
				pd.put("imgPath", path+imgPathFileName);
			}else{
				pd.put("imgPath", pd.getString("imgPath"));
			}
			pd.put("addTime", DateUtil.getTime());
			pd.put("title", title);
			pd.put("detailContent", detailContent);
			ljylShangHuService.updateAnLiInformation(pd);
			mv.setViewName("redirect:/api/shangHu/toSettingExample");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-设置-案例-编辑页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toSettingExampleEdit")
	public ModelAndView toSettingExampleEdit() throws Exception{
		logBefore(logger, "--进入个人中心-设置-案例-编辑页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd=this.getPageData();
			pd=ljylShangHuService.getAnLiDataById(pd);
			mv.addObject("pd", pd);
			mv.addObject("titleMsg", "编辑案例");
			mv.addObject("msg", "saveSettingExampleEdit");
			mv.setViewName("information/zhaoyiwang/addExample");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-设置-案例-点击删除
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/deleteSettingExample")
	public ModelAndView deleteSettingExample() throws Exception{
		logBefore(logger, "--进入个人中心-设置-案例-点击删除--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd=this.getPageData();
			ljylShangHuService.deleteAnLiById(pd);
			mv.setViewName("redirect:/api/shangHu/toSettingExample");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-设置-案例页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toSettingExample")
	public ModelAndView toSettingExample() throws Exception{
		logBefore(logger, "--进入个人中心-设置-案例页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd.put("user_shanghu_fid", getSessionUser().getUser_shanghu_id());
			List<PageData> list=ljylShangHuService.getAnLiList(pd);
			mv.addObject("list", list);
			mv.setViewName("information/zhaoyiwang/example");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-设置-擅长领域页面-点击保存
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/saveSettingGoodField")
	public ModelAndView saveSettingGoodField() throws Exception{
		logBefore(logger, "--进入个人中心-设置-擅长领域页面-点击保存--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd=this.getPageData();
			pd.put("user_shanghu_id", getSessionUser().getUser_shanghu_id());
			pd.put("identity", getSessionUser().getIdentity());
			ljylShangHuService.updatePersonIntroductOrGoodsField(pd);
			mv.setViewName("redirect:/api/ljylshangHu/toPersonCenterSetting");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-设置-擅长领域页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toSettingGoodField")
	public ModelAndView toSettingGoodField() throws Exception{
		logBefore(logger, "--进入个人中心-设置-擅长领域页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData tempPd=new PageData();
			tempPd.put("user_shanghu_id", getSessionUser().getUser_shanghu_id());
			tempPd.put("identity", getSessionUser().getIdentity());
			PageData pd=ljylShangHuService.getDataByIdAndIdentity(tempPd);
			mv.addObject("pd", pd);
			mv.setViewName("lvjuyanglao/shanghuduan/goodAtArea");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-设置-个人简介页面-点击保存
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/saveSettingPersonIntroduct")
	public ModelAndView saveSettingPersonIntroduct() throws Exception{
		logBefore(logger, "--进入个人中心-设置-个人简介页面-点击保存--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd=this.getPageData();
			pd.put("user_shanghu_id", getSessionUser().getUser_shanghu_id());
			pd.put("identity", getSessionUser().getIdentity());
			ljylShangHuService.updatePersonIntroductOrGoodsField(pd);
			mv.setViewName("redirect:/api/ljylshangHu/toPersonCenterSetting");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-设置-个人简介页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toSettingPersonIntroduct")
	public ModelAndView toSettingPersonIntroduct(HttpSession session) throws Exception{
		logBefore(logger, "--进入个人中心-设置-个人简介页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData tempPd=new PageData();
			tempPd.put("user_shanghu_id", getSessionUser().getUser_shanghu_id());
			tempPd.put("identity", getSessionUser().getIdentity());
			PageData pd=ljylShangHuService.getDataByIdAndIdentity(tempPd);
			mv.addObject("pd", pd);
			mv.setViewName("lvjuyanglao/shanghuduan/persJianjie");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-设置-个人信息页面-点击保存
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/savePersonInformation")
	public ModelAndView savePersonInformation(
			@RequestParam(required=false) MultipartFile headImgFile,
			String youName,
			String position,
			String mark,
			String linkMethod,
			String address,
			String category,
			String keshiName,
			String dengji,
			String city
			) throws Exception{
		logBefore(logger, "--进入个人中心-设置-个人信息页面-点击保存--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData dataPd=new PageData();
			dataPd.put("user_shanghu_id", getSessionUser().getUser_shanghu_id());
			dataPd.put("identity", getSessionUser().getIdentity());
			//根据ID获取对象信息
			PageData pd=ljylShangHuService.getDataByIdAndIdentity(dataPd);
			if(headImgFile!=null && !headImgFile.isEmpty()){
				//原有头像如果存在，则删除
				if(Tools.notEmpty(pd.getString("headImg"))){
					FileUtil.delFile(PathUtil.getClasspath()+pd.getString("headImg"));
				}
				String timeFolder=DateUtil.getDays(),headImgFileName="";
				String path=Const.FILEPATHIMG + "shangHu/" + "headImg/" + timeFolder + "/";
				String filePath=PathUtil.getClasspath() + path;
				headImgFileName=FileUpload.fileUp(headImgFile, filePath, this.get32UUID());
				dataPd.put("headImg", path+headImgFileName);
				/*//删除原有的二维码
				if(Tools.notEmpty(pd.getString("erWeiMaImg"))){
					FileUtil.delFile(PathUtil.getClasspath()+pd.getString("erWeiMaImg"));
				}
				//生成带logo的新的二维码
				String content=BaseController.getPath(getRequest())+"api/zywkehu/toRegister2.do?type=2&twoDimensioncode_id="+getSessionUser().getUser_shanghu_id();
				String imgPath=BaseController.getPath(getRequest())+path+headImgFileName;
				String destPath=Const.FILEPATHIMG+"shangHu/erweima/"+DateUtil.getDays()+"/";
				String imgName=this.get32UUID()+".jpg";
				QRCodeUtil.encode(content, imgPath, PathUtil.getClasspath()+destPath, imgName, true);
				dataPd.put("erWeiMaImg", destPath+imgName);
				//更新用户二维码
				ljylShangHuService.updateErWeiMa(dataPd);*/
			}else{
				dataPd.put("headImg", pd.getString("headImg"));
			}
			dataPd.put("youName", youName);
			dataPd.put("position", position);
			dataPd.put("mark", mark);
			dataPd.put("linkMethod", linkMethod);
			dataPd.put("address", address);
			dataPd.put("category", category);
			dataPd.put("dengji", dengji);
			dataPd.put("keshiName", keshiName);
			dataPd.put("city", city);
			ljylShangHuService.updatePersonInformation(dataPd);
			mv.setViewName("redirect:/api/ljylshangHu/toPersonCenterSetting");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-设置-个人信息页面-科类选择页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toSettingPersonInformationKeLei")
	public ModelAndView toSettingPersonInformationKeLei(
			@RequestParam(required=false) MultipartFile headImgFile,
			String youName,
			String position,
			String mark,
			String linkMethod,
			String address,
			String category
			) throws Exception{
		logBefore(logger, "--进入个人中心-设置-个人信息页面-科类选择页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData dataPd=new PageData();
			dataPd.put("user_shanghu_id", getSessionUser().getUser_shanghu_id());
			//根据ID获取对象信息
			PageData pd=ljylShangHuService.getDataById(dataPd);
			if(headImgFile!=null && !headImgFile.isEmpty()){
				//原有头像如果存在，则删除
				if(Tools.notEmpty(pd.getString("headImg"))){
					FileUtil.delFile(PathUtil.getClasspath()+pd.getString("headImg"));
				}
				String timeFolder=DateUtil.getDays(),headImgFileName="";
				String path=Const.FILEPATHIMG + "shangHu/" + "headImg/" + timeFolder + "/";
				String filePath=PathUtil.getClasspath() + path;
				headImgFileName=FileUpload.fileUp(headImgFile, filePath, this.get32UUID());
				dataPd.put("headImg", path+headImgFileName);
				//删除原有的二维码
				if(Tools.notEmpty(pd.getString("erWeiMaImg"))){
					FileUtil.delFile(PathUtil.getClasspath()+pd.getString("erWeiMaImg"));
				}
				//生成带logo的新的二维码
				String content=BaseController.getPath(getRequest())+"api/zywkehu/toRegister2.do?type=2&twoDimensioncode_id="+getSessionUser().getUser_shanghu_id();
				String imgPath=BaseController.getPath(getRequest())+path+headImgFileName;
				String destPath=Const.FILEPATHIMG+"shangHu/erweima/"+DateUtil.getDays()+"/";
				String imgName=this.get32UUID()+".jpg";
				QRCodeUtil.encode(content, imgPath, PathUtil.getClasspath()+destPath, imgName, true);
				dataPd.put("erWeiMaImg", destPath+imgName);
				//更新用户二维码
				ljylShangHuService.updateErWeiMa(dataPd);
			}else{
				dataPd.put("headImg", pd.getString("headImg"));
			}
			dataPd.put("youName", youName);
			dataPd.put("position", position);
			dataPd.put("mark", mark);
			dataPd.put("linkMethod", linkMethod);
			dataPd.put("address", address);
			dataPd.put("category", category);
			ljylShangHuService.updatePersonInformation(dataPd);
			//获取顶级科室的名称列表
			pd.put("parent_id", "0");
			List<PageData> listtop=ljylShangHuService.getkeLeiList(pd);
			//获取第一个顶级科室下的子科类
			pd.put("parent_id", listtop.get(0).getString("kelei_id"));
			List<PageData> listchild=ljylShangHuService.getkeLeiList(pd);
			mv.addObject("listtop", listtop);
			mv.addObject("listchild", listchild);
			mv.setViewName("information/zhaoyiwang/xuanzeKelei");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心-设置-个人信息页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toSettingPersonInformation")
	public ModelAndView toSettingPersonInformation() throws Exception{
		logBefore(logger, "--进入个人中心-设置-个人信息页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData tempPd=new PageData();
			tempPd=this.getPageData();
			tempPd.put("user_shanghu_id", getSessionUser().getUser_shanghu_id());
			tempPd.put("identity", getSessionUser().getIdentity());
			PageData pd=ljylShangHuService.getDataByIdAndIdentity(tempPd);
			
			/*if(Tools.notEmpty(tempPd.getString("keshiName"))){
				pd.put("keshiName", tempPd.getString("keshiName"));
			}*/
			System.out.println("=================getSessionUser().getIdentity()=============="+getSessionUser().getIdentity());
			/*if(getSessionUser().getIdentity().equals("1")){
				mv.setViewName("lvjuyanglao/shanghuduan/persXinxi1");
			}else{
				if(getSessionUser().getIdentity().equals("2")){
					List<PageData> list=ljylShangHuService.getJiGouTypeList(tempPd);
					mv.addObject("list", list);
				}
				mv.setViewName("lvjuyanglao/shanghuduan/persXinxi1");
			}*/
			mv.setViewName("lvjuyanglao/shanghuduan/persXinxi1");
			mv.addObject("pd", pd);
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心中的设置页面（个人资料页面）
	 * @return
	 */
	@RequestMapping(value="/toPersonCenterSetting")
	public ModelAndView toPersonCenterSetting(){
		logBefore(logger, "--进入个人中心中的设置页面（个人资料页面）--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			mv.setViewName("lvjuyanglao/shanghuduan/personalData");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 进入个人中心页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toPersonCenter")
	public ModelAndView toPersonCenter() throws Exception{
		logBefore(logger, "--进入个人中心页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData tempPd=new PageData();
			tempPd.put("user_shanghu_id", getSessionUser().getUser_shanghu_id());
			tempPd.put("user_shanghu_fid", getSessionUser().getUser_shanghu_id());
			tempPd.put("shanghu_name", getSessionUser().getUserName());
			tempPd.put("identity", getSessionUser().getIdentity());
			PageData pd=ljylShangHuService.getDataByIdAndIdentity(tempPd);
			List<PageData> list=ljylShangHuService.getServiceList(tempPd);
			mv.addObject("pd", pd);
			mv.addObject("list", list);
			mv.addObject("tempPd", tempPd);
			mv.setViewName("lvjuyanglao/shanghuduan/center_home");
		}else{
			mv.setViewName("redirect:/api/shangHu/toLogin");
		}
		return mv;
	}
	/**
	 * 判断个人资料是否完善
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/isPerfectPersonInformation")
	@ResponseBody
	public Object isPerfectPersonInformation() throws Exception{
		logBefore(logger, "--判断个人资料是否完善--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		
		String respCode = "01";
		String respMsg="信息已完善";
		
		//获取session信息
		ShangHu shangHu=getSessionUser();
		//根据商户的主键ID和身份获取对应的基本信息2017-9-18 15:18:44
		pd.put("user_shanghu_id", shangHu.getUser_shanghu_id());
		pd.put("identity", shangHu.getIdentity());
		PageData pd1=ljylShangHuService.getDataByIdAndIdentity(pd);
		
		/*if(pd.getString("identity").equals("1")){
			if (Tools.isEmpty(pd.getString("headImg"))
					|| Tools.isEmpty(pd.getString("youName"))
					|| Tools.isEmpty(pd.getString("position"))
					|| Tools.isEmpty(pd.getString("mark"))
					|| Tools.isEmpty(pd.getString("linkMethod"))
					|| Tools.isEmpty(pd.getString("address"))
					|| Tools.isEmpty(pd.getString("introduct"))
					|| Tools.isEmpty(pd.getString("goodField"))
					|| Tools.isEmpty(pd.getString("keshiName"))) {
					respCode="00";
					respMsg="您的信息尚未完善,点击确定去完善信息!";
				}
		}else{
			if (Tools.isEmpty(pd.getString("headImg"))
					|| Tools.isEmpty(pd.getString("youName"))
					|| Tools.isEmpty(pd.getString("address"))) {
					respCode="00";
					respMsg="您的信息尚未完善,点击确定去完善信息!";
				}
		}*/
		System.out.println(pd1.getString("headImg"));
		System.out.println(pd1.getString("introduct"));
		System.out.println(pd1.getString("goodField"));
		if (Tools.isEmpty(pd1.getString("headImg")) || Tools.isEmpty(pd1.getString("introduct")) || Tools.isEmpty(pd1.getString("goodField"))) {
			respCode="00";
			respMsg="您的信息尚未完善,点击确定去完善信息!";
		}
		
		map.put("respCode", respCode);
		map.put("respMsg", respMsg);
		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 判断店铺申请状态
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/isStateApplyStore")
	@ResponseBody
	public Object isStateApplyStore() throws Exception{
		logBefore(logger, "--判断店铺申请状态--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd1=new PageData();
		PageData pd=new PageData();
		
		String respCode = "";
		String respMsg="";
		String respMsgPc="";
		
		//获取session信息
		ShangHu shangHu=getSessionUser();
		//根据商户的主键ID和身份获取对应的基本信息2017-9-18 15:18:44
		pd.put("user_shanghu_id", shangHu.getUser_shanghu_id());
		pd.put("identity", shangHu.getIdentity());
		pd=ljylShangHuService.getDataByIdAndIdentity(pd);
		
		if(pd.getString("renZhengState").equals("3")){
			respCode="03";
			respMsg="还未认证";
			respMsgPc="您还未进行商家资质认证,点击确定进行认证!";
		}else if(pd.getString("renZhengState").equals("2")){
			respCode="02";
			respMsg="等待审核";
		}else if(pd.getString("renZhengState").equals("1")){
			respCode="01";
			respMsg="认证通过";
		}else {
			respCode="00";
			respMsg="认证失败";
			respMsgPc="您的商家资质认证结果失败,点击确定进行重新认证!";
		}
		
		map.put("respCode", respCode);
		map.put("respMsg", respMsg);
		map.put("respMsgPc", respMsgPc);
		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 进入页面
	 * @return
	 */
	@RequestMapping(value="/toRegister")
	public ModelAndView toRegister(){
		logBefore(logger, "--进入注册页面--");
		ModelAndView mv=new ModelAndView();
		mv.setViewName("lvjuyanglao/shanghuduan/register");
		return mv;
	}
	/**
	 * 注册
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/register")
	@ResponseBody
	public Object register(HttpServletRequest request) throws Exception{
		logBefore(logger, "--注册--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		PageData pdUserName=new PageData();
		pdUserName.put("userName", pd.getString("userName"));
		pdUserName.put("identity", pd.getString("identity"));
		PageData pdPhone=new PageData();
		pdPhone.put("phone", pd.getString("phone"));
		pdPhone.put("identity", pd.getString("identity"));
		//根据用户名或者手机号查询对象信息
		PageData tempUserName=ljylShangHuService.getDataByNameOrPhone(pdUserName);
		PageData tempPhone=ljylShangHuService.getDataByNameOrPhone(pdPhone);
		Map rMap = new HashMap();
		//
		String respCode = "00";
		String respMsg="";
		if(tempUserName!=null){//该用户名已经存在
			respMsg="该用户名已经存在";
		}else{
			if(tempPhone!=null){//该手机号已经注册
				respMsg="该手机号已经注册";
			}else{
				
				/*//获取IM返回的accid和 token
				rMap = RegisterIMUser.registerUser(pd.getString("userName"));
				if(rMap.get("code").equals("414")){
					respMsg="该用户名已经存在";
				}else if(rMap.get("code").equals("200")){
					map.put("accid", rMap.get("accid"));
					map.put("token", rMap.get("token"));*/
					//====执行注册====
					respCode="01";
					respMsg="注册成功";
					String user_shanghu_id=this.get32UUID();
					pd.put("user_shanghu_id", user_shanghu_id);//主键ID
					pd.put("renZhengState", "3");//认证状态，3-待认证
					pd.put("loginPassword", MD5.md5(pd.getString("loginPassword")));//密码
					pd.put("registerTime", DateUtil.getTime());//注册时间	
					pd.put("last_login_time", DateUtil.getTime());//最近登陆时间	
					pd.put("ip", request.getRemoteHost());//ip地址	
					pd.put("status", "1");//1 使用中 0 已停用
					pd.put("bz", "app用户");
					pd.put("top", "0");
					pd.put("accid", "");
					pd.put("token", "");
					//获取注册送积分
					pd.put("integral", ljylShangHuService.getDataOfJiFenZhuCe(pd).get("jifen_zhuce_number"));
					//获取注册送虚拟币
					pd.put("xunibi", ljylShangHuService.getDataOfXuNiBi(pd).get("xunibi_number"));
					//获取注册送股权
					pd.put("guquan", ljylShangHuService.getDataOfGuQuan(pd).get("guquan_number"));
					ljylShangHuService.saveShangHu(pd);
					
					//by yym 加一个注册就插数据到分销表中
					//默认保存一条数据到分销表中，主键作为顶级id
					PageData djpd = new PageData();
					djpd.put("fenxiao_id", this.get32UUID());
					djpd.put("dingji_id", user_shanghu_id);
					djpd.put("yiji_id", "");
					djpd.put("erji_id", "");
					djpd.put("type", "2");
					ljylKeHuService.saveFenXiao(djpd);
				}
			
			}
		map.put("respCode", respCode);
		map.put("respMsg", respMsg);
		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 忘记登录密码第3步：保存更改密码
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toLoginMissPassword3")
	@ResponseBody
	public Object toLoginMissPassword3() throws Exception{
		logBefore(logger, "--忘记登录密码第3步：保存更改密码--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		String respCode = "00";
		String respMsg="";
		//验证该手机号是否已经注册
		PageData tpd=ljylShangHuService.getDataByNameOrPhone(pd);
		if(tpd==null){
			respMsg="该手机号尚未注册!";
		}else{
			PageData tempPd=new PageData();
			tempPd.put("phone", pd.getString("phone"));
			tempPd.put("identity", pd.getString("identity"));
			tempPd.put("loginPassword", MD5.md5(pd.getString("newPassword")));
			ljylShangHuService.updatePasswordByPhone(tempPd);
			respMsg="修改成功";
			respCode = "01";
		}
		map.put("respMsg", respMsg);
		map.put("respCode", respCode);
		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 忘记登录密码第2步：输入新密码
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toLoginMissPassword2")
	public ModelAndView toLoginMissPassword2(){
		logBefore(logger, "--忘记登录密码第2步：输入新密码--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		if(pd==null){
			mv.setViewName("redirect:/api/shangHu/toLoginMissPassword1");
		}else{
			mv.addObject("phone", pd.getString("phone"));
			mv.addObject("identity", pd.getString("identity"));
			mv.setViewName("lvjuyanglao/shanghuduan/newPass");
		}
		return mv;
	}
	
	
	/**
	 * 忘记登录密码第一步：短信验证
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toLoginMissPassword1")
	public ModelAndView toLoginMissPassword1(){
		logBefore(logger, "--忘记登录密码第一步：短信验证--");
		ModelAndView mv=new ModelAndView();
		mv.setViewName("lvjuyanglao/shanghuduan/searchPass");
		return mv;
	}
	
	
	/**
	 * IM跳转
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toIMIndex")
	public ModelAndView toIMIndex(){
		logBefore(logger, "--去IM首页--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.addObject("pd", pd);
		mv.setViewName("information/zhaoyiwang/index");
		return mv;
	}
	
	
	
	
	
	
	/**
	 * 进入登录页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toLogin")
	public ModelAndView toLogin(){
		logBefore(logger, "--进入登录页面--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.addObject("pd", pd);
		mv.setViewName("lvjuyanglao/shanghuduan/login");
		return mv;
	}
	/**
	 * 退出登录
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/removeLogin")
	public ModelAndView removeLogin(HttpSession session){
		logBefore(logger, "--退出登录--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.addObject("pd", pd);
		session.removeAttribute(Const.SESSION_SHANGHU_USER);
		mv.setViewName("lvjuyanglao/shanghuduan/login");
		return mv;
	}
	/**
	 * 登录
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/login")
	@ResponseBody
	public Object login(HttpSession session,HttpServletRequest request) throws Exception{
		logBefore(logger, "--登录--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		PageData tempPd=new PageData();
		
		String respCode = "00";
		String respMsg="用户名或密码错误";
		//先判断是以用户名的方式登录还是手机号登录
		if(isNumeric(pd.getString("loginName"))){
			tempPd.put("phone", pd.getString("loginName"));
		}else{
			tempPd.put("userName", pd.getString("loginName"));
		}
		tempPd.put("loginPassword", MD5.md5(pd.getString("loginPassword")));
		tempPd.put("identity", pd.getString("identity"));
		//判断该用户名或者手机号是否在该平台注册
		PageData pdTemp=ljylShangHuService.getDataByNameOrPhone(tempPd);
		if(pdTemp==null){
			respMsg="用户不存在";
		}else{
			PageData tempData=ljylShangHuService.getDataByNameAndPawAndIdentity(tempPd);
			if(tempData!=null){
				respCode="01";
				respMsg="登录成功";
				//创建session
				//createSession(tempData.getString("user_shanghu_id"));
				ShangHu shangHu=new ShangHu();
				shangHu.setUser_shanghu_id(tempData.getString("user_shanghu_id"));
				shangHu.setPhone(tempData.getString("phone"));
				shangHu.setUserName(tempData.getString("userName"));
				shangHu.setIdentity(tempData.getString("identity"));
				session.setAttribute(Const.SESSION_SHANGHU_USER,shangHu);
				//判断客户session是否存在，销毁客户session
				session.removeAttribute(Const.SESSION_KEHU_USER);
				//更新登录时间和登录IP
				PageData temp=new PageData();
				temp.put("last_login_time", DateUtil.getTime());//最近登陆时间	
				temp.put("ip", request.getRemoteHost());//ip地址	
				temp.put("user_shanghu_id", tempData.getString("user_shanghu_id"));
				ljylShangHuService.updateIpAndTime(temp);
				
				//该操作是为了只有一个身份登录
				session.removeAttribute(Const.SESSION_KEHU_USER);
			}
		}
		map.put("respCode", respCode);
		map.put("respMsg", respMsg);
		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 获取短信验证码
	 * @return
	 */
	@RequestMapping(value="/getSms")
	@ResponseBody
	public Object getSms(){
		logBefore(logger, "--获取短信验证码--");
		PageData pd = new PageData();
		pd= this.getPageData();
		Map<String,String> map = new HashMap<String,String>();
		String phone = pd.getString("phone");
		String resultCode  = miaodiyunUtil.sendMsM(phone);
		map.put("phone", phone);
		if(Tools.notEmpty(resultCode)){
			map.put("yanzhengma",resultCode);
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
		ShangHu shangHu=(ShangHu) session.getAttribute(Const.SESSION_SHANGHU_USER);
		if(shangHu==null){
			return false;
		}
		return true;
	}
	/**
	 * 获取session对象
	 * @return
	 */
	public ShangHu getSessionUser(){
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		ShangHu shangHu=(ShangHu) session.getAttribute(Const.SESSION_SHANGHU_USER);
		return shangHu;
	}
	/**
	 * 保留两位小数
	 * @param str
	 * @return
	 */
	public String ddd(String str){
		DecimalFormat df = new DecimalFormat("#0.00");  
		return df.format(str);
	}
	/**
	 * 创建用户session
	 * @throws Exception 
	 */
	public void createSession(String user_shanghu_id) throws Exception{
		PageData pd=new PageData();
		pd.put("user_shanghu_id", user_shanghu_id);
		PageData tempData=ljylShangHuService.getDataByNameOrPhone(pd);
		ShangHu shangHu=new ShangHu();
		shangHu.setUser_shanghu_id(tempData.getString("user_shanghu_id"));
		shangHu.setPhone(tempData.getString("phone"));
		shangHu.setUserName(tempData.getString("userName"));
		/*shangHu.setAddress(tempData.getString("address"));
		shangHu.setHeadImg(tempData.getString("headImg"));
		shangHu.setLinkMethod(tempData.getString("linkMethod"));
		shangHu.setMark(tempData.getString("mark"));
		shangHu.setPosition(tempData.getString("position"));
		shangHu.setYouName(tempData.getString("youName"));
		shangHu.setXianjinAmount(Double.parseDouble(tempData.get("xianjinAmount").toString()));
		shangHu.setIntegral(Integer.parseInt(tempData.get("integral").toString()));*/
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		session.setAttribute(Const.SESSION_SHANGHU_USER,shangHu);
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
	
///////////////////////////////////////////////////////////医生部分////网站后台功能//////////////////////////////////
	/**
	 * 获取医生列表
	 * @param page
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getyishenglistPage")
	public ModelAndView getyishenglistPage(Page page) throws Exception{
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		List<PageData> list=ljylShangHuService.getyishenglistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.addObject("msg", pd.getString("identity"));
		mv.addObject("msg1", pd.getString("renZhengState"));
		System.out.println("================pd.getString()===="+pd.getString("identity"));
		mv.setViewName("lvjuyanglao/yishengList/yishengList_list");
		return mv;
	}
	/**
	 * 认证审核操作
	 * @param page
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/yishengChenked")
	public void yishengChenked(PrintWriter writer) throws Exception{
		logBefore(logger, "后台医生审核操作");
		Map<String, Object> map =new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		String id[]=pd.getString("ids").split(",");
		List<String> ids=new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			ids.add(id[i]);
		}
		map.put("ids", ids);
		map.put("renZhengBackTime", DateUtil.getTime());
		map.put("renZhengState", pd.getString("renZhengState"));
		ljylShangHuService.yishengChenked(map);
		writer.close();
	}
	/**
	 * 改变账号状态操作
	 * @param page
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/yishengStatus")
	public void yishengStatus(PrintWriter writer) throws Exception{
		logBefore(logger, "---改变账号状态操作--");
		PageData pd=new PageData();
		pd=this.getPageData();
		ljylShangHuService.yishengStatus(pd);
		writer.close();
	}
	/**
	 * 获取基本信息
	 * @param page
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getBaseInformation")
	@ResponseBody
	public Object getBaseInformation() throws Exception{
		logBefore(logger, "---获取基本信息--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd=ljylShangHuService.getDataById(pd);
		map.put("pd", pd);
		System.out.println("获取基本信息pd:"+pd);
 		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 获取开店申请资料
	 * @param page
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getRenZhengInformation")
	@ResponseBody
	public Object getRenZhengInformation() throws Exception{
		logBefore(logger, "---获取开店申请资料--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		List<PageData> list=ljylShangHuService.getRenZhengInformation(pd);
		map.put("list", list);
		System.out.println("获取基本信息list:"+list);
 		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 获取医生服务列表
	 * @param page
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getyishengfuwulistPage")
	public ModelAndView getyishengfuwulistPage(Page page) throws Exception{
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		List<PageData> list=ljylShangHuService.getyishengfuwulistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("lvjuyanglao/yishengfuwuList/yishengfuwuList_list");
		return mv;
	}
	/**
	 * 根据ID获取服务的详情
	 * @param page
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getYiShengServiceDetailInformation")
	@ResponseBody
	public Object getYiShengServiceDetailInformation() throws Exception{
		logBefore(logger, "---根据ID获取服务的详情--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd=ljylShangHuService.getDataByIdOfService1(pd);
		map.put("pd", pd);
		System.out.println("获取基本信息pd:"+pd);
 		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 置顶
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value="/topShangHu")
	public void topShangHu(PrintWriter writer) throws Exception{
		logBefore(logger, "---置顶--");
		PageData pd=new PageData();
		pd=this.getPageData();
		ljylShangHuService.topShangHu(pd);
		writer.close();
	}
	
///////////////////////////////////////////////////////////系统管理:联系我们////网站后台功能//////////////////////////////////
	/**
	 * 获取联系我们列表
	 * @param page
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/contactuslistPage")
	public ModelAndView contactuslistPage(Page page) throws Exception{
		logBefore(logger, "---获取联系我们列表--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		List<PageData> list=ljylShangHuService.contactuslistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("lvjuyanglao/contactus/contactus_list");
		return mv;
	}
	/**
	 * 进入联系我们添加页
	 * @return
	 */
	@RequestMapping(value="/toAddContactUs")
	public ModelAndView toAddContactUs(){
		logBefore(logger, "---进入联系我们添加页--");
		ModelAndView mv=new ModelAndView();
		mv.addObject("msg", "insertContactUs");
		mv.setViewName("lvjuyanglao/contactus/contactus_edit");
		return mv;
	}
	/**
	 * 添加联系我们
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/insertContactUs")
	public ModelAndView insertContactUs() throws Exception{
		logBefore(logger, "---添加联系我们--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd.put("contactus_id", this.get32UUID());
		ljylShangHuService.insertContactUs(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 进入联系我们编辑页
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toEditContactUs")
	public ModelAndView toEditContactUs() throws Exception{
		logBefore(logger, "---进入联系我们编辑页--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd=ljylShangHuService.getContactUsById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "updateContactUs");
		mv.setViewName("lvjuyanglao/contactus/contactus_edit");
		return mv;
	}
	/**
	 * 修改联系我们
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/updateContactUs")
	public ModelAndView updateContactUs() throws Exception{
		logBefore(logger, "---修改联系我们--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		ljylShangHuService.updateContactUs(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 根据ID删除指定对象(联系我们)的信息
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteContactUsById")
	public void deleteContactUsById(PrintWriter writer) throws Exception{
		logBefore(logger, "---根据ID删除指定对象(联系我们)的信息--");
		PageData pd=new PageData();
		Map<String, Object> map=new HashMap<String, Object>();
		pd=this.getPageData();
		String id[]=pd.getString("ids").split(",");
		List<String> ids=new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			ids.add(id[i]);
		}
		map.put("ids", ids);
		ljylShangHuService.deleteContactUsById(map);
		writer.close();
	}
///////////////////////////////////////////////////////////新闻公告////网站后台功能//////////////////////////////////
	/**
	 * 获取新闻公告列表
	 * @param page
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getnewsandnoticelistPage")
	public ModelAndView getnewsandnoticelistPage(Page page) throws Exception{
		logBefore(logger, "---获取新闻公告列表--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		List<PageData> list=ljylShangHuService.getnewsandnoticelistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("lvjuyanglao/newsandnotice/newsandnotice_list");
		return mv;
	}
	/**
	 * 获取新闻公告的详情
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getNewsAndNoticeDetaileInformation")
	@ResponseBody
	public Object getNewsAndNoticeDetaileInformation() throws Exception{
		logBefore(logger, "---获取新闻公告的详情--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd=ljylShangHuService.getNewsAndNoticeById(pd);
		map.put("pd", pd);
		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 进入新闻公告添加页
	 * @return
	 */
	@RequestMapping(value="/toAddNewsAndNotice")
	public ModelAndView toAddNewsAndNotice(){
		logBefore(logger, "---进入新闻公告添加页--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		mv.addObject("category",pd.getString("category"));
		mv.addObject("msg", "insertNewsAndNotice");
		mv.setViewName("lvjuyanglao/newsandnotice/newsandnotice_edit");
		return mv;
	}
	/**
	 * 添加新闻公告
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/insertNewsAndNotice")
	public ModelAndView insertNewsAndNotice(
			@RequestParam(required=false) MultipartFile imgPthFile,
			String title,
			String content,
			String origin,
			String top,
			String category
			) throws Exception{
		logBefore(logger, "---添加新闻公告--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		if(imgPthFile!=null && !imgPthFile.isEmpty()){
			//自定义图片的保存路径
			String  logoImgfolder = Const.FILEPATHIMG + "newsandnotice/" + DateUtil.getDays() + "/";
			String filePath = PathUtil.getClasspath() + logoImgfolder;	//文件上传路径
			//执行上传操作,获取文件名
			String imgPthName = FileUpload.fileUp(imgPthFile, filePath, this.get32UUID());
			pd.put("imgPth", logoImgfolder + imgPthName);
		}else{
			pd.put("imgPth", "");
		}
		pd.put("newsandnotice_id", this.get32UUID());
		pd.put("category", category);
		pd.put("title", title);
		pd.put("content", content);
		pd.put("origin", origin);
		pd.put("top", "0");
		pd.put("addTime", DateUtil.getTime());
		ljylShangHuService.insertNewsAndNotice(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 进入新闻公告编辑页
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toEditNewsAndNotice")
	public ModelAndView toEditNewsAndNotice() throws Exception{
		logBefore(logger, "---进入新闻公告编辑页--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd=ljylShangHuService.getNewsAndNoticeById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "updateNewsAndNotice");
		mv.setViewName("lvjuyanglao/newsandnotice/newsandnotice_edit");
		return mv;
	}
	/**
	 * 修改新闻公告
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/updateNewsAndNotice")
	public ModelAndView updateNewsAndNotice(
			@RequestParam(required=false) MultipartFile imgPthFile,
			String title,
			String content,
			String origin,
			String newsandnotice_id
			) throws Exception{
		logBefore(logger, "---修改新闻公告--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd.put("newsandnotice_id", newsandnotice_id);
		PageData temp=ljylShangHuService.getNewsAndNoticeById(pd);
		if(imgPthFile!=null && !imgPthFile.isEmpty()){
			if(Tools.notEmpty(temp.getString("imgPth"))){
				//删除已存在的图片
				File oldFile=new File(PathUtil.getClasspath()+temp.getString("imgPth"));
				if(oldFile.exists()){
					oldFile.delete();
				}
			}
			//自定义图片的保存路径
			String  logoImgfolder = Const.FILEPATHIMG + "newsandnotice/" + DateUtil.getDays() + "/";
			String filePath = PathUtil.getClasspath() + logoImgfolder;	//文件上传路径
			//执行上传操作,获取文件名
			String imgPthName = FileUpload.fileUp(imgPthFile, filePath, this.get32UUID());
			pd.put("imgPth", logoImgfolder + imgPthName);
		}else{
			pd.put("imgPth", temp.getString("imgPth"));
		}
		pd.put("title", title);
		pd.put("content", content);
		pd.put("origin", origin);
		pd.put("addTime", DateUtil.getTime());
		ljylShangHuService.updateNewsAndNotice(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 根据ID删除指定对象(新闻公告)的信息
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteNewsAndNoticeById")
	public void deleteNewsAndNoticeById(PrintWriter writer) throws Exception{
		logBefore(logger, "---根据ID删除指定对象(新闻公告)的信息--");
		PageData pd=new PageData();
		Map<String, Object> map=new HashMap<String, Object>();
		pd=this.getPageData();
		String id[]=pd.getString("ids").split(",");
		List<String> ids=new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			ids.add(id[i]);
		}
		map.put("ids", ids);
		ljylShangHuService.deleteNewsAndNoticeById(map);
		writer.close();
	}

	/**
	 * 置顶
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value="/topNewsAndNotice")
	public void topNewsAndNotice(PrintWriter writer) throws Exception{
		logBefore(logger, "---置顶--");
		PageData pd=new PageData();
		pd=this.getPageData();
		pd.put("addTime", DateUtil.getTime());
		ljylShangHuService.topNewsAndNotice(pd);
		writer.close();
	}
///////////////////////////////////////////////////////////常见疾病////网站后台功能//////////////////////////////////
	/**
	 * 获取常见疾病列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getjibinglistPage")
	public ModelAndView getjibinglistPage(Page page) throws Exception {
		logBefore(logger, "---获取常见疾病列表--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> list = ljylShangHuService.getjibinglistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("lvjuyanglao/changjianjibing/changjianjibing_list");
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
		mv.setViewName("lvjuyanglao/changjianjibing/changjianjibing_edit2");
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
		mv.setViewName("lvjuyanglao/changjianjibing/changjianjibing_edit2");
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
		
		System.out.println("-----------------"+pd.getString("context"));
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
///////////////////////////////////////////////////////////科类名称////网站后台功能//////////////////////////////////
	/**
	 * 获取科类名称列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/keleilistPage")
	public ModelAndView keleilistPage(Page page) throws Exception {
		logBefore(logger, "---获取科类名称列表--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> list = ljylShangHuService.keleilistPage(page);
		mv.addObject("list", list);
		mv.setViewName("information/kelei/kelei_list");
		return mv;
	}
	/**
	 * 获取科类名称列表(no Page)
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getkeLeiList")
	@ResponseBody
	public Object getkeLeiList() throws Exception {
		logBefore(logger, "---获取科类名称列表(no Page)--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> list = ljylShangHuService.getkeLeiList(pd);
		map.put("list", list);
		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 判断该科类名称是否存在
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/isNameOfKeLeiExistence")
	@ResponseBody
	public Object isNameOfKeLeiExistence() throws Exception {
		logBefore(logger, "---判断该科类名称是否存在--");
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData tempPd = ljylShangHuService.getKeLeiByNameAndParentid(pd);
		String reqCode = "00";
		String reqMsg = "该科类名称已存在";
		if (tempPd == null) {
			reqCode = "01";
			reqMsg = "该科类名称不存在";
		}
		map.put("reqCode", reqCode);
		map.put("reqMsg", reqMsg);
		return AppUtil.returnObject(pd, map);
	}

	/**
	 * 进入科类名称添加页
	 * 
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/toAddKeLei")
	public ModelAndView toAddKeLei() throws Exception {
		logBefore(logger, "---进入科类名称添加页--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd.put("parent_id", "0");
		//获取科室名称列表
		List<PageData> list=ljylShangHuService.getkeLeiList(pd);
		mv.addObject("msg", "insertKeLei");
		mv.addObject("list", list);
		mv.setViewName("information/kelei/kelei_add");
		return mv;
	}
	/**
	 * 根据parentid获取科类
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getKeLeiListByParentId")
	@ResponseBody
	public Object getKeLeiListByParentId() throws Exception{
		logBefore(logger, "---根据parentid获取科类--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		List<PageData> list=ljylShangHuService.getkeLeiList(pd);
		map.put("list", list);
		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 添加科类名称
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertKeLei")
	public ModelAndView insertKeLei() throws Exception {
		logBefore(logger, "---添加科类名称--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("kelei_id", this.get32UUID());
		pd.put("addTime", DateUtil.getTime());
		ljylShangHuService.insertKeLei(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 进入科类名称编辑页
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/toEditKeLei")
	public ModelAndView toEditKeLei() throws Exception {
		logBefore(logger, "---进入科类名称编辑页--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = ljylShangHuService.getKeLeiById(pd);
		mv.addObject("pd", pd);
		PageData tempPd=new PageData();
		tempPd.put("parent_id", "0");
		List<PageData> list=ljylShangHuService.getkeLeiList(tempPd);
		mv.addObject("list", list);
		mv.addObject("msg", "updateKeLei");
		mv.setViewName("information/kelei/kelei_add");
		return mv;
	}

	/**
	 * 修改科类名称
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateKeLei")
	public ModelAndView updateKeLei() throws Exception {
		logBefore(logger, "---修改科类名称--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("addTime", DateUtil.getTime());
		ljylShangHuService.updateKeLei(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 根据ID删除指定对象(科类名称)的信息
	 * 
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteKeLeiById")
	public void deleteKeLeiById(PrintWriter writer) throws Exception {
		logBefore(logger, "---根据ID删除指定对象(科类名称)的信息--");
		PageData pd = new PageData();
		pd=this.getPageData();
		PageData temp=ljylShangHuService.getKeLeiById(pd);
		if(temp.getString("parent_id").equals("0")){
			pd.put("parent_id", pd.getString("kelei_id"));
			ljylShangHuService.deleteKeLeiById(pd);
			ljylShangHuService.deleteKeLeiByParentid(pd);
		}else{
			ljylShangHuService.deleteKeLeiById(pd);
		}
		writer.close();
	}

// /////////////////////////////////////////////////////////会员部分////网站后台功能//////////////////////////////////
	/**
	 * 获取会员列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/gethuiyuanlistPage")
	public ModelAndView gethuiyuanlistPage(Page page) throws Exception {
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> list = ljylShangHuService.gethuiyuanlistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("lvjuyanglao/huiyuanList/huiyuanList_list");
		return mv;
	}
	/**
	 * 改变账号状态操作
	 * @param page
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/huiyuanStatus")
	public void huiyuanStatus(PrintWriter writer) throws Exception{
		logBefore(logger, "---改变账号状态操作--");
		PageData pd=new PageData();
		pd=this.getPageData();
		ljylShangHuService.huiyuanStatus(pd);
		writer.close();
	}
	/**
	 * 获取需求列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getxuqiulistPage")
	public ModelAndView getxuqiulistPage(Page page) throws Exception {
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> list = ljylShangHuService.getxuqiulistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("lvjuyanglao/xuqiuList/xuqiuList_list");
		return mv;
	}
	/**
	 * 根据需求表的主键ID获取对应的需求图片
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getxuqiuimgList")
	@ResponseBody
	public Object getxuqiuimgList() throws Exception {
		logBefore(logger, "---根据需求表的主键ID获取对应的需求图片--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> list = ljylShangHuService.getxuqiuimgList(pd);
		System.out.println("+++++++++++++++++++需求列表list+"+list);
		map.put("list", list);
		return AppUtil.returnObject(pd, map);
	}
///////////////////////////////////////////////////////////注册送积分////网站后台功能//////////////////////////////////
	/**
	 * 获取注册送积分列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getjifenzhucelistPage")
	public ModelAndView getjifenzhucelistPage(Page page) throws Exception {
		logBefore(logger, "---获取注册送积分列表--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> list = ljylShangHuService.getjifenzhucelistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("lvjuyanglao/jifenzhuce/jifenzhuce_list");
		return mv;
	}

	/**
	 * 进入注册送积分添加页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/toAddJiFenZhuCe")
	public ModelAndView toAddJiFenZhuCe() {
		logBefore(logger, "---进入注册送积分添加页--");
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "insertJiFenZhuCe");
		mv.setViewName("lvjuyanglao/jifenzhuce/jifenzhuce_edit");
		return mv;
	}

	/**
	 * 添加注册送积分
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertJiFenZhuCe")
	public ModelAndView insertJiFenZhuCe() throws Exception {
		logBefore(logger, "---添加注册送积分--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("jifen_zhuce_id", this.get32UUID());
		ljylShangHuService.insertJiFenZhuCe(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 进入注册送积分编辑页
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/toEditJiFenZhuCe")
	public ModelAndView toEditJiFenZhuCe() throws Exception {
		logBefore(logger, "---进入注册送积分编辑页--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = ljylShangHuService.getJiFenZhuCeById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "updateJiFenZhuCe");
		mv.setViewName("lvjuyanglao/jifenzhuce/jifenzhuce_edit");
		return mv;
	}

	/**
	 * 修改注册送积分
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateJiFenZhuCe")
	public ModelAndView updateJiFenZhuCe() throws Exception {
		logBefore(logger, "---修改注册送积分--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		ljylShangHuService.updateJiFenZhuCe(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 根据ID删除指定对象(注册送积分)的信息
	 * 
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteJiFenZhuCeById")
	public void deleteJiFenZhuCeById(PrintWriter writer) throws Exception {
		logBefore(logger, "---根据ID删除指定对象(注册送积分)的信息--");
		PageData pd = new PageData();
		pd=this.getPageData();
		ljylShangHuService.deleteJiFenZhuCeById(pd);
		writer.close();
	}
///////////////////////////////////////////////////////////技术费用扣除比例////网站后台功能//////////////////////////////////
	/**
	 * 获取技术费用扣除比例列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getjishufuwubililistPage")
	public ModelAndView getjishufuwubililistPage(Page page) throws Exception {
		logBefore(logger, "---获取技术费用扣除比例列表--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> list = ljylShangHuService.getjishufuwubililistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("lvjuyanglao/jishufuwubili/jishufuwubili_list");
		return mv;
	}

	/**
	 * 进入技术费用扣除比例添加页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/toAddJiShuFuWuBiLi")
	public ModelAndView toAddJiShuFuWuBiLi() {
		logBefore(logger, "---进入技术费用扣除比例添加页--");
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "insertJiShuFuWuBiLi");
		mv.setViewName("lvjuyanglao/jishufuwubili/jishufuwubili_edit");
		return mv;
	}

	/**
	 * 添加技术费用扣除比例
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertJiShuFuWuBiLi")
	public ModelAndView insertJiShuFuWuBiLi() throws Exception {
		logBefore(logger, "---添加技术费用扣除比例--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("bili_jishufuwu_id", this.get32UUID());
		ljylShangHuService.insertJiShuFuWuBiLi(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 进入技术费用扣除比例编辑页
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/toEditJiShuFuWuBiLi")
	public ModelAndView toEditJiShuFuWuBiLi() throws Exception {
		logBefore(logger, "---进入技术费用扣除比例编辑页--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = ljylShangHuService.getJiShuFuWuBiLiById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "updateJiShuFuWuBiLi");
		mv.setViewName("lvjuyanglao/jishufuwubili/jishufuwubili_edit");
		return mv;
	}

	/**
	 * 修改技术费用扣除比例
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateJiShuFuWuBiLi")
	public ModelAndView updateJiShuFuWuBiLi() throws Exception {
		logBefore(logger, "---修改技术费用扣除比例--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		ljylShangHuService.updateJiShuFuWuBiLi(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 根据ID删除指定对象(技术费用扣除比例)的信息
	 * 
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteJiShuFuWuBiLiById")
	public void deleteJiShuFuWuBiLiById(PrintWriter writer) throws Exception {
		logBefore(logger, "---根据ID删除指定对象(技术费用扣除比例)的信息--");
		PageData pd = new PageData();
		pd = this.getPageData();
		ljylShangHuService.deleteJiShuFuWuBiLiById(pd);
		writer.close();
	}

	// /////////////////////////////////////////////////////////分销管理：积分设置////网站后台功能//////////////////////////////////
	/**
	 * 获取分销管理：积分设置列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getjifenlistPage")
	public ModelAndView getjifenlistPage(Page page) throws Exception {
		logBefore(logger, "---获取分销管理：积分设置列表--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> list = ljylShangHuService.getjifenlistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("lvjuyanglao/jifenfenxiao/jifenfenxiao_list");
		return mv;
	}

	/**
	 * 进入分销管理：积分设置添加页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/toAddJiFen")
	public ModelAndView toAddJiFen() {
		logBefore(logger, "---进入分销管理：积分设置添加页--");
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "insertJiFen");
		mv.setViewName("information/jifenfenxiao/jifenfenxiao_edit");
		return mv;
	}

	/**
	 * 添加分销管理：积分设置
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertJiFen")
	public ModelAndView insertJiFen() throws Exception {
		logBefore(logger, "---添加分销管理：积分设置比例--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("jifen_id", this.get32UUID());
		ljylShangHuService.insertJiFen(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 进入分销管理：积分设置编辑页
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/toEditJiFen")
	public ModelAndView toEditJiFen() throws Exception {
		logBefore(logger, "---进入分销管理：积分设置编辑页--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = ljylShangHuService.getJiFenById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "updateJiFen");
		mv.setViewName("information/jifenfenxiao/jifenfenxiao_edit");
		return mv;
	}

	/**
	 * 修改分销管理：积分设置
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateJiFen")
	public ModelAndView updateJiFen() throws Exception {
		logBefore(logger, "---修改分销管理：积分设置--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		ljylShangHuService.updateJiFen(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 根据ID删除指定对象(分销管理：积分设置)的信息
	 * 
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteJiFenById")
	public void deleteJiFenById(PrintWriter writer) throws Exception {
		logBefore(logger, "---根据ID删除指定对象(分销管理：积分设置)的信息--");
		PageData pd = new PageData();
		pd = this.getPageData();
		ljylShangHuService.deleteJiFenById(pd);
		writer.close();
	}
	// /////////////////////////////////////////////////////////分销管理：提成设置////网站后台功能//////////////////////////////////
	/**
	 * 获取分销管理：提成设置列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getfenxiaobililistPage")
	public ModelAndView getfenxiaobililistPage(Page page) throws Exception {
		logBefore(logger, "---获取分销管理：提成设置列表--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> list = ljylShangHuService.getfenxiaobililistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("lvjuyanglao/bilifenxiao/bilifenxiao_list");
		return mv;
	}

	/**
	 * 进入分销管理：提成设置添加页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/toAddFenXiaoBiLi")
	public ModelAndView toAddFenXiaoBiLi() {
		logBefore(logger, "---进入分销管理：提成设置添加页--");
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "insertFenXiaoBiLi");
		mv.setViewName("information/bilifenxiao/bilifenxiao_edit");
		return mv;
	}

	/**
	 * 添加分销管理：提成设置
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertFenXiaoBiLi")
	public ModelAndView insertFenXiaoBiLi() throws Exception {
		logBefore(logger, "---添加分销管理：提成设置比例--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("bili_fenxiao_id", this.get32UUID());
		ljylShangHuService.insertFenXiaoBiLi(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 进入分销管理：提成设置编辑页
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/toEditFenXiaoBiLi")
	public ModelAndView toEditFenXiaoBiLi() throws Exception {
		logBefore(logger, "---进入分销管理：提成设置编辑页--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = ljylShangHuService.getFenXiaoBiLiById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "updateFenXiaoBiLi");
		mv.setViewName("information/bilifenxiao/bilifenxiao_edit");
		return mv;
	}

	/**
	 * 修改分销管理：提成设置
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateFenXiaoBiLi")
	public ModelAndView updateFenXiaoBiLi() throws Exception {
		logBefore(logger, "---修改分销管理：提成设置--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		ljylShangHuService.updateFenXiaoBiLi(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 根据ID删除指定对象(分销管理：提成设置)的信息
	 * 
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteFenXiaoBiLiById")
	public void deleteFenXiaoBiLiById(PrintWriter writer) throws Exception {
		logBefore(logger, "---根据ID删除指定对象(分销管理：提成设置)的信息--");
		PageData pd = new PageData();
		pd = this.getPageData();
		ljylShangHuService.deleteFenXiaoBiLiById(pd);
		writer.close();
	}
///////////////////////////////////////////////////////////名著管理////网站后台功能//////////////////////////////////
	/**
	 * 获取名著列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mingzhulistPage")
	public ModelAndView getmingzhulistPage(Page page) throws Exception {
		logBefore(logger, "---获取名著列表--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> list = ljylShangHuService.getmingzhulistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("lvjuyanglao/mingzhu/mingzhu_list");
		return mv;
	}

	/**
	 * 判断该名著名称是否存在
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/isNameOfMingZhuExistence")
	@ResponseBody
	public Object isNameOfMingZhuExistence() throws Exception {
		logBefore(logger, "---判断该名著名称是否存在--");
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData tempPd = ljylShangHuService.getMingZhuByName(pd);
		String reqCode = "00";
		String reqMsg = "该名称已存在";
		if (tempPd == null) {
			reqCode = "01";
			reqMsg = "该名称不存在";
		}
		map.put("reqCode", reqCode);
		map.put("reqMsg", reqMsg);
		return AppUtil.returnObject(pd, map);
	}

	/**
	 * 进入名著添加页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/toAddJMingZhu")
	public ModelAndView toAddMingZhu() {
		logBefore(logger, "---进入名著添加页--");
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "insertMingZhu");
		mv.setViewName("information/mingzhu/mingzhu_edit");
		return mv;
	}

	/**
	 * 添加名著
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertMingZhu")
	public ModelAndView insertMingZhu(
			@RequestParam(required=false) MultipartFile imgPathFile,
			String mingzhuName,
			String mingzhuLink			
			) throws Exception {
		logBefore(logger, "---添加名著--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		if(imgPathFile!=null && !imgPathFile.isEmpty()){
			//自定义图片的保存路径
			String  logoImgfolder = Const.FILEPATHIMG + "mingzhu/" + DateUtil.getDays() + "/";
			String filePath = PathUtil.getClasspath() + logoImgfolder;	//文件上传路径
			//执行上传操作,获取文件名
			String imgPthName = FileUpload.fileUp(imgPathFile, filePath, this.get32UUID());
			pd.put("imgPath", logoImgfolder + imgPthName);
		}else{
			pd.put("imgPath", "");
		}
		pd.put("mingzhu_id", this.get32UUID());
		pd.put("addTime", DateUtil.getTime());
		pd.put("mingzhuName", mingzhuName);
		pd.put("mingzhuLink", mingzhuLink);
		ljylShangHuService.insertMingZhu(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 进入名著编辑页
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/toEditMingZhu")
	public ModelAndView toEditMingZhu() throws Exception {
		logBefore(logger, "---进入名著编辑页--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = ljylShangHuService.getMingZhuById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "updateMingZhu");
		mv.setViewName("information/mingzhu/mingzhu_edit");
		return mv;
	}

	/**
	 * 修改名著
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateMingZhu")
	public ModelAndView updateMingZhu(
			@RequestParam(required=false) MultipartFile imgPathFile,
			String mingzhuName,
			String mingzhuLink,
			String mingzhu_id			
			) throws Exception {
		logBefore(logger, "---修改名著--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd.put("mingzhu_id", mingzhu_id);
		PageData temp=ljylShangHuService.getMingZhuById(pd);
		if(imgPathFile!=null && !imgPathFile.isEmpty()){
			if(Tools.notEmpty(temp.getString("imgPath"))){
				//删除已存在的图片
				File oldFile=new File(PathUtil.getClasspath()+temp.getString("imgPath"));
				if(oldFile.exists()){
					oldFile.delete();
				}
			}
			//自定义图片的保存路径
			String  logoImgfolder = Const.FILEPATHIMG + "mingzhu/" + DateUtil.getDays() + "/";
			String filePath = PathUtil.getClasspath() + logoImgfolder;	//文件上传路径
			//执行上传操作,获取文件名
			String imgPthName = FileUpload.fileUp(imgPathFile, filePath, this.get32UUID());
			pd.put("imgPath", logoImgfolder + imgPthName);
		}else{
			pd.put("imgPath", temp.getString("imgPath"));
		}
		pd.put("mingzhuName", mingzhuName);
		pd.put("mingzhuLink", mingzhuLink);
		pd.put("addTime", DateUtil.getTime());
		ljylShangHuService.updateMingZhu(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 根据ID删除指定对象(名著)的信息
	 * 
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteMingZhuById")
	public void deleteMingZhuById(PrintWriter writer) throws Exception {
		logBefore(logger, "---根据ID删除指定对象(名著)的信息--");
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<String, Object>();
		pd = this.getPageData();
		String id[] = pd.getString("ids").split(",");
		List<String> ids = new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			ids.add(id[i]);
		}
		map.put("ids", ids);
		ljylShangHuService.deleteMingZhuById(map);
		writer.close();
	}
///////////////////////////////////////////////////////////注册送股权////网站后台功能//////////////////////////////////
	/**
	 * 获取注册送股权列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getguquanlistPage")
	public ModelAndView getguquanlistPage(Page page) throws Exception {
		logBefore(logger, "---获取注册送股权列表--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> list = ljylShangHuService.getguquanlistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("lvjuyanglao/guquanzhuce/guquanzhuce_list");
		return mv;
	}

	/**
	 * 进入注册送股权添加页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/toAddGuQuan")
	public ModelAndView toAddGuQuan() {
		logBefore(logger, "---进入注册送股权添加页--");
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "insertGuQuan");
		mv.setViewName("lvjuyanglao/guquanzhuce/guquanzhuce_edit");
		return mv;
	}

	/**
	 * 添加注册送股权
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertGuQuan")
	public ModelAndView insertGuQuan() throws Exception {
		logBefore(logger, "---添加注册送股权--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("guquan_id", this.get32UUID());
		ljylShangHuService.insertGuQuan(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}
	
	
	

	/**
	 * 进入注册送股权编辑页
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/toEditGuQuan")
	public ModelAndView toEditGuQuan() throws Exception{
		logBefore(logger, "---进入注册送股权编辑页--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = ljylShangHuService.getGuQuanById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "updateGuQuan");
		mv.setViewName("lvjuyanglao/guquanzhuce/guquanzhuce_edit");
		return mv;
	}

	/**
	 * 修改注册送股权
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateGuQuan")
	public ModelAndView updateGuQuan() throws Exception {
		logBefore(logger, "---修改注册送股权--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		ljylShangHuService.updateGuQuan(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 根据ID删除指定对象(注册送股权)的信息
	 * 
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteGuQuanById")
	public void deleteGuQuanById(PrintWriter writer) throws Exception {
		logBefore(logger, "---根据ID删除指定对象(注册送股权)的信息--");
		PageData pd = new PageData();
		pd = this.getPageData();
		ljylShangHuService.deleteGuQuanById(pd);
		writer.close();
	}
///////////////////////////////////////////////////////////注册送虚拟币////网站后台功能//////////////////////////////////
	/**
	 * 获取注册送虚拟币列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getxunibilistPage")
	public ModelAndView getxunibilistPage(Page page) throws Exception {
		logBefore(logger, "---获取注册送虚拟币列表--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> list = ljylShangHuService.getxunibilistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("lvjuyanglao/xunibizhuce/xunibizhuce_list");
		return mv;
	}

	/**
	 * 进入注册送虚拟币添加页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/toAddXuNiBi")
	public ModelAndView toAddXuNiBi() {
		logBefore(logger, "---进入注册送虚拟币添加页--");
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "insertXuNiBi");
		mv.setViewName("lvjuyanglao/xunibizhuce/xunibizhuce_edit");
		return mv;
	}

	/**
	 * 添加注册送虚拟币
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertXuNiBi")
	public ModelAndView insertXuNiBi() throws Exception {
		logBefore(logger, "---添加注册送虚拟币--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("xunibi_id", this.get32UUID());
		ljylShangHuService.insertXuNiBi(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 进入注册送虚拟币编辑页
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/toEditXuNiBi")
	public ModelAndView toEditXuNiBi() throws Exception {
		logBefore(logger, "---进入注册送虚拟币编辑页--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = ljylShangHuService.getXuNiBiById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "updateXuNiBi");
		mv.setViewName("lvjuyanglao/xunibizhuce/xunibizhuce_edit");
		return mv;
	}

	/**
	 * 修改注册送虚拟币
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateXuNiBi")
	public ModelAndView updateXuNiBi() throws Exception {
		logBefore(logger, "---修改注册送虚拟币--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		ljylShangHuService.updateXuNiBi(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 根据ID删除指定对象(注册送虚拟币)的信息
	 * 
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteXuNiBiById")
	public void deleteXuNiBiById(PrintWriter writer) throws Exception {
		logBefore(logger, "---根据ID删除指定对象(注册送虚拟币)的信息--");
		PageData pd = new PageData();
		pd = this.getPageData();
		ljylShangHuService.deleteXuNiBiById(pd);
		writer.close();
	}
///////////////////////////////////////////////////////////提现管理////网站后台功能//////////////////////////////////
	/**
	 * 获取商户端提现列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getSHWithDrawCashlistPage")
	public ModelAndView getWithDrawCashlistPage(Page page) throws Exception {
		logBefore(logger, "---获取商户端提现列表--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> list = ljylShangHuService.getSHWithDrawCashlistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("lvjuyanglao/withdrawcashSH/withdrawcashSH_list");
		return mv;
	}
	/**
	 * 获取客户端提现列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getKHWithDrawCashlistPage")
	public ModelAndView getKHWithDrawCashlistPage(Page page) throws Exception {
		logBefore(logger, "---获取客户端提现列表--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> list = ljylShangHuService.getKHWithDrawCashlistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("lvjuyanglao/withdrawcashKH/withdrawcashKH_list");
		return mv;
	}
	/**
	 * 改变提现状态
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateWithDrawCashState")
	public ModelAndView updateWithDrawCashState(
			@RequestParam(required=false) MultipartFile imgPatnFile,
			String withdraw_cash_id,
			String caozuoName,
			String type
			) throws Exception {
		logBefore(logger, "---改变提现状态--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		//上传图片
		String imgPath=Const.FILEPATHIMG+"tixian/"+DateUtil.getDays()+"/";
		String path=PathUtil.getClasspath()+imgPath;
		String imgPathName=FileUpload.fileUp(imgPatnFile, path, this.get32UUID());
			
		pd.put("imgPath", imgPath+imgPathName);
		pd.put("feedback_time", DateUtil.getTime());
		pd.put("caozuoName", caozuoName);
		pd.put("state", "1");
		pd.put("withdraw_cash_id", withdraw_cash_id);
		ljylShangHuService.updateWithDrawCashState(pd);
		if(type.equals("1")){
			mv.setViewName("redirect:/api/shangHu/getKHWithDrawCashlistPage.do?state=2");
		}else{
			mv.setViewName("redirect:/api/shangHu/getSHWithDrawCashlistPage.do?state=2");
		}
		/*mv.addObject("msg", "success");
		mv.setViewName("save_result");*/
		return mv;
	}
///////////////////////////////////////////////////////////机构类型////网站后台功能//////////////////////////////////
	/**
	 * 获取机构类型列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getjigoulistPage")
	public ModelAndView getjigoulistPage(Page page) throws Exception {
		logBefore(logger, "---获取机构类型列表--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> list = ljylShangHuService.getjigoulistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("system/jigoutype/jigoutype_list");
		return mv;
	}
	
	/**
	 * 判断该名称是否存在
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/isNameOfJiGouTypeExistence")
	@ResponseBody
	public Object isNameOfJiGouTypeExistence() throws Exception {
		logBefore(logger, "---判断该名称是否存在--");
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData tempPd = ljylShangHuService.getJiGouTypeByName(pd);
		String reqCode = "00";
		String reqMsg = "该名称已存在";
		if (tempPd == null) {
			reqCode = "01";
			reqMsg = "该名称不存在";
		}
		map.put("reqCode", reqCode);
		map.put("reqMsg", reqMsg);
		return AppUtil.returnObject(pd, map);
	}

	/**
	 * 进入机构类型添加页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/toAddJiGouType")
	public ModelAndView toAddJiGouType() {
		logBefore(logger, "---进入机构类型添加页--");
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "insertJiGouType");
		mv.setViewName("system/jigoutype/jigoutype_edit");
		return mv;
	}

	/**
	 * 添加机构类型
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertJiGouType")
	public ModelAndView insertJiGouType() throws Exception {
		logBefore(logger, "---添加机构类型--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("jigou_type_id", this.get32UUID());
		pd.put("addTime", DateUtil.getTime());
		ljylShangHuService.insertJiGouType(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 进入机构类型编辑页
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/toEditJiGouType")
	public ModelAndView toEditJiGouType() throws Exception {
		logBefore(logger, "---进入机构类型编辑页--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = ljylShangHuService.getJiGouTypeById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "updateJiGouType");
		mv.setViewName("system/jigoutype/jigoutype_edit");
		return mv;
	}

	/**
	 * 修改机构类型
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateJiGouType")
	public ModelAndView updateJiGouType() throws Exception {
		logBefore(logger, "---修改机构类型--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("addTime", DateUtil.getTime());
		ljylShangHuService.updateJiGouType(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 根据ID删除指定对象(机构类型)的信息
	 * 
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteJiGouTypeById")
	public void deleteJiGouTypeById(PrintWriter writer) throws Exception {
		logBefore(logger, "---根据ID删除指定对象(机构类型)的信息--");
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<String, Object>();
		pd = this.getPageData();
		String id[] = pd.getString("ids").split(",");
		List<String> ids = new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			ids.add(id[i]);
		}
		map.put("ids", ids);
		ljylShangHuService.deleteJiGouTypeById(map);
		writer.close();
	}
	
///////////////////////////////////////////////////////////积分兑换股权////网站后台功能//////////////////////////////////
	/**
	 * 获取积分兑换股权列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getjifenhuanguquanlistPage")
	public ModelAndView getjifenhuanguquanlistPage(Page page) throws Exception {
		logBefore(logger, "---获取积分兑换股权列表--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> list = ljylShangHuService.getjifenhuanguquanlistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("lvjuyanglao/jifenhuanguquan/jifenhuanguquan_list");
		return mv;
	}

	/**
	 * 进入积分兑换股权添加页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/toAddJiFenHuanGuQuan")
	public ModelAndView toAddJiFenHuanGuQuan() {
		logBefore(logger, "---进入积分兑换股权添加页--");
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "insertJiFenHuanGuQuan");
		mv.setViewName("lvjuyanglao/jifenhuanguquan/jifenhuanguquan_edit");
		return mv;
	}

	/**
	 * 添加积分兑换股权
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertJiFenHuanGuQuan")
	public ModelAndView insertJiFenHuanGuQuan() throws Exception {
		logBefore(logger, "---添加积分兑换股权--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("jifen_guquan_id", this.get32UUID());
		ljylShangHuService.insertJiFenHuanGuQuan(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 进入积分兑换股权编辑页
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/toEditJiFenHuanGuQuan")
	public ModelAndView toEditJiFenHuanGuQuan() throws Exception {
		logBefore(logger, "---进入积分兑换股权编辑页--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = ljylShangHuService.getJiFenHuanGuQuanById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "updateJiFenHuanGuQuan");
		mv.setViewName("lvjuyanglao/jifenhuanguquan/jifenhuanguquan_edit");
		return mv;
	}

	/**
	 * 修改积分兑换股权
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateJiFenHuanGuQuan")
	public ModelAndView updateJiFenHuanGuQuan() throws Exception {
		logBefore(logger, "---修改积分兑换股权--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		ljylShangHuService.updateJiFenHuanGuQuan(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 根据ID删除指定对象(积分兑换股权)的信息
	 * 
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteJiFenHuanGuQuanById")
	public void deleteJiFenHuanGuQuanById(PrintWriter writer) throws Exception {
		logBefore(logger, "---根据ID删除指定对象(积分兑换股权)的信息--");
		PageData pd = new PageData();
		pd = this.getPageData();
		ljylShangHuService.deleteJiFenHuanGuQuanById(pd);
		writer.close();
	}
	
	
	
	/**
	 * 商户会员中心-我的金额-查询分销提成所得金额记录
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
		ShangHu shanghu =(ShangHu)session.getAttribute(Const.SESSION_SHANGHU_USER);
		pd.put("user_fid", shanghu.getUser_shanghu_id());
		pd.put("type", "2");
		List<PageData> fenxiaoMoneyList =  ljylKeHuService.selectFenxiaoMoenyList(pd);
		mv.addObject("fenxiaoMoneyList", fenxiaoMoneyList);
		mv.setViewName("information/zhaoyiwang/zywkehuduan/fenxiaoMoenyRecord");
		return mv;
	}
//////////////////////////////////////////////////////////退单部分//////////////////////////////////
	@RequestMapping(value = "/tuidanlistPage")
	public ModelAndView tuidanlistPage(Page page) throws Exception {
		logBefore(logger, "---退单--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> list = new ArrayList<PageData>();
		if(pd.getString("identity").equals("1")){
			list = ljylShangHuService.tuidanw1listPage(page);
		}else if(pd.getString("identity").equals("2")){
			list = ljylShangHuService.tuidanw2listPage(page);
		}else{
			list = ljylShangHuService.tuidanw3listPage(page);
		}
		
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("lvjuyanglao/tuidan/tuidan_list");
		return mv;
	}	
	@RequestMapping(value = "/updateTuiDan")
	public ModelAndView updateTuiDan() throws Exception {
		logBefore(logger, "---更新退单--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("complete_time", DateUtil.getTime());
		if(pd.getString("identity").equals("1")){
			ljylShangHuService.updateTuiDan1(pd);
		}else if(pd.getString("identity").equals("2")){
			ljylShangHuService.updateTuiDan2(pd);
		}else{
			ljylShangHuService.updateTuiDan3(pd);
		}
		ljylShangHuService.updateJiFenHuanGuQuan(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}
		
	@RequestMapping(value = "/updateTuiDan0")
	public ModelAndView updateTuiDan0() throws Exception {
		logBefore(logger, "---退单--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("order_state", "0");
		pd.put("complete_time", DateUtil.getTime());
		if(pd.getString("identity").equals("1")){
			ljylShangHuService.updateTuiDan1(pd);
		}else if(pd.getString("identity").equals("2")){
			ljylShangHuService.updateTuiDan2(pd);
		}else{
			ljylShangHuService.updateTuiDan3(pd);
		}
		mv.setViewName("redirect:/api/ljylkehu/huiyuanzhongxin");
		return mv;
	}
///////////////////////////////////////////////////////////存款利率设置////网站后台功能//////////////////////////////////
	/**
	 * 获取列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cunkuanlilvlistPage")
	public ModelAndView cunkuanlilvlistPage(Page page) throws Exception {
		logBefore(logger, "---获取存款利率列表--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> list = ljylShangHuService.cunkuanlilvlistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("lvjuyanglao/cunkuanlilv/cunkuanlilv_list");
		return mv;
	}

	/**
	 * 进入添加页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/toAddCunKuanLiLv")
	public ModelAndView toAddCunKuanLiLv() {
		logBefore(logger, "---进入存款利率添加页--");
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "insertCunKuanLiLv");
		mv.setViewName("lvjuyanglao/cunkuanlilv/cunkuanlilv_edit");
		return mv;
	}

	/**
	 * 添加
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertCunKuanLiLv")
	public ModelAndView insertCunKuanLiLv() throws Exception {
		logBefore(logger, "---添加--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("cunkuan_lilv_id", this.get32UUID());
		ljylShangHuService.insertCunKuanLiLv(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 进入编辑页
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/toEditCunKuanLiLv")
	public ModelAndView toEditCunKuanLiLv() throws Exception {
		logBefore(logger, "---进入编辑页--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = ljylShangHuService.getCunKuanLiLvById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "updateCunKuanLiLv");
		mv.setViewName("lvjuyanglao/cunkuanlilv/cunkuanlilv_edit");
		return mv;
	}

	/**
	 * 修改
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateCunKuanLiLv")
	public ModelAndView updateCunKuanLiLv() throws Exception {
		logBefore(logger, "---修改--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		ljylShangHuService.updateCunKuanLiLv(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 根据ID删除指定对象(存款利率)的信息
	 * 
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteCunKuanLiLvById")
	public void deleteCunKuanLiLvById(PrintWriter writer) throws Exception {
		logBefore(logger, "---根据ID删除指定对象(存款利率)的信息--");
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<String, Object>();
		pd = this.getPageData();
		String id[] = pd.getString("ids").split(",");
		List<String> ids = new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			ids.add(id[i]);
		}
		map.put("ids", ids);
		ljylShangHuService.deleteCunKuanLiLvById(map);
		writer.close();
	}
///////////////////////////////////////////////////////////存款//////////////////////////////////////
	/**
	 * 获取存款信息列表
	 * （get方式传递user_id）
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getCunKuanList")
	public ModelAndView getCunKuanList() throws Exception {
		logBefore(logger, "---获取存款信息列表--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//改变到期存款记录的状态
		pd.put("now_time", DateUtil.getTime());
		ljylShangHuService.updateCunKuanState(pd);
		//if(isSession()){
			//获取列表信息
			pd.put("user_id", getSessionUser().getUser_shanghu_id());
			List<PageData> list=ljylShangHuService.getCunKuanList(pd);
			mv.addObject("list", list);
		//}else{
			//mv.setViewName("redirect:/api/shangHu/toLogin");
		//}
		
		mv.addObject("pd", pd);
		mv.setViewName("lvjuyanglao/shanghuduan/cunkuanlist");
		return mv;
	}
	/**
	 * 进入选择存款类型页面
	 * （get方式传递user_id）
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/toCunKuan")
	public ModelAndView toCunKuan() throws Exception {
		logBefore(logger, "---进入选择存款类型页面--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		PageData pd2 = new PageData();
		pd = this.getPageData();
		//根据ID获取商户信息
		pd.put("user_shanghu_id", pd.getString("user_id"));
		PageData shanghuPd=ljylShangHuService.getDataById(pd);
		if(shanghuPd!=null){//为商户
			pd.put("amount", shanghuPd.get("xianjinAmount"));
		}else{//为客户
			pd.put("user_kuhu_id", pd.getString("user_id"));
			PageData kehuPd=ljylKeHuService.getDetailByID(pd);
			pd.put("amount", kehuPd.get("money"));
		}
		pd2 = ljylShangHuService.getDataOfCunKuanLiLv(shanghuPd);
		mv.addObject("pd", pd);
		mv.addObject("pd2", pd2);
		mv.setViewName("lvjuyanglao/shanghuduan/cunkuan");
		return mv;
	}
	
	/**
	 * 保存存款记录信息
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertCunKuan")
	public ModelAndView insertCunKuan() throws Exception {
		logBefore(logger, "---保存存款记录信息--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData(); 
		PageData temppd = new PageData(); 
		pd = this.getPageData();
		//获取利率
		int month=0;
		PageData lilvPd=ljylShangHuService.getDataOfCunKuanLiLv(pd);
		//1,2存款记录的利率和存款类型
		if(pd.getString("cunkuan_type").equals("1")){
			temppd.put("rate", lilvPd.getString("cunkuan_lilv3"));
			temppd.put("cunkuan_type", "1");
			month=3;
		}else if(pd.getString("cunkuan_type").equals("2")){
			temppd.put("rate", lilvPd.getString("cunkuan_lilv6"));
			temppd.put("cunkuan_type", "2");
			month=6;
		}else{
			temppd.put("rate", lilvPd.getString("cunkuan_lilv12"));
			temppd.put("cunkuan_type", "3");
			month=12;
		}
		//根据ID获取商户信息
		pd.put("user_shanghu_id", pd.getString("user_id"));
		PageData shanghuPd=ljylShangHuService.getDataById(pd);
		//3用户类型
		if(shanghuPd!=null){//为商户
			temppd.put("user_type", "2");
			//改变商户余额
			double xianjinAmount=Double.parseDouble(shanghuPd.get("xianjinAmount").toString())-Double.parseDouble(pd.getString("begin_amount"));
			pd.put("xianjinAmount", xianjinAmount);
			ljylShangHuService.updateXianJinAmount(pd);
		}else{//为客户
			pd.put("user_kuhu_id", pd.getString("user_id"));
			pd.put("user_kehu_id", pd.getString("user_id"));
			PageData kehuPd=ljylKeHuService.getDetailByID(pd);
			
			pd.put("money", Double.parseDouble(kehuPd.get("money").toString())-Double.parseDouble(pd.getString("begin_amount")));
			ljylKeHuService.updateMoneyBykehuID(pd);
			
			temppd.put("user_type", "1");
		}
		//4主键ID
		temppd.put("cunkuan_id", this.get32UUID());
		//5存入金额
		temppd.put("begin_amount", pd.getString("begin_amount"));
		//6最终金额
		temppd.put("end_amount", Double.parseDouble(pd.getString("begin_amount"))*(1+Double.parseDouble(temppd.getString("rate"))));
		//7开始时间
		temppd.put("begin_time", DateUtil.getTime());
		//8user_id
		temppd.put("user_id", pd.getString("user_id"));
		//9结束时间
		temppd.put("end_time", DateTimeUtil.getYearAddMonth(month, temppd.getString("begin_time")));
		//10状态
		temppd.put("state", "2");
		ljylShangHuService.insertCunKuan(temppd);
		mv.setViewName("redirect:/api/ljylshangHu/getCunKuanList?user_id="+pd.getString("user_id"));
		return mv;
	}
	/**
	 * 取出到余额
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/quchudaoyue")
	@ResponseBody
	public Object quchudaoyue() throws Exception{
		logBefore(logger, "--取出到余额--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd=ljylShangHuService.getCunKuanOfId(pd);
		if(pd.getString("user_type").equals("1")){//kehu
			//根据ID获取客户信息
			pd.put("user_kuhu_id", pd.getString("user_id"));
			pd.put("user_kehu_id", pd.getString("user_id"));
			PageData kehuPd=ljylKeHuService.getDetailByID(pd);
			
			pd.put("money", Double.parseDouble(pd.getString("end_amount"))+Double.parseDouble(kehuPd.get("money").toString()));
			ljylKeHuService.updateMoneyBykehuID(pd);
			
		}else{//商户
			//根据ID获取商户信息
			pd.put("user_shanghu_id", pd.getString("user_id"));
			PageData shanghuPd=ljylShangHuService.getDataById(pd);
			
			pd.put("xianjinAmount", Double.parseDouble(pd.getString("end_amount"))+Double.parseDouble(shanghuPd.get("xianjinAmount").toString()));
			ljylShangHuService.updateXianJinAmount(pd);
			
		}
		ljylShangHuService.updateCunKuanState1(pd);
		return AppUtil.returnObject(pd, map);
	}
	
}
