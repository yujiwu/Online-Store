package com.pokemon.service;

import java.util.List;

import com.pokemon.pojo.User;

public class RegisterService extends BaseService{
	public List<User> findByUser(String username){
		String hql = "From User where username = ?";
		return userDao.getUserCount(hql, username);
	}
	
	public List<User> findByEmail(String email){
		String hql = "From User where email = ?";
		return userDao.getUserCount(hql, email);
	}
	
	public void save(User user){
		userDao.save(user);
	}
}
