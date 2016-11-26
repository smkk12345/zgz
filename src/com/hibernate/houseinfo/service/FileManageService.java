package com.hibernate.houseinfo.service;

import java.util.Date;
import java.util.List;

import com.hibernate.houseinfo.dao.FileManageDao;
import com.hibernate.houseinfo.domain.FileManageBean;

public class FileManageService {
	
	private FileManageDao fileManageDao;
	
	public void setFileManageDao(FileManageDao fileManageDao) {
		this.fileManageDao = fileManageDao;
	}

	public List<FileManageBean> findListByBaseId(String housebasicid){
		return fileManageDao.findListByBaseId(housebasicid);
	}
	
	public void updateFileBean(String isdel,String id){
		FileManageBean filemanage = fileManageDao.getById(id);
		filemanage.setIsdel(isdel);
		fileManageDao.update(filemanage);
	}
	
	public FileManageBean save(String filename,String filepath,String housebasicid,long size,String suffix){
		FileManageBean fileManageBean = new FileManageBean();
		fileManageBean.setCreateTime(new Date());
		fileManageBean.setUpdateTime(new Date());
		fileManageBean.setFilename(filename);
		fileManageBean.setHousebasicid(housebasicid);
		fileManageBean.setIsdel("0");
		fileManageBean.setSuffix(suffix);
		fileManageBean.setPath(filepath);
		fileManageDao.save(fileManageBean);
		return fileManageBean;
	}
	
	public void delete(String fileid){
		 fileManageDao.delete(fileid);
	}
	
}
