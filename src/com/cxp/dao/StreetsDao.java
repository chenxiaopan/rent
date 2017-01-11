package com.cxp.dao;

import java.util.List;

import com.cxp.entity.Street;


public interface StreetsDao {
 List<Street> list(int district_id);
}
