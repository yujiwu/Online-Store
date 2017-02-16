package com.pokemon.action;


import java.io.ByteArrayInputStream;
import java.io.InputStream;

public class RegisterAjax extends BaseAction {

	private static final long serialVersionUID = 1L;

	private InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}
	
	private String param;
	private String type;
	
	public void setParam(String param) {
		this.param = param;
	}
	
	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String execute() throws Exception {
		int number = -1;
		if(type.equalsIgnoreCase("username")){
			number = registerService.findByUser(param).size();
		}else if (type.equalsIgnoreCase("email")){
			number = registerService.findByEmail(param).size();
		}
		if(number == 0){
			inputStream = new ByteArrayInputStream("1".getBytes());	
		}else{
			inputStream = new ByteArrayInputStream("0".getBytes());	
		}
		
		return SUCCESS;
	}
}
