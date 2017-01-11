package com.cxp.service.impl;

import com.cxp.dao.UsersDao;
import com.cxp.dao.impl.UsersDaoImpl;
import com.cxp.entity.Users;
import com.cxp.service.UsersService;

public class UsersServiceImpl implements UsersService {

	//底层数据
	private UsersDao dao = new UsersDaoImpl();
	
	@Override
	//添加用户
	public int add(Users user) {
		return dao.add(user);
	}

	@Override
	//用户登录
	public int login(Users user) {
		return dao.login(user);
	}

	@Override
	public int findByName(String name) {
	return dao.findByName(name);
	}

}
