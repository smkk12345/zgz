﻿package com.spring.exceptionhander;
import java.io.IOException;
import java.io.Writer;

import freemarker.core.Environment;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
public class FreeMarkerExceptionHander implements TemplateExceptionHandler {

	/**
	 * 页面解析错误 输出错误信息
	 */
	public void handleTemplateException(TemplateException te, Environment env,
			Writer out) throws TemplateException {
		try {
			out.write("");
			
		} catch (IOException e) {
			
			throw new TemplateException(
					"输出错误: " + e, env);
		}
	}
}
