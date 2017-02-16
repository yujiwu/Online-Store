package com.pokemon.service;

import com.pokemon.dao.ItemDao;
import com.pokemon.dao.OrderDao;
import com.pokemon.dao.UserDao;

public class BaseService {

		protected UserDao userDao;
		protected ItemDao itemDao;
		protected OrderDao orderDao;
		
		public void setUserDao(UserDao userDao) {
			this.userDao = userDao;
		}
		
		public void setItemDao(ItemDao itemDao) {
			this.itemDao = itemDao;
		}
		
		public void setOrderDao(OrderDao orderDao) {
			this.orderDao = orderDao;
		}
}
