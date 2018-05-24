package com.calbook.web.dao;

import java.util.List;

import com.calbook.web.vo.AccountBook;
import com.calbook.web.vo.SumAccountBook;

public interface AccountBookDAO {
	
	/* 총수입, 총지출, 예산 가져오기(Daily) */
	public List<SumAccountBook> getDailySumAccountBook(String email, String date);
	
	/* 총수입, 총지출, 예산 가져오기(Monthly) */
	public List<SumAccountBook> getMonthlySumAccountBook(String email, String date);
	
	/* 가계부 리스트 가져오기(Daily) */
	public List<AccountBook> getDailyAccountBook(String email, String date);
	
	/* 예산 업데이트 */
	public int updateBudget(String email, int kind, int amount);
	
}
