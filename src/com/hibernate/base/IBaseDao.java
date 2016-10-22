package com.hibernate.base;

import java.util.List;
import java.lang.String;

public interface IBaseDao<T> {

	
	public T save(T entity);

	
	public void update(T entity);

	
	public void delete(String id);

	
	public T getById(String id);

	
	public List<T> getByIds(String[] ids);

	
	public List<T> findAll();
}
