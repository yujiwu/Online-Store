package com.pokemon.action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.pokemon.pojo.Item;

public class CategoryAction extends BaseAction{

	private static final long serialVersionUID = 1L;

	private String category;
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	@Override
	public String execute() throws Exception {
		List<Item> items = customerService.findItemsByCategory(category);
		Map<String, Object> session = ActionContext.getContext().getSession();
		session.put("categoryItems", items);
		return SUCCESS;
	}
}
