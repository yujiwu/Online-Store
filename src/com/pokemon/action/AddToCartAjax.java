package com.pokemon.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import com.opensymphony.xwork2.ActionContext;
import com.pokemon.pojo.User;

public class AddToCartAjax extends BaseAction{

	private static final long serialVersionUID = 1L;

	private InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}
	
	private Integer itemId;
	
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}
	
	@Override
	public String execute() throws Exception {
		Integer userId = ((User)ActionContext.getContext()
				.getSession().get("user")).getUserId();
		customerService.addToCart(itemId, userId);
		inputStream = new ByteArrayInputStream("success".getBytes());	
		return SUCCESS;
	}
}
