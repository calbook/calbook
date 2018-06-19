package com.calbook.web.vo;

public class Schedules {
	private int seq;
	private String m_email;
	private String title;
	private String content;
	private int important;
	private String start_date;
	private String finish_date;
	private String location;
	private int g_num;
	
	public Schedules() {
		this(0, null, null, null, 0, null, null, null, 0);
	}
	public Schedules(int seq, String m_email, String title, String content, int important, String start_date, String finish_date, String location, int g_num) {
		this.seq = seq;
		this.m_email = m_email;
		this.title = title;
		this.content = content;
		this.important = important;
		this.start_date = start_date;
		this.finish_date = finish_date;
		this.location = location;
		this.g_num = g_num;
	}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getImportant() {
		return important;
	}
	public void setImportant(int important) {
		this.important = important;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getFinish_date() {
		return finish_date;
	}
	public void setFinish_date(String finish_date) {
		this.finish_date = finish_date;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getG_num() {
		return g_num;
	}
	public void setG_num(int g_num) {
		this.g_num = g_num;
	}
	
	@Override
	public String toString() {
		return "Schedules [seq=" + seq + ", m_email=" + m_email + ", title=" + title + ", content=" + content
				+ ", important=" + important + ", start_date=" + start_date + ", finish_date=" + finish_date
				+ ", location=" + location + ", g_num=" + g_num + "]";
	}
	
	
}
