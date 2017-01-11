package com.cxp.service;

import com.cxp.entity.Users;


public interface UsersService {
	int add(Users user); // 添加
	int login(Users user); //登录
	int findByName(String name);//根据用户名找到用户id
}
