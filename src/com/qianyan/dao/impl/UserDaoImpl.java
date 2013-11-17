package com.qianyan.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Component;

import com.qianyan.dao.UserDao;
import com.qianyan.entity.News;
import com.qianyan.entity.User;
import com.qianyan.entity.Video;
@Component("userDao")
public class UserDaoImpl extends BaseDaoImpl<User, Integer> implements UserDao {

	
	public User getByName(String name) {
		User user = null;
		Session session =this.getHibernateTemplate().getSessionFactory().openSession();
		
		session.beginTransaction();
		Query query = session.createQuery("from User u where u.name = ?");
		query.setString(0, name);
		if(query.list().size()>0){
			user = (User) query.list().get(0);
		}
		session.getTransaction().commit();
		session.close();
		
		return user;
	}

	
	public List<String> listAllEmail() {
		Session session =this.getHibernateTemplate().getSessionFactory().openSession();
		
		session.beginTransaction();
		Query query = session.createQuery("select distinct(email) from User u");
		
		List<String> mails =query.list();
		session.getTransaction().commit();
		session.close();
			
		return mails;
	}


}
