package com.cxp.service.impl;

import java.util.List;

import com.cxp.dao.impl.TypesDaoImpl;
import com.cxp.entity.Types;
import com.cxp.service.TypesService;

public class TypesServiceImpl implements TypesService {
	private TypesDaoImpl dao = new TypesDaoImpl();

	@Override
	public List<Types> typeslist() {
		return dao.list();
	}

}
