package com.yizhan.service.information.yibaoxuan;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;

@Service("ybxOrderService")
public class YbxOrderService {
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 保存临时信息
	 * @param pd
	 * @throws Exception
	 */
	public void save_tb_temp_information(PageData pd) throws Exception{
		dao.save("ybxorderMapper.save_tb_temp_information", pd);
	}
	/**
	 * 保存临时信息
	 * @param pd
	 * @throws Exception
	 */
	public void save_tb_temp_information1(PageData pd) throws Exception{
		dao.save("ybxorderMapper.save_tb_temp_information1", pd);
	}
	/**
	 * 根据订单的订单编号，获取临时信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData get_tb_temp_information(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxorderMapper.get_tb_temp_information", pd);
	}
	
	
	/**
	 * 创建医生类订单
	 * @param pd
	 * @throws Exception
	 */
	public void saveOrderOfYiSheng(PageData pd) throws Exception{
		dao.save("ybxorderMapper.saveOrderOfYiSheng", pd);
	}
	/**
	 * 创建机构类订单
	 * @param pd
	 * @throws Exception
	 */
	public void saveOrderOfJiGou(PageData pd) throws Exception{
		dao.save("ybxorderMapper.saveOrderOfJiGou", pd);
	}
	/**
	 * 创建药商类订单
	 * @param pd
	 * @throws Exception
	 */
	public void saveOrderOfYaoShang(PageData pd) throws Exception{
		dao.save("ybxorderMapper.saveOrderOfYaoShang", pd);
	}
	/**
	 * 根据主键ID,更新用户的现金金额和成交金额
	 * @param pd
	 * @throws Exception
	 */
	public void updateXianJinAndChengJiaoAmount(PageData pd) throws Exception{
		dao.update("ybxorderMapper.updateXianJinAndChengJiaoAmount", pd);
	}
	/**
	 * 医生获取订单信息（待就诊、已完成）
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getOrderOfYiSheng(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ybxorderMapper.getOrderOfYiSheng", pd);
	}
	/**
	 * 机构获取订单信息（待就诊、已完成）
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getOrderOfJiGou(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ybxorderMapper.getOrderOfJiGou", pd);
	}
	/**
	 * 药商获取订单信息（待就诊、已完成）
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getOrderOfYaoShang(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ybxorderMapper.getOrderOfYaoShang", pd);
	}
	/**
	 * 用户获取订单信息（待就诊、已完成）
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getOrderOfKeHu(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ybxorderMapper.getOrderOfKeHu", pd);
	}
	/**
	 * 根据订单的订单编号，获取订单信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getOrderOfYiShengByOrderNumber(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxorderMapper.getOrderOfYiShengByOrderNumber", pd);
	}
	/**
	 * 根据订单的订单编号，获取订单信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getOrderOfJiGouByOrderNumber(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxorderMapper.getOrderOfJiGouByOrderNumber", pd);
	}
	/**
	 * 根据订单的订单编号，获取订单信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getOrderOfYaoShangByOrderNumber(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxorderMapper.getOrderOfYaoShangByOrderNumber", pd);
	}
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 后台获取医生订单列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getOrderOfYiShenglistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ybxorderMapper.getOrderOfYiShenglistPage", page);
	}
	/**
	 * 后台获取机构订单列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getOrderOfJiGoulistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ybxorderMapper.getOrderOfJiGoulistPage", page);
	}
	/**
	 * 后台获取药商订单列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getOrderOfYaoShanglistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ybxorderMapper.getOrderOfYaoShanglistPage", page);
	}
	/**
	 * 后台获取客户订单列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getOrderOfKeHulistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ybxorderMapper.getOrderOfKeHulistPage", page);
	}
	
	/**
	 * 医生类收益
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getShouYiOfYiShengSum(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxorderMapper.getShouYiOfYiShengSum", pd);
	}
	public List<PageData> getShouYiOfYiShenglistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ybxorderMapper.getShouYiOfYiShenglistPage", page);
	}
	/**
	 * 机构类收益
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getShouYiOfJiGouSum(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxorderMapper.getShouYiOfJiGouSum", pd);
	}
	public List<PageData> getShouYiOfJiGoulistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ybxorderMapper.getShouYiOfJiGoulistPage", page);
	}
	/**
	 * 药商类收益
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getShouYiOfYaoShangSum(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ybxorderMapper.getShouYiOfYaoShangSum", pd);
	}
	public List<PageData> getShouYiOfYaoShanglistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("ybxorderMapper.getShouYiOfYaoShanglistPage", page);
	}
	
	
	
}
