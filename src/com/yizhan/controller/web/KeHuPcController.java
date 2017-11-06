package com.yizhan.controller.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

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
import com.yizhan.controller.rong.util.GetTokenUtil;
import com.yizhan.entity.Page;
import com.yizhan.entity.information.ShangHu;
import com.yizhan.entity.information.ZywKeHu;
import com.yizhan.service.information.zhaoyiwang.KeHuPcService;
import com.yizhan.service.information.zhaoyiwang.KeHuService;
import com.yizhan.service.information.zhaoyiwang.OrderService;
import com.yizhan.service.information.zhaoyiwang.ShangHuService;
import com.yizhan.util.AppUtil;
import com.yizhan.util.Const;
import com.yizhan.util.DateUtil;
import com.yizhan.util.FileUpload;
import com.yizhan.util.FileUtil;
import com.yizhan.util.MD5;
import com.yizhan.util.PageData;
import com.yizhan.util.PathUtil;
import com.yizhan.util.RoundUtil;
import com.yizhan.util.Tools;

@Controller
@RequestMapping(value="/api/keHuPc")
public class KeHuPcController extends BaseController{
	
	@Resource(name="kehuService")
	private KeHuService kehuService;
	@Resource(name="keHuPcService")
	private KeHuPcService keHuPcService;
	@Resource(name="shangHuService")
	private ShangHuService shangHuService;
	@Resource(name="orderService")
	private OrderService orderService;
	
	//TODO 聊天部分
	//根据ID获取用户的名称
	@RequestMapping(value="/getData")
	@ResponseBody
	public Object getData() throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd.put("user_kuhu_id", pd.getString("userId"));
		pd.put("user_shanghu_id", pd.getString("userId"));
		PageData pd1=new PageData();
		PageData pd2=new PageData();
		pd1=kehuService.getDetailByID(pd);
		if(pd1==null){
			pd.put("user_shanghu_id", pd.getString("userId"));
			pd2=shangHuService.getDataById(pd);
			map.put("name", pd2.getString("youName"));
			map.put("userId", pd2.getString("user_shanghu_id"));
		}else{
			map.put("name", pd1.getString("realName"));
			map.put("userId", pd1.getString("user_kuhu_id"));
		}
		return AppUtil.returnObject(pd, map);
	}
	//判断是否有登录
	@RequestMapping(value="/getUserId")
	@ResponseBody
	public Object getUserId() throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		ZywKeHu keHu=getSessionUser();
		ShangHu shangHu=null;
		String userId="";
		if(keHu==null){
			shangHu=getsSessionUser();
			if(shangHu!=null){
				userId=shangHu.getUser_shanghu_id();
			}
		}else{
			userId= keHu.getUser_kuhu_id();
		}
		map.put("userId", userId);
		return AppUtil.returnObject(pd, map);
	}
	//发送http请求，获取token
	@RequestMapping(value="/getToken")
	@ResponseBody
	public Object getToken() throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		String userId="";
		String respCode="00";
		
		ZywKeHu keHu=getSessionUser();
		ShangHu shangHu=null;
		if(keHu==null){
			shangHu=getsSessionUser();
			if(shangHu!=null){
				userId=shangHu.getUser_shanghu_id();
			}
		}else{
			userId= keHu.getUser_kuhu_id();
		}
		
		if(Tools.notEmpty(userId)){
			//获取token
			JSONObject jsonObject=GetTokenUtil.sendPost("userId="+userId);
			map.put("token", jsonObject.get("token"));
			respCode="01";
		}
		
		map.put("respCode", respCode);
		return AppUtil.returnObject(pd, map);
	}
	  
	//TODO 案例部分
	/**
	 * 去添加案例页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toAnLiAdd")
	public ModelAndView toAnLiAdd() throws Exception{
		logBefore(logger, "--去添加案例页面--");
		ModelAndView mv=new ModelAndView();
		if(issSession()){
			mv.addObject("titleMsg", "添加案例");
			mv.addObject("msg", "anLiAdd");
			mv.setViewName("zywPC/center/anli_edit");
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getsJfenGquanXnibi());
			//获取底栏联系我们
			mv.addObject("bottomPd", getContactUs());
		}else{
			mv.setViewName("redirect:/api/keHuPc/tosLogin");
		}
		return mv;
	}
	/**
	 * 保存案例
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/anLiAdd")
	public ModelAndView anLiAdd(
			@RequestParam(required=false) MultipartFile file,
			String title,
			String detailContent
			) throws Exception{
		logBefore(logger, "--保存案例--");
		ModelAndView mv=new ModelAndView();
		if(issSession()){
			PageData pd=new PageData();
			
			String path=Const.FILEPATHIMG + "shangHu/" + "headImg/" + DateUtil.getDays() + "/";
			String imgPathFileName=FileUpload.fileUp(file , PathUtil.getClasspath() + path, this.get32UUID());
			pd.put("imgPath", path+imgPathFileName);
			
			pd.put("title", title);
			pd.put("detailContent", detailContent);
			pd.put("anli_zhanshi_id", this.get32UUID());
			pd.put("addTime", DateUtil.getTime());
			pd.put("user_shanghu_fid", getsSessionUser().getUser_shanghu_id());
			shangHuService.saveAnLiInformation(pd);
			mv.setViewName("redirect:/api/keHuPc/personInformation");
		}else{
			mv.setViewName("redirect:/api/keHuPc/tosLogin");
		}
		return mv;
	}
	/**
	 * 去编辑案例页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toAnLiEdit")
	public ModelAndView toAnLiEdit() throws Exception{
		logBefore(logger, "--去编辑案例页面--");
		ModelAndView mv=new ModelAndView();
		if(issSession()){
			PageData pd=new PageData();
			pd=this.getPageData();
			
			//根据ID获取案例信息
			pd=shangHuService.getAnLiDataById(pd);
			mv.addObject("pd", pd);
			mv.addObject("msg", "anLiEdit");
			mv.addObject("titleMsg", "编辑案例");
			mv.setViewName("zywPC/center/anli_edit");
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getsJfenGquanXnibi());
			//获取底栏联系我们
			mv.addObject("bottomPd", getContactUs());
		}else{
			mv.setViewName("redirect:/api/keHuPc/tosLogin");
		}
		return mv;
	}
	/**
	 * 更新案例
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/anLiEdit")
	public ModelAndView anLiEdit(
			@RequestParam(required=false) MultipartFile file,
			String title,
			String anli_zhanshi_id,
			String imgPath,
			String detailContent
			) throws Exception{
		logBefore(logger, "--更新案例--");
		ModelAndView mv=new ModelAndView();
		if(issSession()){
			PageData pd=new PageData();
			
			if(file!=null && !file.isEmpty()){
				String path=Const.FILEPATHIMG + "shangHu/" + "headImg/" + DateUtil.getDays() + "/";
				String imgPathFileName=FileUpload.fileUp(file , PathUtil.getClasspath() + path, this.get32UUID());
				pd.put("imgPath", path+imgPathFileName);
			}else{
				pd.put("imgPath", imgPath);
			}
			
			pd.put("title", title);
			pd.put("detailContent", detailContent);
			pd.put("anli_zhanshi_id", anli_zhanshi_id);
			pd.put("addTime", DateUtil.getTime());
			shangHuService.updateAnLiInformation(pd);
			
			mv.setViewName("redirect:/api/keHuPc/personInformation");
		}else{
			mv.setViewName("redirect:/api/keHuPc/tosLogin");
		}
		return mv;
	}
	/**
	 * 案例删除
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/anLiDelete")
	@ResponseBody
	public Object anLiDelete() throws Exception{
		logBefore(logger, "--案例删除--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		if(issSession()){
			shangHuService.deleteAnLiById(pd);
			map.put("respCode", "01");
		}else{
			map.put("respCode", "00");
		}
		return AppUtil.returnObject(pd, map);
	}
	//TODO 我的服务
	/**
	 * 我的服务
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toMyService")
	public ModelAndView toMyService() throws Exception{
		logBefore(logger, "--我的服务--");
		ModelAndView mv=new ModelAndView();
		if(issSession()){
			PageData pd=new PageData();
			pd.put("user_shanghu_fid", getsSessionUser().getUser_shanghu_id());
			List<PageData> serviceList=shangHuService.getServiceList(pd);
			mv.addObject("serviceList", serviceList);
			
			mv.addObject("identity", getsSessionUser().getIdentity());
			mv.setViewName("zywPC/service/my_service");
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getsJfenGquanXnibi());
			//获取底栏联系我们
			mv.addObject("bottomPd", getContactUs());
		}else{
			mv.setViewName("redirect:/api/keHuPc/tosLogin");
		}
		return mv;
	}
	/**
	 * 去添加服务页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toServiceAdd")
	public ModelAndView toServiceAdd() throws Exception{
		logBefore(logger, "--去添加服务页面--");
		ModelAndView mv=new ModelAndView();
		if(issSession()){
			if(getsSessionUser().getIdentity().equals("1")){
				//查询疾病（默认查询字母a的疾病）
				PageData pd1=new PageData();
				pd1.put("letter", "a");
				List<PageData> list=shangHuService.getJiBingListByLetter(pd1);
				mv.addObject("list", list);
			}
			//身份信息
			mv.addObject("identity", getsSessionUser().getIdentity());
			
			mv.addObject("msg", "serviceAdd");
			mv.setViewName("zywPC/service/service_edit");
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getsJfenGquanXnibi());
			//获取底栏联系我们
			mv.addObject("bottomPd", getContactUs());
		}else{
			mv.setViewName("redirect:/api/keHuPc/tosLogin");
		}
		return mv;
	}
	/**
	 * 保存发布服务
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/serviceAdd")
	public ModelAndView serviceAdd(
			@RequestParam(required=false) MultipartFile file,
			String fuwu_jibing_name,
			String price,
			String jibing_introdaction
			) throws Exception{
		logBefore(logger, "--保存发布服务--");
		ModelAndView mv=new ModelAndView();
		if(issSession()){
			PageData pd=new PageData();
			
			//上传图片
			if(file!=null && !file.isEmpty()){
				String path=Const.FILEPATHFILE + "xuqiu/" + DateUtil.getDays() +"/";
				String name=FileUpload.fileUp(file, PathUtil.getClasspath() + path, this.get32UUID());
				pd.put("headImg", path + name);
			}
			
			//保存信息
			pd.put("fuwu_id", this.get32UUID());
			pd.put("fuwu_jibing_name", fuwu_jibing_name);
			pd.put("price", price);
			pd.put("user_shanghu_fid", getsSessionUser().getUser_shanghu_id());
			pd.put("addTime", DateUtil.getTime());
			pd.put("jibing_introdaction", jibing_introdaction);
			pd.put("type", getsSessionUser().getIdentity());
			
			shangHuService.saveService(pd);
			
			mv.setViewName("redirect:/api/keHuPc/toMyService");
		}else{
			mv.setViewName("redirect:/api/keHuPc/tosLogin");
		}
		return mv;
	}
	/**
	 * 去编辑服务页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toServiceEdit")
	public ModelAndView toServiceEdit() throws Exception{
		logBefore(logger, "--去编辑服务页面--");
		ModelAndView mv=new ModelAndView();
		if(issSession()){
			PageData pd=new PageData();
			pd=this.getPageData();
			
			if(getsSessionUser().getIdentity().equals("1")){
				//查询疾病（默认查询字母a的疾病）
				PageData pd1=new PageData();
				pd1.put("letter", "a");
				List<PageData> list=shangHuService.getJiBingListByLetter(pd1);
				mv.addObject("list", list);
			}
			//身份信息
			mv.addObject("identity", getsSessionUser().getIdentity());
			//根据ID获取服务详情
			pd=shangHuService.getDataByIdOfService(pd);
			mv.addObject("pd", pd);
			
			mv.addObject("msg", "serviceEdit");
			mv.setViewName("zywPC/service/service_edit");
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getsJfenGquanXnibi());
			//获取底栏联系我们
			mv.addObject("bottomPd", getContactUs());
		}else{
			mv.setViewName("redirect:/api/keHuPc/tosLogin");
		}
		return mv;
	}
	/**
	 * 更新服务
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/serviceEdit")
	public ModelAndView serviceEdit(
			@RequestParam(required=false) MultipartFile file,
			String fuwu_jibing_name,
			String headImg,
			String fuwu_id,
			String price,
			String jibing_introdaction
			) throws Exception{
		logBefore(logger, "--更新服务--");
		ModelAndView mv=new ModelAndView();
		if(issSession()){
			PageData pd=new PageData();
			
			//上传图片
			if(file!=null && !file.isEmpty()){
				String path=Const.FILEPATHFILE + "xuqiu/" + DateUtil.getDays() +"/";
				String name=FileUpload.fileUp(file, PathUtil.getClasspath() + path, this.get32UUID());
				pd.put("headImg", path + name);
			}else{
				pd.put("headImg", headImg);
			}
			
			//保存信息
			pd.put("fuwu_id", fuwu_id);
			pd.put("fuwu_jibing_name", fuwu_jibing_name);
			pd.put("price", price);
			pd.put("addTime", DateUtil.getTime());
			pd.put("jibing_introdaction", jibing_introdaction);
			
			shangHuService.updateService(pd);
			
			mv.setViewName("redirect:/api/keHuPc/toMyService");
		}else{
			mv.setViewName("redirect:/api/keHuPc/tosLogin");
		}
		return mv;
	}
	/**
	 * 删除服务
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/serviceDelete")
	@ResponseBody
	public Object serviceDelete() throws Exception{
		logBefore(logger, "--删除服务--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		if(issSession()){
			shangHuService.deleteService(pd);
			map.put("respCode", "01");
		}else{
			map.put("respCode", "00");
		}
		return AppUtil.returnObject(pd, map);
	}
	//TODO 商家资质认证
	/**
	 * 进入商家资质认证
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toApplyStore")
	public ModelAndView toApplyStore() throws Exception{
		logBefore(logger, "--进入商家资质认证--");
		ModelAndView mv=new ModelAndView();
		if(issSession()){
			mv.setViewName("zywPC/apply/apply");
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getsJfenGquanXnibi());
			//获取底栏联系我们
			mv.addObject("bottomPd", getContactUs());
		}else{
			mv.setViewName("redirect:/api/keHuPc/tosLogin");
		}
		return mv;
	}
	/**
	 * 提交申请
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/saveApplyStore")
	public ModelAndView saveApplyStore(
			@RequestParam(required=false) MultipartFile[] imgPathFile,
			String shenqingMethod
			) throws Exception{
		logBefore(logger, "--提交申请--");
		ModelAndView mv=new ModelAndView();
		if(issSession()){
			System.out.println("=========================上传店内环境图的个数为："+imgPathFile.length);
			//自定义头像的保存路径
			String  imgfolder = Const.FILEPATHIMG + "shangHu/apply/" + DateUtil.getDays() + "/";
			String filePath = PathUtil.getClasspath() + imgfolder;	//文件上传路径
			//执行上传操作,获取文件名
			for (int i = 0; i < imgPathFile.length; i++) {
				PageData tPd=new PageData();
				tPd.put("imgpath_apply_id", this.get32UUID());
				tPd.put("shenqingMethod", shenqingMethod);
				tPd.put("user_shanghu_fid", getsSessionUser().getUser_shanghu_id());
				String imgName = FileUpload.fileUp(imgPathFile[i], filePath, this.get32UUID());
				tPd.put("imgPath", imgfolder + imgName);
				shangHuService.saveApplyImgPath(tPd);
			}
			//改变认证状态以及开店认证申请时间
			PageData temp=new PageData();
			temp.put("user_shanghu_id", getsSessionUser().getUser_shanghu_id());
			temp.put("renZhengState", "2");
			temp.put("renZhengApplyTime", DateUtil.getTime());
			shangHuService.updateStateAndTime(temp);
			mv.setViewName("redirect:/api/keHuPc/personCenter1");
		}else{
			mv.setViewName("redirect:/api/keHuPc/tosLogin");
		}
		return mv;
	}
	//TODO 购买服务
	/**
	 * PC版:立即下单进入选择支付方式页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toCreateOrder")
	public ModelAndView toCreateOrder() throws Exception{
		logBefore(logger, "--PC版:立即下单进入选择支付方式页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd=this.getPageData();
			
			//获取服务
			PageData tempfuwu=keHuPcService.getChanPinInformation(pd);
			mv.addObject("tempfuwu", tempfuwu);
			
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getJfenGquanXnibi());
			//获取底栏联系我们
			mv.addObject("bottomPd", getContactUs());
			if(tempfuwu.getString("type").equals("3")){
				mv.setViewName("zywPC/order/createOrder3");
			}else{
				mv.setViewName("zywPC/order/createOrder12");
			}
		}else{
			mv.setViewName("redirect:/api/keHuPc/toLogin.do");
		}
		return mv;
	}
	//TODO 需求大厅
	/**
	 * PC版:需求大厅
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/xuQiuDaTing")
	public ModelAndView xuQiuDaTing() throws Exception{
		logBefore(logger, "--PC版:需求大厅--");
		ModelAndView mv=new ModelAndView();
		PageData pd  = new PageData();
		pd = this.getPageData();
		//分页使用
		if(Tools.notEmpty(pd.getString("currentPage"))){
			pd.put("begin", (Integer.parseInt(pd.getString("currentPage"))-1) * Integer.parseInt(pd.getString("pageSize")));
			pd.put("size", Integer.parseInt(pd.getString("pageSize")));
			
		}else{
			pd.put("begin", 0);
			pd.put("size", 10);
		}
		
		List xuQiuDaTingList=new ArrayList<PageData>();
		List<PageData> xuQiuDaTing=keHuPcService.getDataIndexOfXuQiuList(pd);
		for (PageData tempPd:xuQiuDaTing) {
			PageData xuQiuDaTingPd=new PageData();
			xuQiuDaTingPd.put("headImg_url", tempPd.getString("headImg_url"));
			xuQiuDaTingPd.put("xuqiu_id", tempPd.getString("xuqiu_id"));
			xuQiuDaTingPd.put("sex", tempPd.getString("sex"));
			xuQiuDaTingPd.put("age", tempPd.getString("age"));
			xuQiuDaTingPd.put("address", tempPd.getString("address"));
			xuQiuDaTingPd.put("phone", tempPd.getString("phone"));
			xuQiuDaTingPd.put("disease", tempPd.getString("disease"));
			xuQiuDaTingPd.put("fabu_time", tempPd.getString("fabu_time"));
			xuQiuDaTingPd.put("symptom", tempPd.getString("symptom"));
			
			String imgPaths[]=tempPd.getString("imgPaths").split(",");
			List<PageData> xuQiuDaTing2=new ArrayList<PageData>();
			for (int i = 0; i < imgPaths.length; i++) {
				PageData tempPd1=new PageData();
				tempPd1.put("imgPath", imgPaths[i]);
				xuQiuDaTing2.add(tempPd1);
			}
			xuQiuDaTingPd.put("imgPathList", xuQiuDaTing2);
			xuQiuDaTingList.add(xuQiuDaTingPd);
		}
		mv.addObject("xuQiuDaTingList", xuQiuDaTingList);
		
		//总记录数，分页使用
		if(xuQiuDaTing!=null && xuQiuDaTing.size()>0){
			mv.addObject("pageCount", xuQiuDaTing.get(0).get("pageCount"));
		}
		mv.addObject("pd", pd);
		
		if(SessionIs().equals("kehu")){
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getJfenGquanXnibi());
		}else if(SessionIs().equals("shanghu")){
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getsJfenGquanXnibi());
		}
		//获取底栏联系我们
		mv.addObject("bottomPd", getContactUs());
		mv.setViewName("zywPC/xqdt/xuqiu");
		return mv;
	}
	
	//TODO 我发布的需求
	/**
	 * PC版:我发布的需求
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/myXuQiuList")
	public ModelAndView myXuQiuList() throws Exception{
		logBefore(logger, "--PC版:我发布的需求--");
		ModelAndView mv=new ModelAndView();
		PageData pd  = new PageData();
		pd = this.getPageData();
		if(isSession()){
			//分页使用
			if(Tools.notEmpty(pd.getString("currentPage"))){
				pd.put("begin", (Integer.parseInt(pd.getString("currentPage"))-1) * Integer.parseInt(pd.getString("pageSize")));
				pd.put("size", Integer.parseInt(pd.getString("pageSize")));
				
			}else{
				pd.put("begin", 0);
				pd.put("size", 10);
			}
			
			pd.put("user_kuhu_id", getSessionUser().getUser_kuhu_id());
			List xuQiuDaTingList=new ArrayList<PageData>();
			List<PageData> xuQiuDaTing=keHuPcService.getDataIndexOfXuQiuList(pd);
			for (PageData tempPd:xuQiuDaTing) {
				PageData xuQiuDaTingPd=new PageData();
				xuQiuDaTingPd.put("headImg_url", tempPd.getString("headImg_url"));
				xuQiuDaTingPd.put("xuqiu_id", tempPd.getString("xuqiu_id"));
				xuQiuDaTingPd.put("sex", tempPd.getString("sex"));
				xuQiuDaTingPd.put("age", tempPd.getString("age"));
				xuQiuDaTingPd.put("address", tempPd.getString("address"));
				xuQiuDaTingPd.put("disease", tempPd.getString("disease"));
				xuQiuDaTingPd.put("fabu_time", tempPd.getString("fabu_time"));
				xuQiuDaTingPd.put("symptom", tempPd.getString("symptom"));
				
				String imgPaths[]=tempPd.getString("imgPaths").split(",");
				List<PageData> xuQiuDaTing2=new ArrayList<PageData>();
				for (int i = 0; i < imgPaths.length; i++) {
					PageData tempPd1=new PageData();
					tempPd1.put("imgPath", imgPaths[i]);
					xuQiuDaTing2.add(tempPd1);
				}
				xuQiuDaTingPd.put("imgPathList", xuQiuDaTing2);
				xuQiuDaTingList.add(xuQiuDaTingPd);
			}
			mv.addObject("xuQiuDaTingList", xuQiuDaTingList);
			
			//总记录数，分页使用
			if(xuQiuDaTing!=null && xuQiuDaTing.size()>0){
				mv.addObject("pageCount", xuQiuDaTing.get(0).get("pageCount"));
			}
			mv.addObject("pd", pd);
			
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getJfenGquanXnibi());
			//获取底栏联系我们
			mv.addObject("bottomPd", getContactUs());
			mv.setViewName("zywPC/xuqiu/xuqiu");
		}else{
			mv.setViewName("redirect:/api/keHuPc/toLogin.do");
		}
		return mv;
	}
	
	/**
	 * PC版:进入添加发布需求页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toAddFaBuXuQiu")
	public ModelAndView toAddFaBuXuQiu() throws Exception{
		logBefore(logger, "--PC版:进入添加发布需求页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			
			mv.addObject("msg", "saveFaBuXuQiu");
			mv.addObject("titleMsg", "发布需求");
			
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getJfenGquanXnibi());
			//获取底栏联系我们
			mv.addObject("bottomPd", getContactUs());
			mv.setViewName("zywPC/xuqiu/fabuNeeds");
		}else{
			mv.setViewName("redirect:/api/keHuPc/toLogin.do");
		}
		return mv;
	}
	/**
	 * PC版:保存发布的需求信息
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/saveFaBuXuQiu")
	public ModelAndView saveFaBuXuQiu(
			@RequestParam(required=false) MultipartFile[] xuQiuImgFile,
			String symptom,
			String patient_name,
			String disease,
			String phone,
			String sex,
			String age,
			String sheng,
			String shi,
			String type
			) throws Exception{
		logBefore(logger, "--PC版:保存发布的需求信息--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			System.out.println("=========================发布需求时上传的图片数："+xuQiuImgFile.length);
			
			//保存需求信息
			PageData pd=new PageData();
			String xuqiu_id=this.get32UUID();
			pd.put("xuqiu_id", xuqiu_id);
			pd.put("sex", sex);
			pd.put("age", age);
			pd.put("patient_name", patient_name);
			pd.put("disease", disease);
			pd.put("phone", phone);
			pd.put("fabu_time", DateUtil.getTime());
			pd.put("symptom", symptom);
			pd.put("address", sheng.split(",")[1]+" "+shi);
			pd.put("type", type);
			pd.put("user_kuhu_fid", getSessionUser().getUser_kuhu_id());
			
			kehuService.saveXuqiu(pd);
			
			//保存需求图片
			if(xuQiuImgFile.length>0 && xuQiuImgFile[0].getSize()!=0){
				for (int i = 0; i < xuQiuImgFile.length; i++) {
					PageData tempPd=new PageData();
					String path=Const.FILEPATHIMG + "xuqiu/"  + DateUtil.getDays() + "/";
					String filePath = PathUtil.getClasspath() + path;		//文件上传路径
					String fileName = FileUpload.fileUp(xuQiuImgFile[i], filePath, this.get32UUID());	
					//添加到数据库
					tempPd.put("xuqiu_img_id", this.get32UUID());
					tempPd.put("xuqiu_fid", xuqiu_id);
					tempPd.put("img_url", path + fileName);
					kehuService.saveXuqiuImgs(tempPd);
				}
			}
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getJfenGquanXnibi());
			//获取底栏联系我们
			mv.addObject("bottomPd", getContactUs());
			mv.setViewName("redirect:/api/keHuPc/myXuQiuList");
		}else{
			mv.setViewName("redirect:/api/keHuPc/toLogin");
		}
		return mv;
	}
	
	/**
	 * PC版:删除需求
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteXuQiu")
	public ModelAndView deleteXuQiu() throws Exception{
		logBefore(logger, "--PC版:删除需求--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd=this.getPageData();
			kehuService.deleteXuQiu(pd);
			mv.setViewName("redirect:/api/keHuPc/myXuQiuList");	
		}else{
			mv.setViewName("redirect:/api/keHuPc/toLogin");
		}
		return mv;
	}
	
	/**
	 * PC版:进入需求编辑页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/toEditeFaBuXuQiu")
	public ModelAndView toEditeFaBuXuQiu() throws Exception{
		logBefore(logger, "--PC版:进入需求编辑页面--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			PageData pd=new PageData();
			pd=this.getPageData();
			
			//获取需求信息
			pd=kehuService.getDataOfXuQiuById(pd);
			String[] address=pd.getString("address").split(" ");
			pd.put("sheng", address[0]);
			pd.put("shi", address[1]);
			mv.addObject("msg", "updateFaBuXuQiu");
			mv.addObject("titleMsg", "编辑需求");
			mv.addObject("pd", pd);
			
			//获取对应需求下的图片
			PageData pd1=new PageData();
			pd1.put("xuqiu_fid", pd.getString("xuqiu_id"));
			List<PageData> list=kehuService.getImgsByXuqiuID(pd1);
			mv.addObject("list", list);
			
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getJfenGquanXnibi());
			//获取底栏联系我们
			mv.addObject("bottomPd", getContactUs());
			mv.setViewName("zywPC/xuqiu/fabuNeeds");
		}else{
			mv.setViewName("redirect:/api/keHuPc/toLogin");
		}
		return mv;
	}
	/**
	 * PC版:更新指定需求信息
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/updateFaBuXuQiu")
	public ModelAndView updateFaBuXuQiu(
			@RequestParam(required=false) MultipartFile[] xuQiuImgFile,
			String xuqiu_id,
			String symptom,
			String patient_name,
			String disease,
			String phone,
			String sex,
			String age,
			String sheng,
			String shi,
			String type
			) throws Exception{
		logBefore(logger, "--PC版:保存发布的需求信息--");
		ModelAndView mv=new ModelAndView();
		if(isSession()){
			System.out.println("=========================发布需求时上传的图片数："+xuQiuImgFile.length);
			
			//保存需求信息
			PageData pd=new PageData();
			pd.put("xuqiu_id", xuqiu_id);
			pd.put("sex", sex);
			pd.put("age", age);
			pd.put("patient_name", patient_name);
			pd.put("disease", disease);
			pd.put("phone", phone);
			pd.put("fabu_time", DateUtil.getTime());
			pd.put("symptom", symptom);
			pd.put("address", sheng.split(",")[1]+" "+shi);
			pd.put("type", type);
			
			kehuService.updateXuqiu(pd);
			
			//保存需求图片
			if(xuQiuImgFile.length>0 && xuQiuImgFile[0].getSize()!=0){
				
				//删除已有图片
				kehuService.deleteXuQiuImg(pd);
				
				for (int i = 0; i < xuQiuImgFile.length; i++) {
					PageData tempPd=new PageData();
					String path=Const.FILEPATHIMG + "xuqiu/"  + DateUtil.getDays() + "/";
					String filePath = PathUtil.getClasspath() + path;		//文件上传路径
					String fileName = FileUpload.fileUp(xuQiuImgFile[i], filePath, this.get32UUID());	
					//添加到数据库
					tempPd.put("xuqiu_img_id", this.get32UUID());
					tempPd.put("xuqiu_fid", xuqiu_id);
					tempPd.put("img_url", path + fileName);
					kehuService.saveXuqiuImgs(tempPd);
				}
			}
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getJfenGquanXnibi());
			//获取底栏联系我们
			mv.addObject("bottomPd", getContactUs());
			mv.setViewName("redirect:/api/keHuPc/myXuQiuList");
		}else{
			mv.setViewName("redirect:/api/keHuPc/toLogin");
		}
		return mv;
	}
	
	//TODO 找药商
	/**
	 * PC版:找药商
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/searchYaoShangList")
	public ModelAndView searchYaoShangList() throws Exception{
		logBefore(logger, "--PC版:找药商--");
		ModelAndView mv=new ModelAndView();
		PageData pd  = new PageData();
		pd = this.getPageData();
		
		//分页使用
		if(Tools.notEmpty(pd.getString("currentPage"))){
			pd.put("begin", (Integer.parseInt(pd.getString("currentPage"))-1) * Integer.parseInt(pd.getString("pageSize")));
			pd.put("size", Integer.parseInt(pd.getString("pageSize")));
			
		}else{
			pd.put("begin", 0);
			pd.put("size", 10);
		}
		
		//药商列表
		List<PageData> yaoshangList = keHuPcService.getYaoshangList(pd);
		mv.addObject("yaoshangList", yaoshangList);
		System.out.println("-------------yaoshangList----------------"+yaoshangList);
		//总记录数，分页使用
		if(yaoshangList!=null && yaoshangList.size()>0){
			mv.addObject("pageCount", yaoshangList.get(0).get("pageCount"));
		}else{
			mv.addObject("pageCount", 0);
		}		
		
		if(SessionIs().equals("kehu")){
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getJfenGquanXnibi());
		}else if(SessionIs().equals("shanghu")){
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getsJfenGquanXnibi());
		}
		//获取底栏联系我们
		mv.addObject("bottomPd", getContactUs());
		mv.setViewName("zywPC/yaoshang/main_yaoshang");
		return mv;
	}
	
	/**
	 * PC版:药商详情
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/yaoShangDetail")
	public ModelAndView yaoShangDetail() throws Exception{
		logBefore(logger, "--PC版:药商详情--");
		ModelAndView mv=new ModelAndView();
		PageData pd  = new PageData();
		pd = this.getPageData();
		
		//详情列表
		PageData xqData  = kehuService.getYishengDetail(pd);
		mv.addObject("xqData",xqData);
		
		//服务列表
		List<PageData> fuwuList = kehuService.getyishengFuwuList(pd);
		mv.addObject("fuwuList",fuwuList);
		
		//案例列表
		List<PageData> anliList = kehuService.getyishengAnliList(pd);
		mv.addObject("anliList",anliList);
		
		if(SessionIs().equals("kehu")){
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getJfenGquanXnibi());
		}else if(SessionIs().equals("shanghu")){
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getsJfenGquanXnibi());
		}
		//获取底栏联系我们
		mv.addObject("bottomPd", getContactUs());
		mv.setViewName("zywPC/yaoshang/yaoshang_home");
		return mv;
	}
	
	/**
	 * PC版:获取药商列表
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getYaoShangList")
	@ResponseBody
	public Object getYaoShangList() throws Exception{
		logBefore(logger, "--PC版:获取药商列表--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd  = new PageData();
		pd = this.getPageData();
		PageData tempData=new PageData();
		//地址
		String address="";
		if(Tools.notEmpty(pd.getString("sheng"))){
			if(Tools.notEmpty(pd.getString("shi"))){
				address=pd.getString("sheng")+" "+pd.getString("shi");
			}else{
				address=pd.getString("sheng");
			}
		}
		tempData.put("address", address);
		//limit
		tempData.put("begin", (Integer.parseInt(pd.getString("currentPage"))-1) * Integer.parseInt(pd.getString("pageSize")));
		tempData.put("size", Integer.parseInt(pd.getString("pageSize")));
		//类型
		tempData.put("category", pd.getString("category"));

		List<PageData> yaoshangList = keHuPcService.getYaoshangList(tempData);
		System.out.println("+++++++++++++++yaoshangList+++++++++++++++++++++="+yaoshangList);
		map.put("yaoshangList", yaoshangList);
		if(yaoshangList.size()>0){
			map.put("pageCount", yaoshangList.get(0).get("pageCount"));
		}else{
			map.put("pageCount", 0);
		}
		map.put("currentPage", pd.getString("currentPage"));
		return AppUtil.returnObject(pd, map);
	}
	
	//TODO 找机构
	/**
	 * PC版:找机构
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/searchJiGouList")
	public ModelAndView searchJiGouList() throws Exception{
		logBefore(logger, "--PC版:找机构--");
		ModelAndView mv=new ModelAndView();
		PageData pd  = new PageData();
		pd = this.getPageData();
		
		//分页使用
		if(Tools.notEmpty(pd.getString("currentPage"))){
			pd.put("begin", (Integer.parseInt(pd.getString("currentPage"))-1) * Integer.parseInt(pd.getString("pageSize")));
			pd.put("size", Integer.parseInt(pd.getString("pageSize")));
			
		}else{
			pd.put("begin", 0);
			pd.put("size", 10);
		}
		
		if(Tools.notEmpty(pd.getString("dengji"))){
			pd.put("dengji", new String(pd.getString("dengji").getBytes("ISO-8859-1"),"UTF-8"));
		}
		
		//机构列表
		List<PageData> jigouList = keHuPcService.getjigouList(pd);
		mv.addObject("jigouList", jigouList);
		System.out.println("-------------jigouList----------------"+jigouList);
		//总记录数，分页使用
		if(jigouList!=null && jigouList.size()>0){
			mv.addObject("pageCount", jigouList.get(0).get("pageCount"));
		}else{
			mv.addObject("pageCount", 0);
		}
		
		//获取所有的机构类型
		Page page=new Page();
		List<PageData> listType = kehuService.getjigouTypeList(page);
		mv.addObject("listType", listType);
		
		if(SessionIs().equals("kehu")){
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getJfenGquanXnibi());
		}else if(SessionIs().equals("shanghu")){
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getsJfenGquanXnibi());
		}
		//获取底栏联系我们
		mv.addObject("bottomPd", getContactUs());
		mv.setViewName("zywPC/jigou/main_jigou");
		return mv;
	}
	/**
	 * PC版:机构详情
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/jiGouDetail")
	public ModelAndView jiGouDetail() throws Exception{
		logBefore(logger, "--PC版:医生详情--");
		ModelAndView mv=new ModelAndView();
		PageData pd  = new PageData();
		pd = this.getPageData();
		
		//医生详情列表
		PageData xqData  = kehuService.getYishengDetail(pd);
		mv.addObject("xqData",xqData);
		
		//服务列表
		List<PageData> fuwuList = kehuService.getyishengFuwuList(pd);
		mv.addObject("fuwuList",fuwuList);
		
		//案例列表
		List<PageData> anliList = kehuService.getyishengAnliList(pd);
		mv.addObject("anliList",anliList);
		
		if(SessionIs().equals("kehu")){
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getJfenGquanXnibi());
		}else if(SessionIs().equals("shanghu")){
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getsJfenGquanXnibi());
		}
		//获取底栏联系我们
		mv.addObject("bottomPd", getContactUs());
		mv.setViewName("zywPC/jigou/jigou_home");
		return mv;
	}
	
	/**
	 * PC版:获取机构列表
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getJiGouList")
	@ResponseBody
	public Object getJiGouList() throws Exception{
		logBefore(logger, "--PC版:获取机构列表--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd  = new PageData();
		pd = this.getPageData();
		PageData tempData=new PageData();
		//地址
		String address="";
		if(Tools.notEmpty(pd.getString("sheng"))){
			if(Tools.notEmpty(pd.getString("shi"))){
				address=pd.getString("sheng")+" "+pd.getString("shi");
			}else{
				address=pd.getString("sheng");
			}
		}
		tempData.put("address", address);
		//limit
		tempData.put("begin", (Integer.parseInt(pd.getString("currentPage"))-1) * Integer.parseInt(pd.getString("pageSize")));
		tempData.put("size", Integer.parseInt(pd.getString("pageSize")));
		//类型
		tempData.put("dengji", pd.getString("dengji"));

		List<PageData> jigouList = keHuPcService.getjigouList(tempData);
		System.out.println("+++++++++++++++jigouList+++++++++++++++++++++="+jigouList);
		map.put("jigouList", jigouList);
		if(jigouList.size()>0){
			map.put("pageCount", jigouList.get(0).get("pageCount"));
		}else{
			map.put("pageCount", 0);
		}
		map.put("currentPage", pd.getString("currentPage"));
		return AppUtil.returnObject(pd, map);
	}
	
	//TODO 找医生
	/**
	 * PC版:找医生
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/searchYiShengList")
	public ModelAndView searchYiShengList() throws Exception{
		logBefore(logger, "--PC版:找医生--");
		ModelAndView mv=new ModelAndView();
		PageData pd  = new PageData();
		pd = this.getPageData();
		
		//分页使用
		if(Tools.notEmpty(pd.getString("currentPage"))){
			pd.put("begin", (Integer.parseInt(pd.getString("currentPage"))-1) * Integer.parseInt(pd.getString("pageSize")));
			pd.put("size", Integer.parseInt(pd.getString("pageSize")));
			
		}else{
			pd.put("begin", 0);
			pd.put("size", 10);
		}
		
		if(Tools.notEmpty(pd.getString("zikelei"))){
			pd.put("zikelei", new String(pd.getString("zikelei").getBytes("ISO-8859-1"),"UTF-8"));
		}
		
		//医生列表
		List<PageData> yishengList = keHuPcService.getyishengList(pd);
		mv.addObject("yishengList", yishengList);
		System.out.println("-------------yishengList----------------"+yishengList);
		//总记录数，分页使用
		if(yishengList!=null && yishengList.size()>0){
			mv.addObject("pageCount", yishengList.get(0).get("pageCount"));
		}else{
			mv.addObject("pageCount", 0);
		}
		
		//获取所有的主科类
		List<PageData> parentkeleiList = kehuService.getkeleiList(pd);
		mv.addObject("parentkeleiList", parentkeleiList);
		
		if(SessionIs().equals("kehu")){
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getJfenGquanXnibi());
		}else if(SessionIs().equals("shanghu")){
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getsJfenGquanXnibi());
		}
		//获取底栏联系我们
		mv.addObject("bottomPd", getContactUs());
		mv.setViewName("zywPC/home/mian_home");
		return mv;
	}
	
	/**
	 * PC版:根据主科类的主键ID获取其下子科类
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getChildKeLeiList")
	@ResponseBody
	public Object getChildKeLeiList() throws Exception{
		logBefore(logger, "--PC版:根据主科类的主键ID获取其下子科类--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd  = new PageData();
		pd = this.getPageData();
		List<PageData> childkeleiList=kehuService.getkeleiListByParentID(pd);
		map.put("childkeleiList", childkeleiList);
		return AppUtil.returnObject(pd, map);
	}
	/**
	 * PC版:获取医生列表
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getYiShengList")
	@ResponseBody
	public Object getYiShengList() throws Exception{
		logBefore(logger, "--PC版:获取医生列表--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd  = new PageData();
		pd = this.getPageData();
		PageData tempData=new PageData();
		//地址
		String address="";
		if(Tools.notEmpty(pd.getString("sheng"))){
			if(Tools.notEmpty(pd.getString("shi"))){
				address=pd.getString("sheng")+" "+pd.getString("shi");
			}else{
				address=pd.getString("sheng");
			}
		}
		tempData.put("address", address);
		//limit
		tempData.put("begin", (Integer.parseInt(pd.getString("currentPage"))-1) * Integer.parseInt(pd.getString("pageSize")));
		tempData.put("size", Integer.parseInt(pd.getString("pageSize")));
		//类型
		tempData.put("category", pd.getString("category"));
		//科类
		if(Tools.notEmpty(pd.getString("zhukelei"))){
			tempData.put("zhukelei", pd.getString("zhukelei"));
		}else{
			tempData.put("zhukelei", "");
		}
		if(Tools.notEmpty(pd.getString("zikelei"))){
			tempData.put("zikelei", pd.getString("zikelei"));
		}else{
			tempData.put("zikelei", "");
		}
		List<PageData> yishengList = keHuPcService.getyishengList(tempData);
		System.out.println("+++++++++++++++yishengList+++++++++++++++++++++="+yishengList);
		map.put("yishengList", yishengList);
		if(yishengList.size()>0){
			map.put("pageCount", yishengList.get(0).get("pageCount"));
		}else{
			map.put("pageCount", 0);
		}
		map.put("currentPage", pd.getString("currentPage"));
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * PC版:医生详情
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/yiShengDetail")
	public ModelAndView yiShengDetail() throws Exception{
		logBefore(logger, "--PC版:医生详情--");
		ModelAndView mv=new ModelAndView();
		PageData pd  = new PageData();
		pd = this.getPageData();
		
		//医生详情列表
		PageData xqData  = kehuService.getYishengDetail(pd);
		mv.addObject("xqData",xqData);
		
		//服务列表
		List<PageData> fuwuList = kehuService.getyishengFuwuList(pd);
		mv.addObject("fuwuList",fuwuList);
		
		//案例列表
		List<PageData> anliList = kehuService.getyishengAnliList(pd);
		mv.addObject("anliList",anliList);
		
		if(SessionIs().equals("kehu")){
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getJfenGquanXnibi());
		}else if(SessionIs().equals("shanghu")){
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getsJfenGquanXnibi());
		}
		//获取底栏联系我们
		mv.addObject("bottomPd", getContactUs());
		mv.setViewName("zywPC/home/home");
		return mv;
	}
	
	//TODO 新闻公告
	/**
	 * PC版:新闻公告详情
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getXinwenDetail")
	public ModelAndView getXinwenDetail() throws Exception{
		logBefore(logger, "--PC版:新闻公告详情--");
		ModelAndView mv=new ModelAndView();
		PageData pd  = new PageData();
		pd = this.getPageData();
		PageData xgData  = kehuService.getXinwenDetail(pd);
		String titleMsg="新闻详情";
		if(xgData.getString("category").equals("2")){
			titleMsg="公告详情";
		}
		mv.addObject("titleMsg",titleMsg);
		mv.addObject("xgData",xgData);
		
		if(SessionIs().equals("kehu")){
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getJfenGquanXnibi());
		}else if(SessionIs().equals("shanghu")){
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getsJfenGquanXnibi());
		}
		//获取底栏联系我们
		mv.addObject("bottomPd", getContactUs());
		mv.setViewName("zywPC/new_detail");
		return mv;
	}
	
	//TODO 常见疾病
	/**
	 * PC版:首页-查看常见疾病详情
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/showCjjbDetail")
	public ModelAndView showCjjbDetail() throws Exception{
		logBefore(logger, "--PC版:常见疾病详情页--");
		ModelAndView mv=new ModelAndView();
		PageData pd  = new PageData();
		pd = this.getPageData();
		PageData cjjbData = kehuService.showChangjianjibingDetailByID(pd);
		mv.addObject("cjjbData", cjjbData);
		
		if(SessionIs().equals("kehu")){
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getJfenGquanXnibi());
		}else if(SessionIs().equals("shanghu")){
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getsJfenGquanXnibi());
		}
		//获取底栏联系我们
		mv.addObject("bottomPd", getContactUs());
		mv.setViewName("zywPC/cjjb/cjjb_detail");
		return mv;
	}
	
	/**
	 * PC版:首页-常见疾病更多
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/showCjjbMore")
	public ModelAndView showCjjbMore() throws Exception{
		logBefore(logger, "--PC版:首页-常见疾病更多--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();

		//分页使用
		if(Tools.notEmpty(pd.getString("currentPage"))){
			pd.put("begin", (Integer.parseInt(pd.getString("currentPage"))-1) * Integer.parseInt(pd.getString("pageSize")));
			pd.put("size", Integer.parseInt(pd.getString("pageSize")));
			
		}else{
			pd.put("begin", 0);
			pd.put("size", 16);
		}
		
		//获取疑难杂症列表
		List<PageData> cjjbList=keHuPcService.getChangJianJiBingList(pd);
		mv.addObject("cjjbList", cjjbList);
		
		//总记录数，分页使用
		if(cjjbList!=null && cjjbList.size()>0){
			mv.addObject("pageCount", cjjbList.get(0).get("pageCount"));
		}
		mv.addObject("pd", pd);
		
		if(SessionIs().equals("kehu")){
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getJfenGquanXnibi());
		}else if(SessionIs().equals("shanghu")){
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getsJfenGquanXnibi());
		}
		//获取底栏联系我们
		mv.addObject("bottomPd", getContactUs());
		mv.setViewName("zywPC/cjjb/cjjb_list");
		return mv;
	}
	
	//TODO 疑难杂症
	/**
	 * PC版:首页-查看疑难杂症详情
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/showYnzzDetail")
	public ModelAndView showYnzzDetail() throws Exception{
		logBefore(logger, "--PC版:疑难杂症详情页--");
		ModelAndView mv=new ModelAndView();
		PageData pd  = new PageData();
		pd = this.getPageData();
		PageData ynzzData = kehuService.showYnzzDetailByID(pd);
		mv.addObject("ynzzData", ynzzData);
		
		if(SessionIs().equals("kehu")){
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getJfenGquanXnibi());
		}else if(SessionIs().equals("shanghu")){
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getsJfenGquanXnibi());
		}
		//获取底栏联系我们
		mv.addObject("bottomPd", getContactUs());
		mv.setViewName("zywPC/ynzz/detail_ynzz");
		return mv;
	}
	
	/**
	 * PC版:首页-疑难杂症更多
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/showYnzzMore")
	public ModelAndView showYnzzMore() throws Exception{
		logBefore(logger, "--PC版:首页-疑难杂症更多--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();

		//分页使用
		if(Tools.notEmpty(pd.getString("currentPage"))){
			pd.put("begin", (Integer.parseInt(pd.getString("currentPage"))-1) * Integer.parseInt(pd.getString("pageSize")));
			pd.put("size", Integer.parseInt(pd.getString("pageSize")));
			
		}else{
			pd.put("begin", 0);
			pd.put("size", 16);
		}
		
		//获取疑难杂症列表
		List<PageData> ynzzList=keHuPcService.getYiNanZaZhengList(pd);
		mv.addObject("ynzzList", ynzzList);
		mv.addObject("pd", pd);
		//总记录数，分页使用
		if(ynzzList!=null && ynzzList.size()>0){
			mv.addObject("pageCount", ynzzList.get(0).get("pageCount"));
		}
		
		if(SessionIs().equals("kehu")){
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getJfenGquanXnibi());
		}else if(SessionIs().equals("shanghu")){
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getsJfenGquanXnibi());
		}
		//获取底栏联系我们
		mv.addObject("bottomPd", getContactUs());
		mv.setViewName("zywPC/ynzz/yinanzazheng");
		return mv;
	}
	
	//TODO  主页
	/**
	 * PC版:进入找医网客户端主页
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/index")
	public ModelAndView index() throws Exception{
		logBefore(logger, "--PC版:进入找医网客户端主页--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		
		//轮播图列表
		pd.put("tidImg", "2");
		List<PageData> bannerList = kehuService.getBannerImagesList(pd);
		mv.addObject("bannerList", bannerList);
		
		//主页右侧找医生内容
		List zhaoYiShengList=new ArrayList<PageData>();
		List<PageData> zhaoYiSheng=keHuPcService.getDataIndexOfZhaoYiSheng(pd);
		for (PageData tempPd:zhaoYiSheng) {
			PageData zhaoYiShengPd=new PageData();
			zhaoYiShengPd.put("zhuKeLei", tempPd.getString("name1"));
			zhaoYiShengPd.put("kelei_id", tempPd.getString("kelei_id"));
			String str[]=tempPd.getString("name2").split(",");
			List<PageData> zhaoYiSheng2=new ArrayList<PageData>();
			for (int i = 0; i < str.length; i++) {
				PageData tempPd1=new PageData();
				tempPd1.put("ziKeLei", str[i]);
				zhaoYiSheng2.add(tempPd1);
			}
			zhaoYiShengPd.put("ziKeLeiList", zhaoYiSheng2);
			zhaoYiShengList.add(zhaoYiShengPd);
		}
		mv.addObject("zhaoYiShengList", zhaoYiShengList);
		
		//主页右侧找机构内容
		List zhaoJiGouList=new ArrayList<PageData>();
		List<PageData> zhaoJiGou=keHuPcService.getDataIndexOfZhaoJiGou(pd);
		for (PageData tempPd:zhaoJiGou) {
			PageData zhaoJiGouPd=new PageData();
			zhaoJiGouPd.put("jiGouType", tempPd.getString("dengji"));
			
			String youName[]=tempPd.getString("youName").split(",");
			String ids[]=tempPd.getString("user_shanghu_id").split(",");
			List<PageData> zhaoJiGou2=new ArrayList<PageData>();
			for (int i = 0; i < youName.length; i++) {
				PageData tempPd1=new PageData();
				tempPd1.put("youName", youName[i]);
				tempPd1.put("id", ids[i]);
				zhaoJiGou2.add(tempPd1);
			}
			zhaoJiGouPd.put("youNameList", zhaoJiGou2);
			zhaoJiGouList.add(zhaoJiGouPd);
		}
		mv.addObject("zhaoJiGouList", zhaoJiGouList);
		
		//主页右侧找药商内容
		List zhaoYaoShangList=new ArrayList<PageData>();
		List<PageData> zhaoYaoShang=keHuPcService.getDataIndexOfZhaoYaoShang(pd);
		for (PageData tempPd:zhaoYaoShang) {
			PageData zhaoYaoShangPd=new PageData();
			if(tempPd.getString("category").equals("1")){
				zhaoYaoShangPd.put("yaoShangType", "中药");
			}else if(tempPd.getString("category").equals("2")){
				zhaoYaoShangPd.put("yaoShangType", "西药");
			}else{
				zhaoYaoShangPd.put("yaoShangType", "中药/西药");
			}
			String youName[]=tempPd.getString("youName").split(",");
			String ids[]=tempPd.getString("user_shanghu_id").split(",");
			List<PageData> zhaoYaoShang2=new ArrayList<PageData>();
			for (int i = 0; i < youName.length; i++) {
				PageData tempPd1=new PageData();
				tempPd1.put("youName", youName[i]);
				tempPd1.put("id", ids[i]);
				zhaoYaoShang2.add(tempPd1);
			}
			zhaoYaoShangPd.put("youNameList", zhaoYaoShang2);
			zhaoYaoShangList.add(zhaoYaoShangPd);
		}
		//获取药商列表
		List<PageData> yaoshangList = kehuService.getYaoshangList(pd);
		mv.addObject("zhaoYaoShangList", zhaoYaoShangList);
		mv.addObject("yaoshangList", yaoshangList);
		
		//主页右侧疑难杂症内容
		List yiNanZaZhengList=new ArrayList<PageData>();
		List<PageData> yiNanZaZheng=keHuPcService.getDataIndexOfYiNanZaZheng(pd);
		for (PageData tempPd:yiNanZaZheng) {
			PageData yiNanZaZhengPd=new PageData();
			yiNanZaZhengPd.put("yiNanZaZhengType", tempPd.getString("letter"));
			
			String namess[]=tempPd.getString("namess").split(",");
			String ids[]=tempPd.getString("ids").split(",");
			List<PageData> yiNanZaZheng2=new ArrayList<PageData>();
			for (int i = 0; i < namess.length; i++) {
				PageData tempPd1=new PageData();
				tempPd1.put("name", namess[i]);
				tempPd1.put("id", ids[i]);
				yiNanZaZheng2.add(tempPd1);
			}
			yiNanZaZhengPd.put("nameList", yiNanZaZheng2);
			yiNanZaZhengList.add(yiNanZaZhengPd);
		}
		//获取药商列表
		List<PageData> ynzzNameList = keHuPcService.getDataIndexOfYiNanZaZhengAll(pd);
		mv.addObject("yiNanZaZhengList", yiNanZaZhengList);
		mv.addObject("ynzzNameList", ynzzNameList);
		
		//主页需求大厅内容
		List xuQiuDaTingList=new ArrayList<PageData>();
		List<PageData> xuQiuDaTing=keHuPcService.getDataIndexOfXuQiuList(pd);
		for (PageData tempPd:xuQiuDaTing) {
			PageData xuQiuDaTingPd=new PageData();
			xuQiuDaTingPd.put("headImg_url", tempPd.getString("headImg_url"));
			xuQiuDaTingPd.put("sex", tempPd.getString("sex"));
			xuQiuDaTingPd.put("age", tempPd.getString("age"));
			xuQiuDaTingPd.put("address", tempPd.getString("address"));
			xuQiuDaTingPd.put("disease", tempPd.getString("disease"));
			xuQiuDaTingPd.put("fabu_time", tempPd.getString("fabu_time"));
			xuQiuDaTingPd.put("symptom", tempPd.getString("symptom"));
			
			List<PageData> xuQiuDaTing2=new ArrayList<PageData>();
			if(Tools.notEmpty(tempPd.get("imgPaths").toString())){
				String imgPaths[]=tempPd.getString("imgPaths").split(",");
				for (int i = 0; i < imgPaths.length; i++) {
					PageData tempPd1=new PageData();
					tempPd1.put("imgPath", imgPaths[i]);
					xuQiuDaTing2.add(tempPd1);
				}
			}
			xuQiuDaTingPd.put("imgPathList", xuQiuDaTing2);
			xuQiuDaTingList.add(xuQiuDaTingPd);
		}
		mv.addObject("xuQiuDaTingList", xuQiuDaTingList);
		
		//常见疾病
		List<PageData> changJianJiBingList=keHuPcService.getChangJianJiBingListOfIndex(pd);
		mv.addObject("changJianJiBingList", changJianJiBingList);
		
		//新闻
		pd.put("category", "1");
		List<PageData> newsList=keHuPcService.getNewsAndNoticeList(pd);
		mv.addObject("newsList", newsList);
		
		//公告
		pd.put("category", "2");
		List<PageData> noticeList=keHuPcService.getNewsAndNoticeList(pd);
		mv.addObject("noticeList", noticeList);
		
		//医生列表
		List<PageData> yishengList = kehuService.getyishengList(pd);
		mv.addObject("yishengList", yishengList);
		
		//机构列表
		List<PageData> jigouList = kehuService.getjigouList(pd);
		mv.addObject("jigouList", jigouList);
		
		//药商列表
		List<PageData> yaoShangList = kehuService.getYaoshangList(pd);
		mv.addObject("yaoShangList", yaoShangList);
		
		//平台简介
		PageData pingtaiPd = keHuPcService.getDataOfGuanYuWoMen(pd);
		mv.addObject("pingtaiPd", pingtaiPd);
		if(SessionIs().equals("kehu")){
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getJfenGquanXnibi());
		}else if(SessionIs().equals("shanghu")){
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getsJfenGquanXnibi());
		}
		//获取底栏联系我们
		mv.addObject("bottomPd", getContactUs());
		mv.setViewName("zywPC/index");
		return mv;
	}
	
	//TODO 会员中心
	/**
	 * PC版:我的订单
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/personCenter")
	public ModelAndView personCenter() throws Exception{
		logBefore(logger, "--PC版:我的订单--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		if(SessionIs().equals("kehu")){
			//获取个人资料
			pd.put("user_kuhu_id", getSessionUser().getUser_kuhu_id());
			pd.put("user_kuhu_fid", getSessionUser().getUser_kuhu_id());
			PageData pd1=kehuService.getDetailByID(pd);
			mv.addObject("pd", pd1);
			
			//获取订单信息
			if(Tools.isEmpty(pd.getString("order_state"))){
				pd.put("order_state", "2");
			}
			List<PageData> yishengOrderList =  kehuService.getYishengOrderList(pd);
			List<PageData> yaoshangOrderList =  kehuService.getYaoshangOrderList(pd);
			List<PageData> jigouOrderList =  kehuService.getjigouOrderList(pd);
			mv.addObject("yishengOrderList", yishengOrderList);
			mv.addObject("yaoshangOrderList", yaoshangOrderList);
			mv.addObject("jigouOrderList", jigouOrderList);
			mv.addObject("order_state", pd.get("order_state"));
			
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getJfenGquanXnibi());
			//获取底栏联系我们
			mv.addObject("bottomPd", getContactUs());
			mv.setViewName("zywPC/center/jiuzhenXiangQ");
		}else if(SessionIs().equals("shanghu")){
			mv.setViewName("zywPC/center/myOrder");
			
			//订单列表
			pd.put("user_shanghu_fid", getsSessionUser().getUser_shanghu_id());
			pd.put("order_state", "2");
			List<PageData> orderList=new ArrayList<PageData>();
			if(getsSessionUser().getIdentity().equals("1")){//获取医生订单列表
				orderList=orderService.getOrderOfYiSheng(pd);
			}else if(getsSessionUser().getIdentity().equals("2")){//获取机构订单列表
				orderList=orderService.getOrderOfJiGou(pd);
			}else {//获取药商订单列表
				orderList=orderService.getOrderOfYaoShang(pd);
			}
			mv.addObject("orderList", orderList);
			
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getsJfenGquanXnibi());
			//获取底栏联系我们
			mv.addObject("bottomPd", getContactUs());
		}else{
			mv.setViewName("redirect:/api/keHuPc/toLogin.do");
		}
		return mv;
	}
	/**
	 * PC版:会员中心
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/personCenter1")
	public ModelAndView personCenter1() throws Exception{
		logBefore(logger, "--PC版:会员中心--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		if(SessionIs().equals("kehu")){
			//获取个人资料
			pd.put("user_kuhu_id", getSessionUser().getUser_kuhu_id());
			PageData pd1=kehuService.getDetailByID(pd);
			mv.addObject("pd", pd1);
			//获取一级团队信息
			List<PageData> yijiList = kehuService.getYijiTeamList(pd);
			mv.addObject("yijiList", yijiList);
			//获取二级团队信息
			List<PageData> ErjiList = kehuService.getErjiTeamList(pd);
			mv.addObject("ErjiList", ErjiList);
			//获取积分兑换股权的信息
			PageData tempPd=shangHuService.getDataOfJiFenHuanGuQuan(pd);
			mv.addObject("tempPd", tempPd);
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getJfenGquanXnibi());
			//获取底栏联系我们
			mv.addObject("bottomPd", getContactUs());
			mv.setViewName("zywPC/myTeam/myTeam");
		}else if(SessionIs().equals("shanghu")){
			//获取个人资料
			pd.put("user_shanghu_id", getsSessionUser().getUser_shanghu_id());
			PageData pd1=shangHuService.getDataById(pd);
			pd1.put("jifen", pd1.getString("integral"));
			mv.addObject("pd", pd1);
			//获取积分兑换股权的信息
			PageData tempPd=shangHuService.getDataOfJiFenHuanGuQuan(pd);
			mv.addObject("tempPd", tempPd);
			
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getsJfenGquanXnibi());
			//获取底栏联系我们
			mv.addObject("bottomPd", getContactUs());
			mv.setViewName("zywPC/center/myTeam");
		}else{
			mv.setViewName("redirect:/api/keHuPc/toLogin.do");
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
		if(SessionIs().equals("kehu")){
			//获取我的积分
			pd.put("user_kehu_id", getSessionUser().getUser_kuhu_id());
			pd=kehuService.getjgDataById(pd);
			pd.put("user_kehu_id", getSessionUser().getUser_kuhu_id());
			//获取积分兑换股权的信息
			PageData tempPd=shangHuService.getDataOfJiFenHuanGuQuan(pd);
			
			//更新积分和股权信息
			pd.put("jifen", Integer.parseInt(pd.get("jifen").toString()) - Integer.parseInt(tempPd.get("jifen_num").toString()));
			pd.put("guquan", Double.parseDouble(pd.get("guquan").toString()) + Double.parseDouble(tempPd.get("guquan_num").toString()));
			kehuService.updateJiFenAndGuQuan(pd);
			
			map.put("respCode", "01");
		}else if(SessionIs().equals("shanghu")){
			//获取我的积分
			pd.put("user_shanghu_id", getsSessionUser().getUser_shanghu_id());
			pd=shangHuService.getDataById(pd);
			pd.put("user_shanghu_id", getsSessionUser().getUser_shanghu_id());
			//获取积分兑换股权的信息
			PageData tempPd=shangHuService.getDataOfJiFenHuanGuQuan(pd);
			
			//更新积分和股权信息
			pd.put("integral", Integer.parseInt(pd.get("integral").toString()) - Integer.parseInt(tempPd.get("jifen_num").toString()));
			pd.put("guquan", RoundUtil.fixd2(Double.parseDouble(pd.get("guquan").toString()) + Double.parseDouble(tempPd.get("guquan_num").toString())));
			shangHuService.updateJiFenAndGuQuan(pd);
			
			map.put("respCode", "01");
		}else{
			map.put("respCode", "00");
		}
		return AppUtil.returnObject(pd, map);
	}
	/**
	 * PC版:主页点击个人资料
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/personInformation")
	public ModelAndView personInformation() throws Exception{
		logBefore(logger, "--PC版:主页点击个人资料--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		if(SessionIs().equals("kehu")){
			pd.put("user_kuhu_id", getSessionUser().getUser_kuhu_id());
			pd=kehuService.getDetailByID(pd);
			if(Tools.notEmpty(pd.getString("address"))){
				String address[]=pd.getString("address").replaceAll(" ", ",").split(",");
				String sheng=address[0];
				String city=address[1];
				String qu=address[2];
				pd.put("sheng", sheng);
				pd.put("city", city);
				pd.put("qu", qu);
			}
			System.out.println("+++++++++++++++++++++++++++++++pd"+pd);
			mv.addObject("pd", pd);
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getJfenGquanXnibi());
			//获取底栏联系我们
			mv.addObject("bottomPd", getContactUs());
			mv.setViewName("zywPC/center/perZiliao");
		}else if(SessionIs().equals("shanghu")){
			mv.setViewName("zywPC/center/yisheng");
			ShangHu shangHu=getsSessionUser();
			if(shangHu.getIdentity().equals("1")){
				//获取顶级科室的名称列表
				pd.put("parent_id", "0");
				List<PageData> listtop=shangHuService.getkeLeiList(pd);
				//获取第一个顶级科室下的子科类
				pd.put("parent_id", listtop.get(0).getString("kelei_id"));
				List<PageData> listchild=shangHuService.getkeLeiList(pd);
				mv.addObject("listtop", listtop);
				mv.addObject("listchild", listchild);
			}else if(shangHu.getIdentity().equals("2")){
				PageData tempPd=new PageData();
				tempPd.put("user_shanghu_id", getsSessionUser().getUser_shanghu_id());
				List<PageData> list=shangHuService.getJiGouTypeList(tempPd);
				mv.addObject("list", list);
			}
			
			//获取详情
			PageData detaileData=new PageData();
			detaileData.put("yisheng_id", shangHu.getUser_shanghu_id());
			detaileData=kehuService.getYishengDetail(detaileData);
			if(Tools.notEmpty(detaileData.getString("address"))){
				String address[]=detaileData.getString("address").replaceAll(" ", ",").split(",");
				String sheng=address[0];
				String city=address[1];
				String qu=address[2];
				detaileData.put("sheng", sheng);
				detaileData.put("city", city);
				detaileData.put("qu", qu);
			}
			mv.addObject("detaileData",detaileData);
			
			//案例列表
			pd.put("yisheng_id", shangHu.getUser_shanghu_id());
			List<PageData> anliList = kehuService.getyishengAnliList(pd);
			mv.addObject("anliList",anliList);
			
			//获取积分、虚拟币、股权
			mv.addObject("topPd", getsJfenGquanXnibi());
			//获取底栏联系我们
			mv.addObject("bottomPd", getContactUs());
		}else{
			mv.setViewName("redirect:/api/keHuPc/toLogin.do");
		}
		return mv;
	}
	/**
	 * 保存基本信息
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/saveBaseInformation")
	public ModelAndView saveBaseInformation(
			@RequestParam(required=false) MultipartFile headImgFile,
			String youName,
			String position,
			String mark,
			String linkMethod,
			String address,
			String category,
			String keshiName,
			String dengji,
			String headImg
			) throws Exception{
		logBefore(logger, "--保存基本信息--");
		ModelAndView mv=new ModelAndView();
		if(issSession()){
			PageData dataPd=new PageData();

			if(headImgFile!=null && !headImgFile.isEmpty()){
				//原有头像如果存在，则删除
				if(Tools.notEmpty(headImg)){
					FileUtil.delFile(PathUtil.getClasspath()+headImg);
				}
				
				String path=Const.FILEPATHIMG + "shangHu/" + "headImg/" + DateUtil.getDays() + "/";
				String headImgFileName=FileUpload.fileUp(headImgFile, PathUtil.getClasspath() + path, this.get32UUID());
				dataPd.put("headImg", path+headImgFileName);
				
			}else{
				dataPd.put("headImg", headImg);
			}
			dataPd.put("user_shanghu_id", getsSessionUser().getUser_shanghu_id());
			dataPd.put("youName", youName);
			dataPd.put("position", position);
			dataPd.put("mark", mark);
			dataPd.put("linkMethod", linkMethod);
			dataPd.put("address", address);
			dataPd.put("category", category);
			dataPd.put("dengji", dengji);
			dataPd.put("keshiName", keshiName);
			shangHuService.updatePersonInformation(dataPd);
			mv.setViewName("redirect:/api/keHuPc/personInformation");
		}else{
			mv.setViewName("redirect:/api/keHuPc/tosLogin");
		}
		return mv;
	}
	/**
	 * 保存个人简介或擅长领域
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/saveIntroductOrGoodsField")
	@ResponseBody
	public ModelAndView saveIntroductOrGoodsField() throws Exception{
		logBefore(logger, "--保存个人简介或擅长领域--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();

		if(issSession()){
			pd.put("user_shanghu_id", getsSessionUser().getUser_shanghu_id());
			shangHuService.updatePersonIntroductOrGoodsField(pd);
			mv.setViewName("redirect:/api/keHuPc/personInformation.do");
		}else {
			mv.setViewName("redirect:/api/keHuPc/toLogin.do");
		}
		return mv;
	}
	/**
	 * PC版:已就诊
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/yiJiuZhen")
	public ModelAndView yiJiuZhen() throws Exception {
		logBefore(logger, "---PC版:已就诊---");
		ModelAndView mv = new ModelAndView();
		if(isSession()){
			PageData pd = new PageData();
			pd = this.getPageData();
			PageData rpd = kehuService.getAmountById(pd);
			if(rpd!=null){
				//成交金额
				double cjAmount =Double.parseDouble(rpd.get("chengjiaoAmount").toString());
				//现金金额
				double xjAmount = Double.parseDouble(rpd.get("xianjinAmount").toString());
				
				double chengjiaoAmount = cjAmount+Double.parseDouble(pd.getString("price"));
				double xianjinAmount =   xjAmount+Double.parseDouble(pd.getString("price"));
				PageData pdset = new PageData();
				pdset.put("chengjiaoAmount", chengjiaoAmount);
				pdset.put("xianjinAmount", xianjinAmount);
				pdset.put("user_shanghu_id", pd.get("user_shanghu_id"));
				//修改商户的金额
				kehuService.updateAmountById(pdset);
			}
			pd.put("complete_time", DateUtil.getTime());
			if(pd.get("type").equals("1")){
				//修改医生订单状态
				kehuService.updateYishengOrderState(pd);
			}else if(pd.get("type").equals("2")){
				//修改药商订单状态
				kehuService.updateYaoshangOrderState(pd);
			}else{
				//修改机构订单状态
				kehuService.updatejigouOrderState(pd);
			}
			mv.setViewName("redirect:/api/keHuPc/personCenter");
		}else{
			mv.setViewName("redirect:/api/keHuPc/toLogin.do");
		}
		return mv;
	}
	
	//TODO 注册
	/**
	 * PC版:进入找医网客户端注册页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toRegister")
	public ModelAndView toRegister() throws Exception{
		logBefore(logger, "--PC版:进入找医网客户端注册页面--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		mv.addObject("pd", pd);
		//获取积分、虚拟币、股权
		mv.addObject("topPd", getJfenGquanXnibi());
		//获取底栏联系我们
		mv.addObject("bottomPd", getContactUs());
		mv.setViewName("zywPC/login/register");
		return mv;
	}
	/**
	 * PC版:进入找医网商户端注册页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toRegister1")
	public ModelAndView toRegister1() throws Exception{
		logBefore(logger, "--PC版:进入找医网商户端注册页面--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		mv.addObject("pd", pd);
		//获取积分、虚拟币、股权
		mv.addObject("topPd", getsJfenGquanXnibi());
		//获取底栏联系我们
		mv.addObject("bottomPd", getContactUs());
		mv.setViewName("zywPC/login/sregister");
		return mv;
	}
	
	//TODO 登录
	/**
	 * PC版:进入找医网客户端登录页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toLogin")
	public ModelAndView toLogin() throws Exception{
		logBefore(logger, "--PC版:进入找医网客户端登录页面--");
		ModelAndView mv=new ModelAndView();
		//获取积分、虚拟币、股权
		mv.addObject("topPd", getJfenGquanXnibi());
		//获取底栏联系我们
		mv.addObject("bottomPd", getContactUs());
		mv.setViewName("zywPC/login/login");
		return mv;
	}
	/**
	 * PC版:进入找医网商户端登录页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/tosLogin")
	public ModelAndView tosLogin() throws Exception{
		logBefore(logger, "--PC版:进入找医网商户端登录页面--");
		ModelAndView mv=new ModelAndView();
		//获取积分、虚拟币、股权
		mv.addObject("topPd", getsJfenGquanXnibi());
		//获取底栏联系我们
		mv.addObject("bottomPd", getContactUs());
		mv.setViewName("zywPC/login/slogin");
		return mv;
	}
	
	//TODO 退出登录
	/**
	 * PC版:退出登录操作
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/tuichu")
	public ModelAndView tuichu(HttpSession session){
		logBefore(logger, "--PC版:退出登录操作--");
		ModelAndView mv=new ModelAndView();
		session.removeAttribute(Const.SESSION_KEHU_USER);
		session.removeAttribute(Const.SESSION_SHANGHU_USER);
		mv.setViewName("redirect:/api/keHuPc/index.do");
		return mv;
	}
	
	//TODO 忘记密码(客户)
	/**
	 * PC版:找医网客户端忘记密码(身份验证页面)
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/towangjimima")
	public ModelAndView wangjimima() throws Exception{
		logBefore(logger, "--PC版:找医网客户端忘记密码(身份验证页面)--");
		ModelAndView mv=new ModelAndView();
		//获取积分、虚拟币、股权
		mv.addObject("topPd", getJfenGquanXnibi());
		//获取底栏联系我们
		mv.addObject("bottomPd", getContactUs());
		mv.setViewName("zywPC/login/find1");
		return mv;
	}
	
	/**
	 * PC版:找医网客户端忘记密码(输入新密码页面)
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toxinmima")
	public ModelAndView xinmima() throws Exception{
		logBefore(logger, "-PC版:找医网客户端忘记密码(输入新密码页面)--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd =this.getPageData();
		mv.addObject("phone", pd.getString("phone"));
		//获取积分、虚拟币、股权
		mv.addObject("topPd", getJfenGquanXnibi());
		//获取底栏联系我们
		mv.addObject("bottomPd", getContactUs());
		mv.setViewName("zywPC/login/find2");
		return mv;
	}
	
	/**
	 * PC版:找医网客户端忘记密码(更新新密码)
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/updatePassword")
	@ResponseBody
	public Object updatePassword() throws Exception{
		logBefore(logger, "--PC版:找医网客户端忘记密码(更新新密码)--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		//根据手机号获取用户信息,判断该手机号 是否已经注册
		PageData userPd=kehuService.isExistUser(pd);
		if(userPd==null){
			map.put("respCode", "00");
		}else{
			pd.put("loginPassword", MD5.md5(pd.getString("password")));
			kehuService.updatePassword(pd);
			map.put("respCode", "01");
		}
		return AppUtil.returnObject(pd, map);
	}
	//TODO 忘记密码(商户)
	/**
	 * PC版:找医网商户端忘记密码(身份验证页面)
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/towangjimima1")
	public ModelAndView wangjimima1() throws Exception{
		logBefore(logger, "--PC版:找医网商户端忘记密码(身份验证页面)--");
		ModelAndView mv=new ModelAndView();
		//获取积分、虚拟币、股权
		mv.addObject("topPd", getsJfenGquanXnibi());
		//获取底栏联系我们
		mv.addObject("bottomPd", getContactUs());
		mv.setViewName("zywPC/login/sfind1");
		return mv;
	}
	
	/**
	 * PC版:找医网商户端忘记密码(输入新密码页面)
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toxinmima1")
	public ModelAndView xinmima1() throws Exception{
		logBefore(logger, "-PC版:找医网商户端忘记密码(输入新密码页面)--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd =this.getPageData();
		mv.addObject("pd", pd);
		//获取积分、虚拟币、股权
		mv.addObject("topPd", getsJfenGquanXnibi());
		//获取底栏联系我们
		mv.addObject("bottomPd", getContactUs());
		mv.setViewName("zywPC/login/sfind2");
		return mv;
	}
	
	//TODO 判断信息是否完善
	/**
	 * PC版:判断信息是否完善
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/InforPerfectIsOrNo")
	@ResponseBody
	public Object InforPerfectIsOrNo() throws Exception{
		logBefore(logger, "--PC版:判断信息是否完善--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		if(isSession()){
			pd.put("user_kuhu_id", getSessionUser().getUser_kuhu_id());
			pd=kehuService.getDetailByID(pd);
			if(Tools.notEmpty(pd.getString("realName")) && Tools.notEmpty(pd.getString("address")) && Tools.notEmpty(pd.getString("sex")) && Tools.notEmpty(pd.getString("age")) && Tools.notEmpty(pd.getString("phone"))){
				map.put("respCode", "01");
				map.put("respMsg", "信息已完善");
			}else{
				map.put("respCode", "00");
				map.put("respMsg", "信息未完善");
			}
		}else{
			map.put("respCode", "02");
			map.put("respMsg", "还未登录");
		}
		return AppUtil.returnObject(pd, map);
	}
	
	
	
	/**
	 * 判断session是否存在以及类型
	 * @return
	 */
	public String SessionIs(){
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		ZywKeHu keHu=(ZywKeHu) session.getAttribute(Const.SESSION_KEHU_USER);
		ShangHu shangHu=(ShangHu) session.getAttribute(Const.SESSION_SHANGHU_USER);
		if(keHu!=null){
			return "kehu";
		}else if(shangHu!=null){
			return "shanghu";
		}
		return "zhang";
	}
	
	/**
	 * 判断客户session是否存在
	 * 存在：返回TRUE
	 * 反之：返回FALSE
	 * @return
	 */
	public boolean isSession(){
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		ZywKeHu keHu=(ZywKeHu) session.getAttribute(Const.SESSION_KEHU_USER);
		if(keHu==null){
			return false;
		}
		return true;
	}
	/**
	 * 判断商户session是否存在
	 * 存在：返回TRUE
	 * 反之：返回FALSE
	 * @return
	 */
	public boolean issSession(){
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		ShangHu shangHu=(ShangHu) session.getAttribute(Const.SESSION_SHANGHU_USER);
		if(shangHu==null){
			return false;
		}
		return true;
	}

	/**
	 * 获取客户session对象
	 * @return
	 */
	public ZywKeHu getSessionUser(){
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		ZywKeHu keHu=(ZywKeHu) session.getAttribute(Const.SESSION_KEHU_USER);
		return keHu;
	}
	/**
	 * 获取商户session对象
	 * @return
	 */
	public ShangHu getsSessionUser(){
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		ShangHu shangHu=(ShangHu) session.getAttribute(Const.SESSION_SHANGHU_USER);
		return shangHu;
	}
	
	/**
	 * 获取客户积分、虚拟币、股权
	 * @return
	 */
	public PageData getJfenGquanXnibi() throws Exception{
		if(isSession()){
			//获取积分、虚拟币、股权
			PageData topPd=new PageData();
			topPd.put("user_kuhu_id", getSessionUser().getUser_kuhu_id());
			topPd=keHuPcService.getGuXuJiByUserId(topPd);
			return topPd;
		}
		return null;
	}
	/**
	 * 获取商户积分、虚拟币、股权
	 * @return
	 */
	public PageData getsJfenGquanXnibi() throws Exception{
		if(issSession()){
			//获取积分、虚拟币、股权
			PageData topPd=new PageData();
			topPd.put("user_shanghu_id", getsSessionUser().getUser_shanghu_id());
			topPd=shangHuService.getDataById(topPd);
			topPd.put("jifen", topPd.getString("integral"));
			return topPd;
		}
		return null;
	}
	
	/**
	 * 获取联系我们的信息（QQ、电话、微信等）
	 * @return
	 */
	public PageData getContactUs() throws Exception{
		PageData pd=new PageData();
		pd=shangHuService.getDataOfContactUs(pd);
		return pd;
	}
	//TODO 后台功能：关于我们
	///////////////////////////////////////////////////////////系统管理:关于我们////网站后台功能//////////////////////////////////
	/**
	 * 获取关于我们列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/guanyuuslistPage")
	public ModelAndView guanyuuslistPage(Page page) throws Exception {
		logBefore(logger, "---获取关于我们列表--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> list = keHuPcService.guanyuuslistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("system/guanyuwomen/guanyuwomen_list");
		return mv;
	}

	/**
	 * 进入关于我们添加页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/toAddGuanYuWoMen")
	public ModelAndView toAddGuanYuWoMen() {
		logBefore(logger, "---进入关于我们添加页--");
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "insertGuanYuWoMen");
		mv.setViewName("system/guanyuwomen/guanyuwomen_edit");
		return mv;
	}

	/**
	 * 添加关于我们
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertGuanYuWoMen")
	public ModelAndView insertGuanYuWoMen(
			@RequestParam(required=false) MultipartFile imgPathFile,
			String content
			) throws Exception {
		logBefore(logger, "---添加关于我们--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();

		String path=Const.FILEPATHIMG + "shangHu/" + "headImg/" + DateUtil.getDays() + "/";
		String filePath=PathUtil.getClasspath() + path;
		String imgPathFileName=FileUpload.fileUp(imgPathFile, filePath, this.get32UUID());
		pd.put("imgPath", path+imgPathFileName);
		
		pd.put("guanyuwomen_id", this.get32UUID());
		pd.put("content", content);
		keHuPcService.insertGuanYuWoMen(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 进入关于我们编辑页
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/toEditGuanYuWoMen")
	public ModelAndView toEditGuanYuWoMen() throws Exception {
		logBefore(logger, "---进入关于我们编辑页--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = keHuPcService.getGuanYuWoMenById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "updateGuanYuWoMen");
		mv.setViewName("system/guanyuwomen/guanyuwomen_edit");
		return mv;
	}

	/**
	 * 修改关于我们
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateGuanYuWoMen")
	public ModelAndView updateGuanYuWoMen(
			@RequestParam(required=false) MultipartFile imgPathFile,
			String guanyuwomen_id,
			String content
			) throws Exception {
		logBefore(logger, "---修改关于我们--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();

		pd.put("guanyuwomen_id", guanyuwomen_id);
		pd = keHuPcService.getGuanYuWoMenById(pd);
		
		if(imgPathFile!=null && !imgPathFile.isEmpty()){
			String path=Const.FILEPATHIMG + "shangHu/" + "headImg/" + DateUtil.getDays() + "/";
			String filePath=PathUtil.getClasspath() + path;
			String imgPathFileName=FileUpload.fileUp(imgPathFile, filePath, this.get32UUID());
			pd.put("imgPath", path+imgPathFileName);
		}else{
			pd.put("imgPath", pd.getString("imgPath"));
		}
		
		pd.put("content", content);
		
		keHuPcService.updateGuanYuWoMen(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 根据ID删除指定对象(关于我们)的信息
	 * 
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteGuanYuWoMenById")
	public void deleteGuanYuWoMenById(PrintWriter writer) throws Exception {
		logBefore(logger, "---根据ID删除指定对象(关于我们)的信息--");
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<String, Object>();
		pd = this.getPageData();
		String id[] = pd.getString("ids").split(",");
		List<String> ids = new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			ids.add(id[i]);
		}
		map.put("ids", ids);
		keHuPcService.deleteGuanYuWoMenById(map);
		writer.close();
	}
}
