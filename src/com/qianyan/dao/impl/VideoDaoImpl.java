package com.qianyan.dao.impl;

import java.util.List;

import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Component;

import com.qianyan.dao.VideoDao;
import com.qianyan.entity.Video;
@Component("videoDao")
public class VideoDaoImpl extends BaseDaoImpl<Video, Integer> implements VideoDao {


	
	public List<Video> listVideo(int i) {
		Session session =this.getHibernateTemplate().getSessionFactory().openSession();
		
		session.beginTransaction();
		Query query = session.createQuery("from Video v order by v.uptime desc");
		query.setFirstResult(0);
		query.setMaxResults(i);
		List<Video> videos =query.list();
		session.getTransaction().commit();
		session.close();
			
		return videos;
	}

	
	public List<Video> listByTypeid(int id) {
		
		return null;
	}

	
	public Video findByName(String s) {
		Video video =(Video)super.getHibernateTemplate().find("from Video v where v.vname=?",s).get(0);
//		System.out.println("video:"+video);
		return video;
	}

	
	public List<Video> listByClick(int i) {
		Session session =this.getHibernateTemplate().getSessionFactory().openSession();
		
		session.beginTransaction();
		Query query = session.createQuery("from Video v where v.cd=3 order by v.click desc");
		query.setFirstResult(0);
		query.setMaxResults(i-1);
		List<Video> videos =query.list();
		session.getTransaction().commit();
		session.close();
			
		return videos;
	}

	
	public List<Video> listByDownload(int i) {
        Session session =this.getHibernateTemplate().getSessionFactory().openSession();
		
		session.beginTransaction();
		Query query = session.createQuery("from Video v where v.cd=3 order by v.download desc");
		query.setFirstResult(0);
		query.setMaxResults(i-1);
		List<Video> videos =query.list();
		session.getTransaction().commit();
		session.close();
			
		return videos;
	}
	
	
	//事务    LockMode.UPGRADE悲观锁
	
	public Video GetandUpdate(int id) {
		Session session =this.getHibernateTemplate().getSessionFactory().openSession();
		session.beginTransaction();
		Video video =(Video)session.load(Video.class, id, LockMode.UPGRADE); 
//		System.out.println(video.getClick()+1);
		video.setClick(video.getClick()+1);
		session.update(video);
		session.getTransaction().commit();
		session.close();
		
		return video;
	}

	
	public Video GetAndUpdateDown(int id) {
		Session session =this.getHibernateTemplate().getSessionFactory().openSession();
		session.beginTransaction();
		Video video =(Video)session.load(Video.class, id, LockMode.UPGRADE); 
//		System.out.println("下载："+(video.getDownload()+1));
		video.setDownload(video.getDownload()+1);
		session.update(video);
		session.getTransaction().commit();
		session.close();
		
		return video;
	}

}
