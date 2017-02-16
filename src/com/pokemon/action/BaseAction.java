package com.pokemon.action;


import com.opensymphony.xwork2.ActionSupport;
import com.pokemon.service.CustomerService;
import com.pokemon.service.LoginService;
import com.pokemon.service.RegisterService;
import com.pokemon.service.SellerService;

public class BaseAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	protected LoginService loginService;
	protected RegisterService registerService;
	protected CustomerService customerService;
	protected SellerService sellerService;

	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}

	public void setRegisterService(RegisterService registerService) {
		this.registerService = registerService;
	}

	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}

	public void setSellerService(SellerService sellerService) {
		this.sellerService = sellerService;
	}

}
