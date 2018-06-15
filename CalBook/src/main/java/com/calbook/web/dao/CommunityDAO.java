package com.calbook.web.dao;

import java.util.List;

import com.calbook.web.vo.Community;

public interface CommunityDAO {
   /* COMMUNITY 글 리스트 가져오기 */
   public List<Community> getCommunityList(String email, String query, int pg);
   
   /* COMMUNITY 총 글 개수 가져오기 */
   public int getCommunityCount(String email, String query);
   
   /* COMMUNITY 글 정보 가져오기 */
   public Community getCommunity(int seq);
   
   /* 조회수 증가하기 */
   public int updateHit(int seq);
   
   /* COMMUNITY 글 등록하기 */
   public int addCommunity(Community c);
   
   /* COMMUNITY 글 삭제하기 */
   public int delCommunity(int seq);
   
   /* COMMUNITY 글 수정하기 */
   public int updateCommunity(Community c);
}