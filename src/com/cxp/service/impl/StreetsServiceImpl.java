package com.cxp.service.impl;

import java.util.List;

import com.cxp.dao.impl.StreetsDaoImpl;
import com.cxp.service.StreetsService;
import com.cxp.entity.Street;

public class StreetsServiceImpl implements StreetsService {
	private StreetsDaoImpl dao = new StreetsDaoImpl();

	@Override
	public List<Street> strList(int district_id) {
		return dao.list(district_id);
	}

}
