package com.pokemon.action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.pokemon.pojo.User;

public class LoginAction extends BaseAction{

	private static final long serialVersionUID = 1L;

	private String username;
	private String password;
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Override
	public String execute() throws Exception {
		List<User> users = loginService.findUser(username, password);
		if(users != null && users.size() > 0){
			Map<String,Object> session = ActionContext.getContext().getSession();
			session.put("user", users.get(0));
			session.put("login", "true");
			return SUCCESS;
		}
		else{
			addActionMessage("Username or password is incorrect");
			return "fail";
		}
	}
}
