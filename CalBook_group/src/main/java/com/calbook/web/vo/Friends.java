package com.calbook.web.vo;

public class Friends {
	private String m_email;
	private String f_email;
	private int relation;
	
	public Friends() {
		this(null, null, 0);
	}
	public Friends(String m_email, String f_email, int relation) {
		this.m_email = m_email;
		this.f_email = f_email;
		this.relation = relation;
	}
	
	
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getF_email() {
		return f_email;
	}
	public void setF_email(String f_email) {
		this.f_email = f_email;
	}
	public int getRelation() {
		return relation;
	}
	public void setRelation(int relation) {
		this.relation = relation;
	}
	
	
}
