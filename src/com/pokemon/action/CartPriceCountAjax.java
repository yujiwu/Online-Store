package com.pokemon.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

public class CartPriceCountAjax extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	private InputStream inputStream;
	
	public InputStream getInputStream() {
		return inputStream;
	}

	private Integer checked;
	private Integer currentPrice;
	private Integer quantity;
	private Integer itemPrice;
	private Integer itemId;
	
	public void setChecked(Integer checked) {
		this.checked = checked;
	}
	
	public void setCurrentPrice(Integer currentPrice) {
		this.currentPrice = currentPrice;
	}
	
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	public void setItemPrice(Integer itemPrice) {
		this.itemPrice = itemPrice;
	}
	
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public String execute() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		List<Integer> paidItemIds;
		if(session.containsKey("paidItemIds")){
			//get the array of itemIds that will be added in an order
			paidItemIds =  (List<Integer>) session.get("paidItemIds");
			session.remove("paidItemIds");
		}else{
			paidItemIds = new ArrayList<Integer>();
		}
		//checked is 1 means checked, 0 means unchecked
		if(checked == 0 && currentPrice > 0){
			currentPrice = currentPrice - quantity*itemPrice;
			paidItemIds.remove(itemId);
		}else if(checked == 1){
			currentPrice = currentPrice + quantity*itemPrice;
			paidItemIds.add(itemId);
		} 
		session.put("paidItemIds", paidItemIds);
		if(session.containsKey("currentPrice")){
			session.remove("currentPrice");
		}
		session.put("currentPrice", currentPrice);
		inputStream = new ByteArrayInputStream(currentPrice.toString().getBytes());	
		return SUCCESS;
	}
}
