package com.pokemon.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.opensymphony.xwork2.ActionContext;
import com.pokemon.pojo.Item;
import com.pokemon.pojo.Order;
import com.pokemon.pojo.User;

public class PayAction extends BaseAction{

	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	@Override
	public String execute() throws Exception {
		//1. get the session 
		Map<String, Object> session = ActionContext.getContext().getSession();
		//2. create an order
		Order order = new Order();
		//3. prepare items & connect order to items
		Set<Item> items = new HashSet<>();
		if(session.containsKey("paidItemIds")){
			List<Integer> paidItemIds = (List<Integer>) session.get("paidItemIds");
			for(Integer i : paidItemIds){
				Item item = customerService.findItemsByItemId(i);
				items.add(item);
				System.out.println(item);
			}
		}else {
			addActionError("No item is selected");
			return "input";
		}
		order.setItems(items);
		//4. create time
		SimpleDateFormat sdf =new SimpleDateFormat("MM-dd-yy");
		order.setDate(sdf.format(new Date()));
		//5. get total price
		order.setTotalPrice(session.get("currentPrice").toString());
		//6. prepare user
		Integer userId = ((User)session.get("user")).getUserId();
		User user = customerService.get(userId);
		order.setUser(user);
		//7. save order
		customerService.save(order);
		//8. delete paid items from shopping cart
		for(Integer itemId : ((List<Integer>) session.get("paidItemIds"))){
			customerService.deleteItems(itemId, userId);
		}
		//9. remove paidItemIds attribute from session
		// this step is to avoid any error when you go to the cart and check out again
		session.remove("paidItemIds");
		return SUCCESS;
	}
}
