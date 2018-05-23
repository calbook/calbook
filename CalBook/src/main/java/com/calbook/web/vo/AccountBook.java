package com.calbook.web.vo;

public class AccountBook {
	private int num;
	private String m_email;
	private String adate;
	private int kind;
	private int balance;
	private String content;
	
	public AccountBook() {
		this(0, null, null, 0, 0, null);
	}
	public AccountBook(int num, String m_email, String adate, int kind, int balance, String content) {
		this.num = num;
		this.m_email = m_email;
		this.adate = adate;
		this.kind = kind;
		this.balance = balance;
		this.content = content;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getAdate() {
		return adate;
	}
	public void setAdate(String adate) {
		this.adate = adate;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
