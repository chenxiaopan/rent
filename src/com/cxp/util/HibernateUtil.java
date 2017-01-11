package com.cxp.util;

import org.hibernate.*;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

public final class HibernateUtil {
	// 初始化一个ThreadLocal对象
	private static final ThreadLocal sessionTL = new ThreadLocal();
	private static Configuration configuration;
	private final static SessionFactory sessionFactory;
	static {
		try {
			// 加载配置文件hibernate.cfg.xml
			configuration = new Configuration().configure();
			
			// 获得会话工厂
			// sessionFactory = configuration.buildSessionFactory();

			// 这是Hibernate4.0之后引入的新特性，Service Register机制
			StandardServiceRegistry ssrRegistry = new StandardServiceRegistryBuilder()
					.applySettings(configuration.getProperties()).build();
			sessionFactory = configuration.buildSessionFactory(ssrRegistry);

		} catch (Throwable ex) {
			ex.printStackTrace();
			throw new ExceptionInInitializerError(ex);
		}
	}

	/**
	 * 获取Session
	 */
	public static Session currentSession() {
		// sessionTL的get()方法根据当前线程返回其对应的线程内部变量，
		// 也就是我们需要的Session，多线程情况下共享数据库连接是不安全的。
		// ThreadLocal保证了每个线程都有自己的Session。
		Session session = (Session) sessionTL.get();
		// 如果session为null，则打开一个新的session
		if (session == null) {
			// 创建一个数据库连接对象session。
			session = sessionFactory.openSession();
			// 保存该数据库连接session到ThreadLocal中。
			sessionTL.set(session);
		}
		// 如果当前线程已经访问过数据库了，
		// 则从sessionTL中get()就可以获取该线程上次获取过的数据库连接对象。
		return session;
	}

	/**
	 * 关闭Session
	 */
	@SuppressWarnings("unchecked")
	public static void closeSession() {
		Session session = (Session) sessionTL.get();
		sessionTL.set(null);
		session.close();
	}
}
