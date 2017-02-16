package com.pokemon.dao;

import java.util.List;

import org.hibernate.Query;

import com.pokemon.pojo.User;

public class UserDao extends BaseDao<User>{
	@SuppressWarnings("unchecked")
	public List<User> getUserCount(String hql, Object...parameters) {
		Query query = getSession().createQuery(hql);
		for(int i=0; i<parameters.length; i++){
			query.setParameter(i, parameters[i]);
		}
		return query.list();
	}
}
