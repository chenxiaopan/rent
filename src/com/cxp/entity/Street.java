package com.cxp.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Street entity. @author MyEclipse Persistence Tools
 */

public class Street implements java.io.Serializable {

	// Fields

	private Short id;
	private District district=new District();
	private String name;
	private Set<House> houses = new HashSet<House>();

	// Constructors

	/** default constructor */
	public Street() {
	}

	/** minimal constructor */
	public Street(String name) {
		this.name = name;
	}

	/** full constructor */
	public Street(District district, String name, Set houses) {
		this.district = district;
		this.name = name;
		this.houses = houses;
	}

	// Property accessors

	public Short getId() {
		return this.id;
	}

	public void setId(Short id) {
		this.id = id;
	}

	public District getDistrict() {
		return this.district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<House> getHouses() {
		return this.houses;
	}

	public void setHouses(Set<House> houses) {
		this.houses = houses;
	}

}