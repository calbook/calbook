package com.calbook.web.vo;

public class Groups {
	private int num;
	private String owner;
	private String content;
	private String name;
	private String status;
	
	public Groups() {
		this(0, null, null, null, null);
	}
	public Groups(int num, String owner, String content, String name, String status) {
		this.num = num;
		this.owner = owner;
		this.content = content;
		this.name = name;
		this.status = status;
	}
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
