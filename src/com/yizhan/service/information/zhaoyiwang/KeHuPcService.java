package com.yizhan.service.information.zhaoyiwang;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;

@Service("keHuPcService")
public class KeHuPcService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 获取指定用户的积分、股权、虚拟币
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getGuXuJiByUserId(PageData pd) throws Exception{
		return (PageData) dao.findForObject("keHuPcMapper.getGuXuJiByUserId", pd);
	}
	/**
	 * 获取科类信息（主科类以及其子科类）
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getDataIndexOfZhaoYiSheng(PageData pd) throws Exception{
		return  (List<PageData>) dao.findForList("keHuPcMapper.getDataIndexOfZhaoYiSheng", pd);
	}
	/**
	 * 获取找机构（类型以及旗下的机构名称）
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getDataIndexOfZhaoJiGou(PageData pd) throws Exception{
		return  (List<PageData>) dao.findForList("keHuPcMapper.getDataIndexOfZhaoJiGou", pd);
	}
	/**
	 * 获取找药商（类型以及旗下的药店名称）
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getDataIndexOfZhaoYaoShang(PageData pd) throws Exception{
		return  (List<PageData>) dao.findForList("keHuPcMapper.getDataIndexOfZhaoYaoShang", pd);
	}
	/**
	 * 获取疑难杂症（分组字母以及名称）
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getDataIndexOfYiNanZaZheng(PageData pd) throws Exception{
		return  (List<PageData>) dao.findForList("keHuPcMapper.getDataIndexOfYiNanZaZheng", pd);
	}
	/**
	 * 获取所有疑难杂症（名称以及ID）
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getDataIndexOfYiNanZaZhengAll(PageData pd) throws Exception{
		return  (List<PageData>) dao.findForList("keHuPcMapper.getDataIndexOfYiNanZaZhengAll", pd);
	}
	/**
	 * 需求大厅中的内容
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getDataIndexOfXuQiuList(PageData pd) throws Exception{
		return  (List<PageData>) dao.findForList("keHuPcMapper.getDataIndexOfXuQiuList", pd);
	}
	/**
	 * 常见疾病
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getChangJianJiBingListOfIndex(PageData pd) throws Exception{
		return  (List<PageData>) dao.findForList("keHuPcMapper.getChangJianJiBingListOfIndex", pd);
	}
	/**
	 * 新闻公告
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getNewsAndNoticeList(PageData pd) throws Exception{
		return  (List<PageData>) dao.findForList("keHuPcMapper.getNewsAndNoticeList", pd);
	}
	/**
	 * 疑难杂症列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getYiNanZaZhengList(PageData pd) throws Exception{
		return  (List<PageData>) dao.findForList("keHuPcMapper.getYiNanZaZhengList", pd);
	}
	/**
	 * 常见疾病列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getChangJianJiBingList(PageData pd) throws Exception{
		return  (List<PageData>) dao.findForList("keHuPcMapper.getChangJianJiBingList", pd);
	}
	/**
	 * 首页-找医生-医生列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getyishengList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("keHuPcMapper.getyishengList", pd);
	}
	/**
	 * 首页-找机构-机构列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getjigouList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("keHuPcMapper.getjigouList", pd);
	}
	/**
	 * 首页-找药商-药商列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getYaoshangList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("keHuPcMapper.getYaoshangList", pd);
	}
	/**
	 * 获取产品信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getChanPinInformation(PageData pd) throws Exception{
		return (PageData) dao.findForObject("keHuPcMapper.getChanPinInformation", pd);
	}
	/* //////////////////////////////////////////////////系统管理:关于我们////网站后台功能/////////////////////////////////////////////////////*/
	/**
	 * 获取关于我们列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> guanyuuslistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("keHuPcMapper.guanyuuslistPage", page);
	}
	/**
	 * 获取对象信息(肯定只有一条记录)
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getDataOfGuanYuWoMen(PageData pd) throws Exception{
		return (PageData) dao.findForObject("keHuPcMapper.getDataOfGuanYuWoMen", pd);
	}
	/**
	 * 添加关于我们
	 * @param pd
	 * @throws Exception
	 */
	public void insertGuanYuWoMen(PageData pd) throws Exception{
		dao.save("keHuPcMapper.insertGuanYuWoMen", pd);
	}
	/**
	 * 更新关于我们
	 * @param pd
	 * @throws Exception 
	 */
	public void updateGuanYuWoMen(PageData pd) throws Exception{
		dao.update("keHuPcMapper.updateGuanYuWoMen", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getGuanYuWoMenById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("keHuPcMapper.getGuanYuWoMenById", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteGuanYuWoMenById(Map<String, Object> map) throws Exception{
		dao.delete("keHuPcMapper.deleteGuanYuWoMenById", map);
	}
}
