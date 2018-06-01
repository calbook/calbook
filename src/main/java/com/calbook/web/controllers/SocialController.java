package com.calbook.web.controllers;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/social/*")
public class SocialController {
	
	@Autowired
	private SqlSession ss;
	
	
	@RequestMapping(value={"social.do"}, method=RequestMethod.GET)
	public String social() {
		return "social.jsp";
	}
	
	@RequestMapping(value={"individual_page.do"}, method=RequestMethod.GET)
	public String individual_page() {
		return "individual_page.jsp";
	}
}
