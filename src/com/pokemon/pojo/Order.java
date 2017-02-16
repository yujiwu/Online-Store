package com.pokemon.pojo;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Order implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Integer orderId;
	private String date;
	private String totalPrice;
	private User user;
	private Set<Item> items = new HashSet<>();

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	public String getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Set<Item> getItems() {
		return items;
	}

	public void setItems(Set<Item> items) {
		this.items = items;
	}

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", date=" + date + ", totalPrice=" + totalPrice + ", user=" + user
				+ ", items=" + items + "]";
	}

}