package com.cxp.dao;

import java.util.List;

import com.cxp.entity.House;
import com.cxp.util.Page;

public interface HouseDao {
	int add(House house); // 添加

	List<House> list(House house,int low,int high); // 查询所有需要显示的房屋信息

	House findByTitle(String title); // 根据title查询房屋信息

	List<House> getPageInfo(Page pages);
}
