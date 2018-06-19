<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
* {
    box-sizing: border-box;
   border: 0;
   font-family: sans-serif
}

body {
   margin: 0;
   background: #f5f4f4;
}

html, body {
   padding: 0;
   margin: 0;
   /* height: 100%; */
}

.profile {
   float: left;
   width: 30%;
   height: 100%;
}

.content {
   float: right;
   width: 70%;
   min-height: 1000px;
   height: 100%;
   font-family: sans-serif;
   font-size: 18px;
   line-height: 1.5;
   margin-top: 90px;
   border: 5px solid #777777;
   padding: 50px;
   color: #EEEEEE;
}
/* Clear floats after the columns */
.row:after {
   content: "";
   display: table;
   clear: both;
}
/* profile CSS */
.container {
   width: 90%;
   margin: auto;
   text-align: center;
}

.card {
/*    height: 1000px; */
   width: 85%; 
   background-color: white;
   border: 0px solid #eee;
   text-align: center;
   display: inline-block;
   /* margin-top: 100px; */
   box-shadow: -1px 1px 8px rgba(0, 0, 0, 0.53);
   margin: 20px;
   margin-top: 100px;
}

img {
   width: 100%;
}

.card h1 {
   text-align: center;
   margin-top: 30px;
   margin-bottom: 15px;
   
}

.card span {
   display: inline-block;
   width: 20%;
   color: #999;
}

.card p {
   font-family: sans-serif;
   font-size: 15px
}

h1 i {
   color: #D5D5D5;
   padding-left: 15px;
}

h1 i:hover {
   color: #aaaaaa;
}

.info_modi {
   display: none;
}

.card input[type="text"], .card input[type="checkbox"], .card input[type="password"] {
   display: inline-block;
   width: 70%;
   border-bottom: 1px solid #000;
    font-weight: bold;
    font-size: 2rem;
   -webkit-margin-before: 0.67em;
    /* -webkit-margin-after: 0.67em; */
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
}

.card input:focus {
   outline: none;
}


.card input[type="button"] {
   display: block;
   width: 87%;
   padding: 10px;
   color: white;
   font-size: 19px;
   margin: auto;
   margin-bottom: 17px;
   margin-top: 20px;
   cursor: pointer;
   transition: 0.3s;
}

.card input[type="button"].half {
   display: inline;
   width: 30%;
}

.card input[type="button"].blue {
   background-color: #3498DB;
   opacity: 0.9;
   
}

.card input[type="button"].blue:hover {
   opacity: 1;
}

.card input[type="button"].red {
   background-color: #E74C3C;
   opacity: 0.9;
}

.card input[type="button"].red:hover {
   opacity: 1;
}

.card input[type="button"].yellow {
   background-color: #F2CF66;
   opacity: 0.9;
}

.card input[type="button"].yellow:hover {
   opacity: 1;
}

.card input[type="button"].green {
   background-color: #82BF56;
   opacity: 0.9;
}

.card input[type="button"].green:hover {
   opacity: 1;
}

/* image upload */
.filebox {display:inline-block; margin-right: 10px;}


.filebox label {
  display: inline-block;
  margin-top: 10px;
  padding: .5em .75em;
  color: #999;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #fdfdfd;
  cursor: pointer;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
}

.filebox input[type="file"] {  /* 파일 필드 숨기기 */
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
}




/* detail CSS  */
.title {
  text-align:center;
  color: #444444;
  font-family: Georgia,sans;
  font-style: italic;
  margin-top: 0;
  
}

.active {
  color: #444444;
}

strong {
  color: #FFFFFF;
}

main {
  min-height:600px;
  color:#444444;
  font-size:20px;
}

span {
  color: #444444;
}

.detailImg {
   width:300px;
   height:340px;
   float: right;
   margin-left: 20px;
   margin-bottom: 20px;
   border: 1px solid #999999;
   padding: 9px;
}

h2 {
   font-family: 'Jeju Gothic', sans-serif;
}

h4 {
   font-weight: normal;
   margin-bottom: 0;
}

p {
   font-family: 'Jeju Gothic', sans-serif;
   margin-top: 0;
   margin-bottom: 27px;
}

hr {
   border: none;
   border-top: 1px solid #999999;
   margin: 30px 0;
}

.top {
   color: #999999;
   text-align: center;
}

.bottom {
  text-align:center;
}



/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media screen and (max-width: 1190px) {
   .pagination-newer {
        margin-right: 0;
   }

   .pagination-older {
        margin-left: 0;
   }
}


/* button css */
button {
  background: none;
  font: inherit;
  font-weight: bold;
  line-height: 1;
  margin: 0.5em;
  padding: 1em 2em;
  cursor: pointer;
}

.check {
   border: 2px solid #00CC98;
   color: #00CC98;
}

.check:hover {
   background-color: #00CC98;
   color: #FFFFFF;
}

.modify {
   border: 2px solid #e4cb58;
   color: #e4cb58;
}

.modify:hover {
   background-color: #e4cb58;
   color: #FFFFFF;
}


.delete {
   border: 2px solid #ff7f82;
   color: #ff7f82;
}

.delete:hover {
   background-color: #ff7f82;
   color: #FFFFFF;
}



/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media screen and (max-width: 900px) {
   .new {
       width: 9%;
       padding: 0;
    }
    
    .card {
       margin-top: 80px;
    }
}
</style>

<script>
   $(function(){
      
      $("#profileImg").change(function(event) {
         $('#imagePreview').fadeIn('fast').attr('src', URL.createObjectURL(event.target.files[0]));
      });
      
      
      $('#profile_modi').click(function(){
         $('.info_modi').css({
            "display":"block"
         });
      });
      
      $('#cancel').click(function(){
    	 var src = $('#imageSrc').val();
         $('#imagePreview').fadeIn('fast').attr('src', src);
         $('.info_modi').css({
            "display":"none"
         });
      });      
   });
   
   function modiProfile(){
	      var formData = new FormData($('#info_modi')[0]);
	      var nick = $('#nick').val();
	      var phone = $('#phone').val();
	      var pwd = $('#password').val();
	      var pwd_check = $('#password_check').val();
	      if(nick == null || nick == "null" || nick == ""){
	         alert("닉네임을 입력해주세요.");
	      }else if(phone == null || phone == "null" || phone == ""){
	         alert("핸드폰 번호를 입력해주세요.");
	      }else if(pwd == null || pwd_check == null || pwd == "" || pwd_check == ""){
	         alert("비밀번호를 입력해주세요.");
	      }else if(pwd != pwd_check){
	         alert("비밀번호가 일치하지 않습니다.");
	      }else{
	         var check = 0;

	         $.ajax({
	            url: "checkMembers.do",
	            type: "POST",
	            data: {"nick":nick, "phone":phone},
	            error: function(jqXHR){
	               alert("jqXHR.status: " + jqXHR.status);
	               alert("jqXHR.statusText(): " + jqXHR.statusText());
	            },
	            dataType: "text",
	            success: function(resData){
	               var result = $.trim(resData);
	               if(result == "true"){
	                  $.ajax({
	                        type : 'post',
	                        url : 'updateMembers.do',
	                        data : formData,
	                        processData : false,
	                        contentType : false,
	                        dataType: "text",
	                        error: function(jqXHR){
	                        alert("jqXHR.status: " + jqXHR.status);
	                        alert("jqXHR.statusText(): " + jqXHR.statusText());
	                     },
	                        success : function(resData) {
	                           if(resData == "success"){
	                              alert("정보 수정 성공");
	                              $('.info_modi').css({
	                                "display":"none"
	                             });
	                              $('#h1Nick').text($('#nick').val());
	                              $('#pPhone').text($('#phone').val());
	                              $('#password_check').val('');
	                           }else{
	                              alert("정보 수정 실패");
	                           }
	                        }
	                    });
	                  }else if(result == "nick_false"){
	                     alert("중복되는 닉네임입니다.");
	                  }else if(result == "phone_false"){
	                     alert("중복되는 전화번호입니다.");
	                  }
	            }
	         });
	      }
	   }
</script>

</head>

<body>
   <div>
      <jsp:include page="../default/navbar.jsp" />
   </div>

   <div class="row">
      <div class="profile">
         <div class="container">
            <div class="card">
               <c:if test="${member.profile == null}">
                  <img id="imagePreview" class="profile_img" src="../images/profile.jpg" alt="prof">
                  <input id="imageSrc" type="hidden" value="../images/profile.jpg">
               </c:if>
               <c:if test="${member.profile != null}">
                  <img id="imagePreview" class="profile_img" src="upload/${member.profile}" alt="prof">
                  <input id="imageSrc" type="hidden" value="upload/${member.profile}">
               </c:if>
               <c:if test="${email == cEmail}">
                  <h1 id="h1Nick">${member.nick}</h1><a id="profile_modi"><i class="fa fa-pencil"></i></a>
               </c:if>
               <c:if test="${email != cEmail}">
                  <h1 id="h1Nick">${member.nick}</h1>
               </c:if>
               <p>${member.email}</p>
               <p id="pPhone">${member.phone}</p>

               
               
               <form enctype="multipart/form-data" id="info_modi" class="info_modi" action="updateMembers.do" method="get">
                  <span>닉네임</span> <input id="nick" name="nick" type="text" value="${member.nick}" required>
                  <span>전화번호</span> <input id="phone" name="phone" type="text" value="${member.phone}" required>
                  <span>비밀번호</span> <input id="password" name="pwd" type="password" placeholder="password" value="${member.pwd}" required>
                  <span>비밀번호 확인</span> <input id="password_check" type="password" placeholder="password check" required>
                  <input type="hidden" id="profile_img" value="${member.profile}">
                  <div class="filebox">
                    <label for="profileImg"><i class="fa fa-camera"></i>업로드</label> 
                    <input type="file" name="file" id="profileImg">
                  </div>
                  <div>
                     <input type="button" value="전송" id="modiSubmit" class="half green" onclick="modiProfile();">
                     <input type="button" value="취소" id="cancel" value="취소" class="half yellow">                  
                  </div>
               </form>
               
<!--                <button class="blue">친구 신청</button> -->
<!--                <button class="red">친구 삭제</button> -->
<!--                <button class="yellow">프로필 수정</button> -->
            </div>
         </div>
      </div>
      
      <div class="content">
         <header>
             <h1 class="title">${com.title}</h1>
             <div class="top">
                <span class="hit">조회수 : ${com.hit}</span>
                <span>|</span>
                <span class="date">작성일 : ${com.cdate}</span>
                <span>|</span>
                <span class="nick">작성자 : ${com.writer}</span>
             </div>
             <hr>
           </header>
         
           <main>
             <h2>${com.title}</h2>
             <c:if test="${com.url == null}">
                <img class="detailImg" src="../images/background/member.jpg" alt="This is Wendy Bite" />
             </c:if>
             <c:if test="${com.url != null}">
               <img class="detailImg" src="upload/${com.url}" alt="This is Wendy Bite" />
             </c:if>
             <p>${com.content}</p>
         
             <!-- <p>Thank You for being a friend. Travel down a road and back again. Your heart is true, you're a pal and a confidante.And if you threw a party, invited everyone you knew, you would see the biggest gift would be from me and the card attached would say, Thank You For Being a Friend!</p> -->
           </main>
         <hr>
           <div class="bottom">
              <a href="individual_page.do?pg=${pg}&query=${urlquery}&cEmail=${com.writer}"><button class="check">Check</button></a>
              <span>|</span>
              <c:if test="${com.writer == email}">
                 <a href="diary_modi.do?cEmail=${cEmail}&pg=${pg}&query=${urlquery}&seq=${com.seq}"><button class="modify">Modify</button></a>
                 <span>|</span>
                 <a href="diary_del.do?pg=${pg}&query=${urlquery}&seq=${com.seq}"><button class="delete">Delete</button></a>
              </c:if>
           </div>

      </div>

   </div>

   <div>
      <jsp:include page="../default/footer.jsp" />
   </div>
</body>
</html>