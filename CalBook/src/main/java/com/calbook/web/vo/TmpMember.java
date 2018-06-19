package com.calbook.web.vo;

public class TmpMember {
	private String email;
	private String pwd;
	private String nick;
	private String phone;
	private String profile;
	private int open;
	private String regdate;
	private int relation;
	private int status_accept;
	private int g_num;
	
	public TmpMember() {
		this(null, null, null, null, null, 0, null, -1, -1, 0);
	}
	
	public TmpMember(String email, String pwd, String nick, String phone, String profile, int open, String regdate, int relation, int status_accept, int g_num) {
		this.email = email;
		this.pwd = pwd;
		this.nick = nick;
		this.phone = phone;
		this.profile = profile;
		this.open = open;
		this.regdate = regdate;
		this.relation = relation;
		this.status_accept = status_accept;
		this.g_num = g_num;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public int getOpen() {
		return open;
	}
	public void setOpen(int open) {
		this.open = open;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getRelation() {
		return relation;
	}
	public void setRelation(int relation) {
		this.relation = relation;
	}

	public int getStatus_accept() {
		return status_accept;
	}

	public void setStatus_accept(int status_accept) {
		this.status_accept = status_accept;
	}

	public int getG_num() {
		return g_num;
	}

	public void setG_num(int g_num) {
		this.g_num = g_num;
	}
	
	
	
	
	
}
