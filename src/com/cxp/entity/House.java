package com.cxp.entity;

import java.util.Date;

import com.sun.org.apache.bcel.internal.generic.NEW;

/**
 * House entity. @author MyEclipse Persistence Tools
 */

public class House implements java.io.Serializable {

	// Fields

	private Integer id;
	private Types types=new Types();
	private Street street=new Street();
	private Integer userId;
	private String title;
	private String description;
	private Integer price;
	private Date pubdate;
	private Integer floorage;
	private String contact;

	// Constructors

	/** default constructor */
	public House() {
	}

	public House(Integer userId, String title, String description, Integer price,
			Date pubdate, Integer floorage, String contact) {
		super();
		this.userId = userId;
		this.title = title;
		this.description = description;
		this.price = price;
		this.pubdate = pubdate;
		this.floorage = floorage;
		this.contact = contact;
	}


	/** full constructor */
	public House(Integer id, Integer userId, String title, String description,
			Integer price, Date pubdate, Integer floorage, String contact) {
		super();
		this.id = id;
		this.userId = userId;
		this.title = title;
		this.description = description;
		this.price = price;
		this.pubdate = pubdate;
		this.floorage = floorage;
		this.contact = contact;
	}
	

	// Property accessors

	public Integer getId() {
		return this.id;
	}


	public void setId(Integer id) {
		this.id = id;
	}

	public Types getTypes() {
		return this.types;
	}

	public void setTypes(Types types) {
		this.types = types;
	}

	public Street getStreet() {
		return this.street;
	}

	public void setStreet(Street street) {
		this.street = street;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getPrice() {
		return this.price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Date getPubdate() {
		return this.pubdate;
	}

	public void setPubdate(Date pubdate) {
		this.pubdate = pubdate;
	}

	public Integer getFloorage() {
		return this.floorage;
	}

	public void setFloorage(Integer floorage) {
		this.floorage = floorage;
	}

	public String getContact() {
		return this.contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

}