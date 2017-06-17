package com.tmall.model.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tmall.dao.UserDao;
import com.tmall.model.User;
@ContextConfiguration("/beans.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class testmodel {
//	public static SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

//	@Test
//	public void testDatebase() {
//
//		Session session = sessionFactory.getCurrentSession();
//		session.beginTransaction();
//		session.getTransaction().commit();
//	}
	@Autowired
	private UserDao userDao;
	@Test
	public void testAdd() {
		User u = new User();
		u.setUsername("asd");
		u.setPassword("321");
		userDao.addUser(u);
	}
}
