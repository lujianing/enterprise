package com.qianyan.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Component;

import com.qianyan.dao.PictureDao;
import com.qianyan.entity.News;
import com.qianyan.entity.Picture;

@Component("pictureDao")
public class PictureDaoImpl extends BaseDaoImpl<Picture, Integer> implements PictureDao {

	
	public List<Picture> listbynum(int num, String sort) {
		Session session =this.getHibernateTemplate().getSessionFactory().openSession();
		
		session.beginTransaction();
		Query query = session.createQuery("from Picture order by uptime "+sort);
		query.setFirstResult(0);
		query.setMaxResults(num);
		List<Picture> pictures =query.list();
		session.getTransaction().commit();
		session.close();
			
		return pictures;
	}


}
