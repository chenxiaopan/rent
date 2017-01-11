package com.cxp.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.cxp.dao.StreetsDao;
import com.cxp.entity.Street;
import com.cxp.util.HibernateUtil;

public class StreetsDaoImpl implements StreetsDao {

	@Override
	public List<Street> list(int district_id) {
		System.out.println(district_id);
		// 1.获得会话
		Session session = HibernateUtil.currentSession();
		// 2.hql语句
		String hql = "from Street s where s.district.id=?";

		return session.createQuery(hql).setInteger(0, district_id).list();
	}
}
