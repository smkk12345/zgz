package com.hibernate.base;

import java.util.List;

public interface IBaseService<T> {
	   public T save(T entity);
		
		public void update(T entity);

		public void delete(String id);
		public void deleteList(List<T> beans);
		
		public T getById(String id);

		public List<T> findAll();
}
