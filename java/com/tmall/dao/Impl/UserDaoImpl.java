package com.tmall.dao.Impl;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.engine.query.spi.ReturnMetadata;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.tmall.dao.UserDao;
import com.tmall.model.User;

@Repository("userDao")
public class UserDaoImpl implements UserDao {
	@Resource
	private HibernateTemplate hibernateTemplate;

	@Override
	public void addUser(User u) {
		hibernateTemplate.save(u);
		System.out.println("Add complete!");
	}

	@Override
	public User seachByName(String username) {
		List<User> userList = (List<User>) hibernateTemplate.find("from User u where u.username=?", username);
		// User u = hibernateTemplate.findByNamedParam("from User u where
		// username=:username", "username", username);
		if(userList.isEmpty()){
			return null;
		}
		User user = new User();
		System.out.println(userList.get(0).getUsername()+userList.get(0).getPassword());
		return userList.get(0);
	}
	
	@Override
	public boolean userIsExist(String username){
		List<User> userList = (List<User>) hibernateTemplate.find("from User u where u.username=?",username);
		System.out.println("userdao");
		if(userList != null && userList.size() > 0){
			return true;
		}
		return false;
		
	}
	@Override
	public void deleteById(int id) {
	}

	@Override
	public boolean modifyUser(User u) {
		if(!userIsExist(u.getUsername())) {
			return false;
		}
		hibernateTemplate.update("update User u set u = ?", u);
		return true;
	}
}
