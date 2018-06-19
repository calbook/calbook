package com.calbook.web.vo;

public class Members {
   private String email;
   private String pwd;
   private String nick;
   private String phone;
   private String profile;
   private int open;
   private String regdate;
   
   
   public Members() {
      this(null, null, null, null, null, 0, null);
   }
   public Members(String email, String pwd, String nick, String phone, String profile, int open, String regdate) {
      this.email = email;
      this.pwd = pwd;
      this.nick = nick;
      this.phone = phone;
      this.profile = profile;
      this.open = open;
      this.regdate = regdate;
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
   
   
}