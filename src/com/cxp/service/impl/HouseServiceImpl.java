package com.cxp.service.impl;

import java.util.List;

import com.cxp.dao.HouseDao;
import com.cxp.dao.impl.HouseDaoImpl;
import com.cxp.entity.House;
import com.cxp.service.HouseService;
import com.cxp.util.Page;

public class HouseServiceImpl implements HouseService {
	private HouseDao dao = new HouseDaoImpl();

	@Override
	public int add(House house) {
		return dao.add(house);
	}

	@Override
	public List<House> list(House house,int low,int high) {
		return dao.list(house,low,high);
	}

	@Override
	public House findByTitle(String title) {
		return dao.findByTitle(title);
	}

	@Override
	public List<House> getPageInfo(Page pages) {
		return dao.getPageInfo(pages);
	}

}
