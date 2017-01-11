package com.cxp.dao;

import com.cxp.entity.Users;


public interface UsersDao {
	int add(Users user); // 添加
	int login(Users user); //登录
    int findByName(String name);//根据用户名找到用户id
}
