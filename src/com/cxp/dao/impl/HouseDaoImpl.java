package com.cxp.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.cxp.dao.HouseDao;
import com.cxp.entity.House;
import com.cxp.util.HibernateUtil;
import com.cxp.util.Page;

public class HouseDaoImpl implements HouseDao {

	@Override
	public int add(House house) {
		// 1.获得会话
		Session session = HibernateUtil.currentSession();
		session.save(house);
		return 0;
	}

	@Override
	public List<House> list(House house, int low, int high) {
		// 1.获得会话
		Session session = HibernateUtil.currentSession();
		// 2.hql语句------ 模糊查询
		String hql = "from House h where h.title like '%" + house.getTitle()
				+ "%' and h.street.name like '%" + house.getStreet().getName()
				+ "%' and h.types.name like '%" + house.getTypes().getName()
				+ "%' and h.price between ? and ?";
		return session.createQuery(hql)
		// .setString(0,"%"+ house.getStreet().getName()+"%")
		// .setString(1,"%"+ house.getTypes().getName()+"%")
				.setParameter(0, low).setParameter(1, high).list();
	}

	@Override
	public House findByTitle(String title) {
		// 1.获得会话
		Session session = HibernateUtil.currentSession();
		// 2.hql语句
		String hql = "from House where title=?";

		return (House) session.createQuery(hql).setParameter(0, title)
				.uniqueResult();
	}

	/**
	 * 分页显示数据
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<House> getPageInfo(Page page) {

		// 1.会话对象
		Session session = HibernateUtil.currentSession();

		// 2.hql语句
		String hql = "from House";

		// 计算总个数
		int count = session.createQuery(hql).list().size();

		// 计算总页数
		int pageTotal = (count % page.getPageSize() == 0) ? (count / page
				.getPageSize()) : (count / page.getPageSize() + 1);
		// 将总页数设置进分页对象
		page.setTotalPageCount(pageTotal);

		System.out.println(count + "\t" + pageTotal);

		// 获得房屋信息
		List<House> list = session
				.createQuery(hql)
				.setFirstResult((page.getCurrPageNo() - 1) * page.getPageSize())
				.setMaxResults(page.getPageSize()).list();

		return list;

	}

}
