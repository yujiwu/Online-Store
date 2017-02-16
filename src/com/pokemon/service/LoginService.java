package com.pokemon.service;

import java.util.List;

import com.pokemon.pojo.User;

public class LoginService extends BaseService{
	
	public List<User> findUser(String username, String password){
		String hql = "From User where username = ? and password = ?";
		return userDao.find(hql, username, password);
	}
}
