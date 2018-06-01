package com.calbook.web.vo;

public class CalSchedules {
	private String title;
	private String start;
	private String end;
	private String color;
	
	public CalSchedules() {
		this(null, null, null, null);
	}
	public CalSchedules(String title, String color, String start, String end) {
		this.title = title;
		this.start = start;
		this.end = end;
		this.color = color;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	@Override
	public String toString() {
		return "CalSchedules [title=" + title + ", color=" + color + ", start=" + start + ", end=" + end + "]";
	}
	
}
