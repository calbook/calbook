package com.calbook.web.vo;

public class Group_Members {
	
	private int g_num;
	private String m_email;
	private String status;
	private String status_accept;
	
	
	public Group_Members() {
		this(0,null,null,null);
	}
	
	public Group_Members(int g_num, String m_email, String status, String status_accept){
		this.g_num = g_num;
		this.m_email = m_email;
		this.status = status;
		this.status_accept = status_accept;
	}

	
	public int getG_num() {
		return g_num;
	}

	public void setG_num(int g_num) {
		this.g_num = g_num;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStatus_accept() {
		return status_accept;
	}

	public void setStatus_accept(String status_accept) {
		this.status_accept = status_accept;
	}
	
	
	
	
	
}
