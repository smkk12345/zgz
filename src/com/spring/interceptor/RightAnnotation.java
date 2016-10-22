package com.spring.interceptor;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import java.lang.annotation.ElementType;
import java.lang.annotation.RetentionPolicy;

@Target(ElementType.METHOD)//ע���ڷ�������Ч��
@Retention(RetentionPolicy.RUNTIME)//��ʾ��VM�ܹ���ȥ����Ӧע��
public @interface RightAnnotation {
	OperateRightType[] operateRightTypes();
	ResultType resultType() default ResultType.page;
}
