package com.calbook.web.dao;

import java.util.List;

import com.calbook.web.vo.AccountBook;
import com.calbook.web.vo.SumAccountBook;

public interface AccountBookDAO {
   
   /* 총수입, 총지출 가져오기(Daily) */
   public List<SumAccountBook> getDailySumAccountBook(String email, String date);
   
   /* 총수입, 총지출 가져오기(Monthly) */
   public List<SumAccountBook> getMonthlySumAccountBook(String email, String date);
   
   /* 총수입, 총지출  가져오기(Period)*/
   public List<SumAccountBook> getPeriodSumAccountBook(String email, String startD, String endD);
   
   /* 가계부 리스트 가져오기(Daily) */
   public List<AccountBook> getDailyAccountBook(String email, String date);
   
   /* 가계부 리스트 가져오기(Monthly) */
   public List<AccountBook> getMonthlyAccountBook(String email, String date);
   
   /* 가계부 리스트 가져오기(Period) */
   public List<AccountBook> getPeriodAccountBook(String email, String startD, String endD);
   
   /* 가계부 저장하기 */
   public int saveAccountBook(AccountBook ab);
   
   /* 가계부 삭제하기 */
   public int rmAccountBook(int num);
   
   /* 가계부 수정하기 */
   public int modiAccountBook(int num, String content, int amount);
   
   /* sub_kind별 가계부 가져오기 */
   public List<SumAccountBook> getModalSumAccountBook(String email, String date);
}