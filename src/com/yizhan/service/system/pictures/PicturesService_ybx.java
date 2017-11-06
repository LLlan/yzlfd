package com.yizhan.service.system.pictures;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;



@Service("picturesService_ybx")
public class PicturesService_ybx {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("YbxPicturesMapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("YbxPicturesMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("YbxPicturesMapper.edit", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> picturesList(Page page)throws Exception{
		return (List<PageData>)dao.findForList("YbxPicturesMapper.datalistPage", page);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("YbxPicturesMapper.listAll", pd);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAllForIndex(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("YbxPicturesMapper.listAllForIndex", pd);
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("YbxPicturesMapper.findById", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("YbxPicturesMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/*
	* 批量获取
	*/
	public List<PageData> getAllById(String[] ArrayDATA_IDS)throws Exception{
		return (List<PageData>)dao.findForList("YbxPicturesMapper.getAllById", ArrayDATA_IDS);
	}
	
	/*
	* 删除图片
	*/
	public void delTp(PageData pd)throws Exception{
		dao.update("YbxPicturesMapper.delTp", pd);
	}
	
}

