package com.calbook.web.dao;

import com.calbook.web.vo.Members;

public interface MembersDAO {
   
   // 회원가입(개인정보 저장)
   public int addMembers(Members m);
   
   // 개인정보 불러오기(닉네임)
   public Members getMembersNick(String nick);
   
   // 개인정보 불러오기(이메일)
   public Members getMembersEmail(String email);
   
   // 개인정보 수정하기
   public int updateMembers(Members m);
   
   // 중복체크(전화번호)
   public Members checkMembersPhone(String email, String phone);
   
   // 중복체크(닉네임)
   public Members checkMembersNick(String email, String nick);
}