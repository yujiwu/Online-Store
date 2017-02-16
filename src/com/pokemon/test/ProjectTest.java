package com.pokemon.test;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.pokemon.dao.ItemDao;
import com.pokemon.pojo.Item;

public class ProjectTest {

	@Test
	public void test() {
//		@SuppressWarnings("resource")
//		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext*.xml");
//		SessionFactory sessionFactory = (SessionFactory) ctx.getBean("sessionFactory");
//		Session session = sessionFactory.openSession();
//		System.out.println(session);
//		org.hibernate.Transaction transaction = session.beginTransaction();
//		
//		ItemDao itemDao = (ItemDao) ctx.getBean("itemDao");
//		Item item = new Item();
//		item.setItemName("JQuery");
//		item.setPrice(100);
//		item.setDescription("intro to jquery");
//		item.setCategory("Book");
//		itemDao.save(item);
//		
//		transaction.commit();
//		session.close();
//		sessionFactory.close();
		
		
//		String str = "aa\\bb\\cc\\dd\\dd";
//		System.out.println(str.replaceAll("\\\\", "."));
		
		SimpleDateFormat sdf =new SimpleDateFormat("MM-dd-yy");
		System.out.println(sdf.format(new Date()));
	}

}
