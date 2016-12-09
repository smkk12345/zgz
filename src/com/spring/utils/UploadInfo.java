package com.spring.utils;

/**
 * Created by ccj on 2016/12/9.
 */
public class UploadInfo {
    private long fileSize;
    private String OriginalFilename;
    private String saveFilename;
    private String contentType;

    public long getFileSize() {
        return fileSize;
    }
    public void setFileSize(long fileSize) {
        this.fileSize = fileSize;
    }
    public String getOriginalFilename() {
        return OriginalFilename;
    }
    public void setOriginalFilename(String originalFilename) {
        OriginalFilename = originalFilename;
    }
    public String getSaveFilename() {
        return saveFilename;
    }
    public void setSaveFilename(String saveFilename) {
        this.saveFilename = saveFilename;
    }
    public String getContentType() {
        return contentType;
    }
    public void setContentType(String contentType) {
        this.contentType = contentType;
    }


}
