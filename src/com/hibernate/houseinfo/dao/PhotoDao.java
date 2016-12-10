package com.hibernate.houseinfo.dao;

import com.hibernate.base.BaseDaoImpl;
import com.hibernate.houseinfo.domain.Agreement;
import com.hibernate.houseinfo.domain.Photo;
import org.hibernate.Session;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 档案照片数据库操作
 * Created by ccj on 2016/12/9.
 */
public class PhotoDao extends BaseDaoImpl<Photo> {
    public List<Photo> listByType(int type, String agreementId) {

        Session session = null;
        List<Photo> list = null;
        try{
            session = getSession();
            String hql = "from Photo where type=? and agreementId=? order by  id";
            list = session.createQuery(hql).setInteger(0,type).setString(1,agreementId).list();
        }finally {
            if(session!=null) {
                session.close();
            }
        }
        return list;
    }

    public List<Photo> getListByIds(String ids) {
        Session session = null;
        List<Photo> list = null;
        try {
            session = getSession();
            String[] array = ids.split(",");
            String hql = "from Photo where id in (:ids) order by id";
            list = session.createQuery(hql).setParameterList("ids", array).list();
        }finally {
            if(session!=null) {
                session.close();
            }
        }
        return list;
    }

    public void deletePhoto(Photo photo) {
        delete(photo.getId());
    }

    public Photo getPhoto(String id) {
        return getById(id);
    }

    public Photo prePhoto(String id, String agreementId,int type) {
        List<Photo> list = listByType(type,agreementId);
        int index= -1;
        for(int i=0;i<list.size();i++){
            Photo photo  = list.get(i);
            if(photo.getId().equals(id)){
                index = i;
                break;
            }
        }
        index = index - 1;
        if(index>=0){
            return list.get(index);
        }else{
            return null;
        }
    }

    public Photo nextPhoto(String id, String agreementId,int type) {
        List<Photo> list = listByType(type,agreementId);
        int index= -1;
        for(int i=0;i<list.size();i++){
            Photo photo  = list.get(i);
            if(photo.getId().equals(id)){
                index = i;
                break;
            }
        }
        index = index + 1;
        if(index<list.size()){
            return list.get(index);
        }else{
            return null;
        }
    }
}
