package com.pokemon.action;

import java.util.Map;
import java.util.Set;

import com.opensymphony.xwork2.ActionContext;
import com.pokemon.pojo.Item;
import com.pokemon.pojo.User;

public class ShoppingCartAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Override
	public String execute() throws Exception {
		Map<String, Object> session= ActionContext.getContext().getSession();
		User user = (User) session.get("user");
		Integer userId = user.getUserId();
		Set<Item> items = customerService.findItemsByUserId(userId);
		session.put("items", items);
		if(user.getRole().equalsIgnoreCase("Customer")){
			return "ShoppingCart";
		}else {
			return "ListItems";
		}
	}
}
