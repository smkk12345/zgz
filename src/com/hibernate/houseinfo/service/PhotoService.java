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
}
