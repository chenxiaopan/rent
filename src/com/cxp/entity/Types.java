package com.cxp.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Types entity. @author MyEclipse Persistence Tools
 */

public class Types implements java.io.Serializable {

	// Fields

	private Short id;
	private String name;
	private Set<House> houses = new HashSet<House>();

	// Constructors

	/** default constructor */
	public Types() {
	}

	/** minimal constructor */
	public Types(String name) {
		this.name = name;
	}

	/** full constructor */
	public Types(String name, Set<House> houses) {
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