package com.calbook.web.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.calbook.web.dao.FriendsDAO;
import com.calbook.web.util.CookieManager;
import com.calbook.web.vo.Members;
import com.google.gson.Gson;

@Controller
@RequestMapping("/social/*")
public class SocialController {
	
	@Autowired
	private SqlSession ss;
	
	
	/* 模备 其捞瘤 阂矾坷扁	 */
	@RequestMapping(value={"social.do"}, method=RequestMethod.GET)
	public String social(HttpServletRequest request, Model model) {
		
		/*Cookie[] coos = request.getCookies();
		String ckNewFriend = CookieManager.getCookie(coos, "searchNewFriends");*/
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		System.out.println("session email = "+email);
		FriendsDAO fdao = ss.getMapper(FriendsDAO.class);
		List<Members> friends = fdao.getFriends(email);
		
		System.out.println("friends.size() = "+friends.size());
		for(int i=0; i<friends.size(); i++) {
			System.out.println(friends.get(i).getNick());
		}
		
		model.addAttribute("friends", friends);
		/*model.addAttribute("ckNewFriend", ckNewFriend);*/
		
		return "social.jsp";
	}
	
	/* 模备 八祸 ajax */
	@RequestMapping(value={"searchFriends.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String searchFriends(String searchSelect, String search, String searchNewFriends,HttpServletRequest request,  HttpServletResponse response) {
		System.out.println("=====searchFriends======");
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		System.out.println("session email = "+email);
		
		FriendsDAO fdao = ss.getMapper(FriendsDAO.class);
		
		if(searchNewFriends.equals("false")) {
			System.out.println("模备吝 八祸");
			/*Cookie ckNewFriend = new Cookie("searchNewFriends", searchNewFriends);
			ckNewFriend.setMaxAge(0);
			response.addCookie(ckNewFriend);*/
			
			List<Members> friends = fdao.getSearchMyFriends(email, searchSelect, search);
			
			Gson gson = new Gson();
			String friendsJson = gson.toJson(friends);
			System.out.println(friendsJson);
			
			return friendsJson;
		}else {
			System.out.println("货肺款 模备 吝 八祸");
			/*Cookie ckNewFriend = new Cookie("searchNewFriends", searchNewFriends);
			ckNewFriend.setMaxAge(60*60*24*30);
			response.addCookie(ckNewFriend);*/
			
			Members friend = fdao.getSearchNewFriends(searchSelect, search);
			
			Gson gson = new Gson();
			String friendsJson = gson.toJson(friend);
			System.out.println(friendsJson);
			return friendsJson;
		}
	}
	
	/* 郴模备 昏力 ajax */
	@RequestMapping(value={"delFriendProc.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String delFriendProc(String f_email, HttpServletRequest request,  HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		System.out.println("session email = "+email);
		
		FriendsDAO fdao = ss.getMapper(FriendsDAO.class);
		int af = fdao.delFriend(email, f_email);
		
		if(af==1) {
			System.out.println("模备昏力 己傍");
			List<Members> friends = fdao.getFriends(email);
			Gson gson = new Gson();
			String friendsJson = gson.toJson(friends);
			
			return friendsJson;
		}else {
			System.out.println("模备昏力 角菩");
			List<Members> friends = fdao.getFriends(email);
			Gson gson = new Gson();
			String friendsJson = gson.toJson(friends);
			
			return null;
		}
	}
	
	@RequestMapping(value={"individual_page.do"}, method=RequestMethod.GET)
	public String individual_page() {
		return "individual_page.jsp";
	}
	
	
}
