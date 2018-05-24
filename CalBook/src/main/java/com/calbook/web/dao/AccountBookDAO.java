package com.calbook.web.dao;

import java.util.List;

import com.calbook.web.vo.AccountBook;
import com.calbook.web.vo.SumAccountBook;

public interface AccountBookDAO {
	
	/* �Ѽ���, ������, ���� ��������(Daily) */
	public List<SumAccountBook> getDailySumAccountBook(String email, String date);
	
	/* �Ѽ���, ������, ���� ��������(Monthly) */
	public List<SumAccountBook> getMonthlySumAccountBook(String email, String date);
	
	/* ����� ����Ʈ ��������(Daily) */
	public List<AccountBook> getDailyAccountBook(String email, String date);
	
	/* ���� ������Ʈ */
	public int updateBudget(String email, int kind, int amount);
	
}
