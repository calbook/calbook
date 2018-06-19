package com.calbook.web.controllers;

import java.io.IOException;
import java.util.List;

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

import com.calbook.web.dao.CommunityDAO;
import com.calbook.web.dao.FriendsDAO;
import com.calbook.web.dao.Group_MembersDAO;
import com.calbook.web.dao.GroupsDAO;
import com.calbook.web.dao.MembersDAO;
import com.calbook.web.dao.SchedulesDAO;
import com.calbook.web.util.ChangeURL;
import com.calbook.web.vo.Community;
import com.calbook.web.vo.Groups;
import com.calbook.web.vo.Members;
import com.calbook.web.vo.Schedules;
import com.calbook.web.vo.TmpMember;
import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
@RequestMapping("/social/*")
public class SocialController {
   
   @Autowired
   private SqlSession ss;
   
   
   /* social.do */
	@RequestMapping(value={"social.do"}, method=RequestMethod.GET)
	public String social(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		FriendsDAO fdao = ss.getMapper(FriendsDAO.class);
		List<Members> friends = fdao.getFriends(email);
		
		List<Members> acceptedFriends = fdao.getAcceptedFriends(email);
		
		GroupsDAO gdao = ss.getMapper(GroupsDAO.class);
		List<Groups> groups = gdao.getGroupList(email);
		
		Group_MembersDAO gmdao = ss.getMapper(Group_MembersDAO.class);
		List<TmpMember> groupMembers = gmdao.getGroupsMemberList(email); 
		
		
		model.addAttribute("friends", friends);
		model.addAttribute("acceptedFriends", acceptedFriends);
		model.addAttribute("groups", groups);
		model.addAttribute("groupMembers", groupMembers);
		
		return "social.jsp";
	}
   
	/* searchFriends ajax */
	@RequestMapping(value={"searchFriends.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String searchFriends(String searchSelect, String search, String searchNewFriends,HttpServletRequest request,  HttpServletResponse response) {
		System.out.println("=====searchFriends======");
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
//		System.out.println("session email = "+email);
		
		FriendsDAO fdao = ss.getMapper(FriendsDAO.class);
		
		if(searchNewFriends.equals("false")) {
			System.out.println("friends");
			
			List<Members> friends = fdao.getSearchMyFriends(email, searchSelect, search);
			
			Gson gson = new Gson();
			String friendsJson = gson.toJson(friends);
			System.out.println(friendsJson);
			
			return friendsJson;
		}else {
			System.out.println("all members");
			
			TmpMember friend = fdao.getSearchNewFriends(searchSelect, search);
			List<TmpMember> friends = fdao.getSearchNewFriendsR(email);
			
			System.out.println(friends.size());
			if(friend != null) {
				if(friends.size()==0) {
					if(friend.getEmail().equals(email)) {
						friend.setRelation(2); //2 : me
					}else {
						friend.setRelation(3); //3 : friend x
					}
				}else {
					for(int i=0; i<friends.size(); i++) {
						System.out.println(friends.get(i).getNick()+"="+friends.get(i).getRelation());
						
						if(friends.get(i).getEmail().equals(friend.getEmail())) {
							friend.setRelation(friends.get(i).getRelation()); //0 : not yet friend, 1 : friend
							break;
						}else if(i==friends.size()-1) {
							if(friend.getEmail().equals(email)) {
								friend.setRelation(2); //2 : me
							}else {
								friend.setRelation(3); //3 : friend x
							}
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
	
	/* delFriendProc ajax */
	@RequestMapping(value={"delFriendProc.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String delFriendProc(String f_email, String searchSelect, String search, String searchNewFriends, HttpServletRequest request,  HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
//		System.out.println("session email = "+email);
		
		FriendsDAO fdao = ss.getMapper(FriendsDAO.class);
		int af = fdao.delFriend(email, f_email);
		
		if(af==1) {
			System.out.println("친占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙");
			if(searchNewFriends.equals("true")) {
				TmpMember friend = fdao.getSearchNewFriends(searchSelect, search);
				List<TmpMember> friends = fdao.getSearchNewFriendsR(email);
				
				
				if(friend != null) {
					for(int i=0; i<friends.size(); i++) {
						System.out.println(friends.get(i).getNick()+"="+friends.get(i).getRelation());
						
						if(friends.get(i).getEmail().equals(friend.getEmail())) {
							friend.setRelation(friends.get(i).getRelation()); //0 : 친占쏙옙占쏙옙청占쏙옙占쏙옙, 1 : 친占쏙옙
							break;
						}else if(i==friends.size()-1) {
							if(friend.getEmail().equals(email)) {
								friend.setRelation(2); //2 : 占쌘쏙옙
							}else {
								friend.setRelation(3); //3 : 친占쏙옙x
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
			System.out.println("친占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙");
			List<Members> friends = fdao.getFriends(email);
			Gson gson = new Gson();
			String friendsJson = gson.toJson(friends);
			
			return friendsJson;
		}
	}
	
	/* 移쒓뎄�떊泥� ajax */
	@RequestMapping(value={"AddFriendProc.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String AddFriendProc(String f_email, String searchSelect, String search, HttpServletRequest request,  HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
//		System.out.println("session email = "+email);
		
		FriendsDAO fdao = ss.getMapper(FriendsDAO.class);
		int af = fdao.addFriend(email, f_email);
		
		if(af==1) {
			System.out.println("친占쏙옙占쏙옙청 占쏙옙占쏙옙");
			
			TmpMember friend = fdao.getSearchNewFriends(searchSelect, search);
			List<TmpMember> friends = fdao.getSearchNewFriendsR(email);
			
			
			if(friend != null) {
				for(int i=0; i<friends.size(); i++) {
//					System.out.println(friends.get(i).getNick()+"="+friends.get(i).getRelation());
					
					if(friends.get(i).getEmail().equals(friend.getEmail())) {
						friend.setRelation(friends.get(i).getRelation()); //0 : 친占쏙옙占쏙옙청占쏙옙占쏙옙, 1 : 친占쏙옙
						break;
					}else if(i==friends.size()-1) {
						if(friend.getEmail().equals(email)) {
							friend.setRelation(2); //2 : 占쌘쏙옙
						}else {
							friend.setRelation(3); //3 : 친占쏙옙x
						}
					}
					
				}
			}
				
			Gson gson = new Gson();
			String friendsJson = gson.toJson(friend);
			System.out.println(friendsJson);
			return friendsJson;
		}else {
			System.out.println("친占쏙옙占쏙옙청 占쏙옙占쏙옙");
			
			
			return null;
		}
	}
	
	/* 移쒓뎄�떊泥�痍⑥냼 ajax */
	@RequestMapping(value={"CancelFriendProc.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String CancelFriendProc(String f_email, String searchSelect, String search, HttpServletRequest request,  HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
//		System.out.println("session email = "+email);
		
		FriendsDAO fdao = ss.getMapper(FriendsDAO.class);
		int af = fdao.delFriend(email, f_email);
		
		if(af==1) {
			System.out.println("친占쏙옙占쏙옙청占쏙옙占� 占쏙옙占쏙옙");
			
			TmpMember friend = fdao.getSearchNewFriends(searchSelect, search);
			List<TmpMember> friends = fdao.getSearchNewFriendsR(email);
			
			
			if(friend != null) {
				for(int i=0; i<friends.size(); i++) {
//					System.out.println(friends.get(i).getNick()+"="+friends.get(i).getRelation());
					
					if(friends.get(i).getEmail().equals(friend.getEmail())) {
						friend.setRelation(friends.get(i).getRelation()); //0 : 친占쏙옙占쏙옙청占쏙옙占쏙옙, 1 : 친占쏙옙
						break;
					}else if(i==friends.size()-1) {
						if(friend.getEmail().equals(email)) {
							friend.setRelation(2); //2 : 占쌘쏙옙
						}else {
							friend.setRelation(3); //3 : 친占쏙옙x
						}
					}
					
				}
			}
				
			Gson gson = new Gson();
			String friendsJson = gson.toJson(friend);
			System.out.println(friendsJson);
			return friendsJson;
		}else {
			System.out.println("친占쏙옙占쏙옙청占쏙옙占� 占쏙옙占쏙옙");
			
			
			return null;
		}
	}
	
	/* getAcceptedFriends ajax */
	@RequestMapping(value={"getAcceptedFriends.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String getAcceptFriends(HttpServletRequest request,  HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
//		System.out.println("session email = "+email);
		
		FriendsDAO fdao = ss.getMapper(FriendsDAO.class);
		
		List<Members> friends = fdao.getAcceptedFriends(email);
		
		Gson gson = new Gson();
		String friendsJson = gson.toJson(friends);
		System.out.println(friendsJson);
		
		return friendsJson;
	}
	
	/* getApplyFriends ajax */
	@RequestMapping(value={"getApplyFriends.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String getApplyFriends(HttpServletRequest request,  HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
//		System.out.println("session email = "+email);
		
		FriendsDAO fdao = ss.getMapper(FriendsDAO.class);
		
		List<Members> friends = fdao.getApplyFriends(email);
		
		Gson gson = new Gson();
		String friendsJson = gson.toJson(friends);
		System.out.println(friendsJson);
		
		return friendsJson;
	}
	
	/*getAcceptedGroups ajax*/
	@RequestMapping(value={"getAcceptedGroups.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String getAcceptedGroups(HttpServletRequest request,  HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
//		System.out.println("session email = "+email);
		
		GroupsDAO gdao = ss.getMapper(GroupsDAO.class);
		
		List<Groups> groups = gdao.getAcceptedGroups(email);
		
		Gson gson = new Gson();
		String groupsJson = gson.toJson(groups);
		System.out.println(groupsJson);
		
		return groupsJson;
	}
	
	
	/* ModalCancelFriendProc ajax */
	@RequestMapping(value={"ModalCancelFriendProc.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String ModalCancelFriendProc(String f_email, String searchSelect, String search, HttpServletRequest request,  HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
//		System.out.println("session email = "+email);
		
		FriendsDAO fdao = ss.getMapper(FriendsDAO.class);
		int af = fdao.delFriend(email, f_email);
		
		if(af==1) {
			System.out.println("移쒓뎄�떊泥� 痍⑥냼 �꽦怨�");
			
			List<Members> friends = fdao.getApplyFriends(email);
				
			Gson gson = new Gson();
			String friendsJson = gson.toJson(friends);
			System.out.println(friendsJson);
			return friendsJson;
		}else {
			System.out.println("移쒓뎄�떊泥� 痍⑥냼 �떎�뙣");
			
			List<Members> friends = fdao.getApplyFriends(email);
			
			Gson gson = new Gson();
			String friendsJson = gson.toJson(friends);
			System.out.println(friendsJson);
			
			return null;
		}
	}
	
	/* ModalAcceptFriendProc ajax */
	@RequestMapping(value={"ModalAcceptFriendProc.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String ModalAcceptFriendProc(String f_email, HttpServletRequest request,  HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
//		System.out.println("session email = "+email);
		
		FriendsDAO fdao = ss.getMapper(FriendsDAO.class);
		int af = fdao.acceptFriend(email, f_email);
		
		if(af==1) {
			System.out.println("移쒓뎄�떊泥� �닔�씫 �꽦怨�");
			
			List<Members> friends = fdao.getAcceptedFriends(email);
			
			Gson gson = new Gson();
			String friendsJson = gson.toJson(friends);
			System.out.println(friendsJson);
			
			return friendsJson;
		}else {
			System.out.println("移쒓뎄�떊泥� �닔�씫 �떎�뙣");
			
			List<Members> friends = fdao.getAcceptedFriends(email);
			
			Gson gson = new Gson();
			String friendsJson = gson.toJson(friends);
			System.out.println(friendsJson);
			
			return friendsJson;
		}
	}
	
	/* ModalRefuseFriendProc ajax */
	@RequestMapping(value={"ModalRefuseFriendProc.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String ModalRefuseFriendProc(String f_email, HttpServletRequest request,  HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
//		System.out.println("session email = "+email);
		
		FriendsDAO fdao = ss.getMapper(FriendsDAO.class);
		int af = fdao.delFriend(email, f_email);
		
		if(af==1) {
			System.out.println("移쒓뎄�떊泥� 嫄곗젅 �꽦怨�");
			
			List<Members> friends = fdao.getAcceptedFriends(email);
			
			Gson gson = new Gson();
			String friendsJson = gson.toJson(friends);
			System.out.println(friendsJson);
			
			return friendsJson;
		}else {
			System.out.println("移쒓뎄�떊泥� 嫄곗젅 �떎�뙣");
			
			List<Members> friends = fdao.getAcceptedFriends(email);
			
			Gson gson = new Gson();
			String friendsJson = gson.toJson(friends);
			System.out.println(friendsJson);
			
			return friendsJson;
		}
	}
	
	/* ModalAcceptGroupProc ajax */
	@RequestMapping(value={"ModalAcceptGroupProc.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String ModalAcceptGroupProc(String g_num, HttpServletRequest request,  HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
//		System.out.println("session email = "+email);
		
		int ig_num = Integer.parseInt(g_num);
		Group_MembersDAO gmdao = ss.getMapper(Group_MembersDAO.class);
		int af = gmdao.updateAcceptGroup(email, ig_num);
		
		if(af==1) {
			System.out.println("모임가입 성공");
			
			GroupsDAO gdao = ss.getMapper(GroupsDAO.class);
			List<Groups> groups = gdao.getAcceptedGroups(email);
			
			Gson gson = new Gson();
			String groupsJson = gson.toJson(groups);
			System.out.println(groupsJson);
			
			return groupsJson;
		}else {
			System.out.println("모임가입 실패");
			
			GroupsDAO gdao = ss.getMapper(GroupsDAO.class);
			List<Groups> groups = gdao.getAcceptedGroups(email);
			
			Gson gson = new Gson();
			String groupsJson = gson.toJson(groups);
			System.out.println(groupsJson);
			
			return groupsJson;
		}
	}
	
	/* ModalRefuseGroupProc ajax */
	@RequestMapping(value={"ModalRefuseGroupProc.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String ModalRefuseGroupProc(String g_num, HttpServletRequest request,  HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
//		System.out.println("session email = "+email);
		
		int ig_num = Integer.parseInt(g_num);
		Group_MembersDAO gmdao = ss.getMapper(Group_MembersDAO.class);
		int af = gmdao.deleteRefuseGroup(email, ig_num);
		
		if(af==1) {
			System.out.println("모임가입거절 성공");
			
			GroupsDAO gdao = ss.getMapper(GroupsDAO.class);
			List<Groups> groups = gdao.getAcceptedGroups(email);
			
			Gson gson = new Gson();
			String groupsJson = gson.toJson(groups);
			System.out.println(groupsJson);
			
			return groupsJson;
		}else {
			System.out.println("모임가입거절 실패");
			
			GroupsDAO gdao = ss.getMapper(GroupsDAO.class);
			List<Groups> groups = gdao.getAcceptedGroups(email);
			
			Gson gson = new Gson();
			String groupsJson = gson.toJson(groups);
			System.out.println(groupsJson);
			
			return groupsJson;
		}
	}
	
	
	/* SignOutGroupProc ajax */
	@RequestMapping(value={"SignOutGroupProc.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String SignOutGroupProc(String g_num, HttpServletRequest request,  HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
//		System.out.println("session email = "+email);
		
		int ig_num = Integer.parseInt(g_num);
		Group_MembersDAO gmdao = ss.getMapper(Group_MembersDAO.class);
		int af = gmdao.signOutGroup(email, ig_num);
		
		if(af==1) {
			System.out.println("모임탈퇴 성공");
			
			GroupsDAO gdao = ss.getMapper(GroupsDAO.class);
			List<Groups> groups = gdao.getGroupList(email);
			Gson gson = new Gson();
			String groupsJson = gson.toJson(groups);
			System.out.println(groupsJson);
			
			return groupsJson;
		}else {
			System.out.println("모임탈퇴 실패");
			
			GroupsDAO gdao = ss.getMapper(GroupsDAO.class);
			List<Groups> groups = gdao.getGroupList(email);
			Gson gson = new Gson();
			String groupsJson = gson.toJson(groups);
			System.out.println(groupsJson);
			return groupsJson;
		}
	}
	
	/* SignOutGroupProc ajax */
	@RequestMapping(value={"RemoveGroupProc.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String RemoveGroupProc(String g_num, HttpServletRequest request,  HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
//		System.out.println("session email = "+email);
		
		int ig_num = Integer.parseInt(g_num);
		Group_MembersDAO gmdao = ss.getMapper(Group_MembersDAO.class);
		int af = gmdao.signOutGroupMembers1(ig_num);
		af += gmdao.signOutGroupMembers2(ig_num);
		GroupsDAO gdao = ss.getMapper(GroupsDAO.class);
		af += gdao.removeGroup(ig_num);
		if(af>=1) {
			System.out.println("success remove group");
			
			List<Groups> groups = gdao.getGroupList(email);
			Gson gson = new Gson();
			String groupsJson = gson.toJson(groups);
			System.out.println(groupsJson);
			
			return groupsJson;
		}else {
			System.out.println("fail to remove group");
			
			List<Groups> groups = gdao.getGroupList(email);
			Gson gson = new Gson();
			String groupsJson = gson.toJson(groups);
			System.out.println(groupsJson);
			return groupsJson;
		}
	}
	
	@RequestMapping(value={"getGroupMembers.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String getGroupMembers(HttpServletRequest request,  HttpServletResponse response) {
		System.out.println("getGroupMembers.do");
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");

		Group_MembersDAO gmdao = ss.getMapper(Group_MembersDAO.class);
		List<TmpMember> groupMembers = gmdao.getGroupsMemberList(email); 


		Gson gson = new Gson();
		String groupMembersJson = gson.toJson(groupMembers);
		System.out.println(groupMembersJson);
		return groupMembersJson;

	}
	
   // add group
	@RequestMapping(value={"createGroup.do"}, method=RequestMethod.POST)
	public String createGroup(HttpServletRequest request,  HttpServletResponse response, Groups g , Model model) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
//		System.out.println("session email = "+email);
		
		GroupsDAO gdao = ss.getMapper(GroupsDAO.class);
		int num = gdao.getMaxGroupNum();
		
		g.setNum(num+1);
		g.setOwner(email);
		
		
		//g.setNum(g.getNum()+1);
		
		int af = gdao.addGroup(g);
		
		/*FriendsDAO fdao = ss.getMapper(FriendsDAO.class);
		int af = fdao.addFriend(email, f_email);*/
		
		if(af==1) {
			System.out.println("그룹생성 성공");
			Group_MembersDAO gmdao = ss.getMapper(Group_MembersDAO.class);
			int af2 = gmdao.addGroupMember(g.getNum(), email, 2);
			
			if(af2 == 1) {
				System.out.println("그룹생성후 오너 멤버 등록 성공");
				List<TmpMember> friends = gmdao.getGroupFriendsList(email, g.getNum()); 
				model.addAttribute("g",g);
				model.addAttribute("friends",friends);
				return "createNewGroup.jsp" ;
			}else {
				System.out.println("그룹생성 성공후 오너 멤버 등록 실패");
				int af3 = gdao.deleteGroup(g.getNum());
				return "social.do";
			}
		}else {
			System.out.println("그룹생성 실패");
			return "social.do";
		}
	}
	
	//그룹생성중 멤버추가 ajax
	@RequestMapping(value={"addGroupMember.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String addGroupMember(String f_email, String g_num, HttpServletRequest request,  HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
//		System.out.println("session email = "+email);
//		System.out.println("g_num="+g_num);
		int ig_num = Integer.parseInt(g_num);
		
		System.out.println("ig_num = "+ig_num);
		
		Group_MembersDAO gmdao = ss.getMapper(Group_MembersDAO.class);
		
		int af = gmdao.addGroupMember(ig_num, f_email, 0);
		
		if(af==1) {
			System.out.println("멤버 추가 성공");
			
			List<TmpMember> friends = gmdao.getGroupFriendsList(email, ig_num);
			Gson gson = new Gson();
			String friendsJson = gson.toJson(friends);
			System.out.println(friendsJson);
			
			return friendsJson;
		}else {
			System.out.println("멤버추가 실패");
			
			List<TmpMember> friends = gmdao.getGroupFriendsList(email, ig_num);
			Gson gson = new Gson();
			String friendsJson = gson.toJson(friends);
			System.out.println(friendsJson);
			
			return friendsJson;
		}
	}
	
	//그룹생성중 멤버추가 취소 ajax
	@RequestMapping(value={"cancelGroupMember.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String cancelGroupMember(String f_email, String g_num, HttpServletRequest request,  HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		System.out.println("session email = "+email);
		System.out.println("g_num="+g_num);
		int ig_num = Integer.parseInt(g_num);
		
		System.out.println("ig_num = "+ig_num);
		
		Group_MembersDAO gmdao = ss.getMapper(Group_MembersDAO.class);
		
		int af = gmdao.cancelGroupMember(ig_num, f_email);
		
		if(af==1) {
			System.out.println("멤버 추가 취소 성공");
			
			List<TmpMember> friends = gmdao.getGroupFriendsList(email, ig_num);
			Gson gson = new Gson();
			String friendsJson = gson.toJson(friends);
			System.out.println(friendsJson);
			
			return friendsJson;
		}else {
			System.out.println("멤버추가 취소 실패");
			
			List<TmpMember> friends = gmdao.getGroupFriendsList(email, ig_num);
			Gson gson = new Gson();
			String friendsJson = gson.toJson(friends);
			System.out.println(friendsJson);
			
			return friendsJson;
		}
	}
	
	
	// 그룹생성 완료
	@RequestMapping(value={"createGroupFinishProc.do"}, method=RequestMethod.GET)
	public String createGroupFinishProc(String g_num, HttpServletRequest request,  HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		System.out.println("session email = "+email);
		
		Group_MembersDAO gmdao = ss.getMapper(Group_MembersDAO.class);
		int ig_num = Integer.parseInt(g_num);
		int af = gmdao.updateMembersStatusAccept(ig_num);
		
		if(af != 0) {
			System.out.println("그룹생성완료 성공");
			return "redirect:social.do" ;
		}else {
			System.out.println("그룹생성완료 실패");
			return "redirect:social.do";
		}
	}
	
	// 그룹 친구 추가 취소
	@RequestMapping(value={"createGroupCancelProc.do"}, method=RequestMethod.GET)
	public String createGroupCancelProc(String g_num, HttpServletRequest request,  HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		System.out.println("session email = "+email);
		
		Group_MembersDAO gmdao = ss.getMapper(Group_MembersDAO.class);
		int ig_num = Integer.parseInt(g_num);
		int af = gmdao.addFriendsCancel(ig_num);
		
		if(af != 0) {
			System.out.println("그룹 친구추가 취소 성공");
			return "redirect:social.do" ;
		}else {
			System.out.println("그룹 친구추가 취소 실패");
			return "redirect:social.do";
		}
	}
	
	// 그룹생성중 멤버추가중  검색 친구리스트 불러오기  ajax
	@RequestMapping(value={"getSearchGroupFriends.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String getSearchGroupFriends(String g_num, String searchSelect, String search, HttpServletRequest request,  HttpServletResponse response) {
		System.out.println("=====getSearchGroupFriends======");
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		System.out.println("session email = "+email);
		
		Group_MembersDAO gmdao = ss.getMapper(Group_MembersDAO.class);
		int ig_num = Integer.parseInt(g_num);
		
		List<TmpMember> friends = gmdao.getSearchGroupFriendsList(email, ig_num, searchSelect, search);
		
		Gson gson = new Gson();
		String friendsJson = gson.toJson(friends);
		System.out.println(friendsJson);
		
		return friendsJson;
		
	}
	
	// 그룹 수정페이지
	@RequestMapping(value={"editGroups.do"}, method=RequestMethod.GET)
	public String editGroups(String g_num, HttpServletRequest request,  HttpServletResponse response, Model model) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		System.out.println("session email = "+email);
		
		GroupsDAO gdao = ss.getMapper(GroupsDAO.class);
		int ig_num = Integer.parseInt(g_num);
		Groups group = gdao.getGroup(ig_num);
		
		Group_MembersDAO gmdao = ss.getMapper(Group_MembersDAO.class);
		List<TmpMember> friends = gmdao.getGroupFriendsList(email, ig_num);
		List<Members> groupMembers = gmdao.getGroupMemberList(ig_num); 
		
		for(int i=0; i<friends.size(); i++) {
			System.out.println(friends.get(i).getNick()+":"+friends.get(i).getStatus_accept());
		}
		
		
		model.addAttribute("g",group);
		model.addAttribute("friends", friends);
		model.addAttribute("groupMembers", groupMembers);
		
		return "editGroups.jsp";
	}
	
	// 그룹 수정페이지
	@RequestMapping(value={"updateGroupsProc.do"}, method=RequestMethod.POST)
	public String updateGroupsProc(String name, String content, String g_num, HttpServletRequest request,  HttpServletResponse response, Model model) {
		
		System.out.println("name: "+name);
		System.out.println("content: "+content);
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		System.out.println("session email = "+email);
		
		GroupsDAO gdao = ss.getMapper(GroupsDAO.class);
		int ig_num = Integer.parseInt(g_num);
		int af = gdao.updateGroup(name, content, ig_num);
		
		if(af == 1) {
			System.out.println("그룹 수정성공");
			Group_MembersDAO gmdao = ss.getMapper(Group_MembersDAO.class);
			int af2 = gmdao.updateMembersStatusAccept(ig_num);
			if(af2 == 1) {
				System.out.println("그룹 멤버 수정 성공");
				return "redirect:social.do";
			}else {
				System.out.println("그룹 멤버수정 실패");
				return "redirect:social.do";
			}
		}else {
			System.out.println("그룹 수정 실패");
			return "redirect:social.do";
		}
	}
	
	@RequestMapping(value={"group_schedule.do"}, method=RequestMethod.GET)
	   public String group_schedule(String g_num, Model model) {
	      int ig_num = Integer.parseInt(g_num);
	      
	      GroupsDAO gdao = ss.getMapper(GroupsDAO.class);
	      Groups group = gdao.getGroup(ig_num);
	      
	      SchedulesDAO sdao = ss.getMapper(SchedulesDAO.class);
	      List<Schedules> gSchedules = sdao.getGroupSchedules(ig_num);
	      
	      model.addAttribute("group", group);
	      model.addAttribute("gSchedules", gSchedules);
	      
	      return "group_schedule.jsp";
	   }
	
	
	@RequestMapping(value={"register.do"}, method=RequestMethod.GET)
	public String register(String g_num, Model model) {
	      int ig_num = Integer.parseInt(g_num);
	      System.out.println("ig_num="+ig_num);
	      GroupsDAO gdao = ss.getMapper(GroupsDAO.class);
	      Groups group = gdao.getGroup(ig_num);
	      model.addAttribute("group", group);
	      return "register.jsp";
	}
	     
	
	@RequestMapping(value={"registerProc.do"}, method=RequestMethod.POST)
	public String registerProc(String title, String start_date, String finish_date, String content, String location, String g_num, String important, HttpServletRequest request){
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		int ig_num = Integer.parseInt(g_num);
		int iImportant = Integer.parseInt(important);
		
		Schedules s = new Schedules();
		s.setTitle(title);
		s.setContent(content);
		s.setStart_date(start_date);
		s.setFinish_date(finish_date);
		s.setLocation(location);
		s.setG_num(ig_num);
		s.setM_email(email);
		s.setImportant(iImportant);
		
		System.out.println("location: "+location);
		System.out.println("title: "+title);
		System.out.println("conetent: "+content);
		System.out.println("start_date: "+start_date);
		System.out.println("finish_date: "+finish_date);
		System.out.println("email: "+email);
		
		SchedulesDAO sdao = ss.getMapper(SchedulesDAO.class);
		int af = sdao.addGroupSchedules(s);
		
		
		if(af ==1){
			System.out.println("그룹 일정 등록 성공");
			return "redirect:group_schedule.do?g_num="+g_num;
		}else{
			System.out.println("그룹 일정 등록 실패");
			return "register.do?g_num="+g_num;
		}
	   }
		
	@RequestMapping(value={"view_GroupSchedule.do"}, method=RequestMethod.GET)
	   public String view_GroupSchedule(String g_num, Model model, String seq) {
	      int ig_num = Integer.parseInt(g_num);
	      int iseq = Integer.parseInt(seq); 
	      
	      GroupsDAO gdao = ss.getMapper(GroupsDAO.class);
	      Groups group = gdao.getGroup(ig_num);
	      
	      SchedulesDAO sdao = ss.getMapper(SchedulesDAO.class);
	      Schedules schedule = sdao.getGroupSchedule(iseq);
	      
	      model.addAttribute("group", group);
	      model.addAttribute("schedule", schedule);
	      
	      return "view_GroupSchedule.jsp";
	   }
	
	@RequestMapping(value={"edit_GroupSchedule.do"}, method=RequestMethod.GET)
	public String edit_GroupSchedule(String g_num, String seq, Model model) {
	      int ig_num = Integer.parseInt(g_num);
	      System.out.println("ig_num="+ig_num);
	      int iseq = Integer.parseInt(seq);
	      
	      GroupsDAO gdao = ss.getMapper(GroupsDAO.class);
	      Groups group = gdao.getGroup(ig_num);
	      
	      SchedulesDAO sdao = ss.getMapper(SchedulesDAO.class);
	      Schedules schedule = sdao.getGroupSchedule(iseq);
	      
	      model.addAttribute("group", group);
	      model.addAttribute("schedule", schedule);
	      
	      return "edit_GroupSchedule.jsp";
	}
	
	@RequestMapping(value={"groupSchedule_editProc.do"}, method=RequestMethod.POST)
	public String groupSchedule_editProc(String title, String start_date, String finish_date, String content, String location, String important, String seq, String g_num) {
	      
		SchedulesDAO sdao = ss.getMapper(SchedulesDAO.class);
		  
		int iImportant = Integer.parseInt(important);
		int iSeq = Integer.parseInt(seq);	
		Schedules s = new Schedules();
		s.setSeq(iSeq);
		s.setTitle(title);
		s.setContent(content);
		s.setStart_date(start_date);
		s.setFinish_date(finish_date);
		s.setLocation(location);
		s.setImportant(iImportant);
	      
		int af = sdao.updateGroupSchedule(s);
	    
		if(af == 1){
			System.out.println("수정성공");
			return "redirect:view_GroupSchedule.do?g_num="+g_num+"&seq="+iSeq;
		}else{
			System.out.println("수정 실패");
			return "redirect:view_GroupSchedule.do?g_num="+g_num+"&seq="+iSeq;
		}
	}
	
	@RequestMapping(value={"deleteGroupScheduleProc.do"}, method=RequestMethod.GET)
	public String deleteGroupScheduleProc(String seq, String g_num) {
	      
		SchedulesDAO sdao = ss.getMapper(SchedulesDAO.class);
		  
		int iSeq = Integer.parseInt(seq);	
		
		int af = sdao.deleteGroupSchedule(iSeq);
	    
		if(af == 1){
			System.out.println("모임일정 삭제 성공");
			return "redirect:group_schedule.do?g_num="+g_num;
		}else{
			System.out.println("모임일정 삭제 실패");
			return "redirect:view_GroupSchedule.do?g_num="+g_num+"&seq="+iSeq;
		}
	}
	
   
   @RequestMapping(value={"individual_page.do"}, method=RequestMethod.GET)
   public String individual_page(String cEmail, String query, String pg, HttpServletRequest request, Model model) {
      CommunityDAO cdao = ss.getMapper(CommunityDAO.class);
      MembersDAO mdao = ss.getMapper(MembersDAO.class);
      Members m = mdao.getMembersEmail(cEmail);
      int count = 0;
      int sPage;
      int fPage;
      int ipg;
      String urlquery;
      
      if(pg == null || pg.equals("null") || pg.equals("")) {
         ipg = 1;
      }else {
         ipg = Integer.parseInt(pg);
      }
      
      if(query == null) {
         query = "";
      }
      urlquery = ChangeURL.getURLFormat(query);
      
      List<Community> cList = cdao.getCommunityList(cEmail, query, ipg);
      count = cdao.getCommunityCount(cEmail, query);
      sPage = ipg - (ipg-1)%5;
      fPage = count/10 + (count%10 == 0? 0:1);
      
      model.addAttribute("member", m);
      model.addAttribute("cEmail", cEmail);
      model.addAttribute("cList", cList);
      model.addAttribute("pg", ipg);
      model.addAttribute("query", query);
      model.addAttribute("urlquery", urlquery);
      model.addAttribute("sPage", sPage);
      model.addAttribute("fPage", fPage);
      return "individual_page.jsp";
   }
   
   
   @RequestMapping(value={"checkMembers.do"}, method=RequestMethod.POST)
   @ResponseBody
   public String checkPhoneMembers(String nick, String phone, HttpServletRequest request) {
      MembersDAO mdao = ss.getMapper(MembersDAO.class);
      HttpSession session = request.getSession();
      String email = (String) session.getAttribute("email");

      Members mPhone = mdao.checkMembersPhone(email, phone);
      Members mNick = mdao.checkMembersNick(email, nick);

      
      if(mNick != null) {
         return "nick_false";
      }else if(mPhone != null) {
         return "phone_false";
      }else {
         return "true";
      }
   }
   
   
   @RequestMapping(value={"updateMembers.do"}, method=RequestMethod.POST)
   @ResponseBody
   public String updateMembers(HttpServletRequest request) {
      MembersDAO mdao = ss.getMapper(MembersDAO.class);
      HttpSession session = request.getSession();
      String email = (String) session.getAttribute("email");
      String path = "/social/upload";
      String realPath = request.getServletContext().getRealPath(path);
      System.out.println("path: " + path);
      System.out.println("realPath: " + realPath);
      
      MultipartRequest mulReq = null;
      try {
         mulReq = new MultipartRequest(request, realPath, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      String nick = mulReq.getParameter("nick");
      String phone = mulReq.getParameter("phone");
      String pwd = mulReq.getParameter("pwd");

      String fileName = mulReq.getFilesystemName("file");
      System.out.println("nick: " + nick);
      System.out.println("fileName: " + fileName);
      Members m = new Members();
      m.setEmail(email);
      m.setNick(nick);
      m.setPhone(phone);
      m.setPwd(pwd);
      
      if(fileName == null) {
    	  Members temp = mdao.getMembersEmail(email);
    	  m.setProfile(temp.getProfile());
      }else {
    	  m.setProfile(fileName);    	  
      }
      
      
      
      int af = mdao.updateMembers(m);
      if(af == 1) {
         return "success";
      }else {
         return "fail";
      }
   }
   
   
   @RequestMapping(value={"diary_detail.do"}, method=RequestMethod.GET)
   public String diary_detil(String cEmail, String pg, String query, String seq, Model model) {
      CommunityDAO cdao = ss.getMapper(CommunityDAO.class);
      MembersDAO mdao = ss.getMapper(MembersDAO.class);
      String urlquery = ChangeURL.getURLFormat(query);
      int iseq = Integer.parseInt(seq);
      
      try {
         cdao.updateHit(iseq);
         Community c = cdao.getCommunity(iseq);
       
         model.addAttribute("com", c);
      }catch (Exception e) {
         System.out.println("다이어리 상세내용 불러오기 실패");
      }
      
      Members m = mdao.getMembersEmail(cEmail);
      model.addAttribute("member", m);
      model.addAttribute("pg", pg);
      model.addAttribute("urlquery", urlquery);
      model.addAttribute("cEmail", cEmail);
      
      return "diary_detail.jsp";
   }
   
   
   @RequestMapping(value={"diary_modi.do"}, method=RequestMethod.GET)
   public String diary_modi(String cEmail, String pg, String query, String seq, Model model) {
      CommunityDAO cdao = ss.getMapper(CommunityDAO.class);
      MembersDAO mdao = ss.getMapper(MembersDAO.class);
      String urlquery = ChangeURL.getURLFormat(query);
      Community c = cdao.getCommunity(Integer.parseInt(seq));
      Members m = mdao.getMembersEmail(c.getWriter());
      
      model.addAttribute("cEmail", cEmail);
      model.addAttribute("pg", pg);
      model.addAttribute("query", query);
      model.addAttribute("urlquery", urlquery);
      model.addAttribute("com", c);
      model.addAttribute("member", m);
      
      return "diary_modi.jsp";
   }
   
   
   @RequestMapping(value={"diary_modi.do"}, method=RequestMethod.POST)
   public String diary_modi(HttpServletRequest request) {
      CommunityDAO cdao = ss.getMapper(CommunityDAO.class);
      String path = "/social/upload";
      String realPath = request.getServletContext().getRealPath(path);
      System.out.println("path: " + path);
      System.out.println("realPath: " + realPath);
      MultipartRequest mulReq = null;
      
      try {
         mulReq = new MultipartRequest(request, realPath, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      String cEmail = mulReq.getParameter("cEmail");
      String pg = mulReq.getParameter("pg");
      String query = mulReq.getParameter("query");
      String urlquery = ChangeURL.getURLFormat(query);
      String seq = mulReq.getParameter("seq");
      String title = mulReq.getParameter("title");
      String content = mulReq.getParameter("content");
      String fileName = mulReq.getFilesystemName("file");
      System.out.println("fileName: " + fileName);
      if(fileName == null) {
         fileName = mulReq.getParameter("url");
      }
      
      Community c = new Community();
      c.setSeq(Integer.parseInt(seq));
      c.setTitle(title);
      c.setContent(content);
      c.setUrl(fileName);
      
      int af = cdao.updateCommunity(c);
      if(af == 1) {
         return "redirect:diary_detail.do?cEmail="+cEmail+"&pg="+pg+"&query="+urlquery+"&seq="+seq;
      }else {
         return "redirect:diary_modi.do?cEmail="+cEmail+"&pg="+pg+"&query="+urlquery+"&seq="+seq;
      }
   }
   
   
   @RequestMapping(value={"diary_add.do"}, method=RequestMethod.GET)
   public String diary_add(String cEmail, String pg, String query, HttpServletRequest request, Model model) {
      MembersDAO mdao = ss.getMapper(MembersDAO.class);
      HttpSession session = request.getSession();
      String email = (String) session.getAttribute("email");
      Members m = mdao.getMembersEmail(email);
      String urlquery = ChangeURL.getURLFormat(query);
      
      model.addAttribute("cEmail", cEmail);
      model.addAttribute("pg", pg);
      model.addAttribute("query", query);
      model.addAttribute("urlquery", urlquery);
      model.addAttribute("member", m);
      
      return "diary_add.jsp";
   }
   
                           
   @RequestMapping(value={"diary_add.do"}, method=RequestMethod.POST)
   public String diary_add(HttpServletRequest request) {
      CommunityDAO cdao = ss.getMapper(CommunityDAO.class);
      HttpSession session = request.getSession();
      String writer = (String) session.getAttribute("email");
      String path = "/social/upload";
      String realPath = request.getServletContext().getRealPath(path);
      System.out.println("path: " + path);
      System.out.println("realPath: " + realPath);
      
      MultipartRequest mulReq = null;
      
      try {
         mulReq = new MultipartRequest(request, realPath, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      String title = mulReq.getParameter("title");
      String content = mulReq.getParameter("content");
      String pg = mulReq.getParameter("pg");
      String query = mulReq.getParameter("query");
      String urlquery = ChangeURL.getURLFormat(query);
      String oriFileName = mulReq.getOriginalFileName("file");
      String fileName = mulReq.getFilesystemName("file");
      System.out.println("oriFileName: " + oriFileName);
      System.out.println("fileName: " + fileName);
      
      Community c = new Community();
      c.setTitle(title);
      c.setContent(content);
      c.setUrl(fileName);
      c.setWriter(writer);
      
      int af = cdao.addCommunity(c);
      
      if(af == 1) {
         return "redirect:individual_page.do?cEmail="+writer+"&pg="+pg+"&query="+urlquery;
      }else {         
         return "redirect:diary_add.do?cEmail="+writer+"&pg="+pg+"&query="+urlquery;
      }
   }
   
   @RequestMapping(value={"diary_del.do"}, method=RequestMethod.GET)
   public String diary_del(String pg, String query, String seq, HttpServletRequest request) {
      CommunityDAO cdao = ss.getMapper(CommunityDAO.class);
      HttpSession session = request.getSession();
      String email = (String) session.getAttribute("email");
      String urlquery = ChangeURL.getURLFormat(query);
      int af = cdao.delCommunity(Integer.parseInt(seq));
      
      if(af == 1) {
         return "redirect:individual_page.do?cEmail="+email+"&pg="+pg+"&query="+urlquery;
      }else {
         return "redirect:diary_detail.do?cEmail="+email+"&pg="+pg+"&query="+urlquery+"&seq="+seq;
      }
   }
   
  
}