package com.hibernate.houseinfo.service;

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
	
	public void save(FileManageBean filemanage){
		fileManageDao.save(filemanage);
	}
	
}
