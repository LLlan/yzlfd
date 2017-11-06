package com.yizhan.service.information.zhaoyiwang;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;

@Service("shangHuService")
public class ShangHuService {
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 保存商户的信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveShangHu(PageData pd) throws Exception{
		dao.save("shangHuMapper.saveShangHu", pd);
	}
	/**
	 * 保存商户的信息的基本信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveShangHuInfo(PageData pd) throws Exception{
		dao.save("shangHuMapper.saveShangHuInfo", pd);
	}
	/**
	 * 更新二维码
	 * @param pd
	 * @throws Exception
	 */
	public void updateErWeiMa(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateErWeiMa", pd);
	}
	/**
	 * 提现成功后，更新现金金额
	 * @param pd
	 * @throws Exception
	 */
	public void updateXianJinAmount(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateXianJinAmount", pd);
	}
	/**
	 * 每次登录成功后更新最新登录时间以及登录的IP地址
	 * @param pd
	 * @throws Exception
	 */
	public void updateIpAndTime(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateIpAndTime", pd);
	}
	/**
	 * 更新（保存）用户个人信息
	 * @param pd
	 * @throws Exception
	 */
	public void updatePersonInformation(PageData pd) throws Exception{
		dao.update("shangHuMapper.updatePersonInformation", pd);
	}
	/**
	 * 更新（保存）用户个人简介或者擅长领域
	 * @param pd
	 * @throws Exception
	 */
	public void updatePersonIntroductOrGoodsField(PageData pd) throws Exception{
		dao.update("shangHuMapper.updatePersonIntroductOrGoodsField", pd);
	}
	/**
	 * 根据手机号修改登录密码或者提现密码
	 * @param pd
	 * @throws Exception
	 */
	public void updatePasswordByPhone(PageData pd) throws Exception{
		dao.update("shangHuMapper.updatePasswordByPhone", pd);
	}
	/**
	 * 根据手机号或者用户名去查询用户信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getDataByNameOrPhone(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getDataByNameOrPhone", pd);
	}
	/**
	 * 根据ID查询用户信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getDataById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getDataById", pd);
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
		return (PageData) dao.findForObject("shangHuMapper.getDataByNameAndPawAndIdentity", pd);
	}
	/**
	 * 更新股权和积分信息
	 * @param pd
	 * @throws Exception
	 */
	public void updateJiFenAndGuQuan(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateJiFenAndGuQuan", pd);
	}
	/*/////////////////////////案例展示////////////////////////////////////*/
	/**
	 * 保存案例的信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveAnLiInformation(PageData pd) throws Exception{
		dao.save("shangHuMapper.saveAnLiInformation", pd);
	}
	/**
	 * 获取案例列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getAnLiList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getAnLiList", pd);
	}
	/**
	 * 根据ID获取案例信息
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getAnLiDataById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getAnLiDataById", pd);
	}
	/**
	 * 根据ID更新案例信息
	 * @param pd
	 * @throws Exception
	 */
	public void updateAnLiInformation(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateAnLiInformation", pd);
	}
	/**
	 * 根据ID更删除例信息
	 * @param pd
	 * @throws Exception
	 */
	public void deleteAnLiById(PageData pd) throws Exception{
		dao.delete("shangHuMapper.deleteAnLiById", pd);
	}
	/*/////////////////////////服务////////////////////////////////////*/
	/**
	 * 保存服务的信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveService(PageData pd) throws Exception{
		dao.save("shangHuMapper.saveService", pd);
	}
	/**
	 * 获取服务列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getServiceList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getServiceList", pd);
	}
	/**
	 * 根据ID更新isDefault的值
	 * @param pd
	 * @throws Exception
	 */
	public void updateisDefault(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateisDefault", pd);
	}
	public void updateisDefault1(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateisDefault1", pd);
	}
	public void updateisDefault2(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateisDefault2", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getDataByIdOfService(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getDataByIdOfService", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getDataByIdOfService1(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getDataByIdOfService1", pd);
	}
	/**
	 * 更新服务
	 * @param pd
	 * @throws Exception
	 */
	public void updateService(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateService", pd);
	}
	/**
	 * 删除服务
	 * @param pd
	 * @throws Exception
	 */
	public void deleteService(PageData pd) throws Exception{
		dao.delete("shangHuMapper.deleteService", pd);
	}
	/********************上传申请图片************************/
	/**
	 * 保存申请图片
	 * @param pd
	 * @throws Exception
	 */
	public void saveApplyImgPath(PageData pd) throws Exception{
		dao.save("shangHuMapper.saveApplyImgPath", pd);
	}
	/**
	 * 改变开店申请状态和申请时间
	 * @param pd
	 * @throws Exception
	 */
	public void updateStateAndTime(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateStateAndTime", pd);
	}
	/**
	 * 根据用户ID获取开店申请资料
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getRenZhengInformation(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getRenZhengInformation", pd);
	}
	/********************成交金额中的成交记录************************/
	/**
	 * 医生获取成交记录（订单）
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getChengJiaoJiLuList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getChengJiaoJiLuList", pd);
	}
	/**
	 * 机构获取成交记录（订单）
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getChengJiaoJiLuList1(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getChengJiaoJiLuList1", pd);
	}
	/**
	 * 药商获取成交记录（订单）
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getChengJiaoJiLuList2(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getChengJiaoJiLuList2", pd);
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
		return (List<PageData>) dao.findForList("shangHuMapper.getyishenglistPage", page);
	}
	/**
	 * 认证审核操作
	 * @param pd
	 * @throws Exception 
	 */
	public void yishengChenked(Map<String, Object> map) throws Exception{
		dao.update("shangHuMapper.yishengChenked", map);
	}
	/**
	 * 改变账号状态操作
	 * @param pd
	 * @throws Exception 
	 */
	public void yishengStatus(PageData pd) throws Exception{
		dao.update("shangHuMapper.yishengStatus", pd);
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
		return (List<PageData>) dao.findForList("shangHuMapper.getyishengfuwulistPage", page);
	}
	public void topShangHu(PageData pd) throws Exception{
		dao.update("shangHuMapper.topShangHu", pd);
	}
	/* //////////////////////////////////////////////////系统管理:联系我们////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取联系我们列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> contactuslistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.contactuslistPage", page);
	}
	/**
	 * 获取对象信息(肯定只有一条记录)
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getDataOfContactUs(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getDataOfContactUs", pd);
	}
	/**
	 * 添加联系我们
	 * @param pd
	 * @throws Exception
	 */
	public void insertContactUs(PageData pd) throws Exception{
		dao.save("shangHuMapper.insertContactUs", pd);
	}
	/**
	 * 更新联系我们
	 * @param pd
	 * @throws Exception 
	 */
	public void updateContactUs(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateContactUs", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getContactUsById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getContactUsById", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteContactUsById(Map<String, Object> map) throws Exception{
		dao.delete("shangHuMapper.deleteContactUsById", map);
	}
	/* //////////////////////////////////////////////////新闻公告////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取新闻公告列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getnewsandnoticelistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getnewsandnoticelistPage", page);
	}
	/**
	 * 添加新闻公告
	 * @param pd
	 * @throws Exception
	 */
	public void insertNewsAndNotice(PageData pd) throws Exception{
		dao.save("shangHuMapper.insertNewsAndNotice", pd);
	}
	/**
	 * 更新新闻公告
	 * @param pd
	 * @throws Exception 
	 */
	public void updateNewsAndNotice(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateNewsAndNotice", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getNewsAndNoticeById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getNewsAndNoticeById", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteNewsAndNoticeById(Map<String, Object> map) throws Exception{
		dao.delete("shangHuMapper.deleteNewsAndNoticeById", map);
	}
	/**
	 * 置顶
	 * @param pd
	 * @throws Exception 
	 */
	public void topNewsAndNotice(PageData pd) throws Exception{
		dao.update("shangHuMapper.topNewsAndNotice", pd);
	}
	/* //////////////////////////////////////////////////常见疾病////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取常见疾病列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getjibinglistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getjibinglistPage", page);
	}
	/**
	 * 根据首字母获取疾病列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getJiBingListByLetter(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getJiBingListByLetter", pd);
	}
	/**
	 * 添加常见疾病
	 * @param pd
	 * @throws Exception
	 */
	public void insertJiBing(PageData pd) throws Exception{
		dao.save("shangHuMapper.insertJiBing", pd);
	}
	/**
	 * 更新常见疾病
	 * @param pd
	 * @throws Exception 
	 */
	public void updateJiBing(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateJiBing", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getJiBingById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getJiBingById", pd);
	}
	/**
	 * 根据疾病name获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getJiBingByName(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getJiBingByName", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteJiBingById(Map<String, Object> map) throws Exception{
		dao.delete("shangHuMapper.deleteJiBingById", map);
	}
	/* //////////////////////////////////////////////////科类名称////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取科类名称列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> keleilistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.keleilistPage", page);
	}
	/**
	 * 获取科室列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getkeLeiList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getkeLeiList", pd);
	}
	/**
	 * 添加科类名称
	 * @param pd
	 * @throws Exception
	 */
	public void insertKeLei(PageData pd) throws Exception{
		dao.save("shangHuMapper.insertKeLei", pd);
	}
	/**
	 * 更新科类名称
	 * @param pd
	 * @throws Exception 
	 */
	public void updateKeLei(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateKeLei", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getKeLeiById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getKeLeiById", pd);
	}
	/**
	 * 根据科类名称name和parent_id获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getKeLeiByNameAndParentid(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getKeLeiByNameAndParentid", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteKeLeiById(PageData pd) throws Exception{
		dao.delete("shangHuMapper.deleteKeLeiById", pd);
	}
	/**
	 * 根据parent_id删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteKeLeiByParentid(PageData pd) throws Exception{
		dao.delete("shangHuMapper.deleteKeLeiByParentid", pd);
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
		return (List<PageData>) dao.findForList("shangHuMapper.gethuiyuanlistPage", page);
	}
	/**
	 * 分销明细
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getFenXiaoMingXiList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getFenXiaoMingXiList", pd);
	}
	public List<PageData> getfxmxlistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getfxmxlistPage", page);
	}
	public PageData getfxmxsum(PageData pd) throws Exception{
		return  (PageData) dao.findForObject("shangHuMapper.getfxmxsum", pd);
	}
	/**
	 * 改变账号状态操作
	 * @param pd
	 * @throws Exception 
	 */
	public void huiyuanStatus(PageData pd) throws Exception{
		dao.update("shangHuMapper.huiyuanStatus", pd);
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
		return (List<PageData>) dao.findForList("shangHuMapper.getxuqiulistPage", page);
	}
	/**
	 * 获取需求列表(医生端获取需求)
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getxuqiuList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getxuqiuList", pd);
	}
	/**
	 * 根据需求表的主键ID获取对应的需求图片
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getxuqiuimgList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getxuqiuimgList", pd);
	}
	/* //////////////////////////////////////////////////注册送积分////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取注册送积分列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getjifenzhucelistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getjifenzhucelistPage", page);
	}
	/**
	 * 获取注册送积分对象信息(肯定只有一条记录)
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getDataOfJiFenZhuCe(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getDataOfJiFenZhuCe", pd);
	}
	/**
	 * 添加注册送积分
	 * @param pd
	 * @throws Exception
	 */
	public void insertJiFenZhuCe(PageData pd) throws Exception{
		dao.save("shangHuMapper.insertJiFenZhuCe", pd);
	}
	/**
	 * 更新注册送积分
	 * @param pd
	 * @throws Exception 
	 */
	public void updateJiFenZhuCe(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateJiFenZhuCe", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getJiFenZhuCeById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getJiFenZhuCeById", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteJiFenZhuCeById(PageData pd) throws Exception{
		dao.delete("shangHuMapper.deleteJiFenZhuCeById", pd);
	}
	/* //////////////////////////////////////////////////技术费用扣除比例////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取技术费用扣除比例列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getjishufuwubililistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getjishufuwubililistPage", page);
	}
	/**
	 * 获取技术费用扣除比例(仅有一条)
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public PageData getDataOfJiShuFuWuBiLi(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getDataOfJiShuFuWuBiLi", pd);
	}
	/**
	 * 添加技术费用扣除比例
	 * @param pd
	 * @throws Exception
	 */
	public void insertJiShuFuWuBiLi(PageData pd) throws Exception{
		dao.save("shangHuMapper.insertJiShuFuWuBiLi", pd);
	}
	/**
	 * 更新技术费用扣除比例
	 * @param pd
	 * @throws Exception 
	 */
	public void updateJiShuFuWuBiLi(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateJiShuFuWuBiLi", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getJiShuFuWuBiLiById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getJiShuFuWuBiLiById", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteJiShuFuWuBiLiById(PageData pd) throws Exception{
		dao.delete("shangHuMapper.deleteJiShuFuWuBiLiById", pd);
	}
	/* //////////////////////////////////////////////////分销管理：积分设置////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取分销管理：积分设置列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getjifenlistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getjifenlistPage", page);
	}
	/**
	 * 添加分销管理：积分设置
	 * @param pd
	 * @throws Exception
	 */
	public void insertJiFen(PageData pd) throws Exception{
		dao.save("shangHuMapper.insertJiFen", pd);
	}
	/**
	 * 更新分销管理：积分设置
	 * @param pd
	 * @throws Exception 
	 */
	public void updateJiFen(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateJiFen", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getJiFenById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getJiFenById", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteJiFenById(PageData pd) throws Exception{
		dao.delete("shangHuMapper.deleteJiFenById", pd);
	}
	/* //////////////////////////////////////////////////分销管理：提成设置////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取分销管理：提成设置列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getfenxiaobililistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getfenxiaobililistPage", page);
	}
	/**
	 * 添加分销管理：提成设置
	 * @param pd
	 * @throws Exception
	 */
	public void insertFenXiaoBiLi(PageData pd) throws Exception{
		dao.save("shangHuMapper.insertFenXiaoBiLi", pd);
	}
	/**
	 * 更新分销管理：提成设置
	 * @param pd
	 * @throws Exception 
	 */
	public void updateFenXiaoBiLi(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateFenXiaoBiLi", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getFenXiaoBiLiById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getFenXiaoBiLiById", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteFenXiaoBiLiById(PageData pd) throws Exception{
		dao.delete("shangHuMapper.deleteFenXiaoBiLiById", pd);
	}
	/* //////////////////////////////////////////////////名著管理////网站后台功能/////////////////////////////////////////////////////*/
	
	/**
	 * 获取名著列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getmingzhulistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getmingzhulistPage", page);
	}
	/**
	 * 添加名著
	 * @param pd
	 * @throws Exception
	 */
	public void insertMingZhu(PageData pd) throws Exception{
		dao.save("shangHuMapper.insertMingZhu", pd);
	}
	/**
	 * 更新名著
	 * @param pd
	 * @throws Exception 
	 */
	public void updateMingZhu(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateMingZhu", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getMingZhuById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getMingZhuById", pd);
	}
	/**
	 * 根据名著name获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getMingZhuByName(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getMingZhuByName", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteMingZhuById(Map<String, Object> map) throws Exception{
		dao.delete("shangHuMapper.deleteMingZhuById", map);
	}
	
	/**
	 * 获取名著列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getMingzhuList(Page page) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getMingzhuList", page);
	}
	/* //////////////////////////////////////////////////注册送股权////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取注册送股权列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getguquanlistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getguquanlistPage", page);
	}
	/**
	 * 获取注册送股权对象信息(肯定只有一条记录)
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getDataOfGuQuan(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getDataOfGuQuan", pd);
	}
	/**
	 * 添加注册送股权
	 * @param pd
	 * @throws Exception
	 */
	public void insertGuQuan(PageData pd) throws Exception{
		dao.save("shangHuMapper.insertGuQuan", pd);
	}
	/**
	 * 更新注册送股权
	 * @param pd
	 * @throws Exception 
	 */
	public void updateGuQuan(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateGuQuan", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getGuQuanById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getGuQuanById", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteGuQuanById(PageData pd) throws Exception{
		dao.delete("shangHuMapper.deleteGuQuanById", pd);
	}
	/* //////////////////////////////////////////////////注册送虚拟币////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取注册送虚拟币列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getxunibilistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getxunibilistPage", page);
	}
	/**
	 * 获取注册送虚拟币对象信息(肯定只有一条记录)
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getDataOfXuNiBi(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getDataOfXuNiBi", pd);
	}
	/**
	 * 添加注册送虚拟币
	 * @param pd
	 * @throws Exception
	 */
	public void insertXuNiBi(PageData pd) throws Exception{
		dao.save("shangHuMapper.insertXuNiBi", pd);
	}
	/**
	 * 更新注册送虚拟币
	 * @param pd
	 * @throws Exception 
	 */
	public void updateXuNiBi(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateXuNiBi", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getXuNiBiById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getXuNiBiById", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteXuNiBiById(PageData pd) throws Exception{
		dao.delete("shangHuMapper.deleteXuNiBiById", pd);
	}
	/* //////////////////////////////////////////////////提现部分（后台和商户端页面）/////////////////////////////////////////////////////*/
	/**
	 * 创建提现申请记录
	 * @param pd
	 * @throws Exception
	 */
	public void saveWithDrawCash(PageData pd) throws Exception{
		dao.save("shangHuMapper.saveWithDrawCash", pd);
	}
	/**
	 * 根据用户的主键ID获取对应的提现申请记录
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getWithDrawCashList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getWithDrawCashList", pd);
	}
	/**
	 * 根据主键ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getWithDrawCashById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getWithDrawCashById", pd);
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
		return (List<PageData>) dao.findForList("shangHuMapper.getSHWithDrawCashlistPage", page);
	}
	/**
	 * 获取提现申请列表客户端
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getKHWithDrawCashlistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getKHWithDrawCashlistPage", page);
	}
	/**
	 * 改变状态
	 * @param pd
	 * @throws Exception
	 */
	public void updateWithDrawCashState(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateWithDrawCashState", pd);
	}
	/* //////////////////////////////////////////////////机构类型////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取机构类型列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getjigoulistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getjigoulistPage", page);
	}
	/**
	 * 获取suoyou
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getJiGouTypeList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getJiGouTypeList", pd);
	}
	/**
	 * 添加机构类型
	 * @param pd
	 * @throws Exception
	 */
	public void insertJiGouType(PageData pd) throws Exception{
		dao.save("shangHuMapper.insertJiGouType", pd);
	}
	/**
	 * 更新机构类型
	 * @param pd
	 * @throws Exception 
	 */
	public void updateJiGouType(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateJiGouType", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getJiGouTypeById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getJiGouTypeById", pd);
	}
	/**
	 * 根据name获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getJiGouTypeByName(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getJiGouTypeByName", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteJiGouTypeById(Map<String, Object> map) throws Exception{
		dao.delete("shangHuMapper.deleteJiGouTypeById", map);
	}
	/* /////////////////////////////////////////////////积分兑换股权////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getjifenhuanguquanlistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getjifenhuanguquanlistPage", page);
	}
	/**
	 * 获取对象信息(肯定只有一条记录)
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getDataOfJiFenHuanGuQuan(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getDataOfJiFenHuanGuQuan", pd);
	}
	/**
	 * 添加
	 * @param pd
	 * @throws Exception
	 */
	public void insertJiFenHuanGuQuan(PageData pd) throws Exception{
		dao.save("shangHuMapper.insertJiFenHuanGuQuan", pd);
	}
	/**
	 * 更新
	 * @param pd
	 * @throws Exception 
	 */
	public void updateJiFenHuanGuQuan(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateJiFenHuanGuQuan", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getJiFenHuanGuQuanById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getJiFenHuanGuQuanById", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteJiFenHuanGuQuanById(PageData pd) throws Exception{
		dao.delete("shangHuMapper.deleteJiFenHuanGuQuanById", pd);
	}
	/* /////////////////////////////////////////////////积分兑换money////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getjifenhuanmoneylistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getjifenhuanmoneylistPage", page);
	}
	/**
	 * 获取对象信息(肯定只有一条记录)
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getDataOfJiFenHuanMoney(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getDataOfJiFenHuanMoney", pd);
	}
	/**
	 * 添加
	 * @param pd
	 * @throws Exception
	 */
	public void insertJiFenHuanMoney(PageData pd) throws Exception{
		dao.save("shangHuMapper.insertJiFenHuanMoney", pd);
	}
	/**
	 * 更新
	 * @param pd
	 * @throws Exception 
	 */
	public void updateJiFenHuanMoney(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateJiFenHuanMoney", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getJiFenHuanMoneyById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getJiFenHuanMoneyById", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteJiFenHuanMoneyById(PageData pd) throws Exception{
		dao.delete("shangHuMapper.deleteJiFenHuanMoneyById", pd);
	}
	/* //////////////////////////////////////////////////分销注册/////////////////////////////////////////////////////*/
	
	/**
	 * 根据ID修改医生的积分
	 * @param map
	 * @throws Exception
	 */
	public void updateJifenToShanghu(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateJifenToShanghu", pd);
	}
	
	
	/**
	 * 根据ID获取积分信息    by yym 6/14 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getShangHuJifen(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getShangHuJifen", pd);
	}
	
	/* //////////////////////////////////////////////////退单部分/////////////////////////////////////////////////////*/
	
	public List<PageData> tuidanw1listPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.tuidanw1listPage", page);
	}
	public List<PageData> tuidanw2listPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.tuidanw2listPage", page);
	}
	public List<PageData> tuidanw3listPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.tuidanw3listPage", page);
	}
	public void updateTuiDan1(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateTuiDan1", pd);
	}
	public void updateTuiDan2(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateTuiDan2", pd);
	}
	public void updateTuiDan3(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateTuiDan3", pd);
	}
	/* //////////////////////////////////////////////////存款利率设置////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> cunkuanlilvlistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.cunkuanlilvlistPage", page);
	}
	/**
	 * 获取对象信息(肯定只有一条记录)
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getDataOfCunKuanLiLv(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getDataOfCunKuanLiLv", pd);
	}
	/**
	 * 添加
	 * @param pd
	 * @throws Exception
	 */
	public void insertCunKuanLiLv(PageData pd) throws Exception{
		dao.save("shangHuMapper.insertCunKuanLiLv", pd);
	}
	/**
	 * 更新
	 * @param pd
	 * @throws Exception 
	 */
	public void updateCunKuanLiLv(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateCunKuanLiLv", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getCunKuanLiLvById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getCunKuanLiLvById", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteCunKuanLiLvById(Map<String, Object> map) throws Exception{
		dao.delete("shangHuMapper.deleteCunKuanLiLvById", map);
	}
	/* //////////////////////////////////////////////////存款/////////////////////////////////////////////////////////*/
	/**
	 * 根据ID改变存款记录的状态
	 * @param pd
	 * @throws Exception 
	 */
	public void updateCunKuanState1(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateCunKuanState1", pd);
	}
	/**
	 * 改变到期存款记录的状态
	 * @param pd
	 * @throws Exception 
	 */
	public void updateCunKuanState(PageData pd) throws Exception{
		dao.update("shangHuMapper.updateCunKuanState", pd);
	}
	/**
	 * 保存存款记录信息
	 * @param pd
	 * @throws Exception
	 */
	public void insertCunKuan(PageData pd) throws Exception{
		dao.save("shangHuMapper.insertCunKuan", pd);
	}
	/**
	 * 获取存款信息记录列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getCunKuanList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getCunKuanList", pd);
	}
	/**
	 * 根据ID获取存款信息
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public PageData getCunKuanOfId(PageData pd) throws Exception{
		return (PageData) dao.findForObject("shangHuMapper.getCunKuanOfId", pd);
	}
	/* //////////////////////////////商家收益明细///////////////////////////////////*/
	public List<PageData> getMingXiOfYiSheng(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getMingXiOfYiSheng", pd);
	}
	public List<PageData> getMingXiOfJiGou(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getMingXiOfJiGou", pd);
	}
	public List<PageData> getMingXiOfYaoShang(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("shangHuMapper.getMingXiOfYaoShang", pd);
	}
	
	
	
	public void updatexssl(PageData pd) throws Exception{
		dao.update("shangHuMapper.updatexssl", pd);
	}
	
	
}
