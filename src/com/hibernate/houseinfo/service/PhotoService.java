package com.hibernate.houseinfo.service;

import com.hibernate.houseinfo.dao.PhotoDao;
import com.hibernate.houseinfo.domain.Photo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 档案管理
 * Created by ccj on 2016/12/9.
 */
public class PhotoService {
    @Autowired
    private PhotoDao photoDao;

    public List<Photo> list(){
        return null;
    }

    public List<Photo> listByType(int type, String agreementId) {
        return photoDao.listByType(type,agreementId);
    }

    public void save(Photo photo) {
        photoDao.save(photo);
    }

    public List<Photo> getListByIds(String ids) {
        return photoDao.getListByIds(ids);
    }

    public void deletePhoto(Photo photo) {
        photoDao.deletePhoto(photo);
    }

    public Photo getPhoto(String id) {
        return photoDao.getPhoto(id);
    }

    public Photo prePhoto(String id, String agreementId, int type) {
        return photoDao.prePhoto(id,agreementId,type);
    }

    public Photo nextPhoto(String id, String agreementId, int type) {
        return photoDao.nextPhoto(id,agreementId,type);
    }
}
