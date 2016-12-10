package com.spring.utils;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeansException;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by cai on 2016/2/19.
 */
public class Servlets {

     // -- 常用数值定义 --//
    public static final long ONE_YEAR_SECONDS = 60 * 60 * 24 * 365;
    public static String HTTP_SERVLET_REQUEST = "sqds_request";
    public static String HTTP_SERVLET_RESPONSE = "sqds_response";



    /**
     * 上传文件
     * @param request
     * @param uploadDir 上传文件路径
     * @param parameterName 表单域名称
     * @param saveFileName 上传另存为文件名称，不含扩展名
     * @return
     */
    public static UploadInfo uploadFile(HttpServletRequest request, String uploadDir, String parameterName, String saveFileName) {
        String fileRelativePath = "";
        UploadInfo uploadInfo = new UploadInfo();

        String path = request.getSession().getServletContext().getRealPath("/");

//        String realPath = System.getProperty("rootPath") + "/" + uploadDir;

        String realPath = path + "/" + uploadDir;

        MultipartHttpServletRequest multipartRequest = null;

        try {
            multipartRequest = (MultipartHttpServletRequest) request;
        } catch (ClassCastException e) {
            return uploadInfo;
        }
        File file = new File(realPath);
        try {
            if (!file.exists()) {
                file.mkdirs();
            }
            MultipartFile multipartFile = multipartRequest.getFile(parameterName);
            if (StringUtils.isNotEmpty(multipartFile.getOriginalFilename())) {
                String fileName = multipartFile.getOriginalFilename();
                String extName = "";
                if (fileName.lastIndexOf(".") != -1) {
                    extName = fileName.substring(fileName.lastIndexOf("."));
                }
                String fileRealPath = file + File.separator + saveFileName	+ extName;
                File file1 = new File(fileRealPath);
                multipartFile.transferTo(file1);
                fileRelativePath = uploadDir + "/" + saveFileName + extName;

                uploadInfo.setFileSize(multipartFile.getSize());
                uploadInfo.setOriginalFilename(fileName);
                uploadInfo.setSaveFilename(fileRelativePath);
                uploadInfo.setContentType(multipartFile.getContentType());
            }
        } catch (IOException e) {
            throw new RuntimeException(e.getMessage());
        }
        return uploadInfo;
    }

}
