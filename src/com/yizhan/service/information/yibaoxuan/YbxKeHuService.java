package com.yizhan.service.information.yibaoxuan;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;

@Service("ybxKeHuService")
public class YbxKeHuService {
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 首页-轮播图列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getBannerImagesList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ybxkehuMapper.getBannerImagesList", pd);
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
		return (List<PageData>) dao.findForList("ybxkehuMapper.pingjiajiluList", pd);
	}
	
	
	
	
	/**
	 * 分享二维码
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData fenxiangEwm(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.fenxiangEwm", pd);
	}
	/**
	 * 分享二维码商户
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData fenxiangEwms(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.fenxiangEwms", pd);
	}
	
	
	
	/**
	 * 根据地区，类型，科类获取医生列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getDoctorListByAddress(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ybxkehuMapper.getDoctorListByAddress", pd);
	}
	/**
	 * 获取新闻公告列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getnewsandnoticeList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ybxkehuMapper.getnewsandnoticeList", pd);
	}
	/**
	 * 获取常见疾病列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getDiseaseListByZimu(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ybxkehuMapper.getDiseaseListByZimu", pd);
	}
	
	
	
	/**
	 * 根据字母获取疑难杂症的数据
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getYnzzListByZimu(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ybxkehuMapper.getYnzzListByZimu", pd);
	}
	
	/**
	 * 保存会员用户信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveKeHu(PageData pd) throws Exception{
		dao.save("ybxkehuMapper.saveKehu", pd);
	}
	
	/**
	 * 保存客户发布的需求
	 * @param pd
	 * @throws Exception
	 */
	public void saveXuqiu(PageData pd) throws Exception{
		dao.save("ybxkehuMapper.saveXuqiu", pd);
	}
	
	
	/**
	 * 保存客户发布的需求的图片
	 * @param pd
	 * @throws Exception
	 */
	public void saveXuqiuImgs(PageData pd) throws Exception{
		dao.save("ybxkehuMapper.saveXuqiuImgs", pd);
	}
	
	
	/**
	 * 保存完善个人资料信息
	 * @param pd
	 * @throws Exception
	 */
	public void updateGerenInfo(PageData pd) throws Exception{
		dao.save("ybxkehuMapper.updateGerenInfo", pd);
	}
	
	/**
	 * 更新系统时间为最后登录时间
	 * @param pd
	 * @throws Exception
	 */
	public void updateLastLoginTime(PageData pd) throws Exception{
		dao.save("ybxkehuMapper.updateLastLoginTime", pd);
	}
	
	/**
	 * 忘记密码-修改密码
	 * @param pd
	 * @throws Exception
	 */
	public void updatePassword(PageData pd) throws Exception{
		dao.save("ybxkehuMapper.updatePassword", pd);
	}
	
	/**
	 * 首页-常见疾病详情
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData showChangjianjibingDetailByID(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.showChangjianjibingDetailByID", pd);
	}
	
	/**
	 * 首页-疑难杂症详情
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData showYnzzDetailByID(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.showYnzzDetailByID", pd);
	}
	
	/**
	 * 首页-查看新闻详情
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getXinwenDetail(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.getXinwenDetail", pd);
	}
	/**
	 * 首页-查看医生详情
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getYishengDetail(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.getYishengDetail", pd);
	}
	
	/**
	 * 首页-查看医生服务列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getyishengFuwuList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ybxkehuMapper.getyishengFuwuList", pd);
	}
	
	
	/**
	 * 首页-查看医生案例列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getyishengAnliList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ybxkehuMapper.getyishengAnliList", pd);
	}
	
	
	/**
	 * 首页-查看医生案例详情
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getYishengAnliDetail(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.getYishengAnliDetail", pd);
	}
	
	
	
	/**
	 * 会员中心-查看会员信息-根据id
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getDetailByID(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.getDetailByID", pd);
	}
	
	/**
	 * 首页-个人中心-我的订单
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getYishengOrderList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ybxkehuMapper.getYishengOrderList", pd);
	}
	
	/**
	 * 首页-个人中心-我的订单
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getYaoshangOrderList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ybxkehuMapper.getYaoshangOrderList", pd);
	}
	
	/**
	 * 首页-个人中心-我的订单
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getjigouOrderList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ybxkehuMapper.getjigouOrderList", pd);
	}
	/**
	 * 首页-根据父类id获取科类列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getkeleiListByParentID(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ybxkehuMapper.getkeleiListByParentID", pd);
	}
	/**
	 * 首页-获取科类列表-父类列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getkeleiList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ybxkehuMapper.getkeleiList", pd);
	}
	

	
	/**
	 * 首页-找医生-医生列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getyishengList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ybxkehuMapper.getyishengList", pd);
	}
	
	/**
	 * 首页-找药商-药商列表
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-17
	 * @throws Exception 
	 */
	public List<PageData> getYaoshangList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ybxkehuMapper.getYaoshangList", pd);
		
	} 
	
	
	/**
	 * 首页-找药商-机构列表
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-17
	 * @throws Exception 
	 */
	public List<PageData> getjigouList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ybxkehuMapper.getjigouList", pd);
		
	} 
	
	/**
	 * 首页-需求列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> selectXuqiuList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ybxkehuMapper.selectXuqiuList", pd);
	}
	
	public void deleteXuQiu(PageData pd) throws Exception{
		dao.delete("ybxkehuMapper.deleteXuQiu", pd);
	}
	public void deleteXuQiuImg(PageData pd) throws Exception{
		dao.delete("ybxkehuMapper.deleteXuQiuImg", pd);
	}
	public void deleteXuQiuImgById(PageData pd) throws Exception{
		dao.delete("ybxkehuMapper.deleteXuQiuImgById", pd);
	}
	public void updateXuqiu(PageData pd) throws Exception{
		dao.update("ybxkehuMapper.updateXuqiu", pd);
	}
	
	public PageData getDataOfXuQiuById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.getDataOfXuQiuById", pd);
	}
	
	
	/**
	 * 首页-需求图片列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getImgsByXuqiuID(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ybxkehuMapper.getImgsByXuqiuID", pd);
	}
	 
	/**
	 * 根据用户名去查询用户信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getDataByUserName(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.getDataByUserName", pd);
	}
	
	/**
	 * 根据手机号查询该用户是否存在
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData isExistUser(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.isExistUser", pd);
	}
	
	/**
	 * 根据手机号查询该用户是否存在
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getDataByPhone(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.getDataByPhone", pd);
	}
	
	/**
	 * 验证登录
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getDataByUserNameAndPassword(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.getDataByUserNameAndPassword", pd);
	}
	
	
	/**
	 * 首页-查积分
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getjifen(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.getjifen", pd);
	}
	
	/**
	 * 首页-查股权和虚拟币
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getGuquanAndXunibi(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.getGuquanAndXunibi", pd);
	}
	
	/**
	 * 个人中心-获取二维码图片
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getErweimaImgById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.getErweimaImgById", pd);
	}
	
	
	/**
	 * 同过分享的二维码注册进来的，修改推荐人的积分和它的上级的积分
	 * @param pd
	 * @throws Exception
	 */
	public void updateJifenByEwmRegister(PageData pd) throws Exception{
		dao.save("ybxkehuMapper.updateJifenByEwmRegister", pd);
	}
	
	
	

	/**
	 * 首页-一级团队 列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getYijiTeamList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ybxkehuMapper.getYijiTeamList", pd);
	}
	
	/**
	 * 一级团队总数量
	 * 功能：
	 * 作者：lj
	 * 日期：2017-8-1
	 */
	public PageData getYijiTeamListCount(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.getYijiTeamListCount", pd);
	}
	
	
	/**
	 * 首页-二级团队 列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getErjiTeamList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ybxkehuMapper.getErjiTeamList", pd);
	}
	
	
	/**
	 * 二级团队总数量
	 * 功能：
	 * 作者：lj
	 * 日期：2017-8-1
	 */
	public PageData getErjiTeamListCount(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.getErjiTeamListCount", pd);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	//-------------------分销---------------------------//
	
	
	/**
	 * 首页-查顶级
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData chaDingji(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.chaDingji", pd);
	}
	

	/**
	 * 首页-查一级
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData chaYiji(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.chaYiji", pd);
	}
	
	/**
	 * 首页-查二级
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData chaErji(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.chaErji", pd);
	}
	
	/**
	 * 保存到分销表中
	 * 
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-9
	 */
	public void saveFenXiao(PageData pd) throws Exception{
		dao.save("ybxkehuMapper.saveFenXiao", pd);
	}
	
	
	
	/**
	 * 根据订单id到临时表中查出客户id并创建session
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getUserKehuIdByOrderNumber(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.getUserKehuIdByOrderNumber", pd);
	}
	
	
	
	/**
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getMyjifen(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.getMyjifen", pd);
	}
	
	
	
	/********************以下3个是更新一级字段的操作 begin************************/

	/**
	 * 首页-根据顶级id查一级有没有被update,如果有则其他的下线则为新增
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData selectYijiByDingji(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.selectYijiByDingji", pd);
	}
	
	/**
	 * 保存一级信息 二级为空
	 * 
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-9
	 */
	public void insertYiji(PageData pd) throws Exception{
		dao.save("ybxkehuMapper.insertYiji", pd);
	}
	
	/**
	 * 更新那条数据的一级字段信息
	 * 
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-9
	 */
	public void updateYiji(PageData pd) throws Exception{
		dao.save("ybxkehuMapper.updateYiji", pd);
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
		return (PageData) dao.findForObject("ybxkehuMapper.selectErjiByYiji", pd);
	}
	
	/**
	 * 
	 * 
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-9
	 */
	public void insertErji(PageData pd) throws Exception{
		dao.save("ybxkehuMapper.insertErji", pd);
	}
	
	
	
	/**
	 * 
	 * 
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-9
	 */
	public void updateErji(PageData pd) throws Exception{
		dao.save("ybxkehuMapper.updateErji", pd);
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
		dao.save("ybxkehuMapper.saveDingji", pd);
	}
	
	
	/**
	 * 保存一级分销用户信息
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-9
	 */
	public void saveYiji(PageData pd) throws Exception{
		dao.save("ybxkehuMapper.saveDingji", pd);
	}
	
	
	/**
	 * 保存二级分销用户信息
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-9
	 */
	public void saveErji(PageData pd) throws Exception{
		dao.save("ybxkehuMapper.saveDingji", pd);
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
		return (List<PageData>) dao.findForList("ybxkehuMapper.getYnzzlistPage", page);
	}
	
	/**
	 * 保存疑难杂症
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-19
	 */
	public void saveYnzz(PageData pd) throws Exception{
		dao.save("ybxkehuMapper.saveYnzz", pd);
	}
	
	
	/**
	 * 修改疑难杂症
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-19
	 */
	public void updateYnzzByID(PageData pd) throws Exception{
		dao.update("ybxkehuMapper.updateYnzzByID", pd);
	}
	
	
	
	/**
	 * 判断疑难杂症名字是否存在
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getNameByID(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.getNameByID", pd);
	}
		
	
	
		
	/**
	 * 批量删除
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-19
	 */
	public void deleteYnzzById(Map<String, Object> map) throws Exception{
		dao.update("ybxkehuMapper.deleteYnzzById", map);
	}
	
	
	/**
	 * 判断疑难杂症名字是否存在
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getYnzzByName(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.getYnzzByName", pd);
	}
		
	
	/**
	 * 疑难杂症列表h5调用
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getYnzzList(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ybxkehuMapper.getYnzzList", page);
	}
	
	/**
	 * 获取机构类型列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getjigouTypeList(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ybxkehuMapper.getjigouTypeList", page);
	}
	

	/**
	 * 根据商户id去查该商户的现金金额和成交金额
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAmountById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.getAmountById", pd);
	}
	
	
	/**
	 * 修改金额
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-27
	 */
	public void updateAmountById(PageData pd)throws Exception{
		dao.update("ybxkehuMapper.updateAmountById", pd);
		
	}
	
	/**
	 * 修改医生订单状态
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-27
	 */
	public void updateYishengOrderState(PageData pd)throws Exception{
		dao.update("ybxkehuMapper.updateYishengOrderState", pd);
		
	}
	/**
	 * 修改药商订单状态
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-27
	 */
	public void updateYaoshangOrderState(PageData pd)throws Exception{
		dao.update("ybxkehuMapper.updateYaoshangOrderState", pd);
		
	}
	/**
	 * 修改机构订单状态
	 * 功能：
	 * 作者：lj
	 * 日期：2017-6-27
	 */
	public void updatejigouOrderState(PageData pd)throws Exception{
		dao.update("ybxkehuMapper.updatejigouOrderState", pd);
		
	}
	
	/**
	 * 获取积分和股权信息
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getjgDataById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.getjgDataById", pd);
	}
	
	
	
	public void updateJiFenAndGuQuan(PageData pd) throws Exception{
		dao.update("ybxkehuMapper.updateJiFenAndGuQuan", pd);
	}
	
	
	/**
	 * 根据客户id获取客户头像和真实姓名 接口
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getKehuHeadImgAnduserName(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.getKehuHeadImgAnduserName", pd);
	}
	
	
	/**
	 * 根据商户id获取客户头像和真实姓名 接口
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getShanghuHeadImgAnduserName(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.getShanghuHeadImgAnduserName", pd);
	}
	
	
	/**
	 * 提成分销 查是不是二级
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData selectIsErji(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.selectIsErji", pd);
	}
	
	/**
	 * 分销提成比例
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-7
	 */
	public PageData selectFenXiaoTichen(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.selectFenXiaoTichen", pd);
	}
	
	
	
	/**
	 * 提成分销 查是不是一级
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData selectIsYiji(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.selectIsYiji", pd);
	}
	

	/**
	 * 查金额根据客户ID
	 * 
	 * 作者：lj
	 * 日期：2017-7-7
	 */
	public PageData getMoneyBykehuID(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.getMoneyBykehuID", pd);
	}
	
	
	/**
	 * 根据商户ID查金额
	 * 
	 * 作者：lj
	 * 日期：2017-7-7
	 */
	public PageData getMoneyByShangHuID(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxkehuMapper.getMoneyByShangHuID", pd);
	}
	
	/**
	 * 修改金额--分销提成--客户
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-7
	 */
	public void updateMoneyBykehuID(PageData pd) throws Exception{
		dao.update("ybxkehuMapper.updateMoneyBykehuID", pd);
	}
	
	/**
	 * 修改金额--分销提成--商户（因为一级可能是商户，商户也可以分享二维码的，所以一级可能是商户）
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-7
	 */
	public void updateMoneyByshangHuID(PageData pd) throws Exception{
		dao.update("ybxkehuMapper.updateMoneyByshangHuID", pd);
	}
	
	
	/**
	 * 保存提成分销金额记录
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-14
	 */
	public void insertTichenMoneyRecord(PageData pd) throws Exception{
		dao.save("ybxkehuMapper.insertTichenMoneyRecord", pd);
	}
	
	/**
	 * 保存评价
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-14
	 */
	public void savePingjia(PageData pd) throws Exception{
		dao.save("ybxkehuMapper.savePingjia", pd);
	}
	
	/**
	 * 客户端查询分销提成所得金额的记录
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-14
	 */
	public List<PageData> selectFenxiaoMoenyList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ybxkehuMapper.selectFenxiaoMoenyList", pd);
	}
	
	
	
	/**
	 * 改变评价状态
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-14
	 */
	public void updateYishengFlagState(PageData pd) throws Exception{
		dao.save("ybxkehuMapper.updateYishengFlagState", pd);
	}
	
	/**
	 * 改变评价状态
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-14
	 */
	public void updateYaoshangFlagState(PageData pd) throws Exception{
		dao.save("ybxkehuMapper.updateYaoshangFlagState", pd);
	}
	
	/**
	 * 改变评价状态
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-14
	 */
	public void updatejigouFlagState(PageData pd) throws Exception{
		dao.save("ybxkehuMapper.updatejigouFlagState", pd);
	}
	
	/**
	 * 定时任务查询列表
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-19
	 */
	public List<PageData> getTimingTaskList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ybxkehuMapper.getTimingTaskList", pd);
	}
	
}
