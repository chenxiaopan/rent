package com.cxp.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.cxp.dao.TypesDao;
import com.cxp.entity.Types;
import com.cxp.util.HibernateUtil;

public class TypesDaoImpl implements TypesDao {

	@Override
	public List<Types> list() {
		// 1.获得会话
		Session session = HibernateUtil.currentSession();
		// 2.hql语句
		String hql = "from Types";
		return session.createQuery(hql).list();
	}

}
