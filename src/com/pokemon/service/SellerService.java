package com.pokemon.service;

import com.pokemon.pojo.Item;

public class SellerService extends BaseService{
	
	public void save(Item item){
		itemDao.save(item);
	}
	
	public void addItems(Integer itemId, Integer userId){
		String sql = "insert into user_item values(?, ?)";
		userDao.findBySql(sql, itemId, userId);
	}

	public void deleteByItemId(Integer itemId) {
		String sql = "delete from user_item where item_id = ?";
		userDao.findBySql(sql, itemId);
	}

	public void deleteTheItem(Integer itemId) {
		itemDao.delete(Item.class,itemId);
	}
}
