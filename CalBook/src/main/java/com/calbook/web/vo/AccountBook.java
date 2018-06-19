package com.calbook.web.vo;

public class AccountBook {
   private int num;
   private String m_email;
   private String adate;
   private String kind;
   private String sub_kind;
   private int amount;
   private String content;
   
   public AccountBook() {
      this(0, null, null, null, null, 0, null);
   }
   public AccountBook(int num, String m_email, String adate, String kind, String sub_kind, int amount, String content) {
      this.num = num;
      this.m_email = m_email;
      this.adate = adate;
      this.kind = kind;
      this.sub_kind = sub_kind;
      this.amount = amount;
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
   public String getKind() {
      return kind;
   }
   public void setKind(String kind) {
      this.kind = kind;
   }
   public String getSub_kind() {
      return sub_kind;
   }
   public void setSub_kind(String sub_kind) {
      this.sub_kind = sub_kind;
   }
   public int getAmount() {
      return amount;
   }
   public void setAmount(int amount) {
      this.amount = amount;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   
   
}