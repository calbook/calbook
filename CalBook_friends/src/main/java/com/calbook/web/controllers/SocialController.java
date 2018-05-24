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
import com.calbook.web.vo.TmpMember;
import com.google.gson.Gson;

@Controller
@RequestMapping("/social/*")
public class SocialController {
	
	@Autowired
	private SqlSession ss;
	
	
	/* ģ�� ������ �ҷ�����	 */
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
	
	/* ģ�� �˻� ajax */
	@RequestMapping(value={"searchFriends.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String searchFriends(String searchSelect, String search, String searchNewFriends,HttpServletRequest request,  HttpServletResponse response) {
		System.out.println("=====searchFriends======");
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		System.out.println("session email = "+email);
		
		FriendsDAO fdao = ss.getMapper(FriendsDAO.class);
		
		if(searchNewFriends.equals("false")) {
			System.out.println("ģ���� �˻�");
			
			List<Members> friends = fdao.getSearchMyFriends(email, searchSelect, search);
			
			Gson gson = new Gson();
			String friendsJson = gson.toJson(friends);
			System.out.println(friendsJson);
			
			return friendsJson;
		}else {
			System.out.println("���ο� ģ�� �� �˻�");
			
			TmpMember friend = fdao.getSearchNewFriends(searchSelect, search);
			List<TmpMember> friends = fdao.getSearchNewFriendsR(email);
			
			
			if(friend != null) {
				for(int i=0; i<friends.size(); i++) {
					System.out.println(friends.get(i).getNick()+"="+friends.get(i).getRelation());
					
					if(friends.get(i).getEmail().equals(friend.getEmail())) {
						friend.setRelation(friends.get(i).getRelation()); //0 : ģ����û����, 1 : ģ��
						break;
					}else if(i==friends.size()-1) {
						if(friend.getEmail().equals(email)) {
							friend.setRelation(2); //2 : �ڽ�
						}else {
							friend.setRelation(3); //3 : ģ��x
						}
					}
					
				}
			}
				
			Gson gson = new Gson();
			String friendsJson = gson.toJson(friend);
			System.out.println(friendsJson);
			return friendsJson;
			
		}
	}
	
	/* ��ģ�� ���� ajax */
	@RequestMapping(value={"delFriendProc.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String delFriendProc(String f_email, String searchSelect, String search, String searchNewFriends, HttpServletRequest request,  HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		System.out.println("session email = "+email);
		
		FriendsDAO fdao = ss.getMapper(FriendsDAO.class);
		int af = fdao.delFriend(email, f_email);
		
		if(af==1) {
			System.out.println("ģ������ ����");
			if(searchNewFriends.equals("true")) {
				TmpMember friend = fdao.getSearchNewFriends(searchSelect, search);
				List<TmpMember> friends = fdao.getSearchNewFriendsR(email);
				
				
				if(friend != null) {
					for(int i=0; i<friends.size(); i++) {
						System.out.println(friends.get(i).getNick()+"="+friends.get(i).getRelation());
						
						if(friends.get(i).getEmail().equals(friend.getEmail())) {
							friend.setRelation(friends.get(i).getRelation()); //0 : ģ����û����, 1 : ģ��
							break;
						}else if(i==friends.size()-1) {
							if(friend.getEmail().equals(email)) {
								friend.setRelation(2); //2 : �ڽ�
							}else {
								friend.setRelation(3); //3 : ģ��x
							}
						}
						
					}
				}
					
				Gson gson = new Gson();
				String friendsJson = gson.toJson(friend);
				System.out.println(friendsJson);
				return friendsJson;
			}else {
				List<Members> friends = fdao.getFriends(email);
				Gson gson = new Gson();
				String friendsJson = gson.toJson(friends);
				
				return friendsJson;
			}
		}else {
			System.out.println("ģ������ ����");
			List<Members> friends = fdao.getFriends(email);
			Gson gson = new Gson();
			String friendsJson = gson.toJson(friends);
			
			return friendsJson;
		}
	}
	
	/* ��ģ�� ��û ajax */
	@RequestMapping(value={"AddFriendProc.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String AddFriendProc(String f_email, String searchSelect, String search, HttpServletRequest request,  HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		System.out.println("session email = "+email);
		
		FriendsDAO fdao = ss.getMapper(FriendsDAO.class);
		int af = fdao.addFriend(email, f_email);
		
		if(af==1) {
			System.out.println("ģ����û ����");
			
			TmpMember friend = fdao.getSearchNewFriends(searchSelect, search);
			List<TmpMember> friends = fdao.getSearchNewFriendsR(email);
			
			
			if(friend != null) {
				for(int i=0; i<friends.size(); i++) {
					System.out.println(friends.get(i).getNick()+"="+friends.get(i).getRelation());
					
					if(friends.get(i).getEmail().equals(friend.getEmail())) {
						friend.setRelation(friends.get(i).getRelation()); //0 : ģ����û����, 1 : ģ��
						break;
					}else if(i==friends.size()-1) {
						if(friend.getEmail().equals(email)) {
							friend.setRelation(2); //2 : �ڽ�
						}else {
							friend.setRelation(3); //3 : ģ��x
						}
					}
					
				}
			}
				
			Gson gson = new Gson();
			String friendsJson = gson.toJson(friend);
			System.out.println(friendsJson);
			return friendsJson;
		}else {
			System.out.println("ģ����û ����");
			
			
			return null;
		}
	}
	
	/* ��ģ�� ��û ��� ajax */
	@RequestMapping(value={"CancelFriendProc.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String CancelFriendProc(String f_email, String searchSelect, String search, HttpServletRequest request,  HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		System.out.println("session email = "+email);
		
		FriendsDAO fdao = ss.getMapper(FriendsDAO.class);
		int af = fdao.delFriend(email, f_email);
		
		if(af==1) {
			System.out.println("ģ����û��� ����");
			
			TmpMember friend = fdao.getSearchNewFriends(searchSelect, search);
			List<TmpMember> friends = fdao.getSearchNewFriendsR(email);
			
			
			if(friend != null) {
				for(int i=0; i<friends.size(); i++) {
					System.out.println(friends.get(i).getNick()+"="+friends.get(i).getRelation());
					
					if(friends.get(i).getEmail().equals(friend.getEmail())) {
						friend.setRelation(friends.get(i).getRelation()); //0 : ģ����û����, 1 : ģ��
						break;
					}else if(i==friends.size()-1) {
						if(friend.getEmail().equals(email)) {
							friend.setRelation(2); //2 : �ڽ�
						}else {
							friend.setRelation(3); //3 : ģ��x
						}
					}
					
				}
			}
				
			Gson gson = new Gson();
			String friendsJson = gson.toJson(friend);
			System.out.println(friendsJson);
			return friendsJson;
		}else {
			System.out.println("ģ����û��� ����");
			
			
			return null;
		}
	}
	
	
	
	@RequestMapping(value={"individual_page.do"}, method=RequestMethod.GET)
	public String individual_page() {
		return "individual_page.jsp";
	}
	
	
}
