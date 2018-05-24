package com.calbook.web.dao;

import java.util.List;

import com.calbook.web.vo.Members;

public interface FriendsDAO {
	
	//친구 불러오기
	public List<Members> getFriends(String email);
	
	//내친구 검색하기(친구 중 검색)
	public List<Members> getSearchMyFriends(String email, String searchSelect, String search);
	
	//새친구 검색하기(전체 친구 중 검색)
	public Members getSearchNewFriends(String searchSelect, String search);
	
	//내친구 삭제하기
	public int delFriend(String email, String f_email);
		
	//검색친구 불러오기
	public List<Members> getSearchFriends(String searchSelect, String search);

}
