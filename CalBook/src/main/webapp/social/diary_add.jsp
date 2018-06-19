7<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style type="text/css">
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
   height: auto;
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
  width: 80%;
  margin: auto;
  margin-bottom: 20px;
  padding: 10px;
  text-align:center;
  color: #444444;
  font-family: Georgia,sans;
  font-style: italic;
  margin-top: 0;
  display: block;
  font-size: 2em;
  font-weight: bold;
}

.date {
  color: #444444;
}

.nick {
  color: #00CC98;
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
   margin-right: 20px;
   margin-bottom: 20px;
   /* border: 1px solid #999999; */
   padding: 9px;
}

h4 {
   font-weight: normal;
   margin-bottom: 0;
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
button, .bottom a{
  text-decoration: none;
  /* width: 150px; */
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



/* image upload */
.avatar-upload {
  position: relative;
  max-width: 280px;
  margin: 20px auto;
}

.avatar-upload .avatar-edit {
  position: absolute;
  right: 12px;
  z-index: 1;
  top: 10px;
}

.avatar-upload .avatar-edit input {
  display: none;
}

.avatar-upload .avatar-edit input + label {
  display: inline-block;
  width: 34px;
  height: 34px;
  margin-bottom: 0;
  border-radius: 100%;
  background: #FFFFFF;
  border: 1px solid transparent;
  box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.12);
  cursor: pointer;
  font-weight: normal;
  transition: all 0.2s ease-in-out;
}

.avatar-upload .avatar-edit input + label:hover {
  background: #f1f1f1;
  border-color: #d6d6d6;
}

.avatar-upload .avatar-edit input + label:after {
  content: "\f040";
  font-family: 'FontAwesome';
  color: #757575;
  position: absolute;
  left: 0;
  right: 0;
  text-align: center;
  margin: auto;
}

.avatar-upload .avatar-preview {
  width: 300px;
  height: 340px;
  position: relative;
  border-radius: 100%;
  /* border: 6px solid #F8F8F8; */
  box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1);
}

.avatar-upload .avatar-preview > div {
  width: 300px;
  height: 340px;
  border-radius: 100%;
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
}

textarea {
  color: #444444;
  font-family: Georgia, serif;
  margin-top: 0;
  font-size: 20px;
  resize: vertical;
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
      $('#imageProfile').fadeIn('fast').attr('src', URL.createObjectURL(event.target.files[0]));
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
   
   function readURL(input) {
       if (input.files && input.files[0]) {
           var reader = new FileReader();
           reader.onload = function(e) {
               $('#imagePreview').css('background-image', 'url('+e.target.result +')');
               $('#imagePreview').hide();
               $('#imagePreview').fadeIn(650);
           };
           reader.readAsDataURL(input.files[0]);
       };
   };
   $("#imageUpload").change(function() {
       readURL(this);
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
                  <img id="imageProfile" class="profile_img" src="../images/profile.jpg" alt="prof">
                  <input id="imageSrc" type="hidden" value="../images/profile.jpg">
               </c:if>
               <c:if test="${member.profile != null}">
                  <img id="imageProfile" class="profile_img" src="upload/${member.profile}" alt="prof">
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
                  <span>전화번호</span> <input id="phone" name="phone" type="text" value="${member.phone}"required>
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
           <form enctype="multipart/form-data" action="diary_add.do" method="POST">
            <header>
               <input class="title" name="title" type="text" placeholder="title" autocomplete="off" required>
                <div class="top">
                   <jsp:useBean id="today" class="java.util.Date"/>
                   
                   <span class="date"><fmt:formatDate value="${today}" pattern="yyyy/MM/dd"/></span>
                   <span>|</span>
                   <span class="nick">${email}</span>
                     <!-- <a href="#" class="active">About Me</a> <span>|</span>
                      <a href="#">R&eacute;sum&eacute;</a> -->
                </div>
                <hr>
              </header>
              <main>
                <!-- <div class="detailImg"> -->
               <div class="avatar-upload">
                  <div class="avatar-edit">
                     <input type="file" name="file" id="imageUpload" accept=".png, .jpg, .jpeg" />
                       <label for="imageUpload"></label>
                   </div>
                   <div class="avatar-preview">
                       <div id="imagePreview" style="background-image: url(../images/background/member.jpg);"></div>
                   </div>
               </div>
                <!-- </div> -->
               <textarea name="content" rows="30" style="width: 100%;"></textarea>
              </main>
              <hr>
              <div class="bottom">
                 <input type="hidden" name="pg" value="${pg}">
                 <input type="hidden" name="query" value="${query}">
                 <button type="submit" class="check">Check</button>
                 <span>|</span>
                 <a href="individual_page.do?pg=${pg}&query=${urlquery}&cEmail=${email}" class="delete">Back</a>
              </div>
           
           </form>

      </div>

   </div>

   <div>
      <jsp:include page="../default/footer.jsp" />
   </div>
</body>
</html>