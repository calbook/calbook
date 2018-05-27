package com.calbook.web.controllers;

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

import com.calbook.web.dao.FriendsDAO;
import com.calbook.web.dao.Group_MembersDAO;
import com.calbook.web.dao.GroupsDAO;
import com.calbook.web.dao.MembersDAO;
import com.calbook.web.vo.Friends;
import com.calbook.web.vo.Groups;
import com.calbook.web.vo.Members;
import com.calbook.web.vo.TmpMember;
import com.google.gson.Gson;

@Controller
@RequestMapping("/social/*")
public class SocialController {
	
	@Autowired
	private SqlSession ss;
	
	
	/* 紐⑥엫 page 泥ロ솕硫� 遺덈윭�삤湲� */
	@RequestMapping(value={"social.do"}, method=RequestMethod.GET)
	public String social(HttpServletRequest request, Model model) {
		
		/*Cookie[] coos = request.getCookies();
		String ckNewFriend = CookieManager.getCookie(coos, "searchNewFriends");*/
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		System.out.println("session email = "+email);
		FriendsDAO fdao = ss.getMapper(FriendsDAO.class);
		List<Members> friends = fdao.getFriends(email);
		
		GroupsDAO gdao = ss.getMapper(GroupsDAO.class);
		List<Groups> groups = gdao.getGroupList(email);
		
		
		System.out.println("friends.size() = "+friends.size());
		for(int i=0; i<friends.size(); i++) {
			System.out.println(friends.get(i).getNick());
		}
		
		model.addAttribute("friends", friends);
		model.addAttribute("groups", groups);
		/*model.addAttribute("ckNewFriend", ckNewFriend);*/
		
		return "social.jsp";
	}
	
	/* 移쒓뎄寃��깋 ajax */
	@RequestMapping(value={"searchFriends.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String searchFriends(String searchSelect, String search, String searchNewFriends,HttpServletRequest request,  HttpServletResponse response) {
		System.out.println("=====searchFriends======");
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		System.out.println("session email = "+email);
		
		FriendsDAO fdao = ss.getMapper(FriendsDAO.class);
		
		if(searchNewFriends.equals("false")) {
			System.out.println("친占쏙옙占쏙옙 占싯삼옙");
			
			List<Members> friends = fdao.getSearchMyFriends(email, searchSelect, search);
			
			Gson gson = new Gson();
			String friendsJson = gson.toJson(friends);
			System.out.println(friendsJson);
			
			return friendsJson;
		}else {
			System.out.println("占쏙옙占싸울옙 친占쏙옙 占쏙옙 占싯삼옙");
			
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
			
		}
	}
	
	/* 移쒓뎄�궘�젣 ajax */
	@RequestMapping(value={"delFriendProc.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String delFriendProc(String f_email, String searchSelect, String search, String searchNewFriends, HttpServletRequest request,  HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		System.out.println("session email = "+email);
		
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
		System.out.println("session email = "+email);
		
		FriendsDAO fdao = ss.getMapper(FriendsDAO.class);
		int af = fdao.addFriend(email, f_email);
		
		if(af==1) {
			System.out.println("친占쏙옙占쏙옙청 占쏙옙占쏙옙");
			
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
		System.out.println("session email = "+email);
		
		FriendsDAO fdao = ss.getMapper(FriendsDAO.class);
		int af = fdao.delFriend(email, f_email);
		
		if(af==1) {
			System.out.println("친占쏙옙占쏙옙청占쏙옙占� 占쏙옙占쏙옙");
			
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
			System.out.println("친占쏙옙占쏙옙청占쏙옙占� 占쏙옙占쏙옙");
			
			
			return null;
		}
	}
	
	/* 移쒓뎄�떊泥� 諛쏆� 移쒓뎄 由ъ뒪�듃 媛��졇�삤�뒗 ajax */
	@RequestMapping(value={"getAcceptedFriends.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String getAcceptFriends(HttpServletRequest request,  HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		System.out.println("session email = "+email);
		
		FriendsDAO fdao = ss.getMapper(FriendsDAO.class);
		
		List<Members> friends = fdao.getAcceptedFriends(email);
		
		Gson gson = new Gson();
		String friendsJson = gson.toJson(friends);
		System.out.println(friendsJson);
		
		return friendsJson;
	}
	
	/* 移쒓뎄�떊泥� �븳 移쒓뎄 由ъ뒪�듃 媛��졇�삤�뒗 ajax */
	@RequestMapping(value={"getApplyFriends.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String getApplyFriends(HttpServletRequest request,  HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		System.out.println("session email = "+email);
		
		FriendsDAO fdao = ss.getMapper(FriendsDAO.class);
		
		List<Members> friends = fdao.getApplyFriends(email);
		
		Gson gson = new Gson();
		String friendsJson = gson.toJson(friends);
		System.out.println(friendsJson);
		
		return friendsJson;
	}
	
	/* 紐⑤떖 移쒓뎄�떊泥�痍⑥냼 ajax */
	@RequestMapping(value={"ModalCancelFriendProc.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String ModalCancelFriendProc(String f_email, String searchSelect, String search, HttpServletRequest request,  HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		System.out.println("session email = "+email);
		
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
	
	/* 紐⑤떖 移쒓뎄�떊泥��닔�씫 ajax */
	@RequestMapping(value={"ModalAcceptFriendProc.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String ModalAcceptFriendProc(String f_email, HttpServletRequest request,  HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		System.out.println("session email = "+email);
		
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
	
	/* 紐⑤떖 移쒓뎄�떊泥�嫄곗젅 ajax */
	@RequestMapping(value={"ModalRefuseFriendProc.do"}, method=RequestMethod.GET)
	@ResponseBody
	public String ModalRefuseFriendProc(String f_email, HttpServletRequest request,  HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		System.out.println("session email = "+email);
		
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
	
	
   // add group
	
	@RequestMapping(value={"createGroup.do"}, method=RequestMethod.POST)
	public String createGroup(HttpServletRequest request,  HttpServletResponse response, Groups g , Model model) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		System.out.println("session email = "+email);
		
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
			int af2 = gmdao.addGroupMember(g.getNum(), email);
			
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
		System.out.println("session email = "+email);
		System.out.println("g_num="+g_num);
		int ig_num = Integer.parseInt(g_num);
		
		System.out.println("ig_num = "+ig_num);
		
		Group_MembersDAO gmdao = ss.getMapper(Group_MembersDAO.class);
		
		int af = gmdao.addGroupMember(ig_num, f_email);
		
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
	
	
	
		
	
	@RequestMapping(value={"individual_page.do"}, method=RequestMethod.GET)
	public String individual_page() {
		return "individual_page.jsp";
	}
	
	
}
