<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel='stylesheet' href='../css/list.css' />
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
   height: 100%;
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

.profile_img {
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

/* search CSS */
form {
   display: inline;
}

.search-box {
   width: 70%;
   /* position: relative; */
   margin: auto;
   margin-top: 20px;
   /* display: inline; */
}

.search-box .emty {
   font-size: 32px;
   position: absolute;
   right: 20px;
   top: 7px;
   z-index: 3;
   display: none;
   cursor: pointer;
}

.search-box button {
   background-color: transparent;
}


.search {
   height: 50px;
   width: 75%;
   margin-top: 10px;
   padding: 5px 15px;
   border-radius: 50px;
   transition: 0.3s;
   border: 2px solid #ddd;
   background: none;
   color: #BDBDBD;
   font-size: 18px;
}

.search:focus {
   color: #000;
   background-color: #FFF;
   outline: none;
   box-shadow: 0 0 0 3px #ddd;
}

.new {
  height: 50px;
  padding: 5px 15px;
  border-radius: 50px;
  transition: 0.3s;
  border: 2px solid #ddd;
  outline: none;
  background: none;
  color: #ddd;
  font-size: 18px;
  cursor: pointer;  
}

.new button {
   color: #ddd;
   text-decoration: none;
}

.new i, .new button i {
   padding: 0;
}

.new:HOVER {
   background: #FFFFFF;
   color: #ddd;
   outline: none;
   box-shadow: 0 0 0 3px #ddd;
}

/* paging */
.pagination-container {
  width: 40%;
  margin-left: 40%;
  margin-bottom: 20px;
  text-align: center;
}
.pagination {
  /* position: relative; */
  
}
.pagination a {
  position: relative;
  display: inline-block;
  color: #2c3e50;
  text-decoration: none;
  font-size: 1.2rem;
  padding: 8px 16px 10px;
}

.pagination a:before {
  z-index: -1;
  position: absolute;
  height: 100%;
  width: 100%;
  content: "";
  top: 0;
  left: 0;
  background-color: #2c3e50;
  border-radius: 24px;
  -webkit-transform: scale(0);
          transform: scale(0);
  -webkit-transition: all 0.2s;
  transition: all 0.2s;
}

.pagination a:hover,
.pagination a .pagination-active {
  color: #fff;
}

.pagination a:hover:before,
.pagination a .pagination-active:before {
  -webkit-transform: scale(1);
          transform: scale(1);
}

.pagination .pagination-active {
  color: #fff;
}

.pagination .pagination-active:before {
  -webkit-transform: scale(1);
          transform: scale(1);
}

.pagination-newer {
  margin-right: 50px;
}

.pagination-older {
  margin-left: 50px;
}

/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0} 
    to {top:0; opacity:1}
}

@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    padding: 2px 16px;
    background-image: url("../images/background/modal_title_background.png");
    background-size: cover;
    color: white;
    text-align: center;
}

.modal-header h2 {
   margin: 30px 0 10px 0;   
    font-size: 30px;
}

.modal-header p {
   font-size: 15px;
}

.modal-body {padding: 2px 16px;}

.modal-body-title {

}

.modal-footer {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
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


/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media screen and (max-width: 1190px) {
   .pagination-newer {
        margin-right: 0;
   }

   .pagination-older {
        margin-left: 0;
   }
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
      
      
      $('.pagination-inner a').on('click', function() {
         $(this).siblings().removeClass('pagination-active');
         $(this).addClass('pagination-active');
      })
      
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
         <div>
            <div class="search-box">
               <form action="individual_page.do" method="get">
                  <input name="cEmail" type="hidden" value="${cEmail}">
                  <input name="query" class="search" value="${query}" placeholder="Search" autocomplete="off"/>
                  <button type="submit" class="new"><i class="fa fa-search"></i></button>
               </form>
               <c:if test="${email == cEmail}">
                  <a id="modalBtn" href="diary_add.do?cEmail=${cEmail}&pg=${pg}&query=${urlquery}">
                     <button class="new"><i class="fa fa-plus"></i></button>
                  </a>               
               </c:if>
            </div>
         </div>
         
         

         <section class="section">
         <div class="grid">
            <c:if test="${empty cList}">
               <div class="item item--large" style="background-image: url('../images/sample6.jpg');">
                  <div class="item__details">일치하거나 등록한 글이 없습니다.😢</div>
               </div>
            </c:if>
            <c:if test="${!empty cList}">
               <jsp:useBean id="random" class="java.util.Random" scope="application" />
               <c:forEach items="${cList}" var="item">
                  <c:set var="rand" value="${random.nextInt(9)+1}" scope="request"></c:set>
                  <c:choose>
                     <c:when test="${1 <= rand && rand <= 4}">
                        <c:if test="${item.url == null}">
                           <div class="item item--large" style="background-image: url('../images/sample7.png');">
                              <div class="item__details"><a href="diary_detail.do?pg=${pg}&query=${urlquery}&seq=${item.seq}&cEmail=${cEmail}">${item.title}</a></div>
                           </div>
                        </c:if>
                        <c:if test="${item.url != null}">
                           <div class="item item--large" style="background-image: url(upload/${item.url});">
                              <div class="item__details"><a href="diary_detail.do?pg=${pg}&query=${urlquery}&seq=${item.seq}&cEmail=${cEmail}">${item.title}</a></div>
                           </div>
                        </c:if>
                     </c:when>
      
                     <c:when test="${4 < rand && rand <= 8}">
                        <c:if test="${item.url == null}">
                           <div class="item item--medium" style="background-image: url('../images/sample5.png');">
                              <div class="item__details"><a href="diary_detail.do?pg=${pg}&query=${urlquery}&seq=${item.seq}&cEmail=${cEmail}">${item.title}</a></div>
                           </div>
                        </c:if>
                        <c:if test="${item.url != null}">
                           <div class="item item--medium" style="background-image: url(upload/${item.url});">
                              <div class="item__details"><a href="diary_detail.do?pg=${pg}&query=${urlquery}&seq=${item.seq}&cEmail=${cEmail}">${item.title}</a></div>
                           </div>
                        </c:if>
                     </c:when>
      
                     <c:when test="${8 < rand && rand <= 10}">
                        <c:if test="${item.url == null}">
                           <div class="item" style="background-image: url('../images/sample1.jpg');">
                              <div class="item__details"><a href="diary_detail.do?pg=${pg}&query=${urlquery}&seq=${item.seq}&cEmail=${cEmail}">${item.title}</a></div>
                           </div>
                        </c:if>
                        <c:if test="${item.url != null}">
                           <div class="item" style="background-image: url(upload/${item.url});">
                              <div class="item__details"><a href="diary_detail.do?pg=${pg}&query=${urlquery}&seq=${item.seq}&cEmail=${cEmail}">${item.title}</a></div>
                           </div>
                        </c:if>
                     </c:when>
                  </c:choose>
               </c:forEach>
            </c:if>
         </div>
      </section>

      </div>

      <div class="pagination-container">
         <div class="pagination">
            <c:if test="${sPage != 1}">
               <a class="pagination-newer" href="individual_page.do?cEmail=${cEmail}&query=${urlquery}&pg=${sPage-5}">PREV</a>
            </c:if>
            <span class="pagination-inner">
               <c:forEach begin="0" end="4" var="i">
                  <c:if test="${i+sPage <= fPage}">
                     <c:if test="${pg == i+sPage}">
                        <a href="#" class="pagination-active">${i+sPage}</a>
                     </c:if>
                     <c:if test="${pg != i+sPage}">
                        <a href="individual_page.do?cEmail=${cEmail}&query=${urlquery}&pg=${i+sPage}">${i+sPage}</a>               
                     </c:if>
                  </c:if>
               </c:forEach>
            </span>
            <c:if test="${sPage+5 <= fPage}">
               <a class="pagination-older" href="individual_page.do?cEmail=${cEmail}&query=${urlquery}&pg=${sPage+5}">NEXT</a>
            </c:if>
         </div>
      </div>
      
   </div>

   <div>
      <jsp:include page="../default/footer.jsp" />
   </div>
</body>
</html>