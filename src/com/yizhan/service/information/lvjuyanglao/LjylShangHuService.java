package com.yizhan.service.information.lvjuyanglao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;

@Service("ljylShangHuService")
public class LjylShangHuService {
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 保存商户的信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveShangHu(PageData pd) throws Exception{
		dao.save("ljylShangHuMapper.saveShangHu", pd);
	}
	/**
	 * 更新二维码
	 * @param pd
	 * @throws Exception
	 */
	public void updateErWeiMa(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateErWeiMa", pd);
	}
	/**
	 * 提现成功后，更新现金金额
	 * @param pd
	 * @throws Exception
	 */
	public void updateXianJinAmount(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateXianJinAmount", pd);
	}
	/**
	 * 每次登录成功后更新最新登录时间以及登录的IP地址
	 * @param pd
	 * @throws Exception
	 */
	public void updateIpAndTime(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateIpAndTime", pd);
	}
	/**
	 * 更新（保存）用户个人信息
	 * @param pd
	 * @throws Exception
	 */
	public void updatePersonInformation(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updatePersonInformation", pd);
	}
	/**
	 * 更新（保存）用户个人简介或者擅长领域
	 * @param pd
	 * @throws Exception
	 */
	public void updatePersonIntroductOrGoodsField(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updatePersonIntroductOrGoodsField", pd);
	}
	/**
	 * 根据手机号修改登录密码
	 * @param pd
	 * @throws Exception
	 */
	public void updatePasswordByPhone(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updatePasswordByPhone", pd);
	}
	/**
	 * 根据手机号或者用户名去查询用户信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getDataByNameOrPhone(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getDataByNameOrPhone", pd);
	}
	/**
	 * 根据ID查询用户信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getDataById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getDataById", pd);
	}
	/**
	 * 根据商户的主键ID和身份获取对应的基本信息
	 * @param pd
	 * @return
	 * @throws Exception
	 * 2017-9-18 15:18:31
	 */
	public PageData getDataByIdAndIdentity(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getDataByIdAndIdentity", pd);
	}
	/**
	 * 根据登录名和密码获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getDataByNameAndPawAndIdentity(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getDataByNameAndPawAndIdentity", pd);
	}
	/**
	 * 更新股权和积分信息
	 * @param pd
	 * @throws Exception
	 */
	public void updateJiFenAndGuQuan(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateJiFenAndGuQuan", pd);
	}
	/*/////////////////////////案例展示////////////////////////////////////*/
	/**
	 * 保存案例的信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveAnLiInformation(PageData pd) throws Exception{
		dao.save("ljylShangHuMapper.saveAnLiInformation", pd);
	}
	/**
	 * 获取案例列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getAnLiList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getAnLiList", pd);
	}
	/**
	 * 根据ID获取案例信息
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getAnLiDataById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getAnLiDataById", pd);
	}
	/**
	 * 根据ID更新案例信息
	 * @param pd
	 * @throws Exception
	 */
	public void updateAnLiInformation(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateAnLiInformation", pd);
	}
	/**
	 * 根据ID更删除例信息
	 * @param pd
	 * @throws Exception
	 */
	public void deleteAnLiById(PageData pd) throws Exception{
		dao.delete("ljylShangHuMapper.deleteAnLiById", pd);
	}
	/*/////////////////////////服务////////////////////////////////////*/
	/**
	 * 保存服务的信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveService(PageData pd) throws Exception{
		dao.save("ljylShangHuMapper.saveService", pd);
	}
	/**
	 * 获取服务列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getServiceList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getServiceList", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getDataByIdOfService(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getDataByIdOfService", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getDataByIdOfService1(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getDataByIdOfService1", pd);
	}
	/**
	 * 更新服务
	 * @param pd
	 * @throws Exception
	 */
	public void updateService(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateService", pd);
	}
	/**
	 * 删除服务
	 * @param pd
	 * @throws Exception
	 */
	public void deleteService(PageData pd) throws Exception{
		dao.delete("ljylShangHuMapper.deleteService", pd);
	}
	/********************上传申请图片************************/
	/**
	 * 保存申请图片
	 * @param pd
	 * @throws Exception
	 */
	public void saveApplyImgPath(PageData pd) throws Exception{
		dao.save("ljylShangHuMapper.saveApplyImgPath", pd);
	}
	/**
	 * 改变开店申请状态和申请时间
	 * @param pd
	 * @throws Exception
	 */
	public void updateStateAndTime(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateStateAndTime", pd);
	}
	/**
	 * 根据用户ID获取开店申请资料
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getRenZhengInformation(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getRenZhengInformation", pd);
	}
	/********************成交金额中的成交记录************************/
	/**
	 * 医生获取成交记录（订单）
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getChengJiaoJiLuList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getChengJiaoJiLuList", pd);
	}
	/**
	 * 机构获取成交记录（订单）
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getChengJiaoJiLuList1(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getChengJiaoJiLuList1", pd);
	}
	/**
	 * 药商获取成交记录（订单）
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getChengJiaoJiLuList2(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getChengJiaoJiLuList2", pd);
	}
/* //////////////////////////////////////////////////医生部分////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 1.医生列表
	 */
	/**
	 * 获取医生列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getyishenglistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getyishenglistPage", page);
	}
	/**
	 * 认证审核操作
	 * @param pd
	 * @throws Exception 
	 */
	public void yishengChenked(Map<String, Object> map) throws Exception{
		dao.update("ljylShangHuMapper.yishengChenked", map);
	}
	/**
	 * 改变账号状态操作
	 * @param pd
	 * @throws Exception 
	 */
	public void yishengStatus(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.yishengStatus", pd);
	}
	/**
	 * 2.医生服务列表
	 */
	/**
	 * 获取医生服务列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getyishengfuwulistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getyishengfuwulistPage", page);
	}
	public void topShangHu(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.topShangHu", pd);
	}
	/* //////////////////////////////////////////////////系统管理:联系我们////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取联系我们列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> contactuslistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.contactuslistPage", page);
	}
	/**
	 * 获取对象信息(肯定只有一条记录)
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getDataOfContactUs(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getDataOfContactUs", pd);
	}
	/**
	 * 添加联系我们
	 * @param pd
	 * @throws Exception
	 */
	public void insertContactUs(PageData pd) throws Exception{
		dao.save("ljylShangHuMapper.insertContactUs", pd);
	}
	/**
	 * 更新联系我们
	 * @param pd
	 * @throws Exception 
	 */
	public void updateContactUs(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateContactUs", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getContactUsById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getContactUsById", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteContactUsById(Map<String, Object> map) throws Exception{
		dao.delete("ljylShangHuMapper.deleteContactUsById", map);
	}
	/* //////////////////////////////////////////////////新闻公告////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取新闻公告列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getnewsandnoticelistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getnewsandnoticelistPage", page);
	}
	/**
	 * 添加新闻公告
	 * @param pd
	 * @throws Exception
	 */
	public void insertNewsAndNotice(PageData pd) throws Exception{
		dao.save("ljylShangHuMapper.insertNewsAndNotice", pd);
	}
	/**
	 * 更新新闻公告
	 * @param pd
	 * @throws Exception 
	 */
	public void updateNewsAndNotice(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateNewsAndNotice", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getNewsAndNoticeById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getNewsAndNoticeById", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteNewsAndNoticeById(Map<String, Object> map) throws Exception{
		dao.delete("ljylShangHuMapper.deleteNewsAndNoticeById", map);
	}
	/**
	 * 置顶
	 * @param pd
	 * @throws Exception 
	 */
	public void topNewsAndNotice(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.topNewsAndNotice", pd);
	}
	/* //////////////////////////////////////////////////常见疾病////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取常见疾病列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getjibinglistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getjibinglistPage", page);
	}
	/**
	 * 根据首字母获取疾病列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getJiBingListByLetter(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getJiBingListByLetter", pd);
	}
	/**
	 * 添加常见疾病
	 * @param pd
	 * @throws Exception
	 */
	public void insertJiBing(PageData pd) throws Exception{
		dao.save("ljylShangHuMapper.insertJiBing", pd);
	}
	/**
	 * 更新常见疾病
	 * @param pd
	 * @throws Exception 
	 */
	public void updateJiBing(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateJiBing", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getJiBingById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getJiBingById", pd);
	}
	/**
	 * 根据疾病name获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getJiBingByName(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getJiBingByName", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteJiBingById(Map<String, Object> map) throws Exception{
		dao.delete("ljylShangHuMapper.deleteJiBingById", map);
	}
	/* //////////////////////////////////////////////////科类名称////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取科类名称列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> keleilistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.keleilistPage", page);
	}
	/**
	 * 获取科室列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getkeLeiList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getkeLeiList", pd);
	}
	/**
	 * 添加科类名称
	 * @param pd
	 * @throws Exception
	 */
	public void insertKeLei(PageData pd) throws Exception{
		dao.save("ljylShangHuMapper.insertKeLei", pd);
	}
	/**
	 * 更新科类名称
	 * @param pd
	 * @throws Exception 
	 */
	public void updateKeLei(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateKeLei", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getKeLeiById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getKeLeiById", pd);
	}
	/**
	 * 根据科类名称name和parent_id获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getKeLeiByNameAndParentid(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getKeLeiByNameAndParentid", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteKeLeiById(PageData pd) throws Exception{
		dao.delete("ljylShangHuMapper.deleteKeLeiById", pd);
	}
	/**
	 * 根据parent_id删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteKeLeiByParentid(PageData pd) throws Exception{
		dao.delete("ljylShangHuMapper.deleteKeLeiByParentid", pd);
	}
	/* //////////////////////////////////////////////////会员部分////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 1.会员列表
	 */
	/**
	 * 获取会员列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> gethuiyuanlistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.gethuiyuanlistPage", page);
	}
	/**
	 * 改变账号状态操作
	 * @param pd
	 * @throws Exception 
	 */
	public void huiyuanStatus(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.huiyuanStatus", pd);
	}
	/**
	 * 2.需求列表
	 */
	/**
	 * 获取需求列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getxuqiulistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getxuqiulistPage", page);
	}
	/**
	 * 获取需求列表(医生端获取需求)
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getxuqiuList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getxuqiuList", pd);
	}
	/**
	 * 根据需求表的主键ID获取对应的需求图片
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getxuqiuimgList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getxuqiuimgList", pd);
	}
	/* //////////////////////////////////////////////////注册送积分////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取注册送积分列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getjifenzhucelistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getjifenzhucelistPage", page);
	}
	/**
	 * 获取注册送积分对象信息(肯定只有一条记录)
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getDataOfJiFenZhuCe(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getDataOfJiFenZhuCe", pd);
	}
	/**
	 * 添加注册送积分
	 * @param pd
	 * @throws Exception
	 */
	public void insertJiFenZhuCe(PageData pd) throws Exception{
		dao.save("ljylShangHuMapper.insertJiFenZhuCe", pd);
	}
	/**
	 * 更新注册送积分
	 * @param pd
	 * @throws Exception 
	 */
	public void updateJiFenZhuCe(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateJiFenZhuCe", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getJiFenZhuCeById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getJiFenZhuCeById", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteJiFenZhuCeById(PageData pd) throws Exception{
		dao.delete("ljylShangHuMapper.deleteJiFenZhuCeById", pd);
	}
	/* //////////////////////////////////////////////////技术费用扣除比例////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取技术费用扣除比例列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getjishufuwubililistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getjishufuwubililistPage", page);
	}
	/**
	 * 获取技术费用扣除比例(仅有一条)
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public PageData getDataOfJiShuFuWuBiLi(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getDataOfJiShuFuWuBiLi", pd);
	}
	/**
	 * 添加技术费用扣除比例
	 * @param pd
	 * @throws Exception
	 */
	public void insertJiShuFuWuBiLi(PageData pd) throws Exception{
		dao.save("ljylShangHuMapper.insertJiShuFuWuBiLi", pd);
	}
	/**
	 * 更新技术费用扣除比例
	 * @param pd
	 * @throws Exception 
	 */
	public void updateJiShuFuWuBiLi(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateJiShuFuWuBiLi", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getJiShuFuWuBiLiById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getJiShuFuWuBiLiById", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteJiShuFuWuBiLiById(PageData pd) throws Exception{
		dao.delete("ljylShangHuMapper.deleteJiShuFuWuBiLiById", pd);
	}
	/* //////////////////////////////////////////////////分销管理：积分设置////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取分销管理：积分设置列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getjifenlistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getjifenlistPage", page);
	}
	/**
	 * 添加分销管理：积分设置
	 * @param pd
	 * @throws Exception
	 */
	public void insertJiFen(PageData pd) throws Exception{
		dao.save("ljylShangHuMapper.insertJiFen", pd);
	}
	/**
	 * 更新分销管理：积分设置
	 * @param pd
	 * @throws Exception 
	 */
	public void updateJiFen(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateJiFen", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getJiFenById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getJiFenById", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteJiFenById(PageData pd) throws Exception{
		dao.delete("ljylShangHuMapper.deleteJiFenById", pd);
	}
	/* //////////////////////////////////////////////////分销管理：提成设置////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取分销管理：提成设置列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getfenxiaobililistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getfenxiaobililistPage", page);
	}
	/**
	 * 添加分销管理：提成设置
	 * @param pd
	 * @throws Exception
	 */
	public void insertFenXiaoBiLi(PageData pd) throws Exception{
		dao.save("ljylShangHuMapper.insertFenXiaoBiLi", pd);
	}
	/**
	 * 更新分销管理：提成设置
	 * @param pd
	 * @throws Exception 
	 */
	public void updateFenXiaoBiLi(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateFenXiaoBiLi", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getFenXiaoBiLiById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getFenXiaoBiLiById", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteFenXiaoBiLiById(PageData pd) throws Exception{
		dao.delete("ljylShangHuMapper.deleteFenXiaoBiLiById", pd);
	}
	/* //////////////////////////////////////////////////名著管理////网站后台功能/////////////////////////////////////////////////////*/
	
	/**
	 * 获取名著列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getmingzhulistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getmingzhulistPage", page);
	}
	/**
	 * 添加名著
	 * @param pd
	 * @throws Exception
	 */
	public void insertMingZhu(PageData pd) throws Exception{
		dao.save("ljylShangHuMapper.insertMingZhu", pd);
	}
	/**
	 * 更新名著
	 * @param pd
	 * @throws Exception 
	 */
	public void updateMingZhu(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateMingZhu", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getMingZhuById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getMingZhuById", pd);
	}
	/**
	 * 根据名著name获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getMingZhuByName(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getMingZhuByName", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteMingZhuById(Map<String, Object> map) throws Exception{
		dao.delete("ljylShangHuMapper.deleteMingZhuById", map);
	}
	
	/**
	 * 获取名著列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getMingzhuList(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getMingzhuList", page);
	}
	/* //////////////////////////////////////////////////注册送股权////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取注册送股权列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getguquanlistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getguquanlistPage", page);
	}
	/**
	 * 获取注册送股权对象信息(肯定只有一条记录)
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getDataOfGuQuan(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getDataOfGuQuan", pd);
	}
	/**
	 * 添加注册送股权
	 * @param pd
	 * @throws Exception
	 */
	public void insertGuQuan(PageData pd) throws Exception{
		dao.save("ljylShangHuMapper.insertGuQuan", pd);
	}
	/**
	 * 更新注册送股权
	 * @param pd
	 * @throws Exception 
	 */
	public void updateGuQuan(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateGuQuan", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getGuQuanById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getGuQuanById", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteGuQuanById(PageData pd) throws Exception{
		dao.delete("ljylShangHuMapper.deleteGuQuanById", pd);
	}
	/* //////////////////////////////////////////////////注册送虚拟币////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取注册送虚拟币列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getxunibilistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getxunibilistPage", page);
	}
	/**
	 * 获取注册送虚拟币对象信息(肯定只有一条记录)
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getDataOfXuNiBi(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getDataOfXuNiBi", pd);
	}
	/**
	 * 添加注册送虚拟币
	 * @param pd
	 * @throws Exception
	 */
	public void insertXuNiBi(PageData pd) throws Exception{
		dao.save("ljylShangHuMapper.insertXuNiBi", pd);
	}
	/**
	 * 更新注册送虚拟币
	 * @param pd
	 * @throws Exception 
	 */
	public void updateXuNiBi(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateXuNiBi", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getXuNiBiById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getXuNiBiById", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteXuNiBiById(PageData pd) throws Exception{
		dao.delete("ljylShangHuMapper.deleteXuNiBiById", pd);
	}
	/* //////////////////////////////////////////////////提现部分（后台和商户端页面）/////////////////////////////////////////////////////*/
	/**
	 * 创建提现申请记录
	 * @param pd
	 * @throws Exception
	 */
	public void saveWithDrawCash(PageData pd) throws Exception{
		dao.save("ljylShangHuMapper.saveWithDrawCash", pd);
	}
	/**
	 * 根据用户的主键ID获取对应的提现申请记录
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getWithDrawCashList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getWithDrawCashList", pd);
	}
	/**
	 * 根据主键ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getWithDrawCashById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getWithDrawCashById", pd);
	}
	/**
	 * 后台功能
	 */
	/**
	 * 获取提现申请列表商户端
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getSHWithDrawCashlistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getSHWithDrawCashlistPage", page);
	}
	/**
	 * 获取提现申请列表客户端
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getKHWithDrawCashlistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getKHWithDrawCashlistPage", page);
	}
	/**
	 * 改变状态
	 * @param pd
	 * @throws Exception
	 */
	public void updateWithDrawCashState(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateWithDrawCashState", pd);
	}
	/* //////////////////////////////////////////////////机构类型////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取机构类型列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getjigoulistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getjigoulistPage", page);
	}
	/**
	 * 获取suoyou
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getJiGouTypeList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getJiGouTypeList", pd);
	}
	/**
	 * 添加机构类型
	 * @param pd
	 * @throws Exception
	 */
	public void insertJiGouType(PageData pd) throws Exception{
		dao.save("ljylShangHuMapper.insertJiGouType", pd);
	}
	/**
	 * 更新机构类型
	 * @param pd
	 * @throws Exception 
	 */
	public void updateJiGouType(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateJiGouType", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getJiGouTypeById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getJiGouTypeById", pd);
	}
	/**
	 * 根据name获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getJiGouTypeByName(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getJiGouTypeByName", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteJiGouTypeById(Map<String, Object> map) throws Exception{
		dao.delete("ljylShangHuMapper.deleteJiGouTypeById", map);
	}
	/* /////////////////////////////////////////////////积分兑换股权////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getjifenhuanguquanlistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getjifenhuanguquanlistPage", page);
	}
	/**
	 * 获取对象信息(肯定只有一条记录)
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getDataOfJiFenHuanGuQuan(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getDataOfJiFenHuanGuQuan", pd);
	}
	/**
	 * 添加
	 * @param pd
	 * @throws Exception
	 */
	public void insertJiFenHuanGuQuan(PageData pd) throws Exception{
		dao.save("ljylShangHuMapper.insertJiFenHuanGuQuan", pd);
	}
	/**
	 * 更新
	 * @param pd
	 * @throws Exception 
	 */
	public void updateJiFenHuanGuQuan(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateJiFenHuanGuQuan", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getJiFenHuanGuQuanById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getJiFenHuanGuQuanById", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteJiFenHuanGuQuanById(PageData pd) throws Exception{
		dao.delete("ljylShangHuMapper.deleteJiFenHuanGuQuanById", pd);
	}
	/* //////////////////////////////////////////////////分销注册/////////////////////////////////////////////////////*/
	
	/**
	 * 根据ID修改医生的积分
	 * @param map
	 * @throws Exception
	 */
	public void updateJifenToShanghu(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateJifenToShanghu", pd);
	}
	
	
	/**
	 * 根据ID获取积分信息    by yym 6/14 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getShangHuJifen(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getShangHuJifen", pd);
	}
	
	/* //////////////////////////////////////////////////退单部分/////////////////////////////////////////////////////*/
	
	public List<PageData> tuidanw1listPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.tuidanw1listPage", page);
	}
	public List<PageData> tuidanw2listPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.tuidanw2listPage", page);
	}
	public List<PageData> tuidanw3listPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.tuidanw3listPage", page);
	}
	public void updateTuiDan1(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateTuiDan1", pd);
	}
	public void updateTuiDan2(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateTuiDan2", pd);
	}
	public void updateTuiDan3(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateTuiDan3", pd);
	}
	/* //////////////////////////////////////////////////存款利率设置////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> cunkuanlilvlistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.cunkuanlilvlistPage", page);
	}
	/**
	 * 获取对象信息(肯定只有一条记录)
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getDataOfCunKuanLiLv(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getDataOfCunKuanLiLv", pd);
	}
	/**
	 * 添加
	 * @param pd
	 * @throws Exception
	 */
	public void insertCunKuanLiLv(PageData pd) throws Exception{
		dao.save("ljylShangHuMapper.insertCunKuanLiLv", pd);
	}
	/**
	 * 更新
	 * @param pd
	 * @throws Exception 
	 */
	public void updateCunKuanLiLv(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateCunKuanLiLv", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getCunKuanLiLvById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getCunKuanLiLvById", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteCunKuanLiLvById(Map<String, Object> map) throws Exception{
		dao.delete("ljylShangHuMapper.deleteCunKuanLiLvById", map);
	}
	/* //////////////////////////////////////////////////存款/////////////////////////////////////////////////////////*/
	/**
	 * 根据ID改变存款记录的状态
	 * @param pd
	 * @throws Exception 
	 */
	public void updateCunKuanState1(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateCunKuanState1", pd);
	}
	/**
	 * 改变到期存款记录的状态
	 * @param pd
	 * @throws Exception 
	 */
	public void updateCunKuanState(PageData pd) throws Exception{
		dao.update("ljylShangHuMapper.updateCunKuanState", pd);
	}
	/**
	 * 保存存款记录信息
	 * @param pd
	 * @throws Exception
	 */
	public void insertCunKuan(PageData pd) throws Exception{
		dao.save("ljylShangHuMapper.insertCunKuan", pd);
	}
	/**
	 * 获取存款信息记录列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getCunKuanList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylShangHuMapper.getCunKuanList", pd);
	}
	/**
	 * 根据ID获取存款信息
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public PageData getCunKuanOfId(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylShangHuMapper.getCunKuanOfId", pd);
	}
}
