package com.pokemon.pojo;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Item implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer itemId;
	private String itemName;
	private Integer price;
	private String description;
	private String category;
	private String photoLoc;
	private Set<User> users = new HashSet<>();

	public Integer getItemId() {
		return itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPhotoLoc() {
		return photoLoc;
	}

	public void setPhotoLoc(String photoLoc) {
		this.photoLoc = photoLoc;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return "Item [itemId=" + itemId + ", itemName=" + itemName + ", price=" + price + ", description=" + description
				+ ", category=" + category + ", photoLoc=" + photoLoc + "]";
	}

}
