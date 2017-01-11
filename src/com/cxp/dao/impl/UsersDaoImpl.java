package com.cxp.dao.impl;

import org.hibernate.Session;

import com.cxp.dao.UsersDao;
import com.cxp.entity.Users;
import com.cxp.util.HibernateUtil;

public class UsersDaoImpl implements UsersDao {

	@Override
	public int add(Users user) {
		return 0;
	}

	@Override
	public int login(Users user) {
		// 返回0表示登录失败，1表示登录成功
		int count = 0;
		// 获得会话对象
		Session session = HibernateUtil.currentSession();

		// hql语句
		String hql = "select count(1) from Users u where u.uname=? and u.upwd=? ";

		// 查询
		Object obj = session.createQuery(hql).setParameter(0, user.getUname())
				.setParameter(1, user.getUpwd()).uniqueResult();
		if ((Long) obj > 0) {
			count = 1;
		}

		System.out.println("login---->" + obj);

		return count;
	}

	@Override
	/**
	 * 根据用户名找到用户id
	 */
	public int findByName(String name) {
		// 1.获得会话
		Session session = HibernateUtil.currentSession();
		// 2.hql语句
		String hql = "select userid from Users where uname=?";

		return (Integer) session.createQuery(hql).setParameter(0, name)
				.uniqueResult();
	}

}
