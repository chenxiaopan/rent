package com.cxp.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cxp.util.HibernateUtil;

/**
 * 过滤器
 * 
 * @author Administrator
 * 
 */
public class OpenSessionFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		Session session = null;
		Transaction tx = null;

		try {
			// 获得会话
			session = HibernateUtil.currentSession();

			// 事务额对象
			tx = session.beginTransaction();

			// 处理下一个//////////////
			chain.doFilter(request, response);
            ///////////////////

			// 事务提交
			tx.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			if (tx != null) {
				tx.rollback();
			}

		} finally {
			HibernateUtil.closeSession(); // 关闭会话
		}

	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

}
