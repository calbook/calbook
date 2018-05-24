package com.calbook.web.dao;

import java.util.List;

import com.calbook.web.vo.Members;
import com.calbook.web.vo.TmpMember;

public interface FriendsDAO {
	
	//친구리스트 불러오기(친구 페이지 시작화면)
	public List<Members> getFriends(String email);
	
	//내친구 검색 리스트 불러오기(내 친구 중 검색 ajax)
	public List<Members> getSearchMyFriends(String email, String searchSelect, String search);
	
	//전체친구 검색 불러오기(전체 친구 중 검색 ajax 중 검색회원 불러오기)
	public TmpMember getSearchNewFriends(String searchSelect, String search);
	
	//전체친구 검색 불러오기(전체 친구 중 검색 ajax 중 친구리스트+관계 불러오기)
	public List<TmpMember> getSearchNewFriendsR(String email);
	
	//친구 삭제하기
	public int delFriend(String email, String f_email);
	
	//친구 신청하기
	public int addFriend(String email, String f_email);
		
	

}
