package com.yizhan.service.information.lvjuyanglao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;

@Service("ljylKeHuService")
public class LjylKeHuService {
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 首页-轮播图列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getBannerImagesList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylkehuMapper.getBannerImagesList", pd);
	}
	
	
	public void updateKeHuXuNiBi(PageData pd) throws Exception{
		dao.update("kehuMapper.updateKeHuXuNiBi", pd);
	}
	/**
	 * 评价记录列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> pingjiajiluList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylkehuMapper.pingjiajiluList", pd);
	}
	
	
	
	
	/**
	 * 分享二维码
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData fenxiangEwm(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.fenxiangEwm", pd);
	}
	/**
	 * 分享二维码商户
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData fenxiangEwms(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.fenxiangEwms", pd);
	}
	
	
	
	/**
	 * 根据地区，类型，科类获取医生列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getDoctorListByAddress(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylkehuMapper.getDoctorListByAddress", pd);
	}
	/**
	 * 获取新闻公告列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getnewsandnoticeList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylkehuMapper.getnewsandnoticeList", pd);
	}
	/**
	 * 获取常见疾病列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getDiseaseListByZimu(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylkehuMapper.getDiseaseListByZimu", pd);
	}
	
	
	
	/**
	 * 根据字母获取疑难杂症的数据
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getYnzzListByZimu(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylkehuMapper.getYnzzListByZimu", pd);
	}
	
	/**
	 * 保存会员用户信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveKeHu(PageData pd) throws Exception{
		dao.save("ljylkehuMapper.saveKehu", pd);
	}
	
	/**
	 * 保存客户发布的需求
	 * @param pd
	 * @throws Exception
	 */
	public void saveXuqiu(PageData pd) throws Exception{
		dao.save("ljylkehuMapper.saveXuqiu", pd);
	}
	
	
	/**
	 * 保存客户发布的需求的图片
	 * @param pd
	 * @throws Exception
	 */
	public void saveXuqiuImgs(PageData pd) throws Exception{
		dao.save("ljylkehuMapper.saveXuqiuImgs", pd);
	}
	
	
	/**
	 * 保存完善个人资料信息
	 * @param pd
	 * @throws Exception
	 */
	public void updateGerenInfo(PageData pd) throws Exception{
		dao.save("ljylkehuMapper.updateGerenInfo", pd);
	}
	
	/**
	 * 更新系统时间为最后登录时间
	 * @param pd
	 * @throws Exception
	 */
	public void updateLastLoginTime(PageData pd) throws Exception{
		dao.save("ljylkehuMapper.updateLastLoginTime", pd);
	}
	
	/**
	 * 忘记密码-修改密码
	 * @param pd
	 * @throws Exception
	 */
	public void updatePassword(PageData pd) throws Exception{
		dao.save("ljylkehuMapper.updatePassword", pd);
	}
	
	/**
	 * 首页-常见疾病详情
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData showChangjianjibingDetailByID(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.showChangjianjibingDetailByID", pd);
	}
	
	/**
	 * 首页-疑难杂症详情
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData showYnzzDetailByID(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.showYnzzDetailByID", pd);
	}
	
	/**
	 * 首页-查看新闻详情
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getXinwenDetail(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.getXinwenDetail", pd);
	}
	/**
	 * 首页-查看医生详情
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getYishengDetail(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.getYishengDetail", pd);
	}
	
	/**
	 * 首页-查看医生服务列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getyishengFuwuList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylkehuMapper.getyishengFuwuList", pd);
	}
	
	
	/**
	 * 首页-查看医生案例列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getyishengAnliList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylkehuMapper.getyishengAnliList", pd);
	}
	
	
	/**
	 * 首页-查看医生案例详情
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getYishengAnliDetail(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.getYishengAnliDetail", pd);
	}
	
	
	
	/**
	 * 会员中心-查看会员信息-根据id
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getDetailByID(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.getDetailByID", pd);
	}
	
	/**
	 * 首页-个人中心-我的订单
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getYishengOrderList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylkehuMapper.getYishengOrderList", pd);
	}
	
	/**
	 * 首页-个人中心-我的订单
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getYaoshangOrderList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylkehuMapper.getYaoshangOrderList", pd);
	}
	
	/**
	 * 首页-个人中心-我的订单
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getjigouOrderList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylkehuMapper.getjigouOrderList", pd);
	}
	/**
	 * 首页-根据父类id获取科类列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getkeleiListByParentID(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylkehuMapper.getkeleiListByParentID", pd);
	}
	/**
	 * 首页-获取科类列表-父类列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getkeleiList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylkehuMapper.getkeleiList", pd);
	}
	

	
	/**
	 * 首页-找医生-医生列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getyishengList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylkehuMapper.getyishengList", pd);
	}
	
	/**
	 * 首页-找药商-药商列表
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-17
	 * @throws Exception 
	 */
	public List<PageData> getYaoshangList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylkehuMapper.getYaoshangList", pd);
		
	} 
	
	
	/**
	 * 首页-找药商-机构列表
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-17
	 * @throws Exception 
	 */
	public List<PageData> getjigouList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylkehuMapper.getjigouList", pd);
		
	} 
	
	/**
	 * 首页-需求列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> selectXuqiuList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylkehuMapper.selectXuqiuList", pd);
	}
	
	public void deleteXuQiu(PageData pd) throws Exception{
		dao.delete("ljylkehuMapper.deleteXuQiu", pd);
	}
	public void deleteXuQiuImg(PageData pd) throws Exception{
		dao.delete("ljylkehuMapper.deleteXuQiuImg", pd);
	}
	public void deleteXuQiuImgById(PageData pd) throws Exception{
		dao.delete("ljylkehuMapper.deleteXuQiuImgById", pd);
	}
	public void updateXuqiu(PageData pd) throws Exception{
		dao.update("ljylkehuMapper.updateXuqiu", pd);
	}
	
	public PageData getDataOfXuQiuById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.getDataOfXuQiuById", pd);
	}
	
	
	/**
	 * 首页-需求图片列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getImgsByXuqiuID(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylkehuMapper.getImgsByXuqiuID", pd);
	}
	 
	/**
	 * 根据用户名去查询用户信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getDataByUserName(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.getDataByUserName", pd);
	}
	
	/**
	 * 根据手机号查询该用户是否存在
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData isExistUser(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.isExistUser", pd);
	}
	
	/**
	 * 根据手机号查询该用户是否存在
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getDataByPhone(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.getDataByPhone", pd);
	}
	
	/**
	 * 验证登录
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getDataByUserNameAndPassword(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.getDataByUserNameAndPassword", pd);
	}
	
	
	/**
	 * 首页-查积分
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getjifen(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.getjifen", pd);
	}
	
	/**
	 * 首页-查股权和虚拟币
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getGuquanAndXunibi(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.getGuquanAndXunibi", pd);
	}
	
	/**
	 * 个人中心-获取二维码图片
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getErweimaImgById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.getErweimaImgById", pd);
	}
	
	
	/**
	 * 同过分享的二维码注册进来的，修改推荐人的积分和它的上级的积分
	 * @param pd
	 * @throws Exception
	 */
	public void updateJifenByEwmRegister(PageData pd) throws Exception{
		dao.save("ljylkehuMapper.updateJifenByEwmRegister", pd);
	}
	
	
	

	/**
	 * 首页-一级团队 列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getYijiTeamList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylkehuMapper.getYijiTeamList", pd);
	}
	
	/**
	 * 一级团队总数量
	 * 功能：
	 * 作者：lj
	 * 日期：2017-8-1
	 */
	public PageData getYijiTeamListCount(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.getYijiTeamListCount", pd);
	}
	
	
	/**
	 * 首页-二级团队 列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getErjiTeamList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylkehuMapper.getErjiTeamList", pd);
	}
	
	
	/**
	 * 二级团队总数量
	 * 功能：
	 * 作者：lj
	 * 日期：2017-8-1
	 */
	public PageData getErjiTeamListCount(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.getErjiTeamListCount", pd);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	//-------------------分销---------------------------//
	
	
	/**
	 * 首页-查顶级
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData chaDingji(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.chaDingji", pd);
	}
	

	/**
	 * 首页-查一级
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData chaYiji(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.chaYiji", pd);
	}
	
	/**
	 * 首页-查二级
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData chaErji(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.chaErji", pd);
	}
	
	/**
	 * 保存到分销表中
	 * 
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-9
	 */
	public void saveFenXiao(PageData pd) throws Exception{
		dao.save("ljylkehuMapper.saveFenXiao", pd);
	}
	
	
	
	/**
	 * 根据订单id到临时表中查出客户id并创建session
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getUserKehuIdByOrderNumber(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.getUserKehuIdByOrderNumber", pd);
	}
	
	
	
	/**
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getMyjifen(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.getMyjifen", pd);
	}
	
	
	
	/********************以下3个是更新一级字段的操作 begin************************/

	/**
	 * 首页-根据顶级id查一级有没有被update,如果有则其他的下线则为新增
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData selectYijiByDingji(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.selectYijiByDingji", pd);
	}
	
	/**
	 * 保存一级信息 二级为空
	 * 
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-9
	 */
	public void insertYiji(PageData pd) throws Exception{
		dao.save("ljylkehuMapper.insertYiji", pd);
	}
	
	/**
	 * 更新那条数据的一级字段信息
	 * 
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-9
	 */
	public void updateYiji(PageData pd) throws Exception{
		dao.save("ljylkehuMapper.updateYiji", pd);
	}
	
	
	
	
	
	/********************以上3个是更新一级字段的操作end****************/
	
	
	
	
	/********************以下3个是更新二级字段的操作 begin************************/

	/**
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData selectErjiByYiji(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.selectErjiByYiji", pd);
	}
	
	/**
	 * 
	 * 
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-9
	 */
	public void insertErji(PageData pd) throws Exception{
		dao.save("ljylkehuMapper.insertErji", pd);
	}
	
	
	
	/**
	 * 
	 * 
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-9
	 */
	public void updateErji(PageData pd) throws Exception{
		dao.save("ljylkehuMapper.updateErji", pd);
	}
	
	
	
	/********************以上3个是更新二级字段的操作end************************/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//********************下面的是开始的三张表的 先暂时保留 暂时不用*************************//
	/**
	 * 保存顶级分销信息
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-9
	 */
	public void saveDingji(PageData pd) throws Exception{
		dao.save("ljylkehuMapper.saveDingji", pd);
	}
	
	
	/**
	 * 保存一级分销用户信息
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-9
	 */
	public void saveYiji(PageData pd) throws Exception{
		dao.save("ljylkehuMapper.saveDingji", pd);
	}
	
	
	/**
	 * 保存二级分销用户信息
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-9
	 */
	public void saveErji(PageData pd) throws Exception{
		dao.save("ljylkehuMapper.saveDingji", pd);
	}
	
	
	////////////////////////后台疑难杂症//////////////////////////////////////////////////
	
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
	 * 疑难杂症列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getYnzzlistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ljylkehuMapper.getYnzzlistPage", page);
	}
	
	/**
	 * 保存疑难杂症
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-19
	 */
	public void saveYnzz(PageData pd) throws Exception{
		dao.save("ljylkehuMapper.saveYnzz", pd);
	}
	
	
	/**
	 * 修改疑难杂症
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-19
	 */
	public void updateYnzzByID(PageData pd) throws Exception{
		dao.update("ljylkehuMapper.updateYnzzByID", pd);
	}
	
	
	
	/**
	 * 判断疑难杂症名字是否存在
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getNameByID(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.getNameByID", pd);
	}
		
	
	
		
	/**
	 * 批量删除
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-19
	 */
	public void deleteYnzzById(Map<String, Object> map) throws Exception{
		dao.update("ljylkehuMapper.deleteYnzzById", map);
	}
	
	
	/**
	 * 判断疑难杂症名字是否存在
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getYnzzByName(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.getYnzzByName", pd);
	}
		
	
	/**
	 * 疑难杂症列表h5调用
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getYnzzList(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ljylkehuMapper.getYnzzList", page);
	}
	
	/**
	 * 获取机构类型列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getjigouTypeList(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ljylkehuMapper.getjigouTypeList", page);
	}
	

	/**
	 * 根据商户id去查该商户的现金金额和成交金额
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAmountById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.getAmountById", pd);
	}
	
	
	/**
	 * 修改金额
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-27
	 */
	public void updateAmountById(PageData pd)throws Exception{
		dao.update("ljylkehuMapper.updateAmountById", pd);
		
	}
	
	/**
	 * 修改医生订单状态
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-27
	 */
	public void updateYishengOrderState(PageData pd)throws Exception{
		dao.update("ljylkehuMapper.updateYishengOrderState", pd);
		
	}
	/**
	 * 修改药商订单状态
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-27
	 */
	public void updateYaoshangOrderState(PageData pd)throws Exception{
		dao.update("ljylkehuMapper.updateYaoshangOrderState", pd);
		
	}
	/**
	 * 修改机构订单状态
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-27
	 */
	public void updatejigouOrderState(PageData pd)throws Exception{
		dao.update("ljylkehuMapper.updatejigouOrderState", pd);
		
	}
	
	/**
	 * 获取积分和股权信息
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getjgDataById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.getjgDataById", pd);
	}
	
	
	
	public void updateJiFenAndGuQuan(PageData pd) throws Exception{
		dao.update("ljylkehuMapper.updateJiFenAndGuQuan", pd);
	}
	
	
	/**
	 * 根据客户id获取客户头像和真实姓名 接口
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getKehuHeadImgAnduserName(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.getKehuHeadImgAnduserName", pd);
	}
	
	
	/**
	 * 根据商户id获取客户头像和真实姓名 接口
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getShanghuHeadImgAnduserName(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.getShanghuHeadImgAnduserName", pd);
	}
	
	
	/**
	 * 提成分销 查是不是二级
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData selectIsErji(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.selectIsErji", pd);
	}
	
	/**
	 * 分销提成比例
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-7
	 */
	public PageData selectFenXiaoTichen(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.selectFenXiaoTichen", pd);
	}
	
	
	
	/**
	 * 提成分销 查是不是一级
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData selectIsYiji(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.selectIsYiji", pd);
	}
	

	/**
	 * 查金额根据客户ID
	 * 
	 * 作者：lj
	 * 日期：2017-7-7
	 */
	public PageData getMoneyBykehuID(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.getMoneyBykehuID", pd);
	}
	
	
	/**
	 * 根据商户ID查金额
	 * 
	 * 作者：lj
	 * 日期：2017-7-7
	 */
	public PageData getMoneyByShangHuID(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ljylkehuMapper.getMoneyByShangHuID", pd);
	}
	
	/**
	 * 修改金额--分销提成--客户
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-7
	 */
	public void updateMoneyBykehuID(PageData pd) throws Exception{
		dao.update("ljylkehuMapper.updateMoneyBykehuID", pd);
	}
	
	/**
	 * 修改金额--分销提成--商户（因为一级可能是商户，商户也可以分享二维码的，所以一级可能是商户）
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-7
	 */
	public void updateMoneyByshangHuID(PageData pd) throws Exception{
		dao.update("ljylkehuMapper.updateMoneyByshangHuID", pd);
	}
	
	
	/**
	 * 保存提成分销金额记录
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-14
	 */
	public void insertTichenMoneyRecord(PageData pd) throws Exception{
		dao.save("ljylkehuMapper.insertTichenMoneyRecord", pd);
	}
	
	/**
	 * 保存评价
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-14
	 */
	public void savePingjia(PageData pd) throws Exception{
		dao.save("ljylkehuMapper.savePingjia", pd);
	}
	
	/**
	 * 客户端查询分销提成所得金额的记录
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-14
	 */
	public List<PageData> selectFenxiaoMoenyList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylkehuMapper.selectFenxiaoMoenyList", pd);
	}
	
	
	
	/**
	 * 改变评价状态
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-14
	 */
	public void updateYishengFlagState(PageData pd) throws Exception{
		dao.save("ljylkehuMapper.updateYishengFlagState", pd);
	}
	
	/**
	 * 改变评价状态
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-14
	 */
	public void updateYaoshangFlagState(PageData pd) throws Exception{
		dao.save("ljylkehuMapper.updateYaoshangFlagState", pd);
	}
	
	/**
	 * 改变评价状态
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-14
	 */
	public void updatejigouFlagState(PageData pd) throws Exception{
		dao.save("ljylkehuMapper.updatejigouFlagState", pd);
	}
	
	/**
	 * 定时任务查询列表
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-19
	 */
	public List<PageData> getTimingTaskList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ljylkehuMapper.getTimingTaskList", pd);
	}
	
}
