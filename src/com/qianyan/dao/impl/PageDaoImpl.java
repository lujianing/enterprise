package com.qianyan.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.qianyan.dao.PageDao;

@Component("pageDao")
public class PageDaoImpl extends BaseDaoImpl implements PageDao {

	/** */
	/**
	 * 分页查询
	 * 
	 * @param <T>
	 * @param hql
	 *            查询的条件
	 * @param offset
	 *            开始记录
	 * @param length
	 *            一次查询几条记录
	 * @return
	 */
	
	public <T>List queryForPage(Class<T> entityClass,String hql, int offset, int length) {

		Session session = this.getHibernateTemplate().getSessionFactory()
				.openSession();

		session.beginTransaction();
		Query query = session.createQuery(hql);
		query.setFirstResult(offset);
		query.setMaxResults(length);
		List<T> list = query.list();
		session.getTransaction().commit();
		session.close();

		return list;

	}

	/** */
	/**
	 * 查询所有记录数
	 * 
	 * @return 总记录数
	 */
	
	public int getAllRowCount(String hql) {

		return this.getHibernateTemplate().find(hql).size();
	}

}
