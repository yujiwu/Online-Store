package com.pokemon.action;

import com.opensymphony.xwork2.ModelDriven;
import com.pokemon.pojo.User;

public class RegisterAction extends BaseAction implements ModelDriven<User>{

	private static final long serialVersionUID = 1L;

	private User user;
	
	@Override
	public User getModel() {
		user = new User();
		return user;
	}

	@Override
	public String execute() throws Exception {
		registerService.save(user);
		return SUCCESS;
	}
}
