package com.pokemon.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.pokemon.pojo.User;

public class DeleteItemsAjax extends BaseAction{

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
		Map<String, Object> session = ActionContext.getContext().getSession();
		User user = (User) session.get("user");
		if(user.getRole().equalsIgnoreCase("Customer")){
			Integer userId = user.getUserId();
			//delete relationship between customer and item
			customerService.deleteItems(itemId, userId);
			inputStream = new ByteArrayInputStream("success".getBytes());	
		}else{
			Integer userId = user.getUserId();
			//delete relationship between seller and item
			customerService.deleteItems(itemId, userId);
			//delete relationship between customer and the item that is going to be deleted
			sellerService.deleteByItemId(itemId);
			//delete the item
			sellerService.deleteTheItem(itemId);
			inputStream = new ByteArrayInputStream("success".getBytes());	
		}
		return SUCCESS;
	}
}
