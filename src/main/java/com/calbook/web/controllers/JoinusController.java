package com.calbook.web.controllers;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/joinus/*")
public class JoinusController {
	@Autowired
	private SqlSession ss;
	
	@RequestMapping(value={"selectMenu.do"},method=RequestMethod.GET)
	public String selectMenu() {
		return "selectMenu.jsp";
	}
	
}
