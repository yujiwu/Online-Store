package com.pokemon.service;

import java.util.List;
import java.util.Set;

import org.hibernate.Hibernate;

import com.pokemon.pojo.Item;
import com.pokemon.pojo.Order;
import com.pokemon.pojo.User;

public class CustomerService extends BaseService{
	
	public User get(Integer userId){
		return userDao.get(User.class , userId);
	}
	
	public Set<Item> findItemsByUserId(Integer userId){
		//1. bind the user object to a session
		User user = userDao.get(User.class, userId);
		//2. force to initialize the not-initialized attributes (somehow like set lazy='false' at this moment)
		Hibernate.initialize(user.getItems());
		return user.getItems();
	}
	
	public void deleteItems(Integer itemId, Integer userId){
		String sql = "delete from user_item where item_id = ? and user_id = ?";
		userDao.findBySql(sql, itemId, userId);
	}
	
	public List<Order> findOrdersByUser(User user){
		//1. bind the user object to a session
		User persistedUser = userDao.get(User.class, user.getUserId());
		String hql = "from Order where user = ?";
		List<Order> orders = orderDao.find(hql, persistedUser);
		// get items in each order
		for (Order order : orders){
			Hibernate.initialize(order.getItems());
		}
		return orders;
	}

	public void save(Order order) {
		orderDao.save(order);
	}
	
	public Item findItemsByItemId(Integer itemId){
		return itemDao.get(Item.class, itemId);
	}
	
	public List<Item> findItemsByCategory(String category){
		String hql= "From Item where category = ?";
		return itemDao.find(hql, category);
	}
	
	public void addToCart(Integer itemId, Integer userId){
		String sql = "Insert into user_item values(?,?)";
		userDao.findBySql(sql, itemId, userId);
	}
}

