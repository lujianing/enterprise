package com.qianyan.dao.impl;

import java.util.List;

import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Component;

import com.qianyan.dao.NewsDao;
import com.qianyan.entity.News;
import com.qianyan.entity.Video;
@Component("newsDao")
public class NewsDaoImpl extends BaseDaoImpl<News, Integer> implements NewsDao{
	public List<News> listByTypeid(int id) {
		
		return null;
	}
	
	public List<News> listNews(int i) {
		Session session =this.getHibernateTemplate().getSessionFactory().openSession();
		
		session.beginTransaction();
		Query query = session.createQuery("from News v order by v.uptime desc");
		query.setFirstResult(0);
		query.setMaxResults(i);
		List<News> news =query.list();
		session.getTransaction().commit();
		session.close();
			
		return news;
	}
	
	
	public News findByName(String s) {
		News news = null;
		Session session =this.getHibernateTemplate().getSessionFactory().openSession();
		
		session.beginTransaction();
		Query query = session.createQuery("from News v where v.title like ?");
		query.setString(0, "%"+s+"%");
		if(query.list().size()>0)
			news = (News) query.list().get(0);
		session.getTransaction().commit();
		session.close();
		
		return news;
	}
	
	
	public List<News> listByClick(int i) {
		Session session =this.getHibernateTemplate().getSessionFactory().openSession();
		
		session.beginTransaction();
		Query query = session.createQuery("from News v order by v.click desc");
		query.setFirstResult(0);
		query.setMaxResults(i);
		List<News> list =query.list();
		session.getTransaction().commit();
		session.close();
			
		return list;
	}
	
	
	public News GetandUpdate(int id) {
		Session session =this.getHibernateTemplate().getSessionFactory().openSession();
		session.beginTransaction();
		News news =(News)session.load(News.class, id, LockMode.UPGRADE); 
		System.out.println(news.getClick()+1);
		news.setClick(news.getClick()+1);
		session.update(news);
		session.getTransaction().commit();
		session.close();
		
		return news;
	}
}
