package com.pokemon.action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.pokemon.pojo.Order;
import com.pokemon.pojo.User;


public class ShoppingHistoryAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Override
	public String execute() throws Exception {
		Map<String, Object> session= ActionContext.getContext().getSession();
		User user = (User) session.get("user");
		List<Order> orders = customerService.findOrdersByUser(user);
		session.put("orders", orders);
		return SUCCESS;
	}
}
