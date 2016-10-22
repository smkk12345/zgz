package com.hibernate.base;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.jsp.tagext.TryCatchFinally;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.transaction.annotation.Transactional;

import com.spring.ServiceManager;

import sessionFactory.HibernateSessionFactory;
@Transactional
public class BaseDaoImpl<T> implements IBaseDao<T> {

	protected Class<T> clazz;
	public BaseDaoImpl() {
		ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass();
	    this.clazz = (Class<T>) pt.getActualTypeArguments()[0];
	}
	@Override
	public T save(T entity) {
		Session s = null;
		Transaction tx = null;
		try{
			s = getSession();
			tx = s.beginTransaction();
			s.save(entity);
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
		return entity;
	}
	@Override
	public void update(T entity) {
		Session s = null;
		Transaction tx = null;
		try{
			s = getSession();
			tx = s.beginTransaction();
//			s.saveOrUpdate(entity);
			s.merge(entity);
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
	}
	@Override
	public void delete(String id) {
		Session s = null;
		Transaction tx = null;
		try{
			s = getSession();
			tx = s.beginTransaction();
			Object obj = s.get(clazz, id);
			s.delete(obj);
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
	}
	
	@Override
	public T getById(String id) {
		Session s = null;
		try{
			s = getSession();
			return (T)s.get(clazz, id);
//			s.saveOrUpdate(entity);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
		return null;
	}
	@Override
	public List<T> getByIds(String[] ids) {
		return (List<T>) getSession().createCriteria(clazz).add(Restrictions.in("id", ids)).list();
	}
	@Override
	public List<T> findAll() {
		Session s = null;
		List<T> list = null;
		try{
			s = getSession();
			list= s.createCriteria(clazz).list();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
		return list;
	}
	
	public Session getSession() {
		return ServiceManager.getSessionFactory().openSession();
	}
}
