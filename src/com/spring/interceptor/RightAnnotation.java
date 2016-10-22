package com.spring.interceptor;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import java.lang.annotation.ElementType;
import java.lang.annotation.RetentionPolicy;

@Target(ElementType.METHOD)//注解在方法是其效果
@Retention(RetentionPolicy.RUNTIME)//表示在VM能够回去到相应注解
public @interface RightAnnotation {
	OperateRightType[] operateRightTypes();
	ResultType resultType() default ResultType.page;
}
