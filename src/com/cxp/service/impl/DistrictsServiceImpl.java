package com.cxp.service.impl;

import java.util.List;

import com.cxp.dao.DistrictsDao;
import com.cxp.dao.impl.DistrictsDaoImpl;
import com.cxp.service.DistrictsService;
import com.cxp.entity.District;

public class DistrictsServiceImpl implements DistrictsService {
  private DistrictsDao dao=new DistrictsDaoImpl();
	@Override
	public List<District> disList() {
	return dao.list();
	}

}
