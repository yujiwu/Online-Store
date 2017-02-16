package com.pokemon.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

public class SignOutAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Override
	public String execute() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.invalidate();
		return SUCCESS;
	}
}
