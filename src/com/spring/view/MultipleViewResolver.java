package com.spring.view;

import java.util.Locale;
import java.util.Map;

import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;

public class MultipleViewResolver implements ViewResolver {

	private Map<String, ViewResolver> resolvers;

	public void setResolvers(Map<String, ViewResolver> resolvers) {
		this.resolvers = resolvers;
	}

	public View resolveViewName(String viewName, Locale locale)
			throws Exception {
		int n = viewName.lastIndexOf(".");
		if (n != -1) {
			String suffix = viewName.substring(n + 1);
			ViewResolver resolver = resolvers.get(suffix);
			if (resolver == null) {
				throw new RuntimeException("No ViewResolver for " + suffix);
			}
			return resolver.resolveViewName(viewName, locale);
		} else {
			ViewResolver resolver = resolvers.get("jsp");
			return resolver.resolveViewName(viewName, locale);
		}
	}



}
