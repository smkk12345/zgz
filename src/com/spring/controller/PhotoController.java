package com.spring.controller;


import com.common.consts.Contanst;
import com.hibernate.houseinfo.domain.Photo;
import com.hibernate.houseinfo.service.PhotoService;
import com.spring.utils.ParamUtils;
import com.spring.utils.Servlets;
import com.spring.utils.UploadInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 档案管理
 * Created by ccj on 2016/12/9.
 */
@Controller
public class PhotoController {
    @Autowired
    private PhotoService photoService;

    /**
     * 档案上传类型
     * @param request
     * @param modelMap
     */
    @RequestMapping("/photo/uploadType.action")
    public String uploadType(HttpServletRequest request,ModelMap modelMap){
        String agreementId = ParamUtils.getString(request,"agreementId","");

        modelMap.addAttribute("agreementId",agreementId);
        modelMap.addAttribute("archivePhotoCategory", Contanst.archivePhotoCategory);

        return "/WEB-INF/pages/jsp/photo/uploadType.jsp";
    }


    /**
     * 档案上传
     * @param request
     * @param modelMap
     */
    @RequestMapping("/photo/upload.action")
    public String upload(HttpServletRequest request,ModelMap modelMap){
        String agreementId = ParamUtils.getString(request,"agreementId","");
        int type = ParamUtils.getInt(request,"type",0);

        List<Photo> photoList = this.photoService.listByType(type,agreementId);

        modelMap.addAttribute("agreementId",agreementId);
        modelMap.addAttribute("photoList",photoList);
        modelMap.addAttribute("type",type);

        return "/WEB-INF/pages/jsp/photo/upload.jsp";
    }


    /**
     * 保存上传图片
     */
    @RequestMapping("/photo/uploadPhoto")
    @ResponseBody
    public Map<String,String> uploadPhoto(HttpServletRequest request, HttpServletResponse response)throws IOException {
        boolean success = true;
        String errorMessage = "";

        String agreementId = ParamUtils.getString(request,"agreementId","");
        int type = ParamUtils.getInt(request,"type",0);
        String uploadDir = "/uploads/photos/"+agreementId;
        UploadInfo uploadInfo = Servlets.uploadFile(request,uploadDir,"pic", System.currentTimeMillis()+"");

        if(uploadInfo.getSaveFilename()==null){
            success = false;
            throw new RuntimeException("图片上传失败");
        }
        String path = request.getSession().getServletContext().getRealPath("/");
        File picture = new File(path + "/" + uploadInfo.getSaveFilename());
        if(success) {
            String filename = uploadInfo.getSaveFilename().toLowerCase();
            if (!filename.endsWith("jpg") && !filename.endsWith("jpeg")) {
                picture.delete();
                success = false;
                errorMessage = "只支持jpg格式的照片上传";
                System.out.println(errorMessage);
            }
        }

        if (success) {
            Photo photo = new Photo();
            photo.setPhotoUrl(uploadInfo.getSaveFilename());
            photo.setSize(uploadInfo.getFileSize());
            photo.setSort(99);
            photo.setType(type);
            photo.setAddTime(new Date());
            photo.setAgreementId(agreementId);
            photoService.save(photo);
        }
        Map<String, String> map = new HashMap<String, String>();
        map.put("success","true");
        return map;
    }


    @RequestMapping("/photo/photoBatchDel")
    @ResponseBody
    public Map<String, String> photoBatchDel(HttpServletRequest request, HttpServletResponse response){
        String ids = ParamUtils.getString(request,"photoIds","");

        List<Photo> photos = this.photoService.getListByIds(ids);

        if(photos!=null){
            try {
                for (Photo photo : photos) {
                    String path = request.getSession().getServletContext().getRealPath("/");
                    File picture = new File(path+ "/" + photo.getPhotoUrl());
                    if (picture.exists()) {
                        picture.delete();
                    }
                    photoService.deletePhoto(photo);
                }
            }catch (Exception e){
                System.out.println(e);
            }
        }

        Map<String, String> map = new HashMap<String, String>();
        map.put("success", "true");
        return map;
    }


    /**
     * 档案照片查看
     * @param request
     * @param modelMap
     */
    @RequestMapping("/photo/view")
    public String view(HttpServletRequest request,ModelMap modelMap){
        String id = ParamUtils.getString(request,"id","");
        String agreementId = ParamUtils.getString(request,"agreementId","");
        int type = ParamUtils.getInt(request,"type",0);
        Photo photo = photoService.getPhoto(id);
        if(photo==null){
            throw new RuntimeException("照片不存在");
        }

        Photo prePhoto = photoService.prePhoto(id,agreementId,type);
        Photo nextPhoto = photoService.nextPhoto(id,agreementId,type);

        modelMap.addAttribute("photo",photo);
        modelMap.addAttribute("prePhoto",prePhoto);
        modelMap.addAttribute("nextPhoto",nextPhoto);
        modelMap.addAttribute("agreementId",agreementId);
        return "/WEB-INF/pages/jsp/photo/view.jsp";
    }


}
