package com.calbook.web.vo;

public class Community {
   private int seq;
   private String title;
   private String content;
   private String cdate;
   private String writer;
   private int hit;
   private String url;
   
   public Community() {
      this(0, null, null, null, null, 0, null);
   }
   public Community(int seq, String title, String content, String cdate, String writer, int hit, String url) {
      this.seq = seq;
      this.title = title;
      this.content = content;
      this.cdate = cdate;
      this.writer = writer;
      this.hit = hit;
      this.url = url;
   }
   
   
   public int getSeq() {
      return seq;
   }
   public void setSeq(int seq) {
      this.seq = seq;
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
   public String getCdate() {
      return cdate;
   }
   public void setCdate(String cdate) {
      this.cdate = cdate;
   }
   public String getWriter() {
      return writer;
   }
   public void setWriter(String writer) {
      this.writer = writer;
   }
   public int getHit() {
      return hit;
   }
   public void setHit(int hit) {
      this.hit = hit;
   }
   public String getUrl() {
      return url;
   }
   public void setUrl(String url) {
      this.url = url;
   }
   
   
   
}