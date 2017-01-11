package com.cxp.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.cxp.dao.DistrictsDao;
import com.cxp.entity.District;
import com.cxp.util.HibernateUtil;

public class DistrictsDaoImpl implements DistrictsDao {

	@Override
	public List<District> list() {
		// 1.获得会话
		Session session = HibernateUtil.currentSession();
		// 2.hql语句
		String hql = "from District";
		return session.createQuery(hql).list();
	}

}
