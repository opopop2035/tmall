package com.tmall.action.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.tmall.action.indexAction;

@WebAppConfiguration
@ContextConfiguration("/beans.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class indexActionTest {
	@Autowired
	private indexAction indexAction;
	
	@Test
	public void testindex() throws Exception{
		System.out.println(indexAction.execute());
	}
}
