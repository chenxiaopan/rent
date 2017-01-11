package com.cxp.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * District entity. @author MyEclipse Persistence Tools
 */

public class District implements java.io.Serializable {

	// Fields

	private Short id;
	private String name;
	private Set<Street> streets = new HashSet<Street>();

	// Constructors

	/** default constructor */
	public District() {
	}

	/** minimal constructor */
	public District(String name) {
		this.name = name;
	}

	/** full constructor */
	public District(String name, Set streets) {
		this.name = name;
		this.streets = streets;
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

	public Set<Street> getStreets() {
		return this.streets;
	}

	public void setStreets(Set<Street> streets) {
		this.streets = streets;
	}

}