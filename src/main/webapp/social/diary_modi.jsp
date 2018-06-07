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
	/* height: 1000px; */
	/* width: 500px; */
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
	margin-top: 10px;
	margin-bottom: 15px;
}

.card span {
	display: inline-block;
	width: 20%;
	color: #999;
}

.card p {
	font-size: 15px
}

h1 i {
	color: #D5D5D5;
	padding-left: 15px;
}

h1 i:hover {
	color: #aaaaaa;
}

.card input {
	display: inline-block;
	width: 70%;
	border-bottom: 1px solid #000;
	text-align: center;
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


.card button {
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

.card button.half {
	display: inline;
	width: 30%;
}

.card button.blue {
	background-color: #3498DB;
	opacity: 0.9;
	
}

.card button.blue:hover {
	opacity: 1;
}

.card button.red {
	background-color: #E74C3C;
	opacity: 0.9;
}

.card button.red:hover {
	opacity: 1;
}

.card button.yellow {
	background-color: #F2CF66;
	opacity: 0.9;
}

.card button.yellow:hover {
	opacity: 1;
}

.card button.green {
	background-color: #82BF56;
	opacity: 0.9;
}

.card button.green:hover {
	opacity: 1;
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
}0

p {
  font-family: Georgia, serif;
	margin-top: 0;
	margin-bottom: 27px;
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

p {
	font-family: Georgia, serif;
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
  width: 150px;
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
					<img src="https://www.w3schools.com/w3images/team2.jpg" alt="prof">
					<h1>John Doe<a><i class="fa fa-camera"></i></a></h1>
					<span>CEO &amp; Founder, Example</span>
					<p>Harvard University</p>
					
					<span>닉네임</span> <input type="text">
					<span>전화번호</span> <input type="text">
					<span>비밀번호</span> <input type="text">
					<span>비밀번호 확인</span> <input type="text">
					
					<button class="blue">친구 신청</button>
					<button class="red">친구 삭제</button>
					<button class="yellow">프로필 수정</button>
					<button class="half green">확인</button>
					<button class="half yellow">취소</button>
				</div>
			</div>
		</div>
		
		<div class="content">
			<header>
				<input class="title" type="text" placeholder="title">
			    <div class="top">
			    	<span class="date">20xx.xx.xx</span>
			    	<span>|</span>
			    	<span class="nick">NickName</span>
			      	<!-- <a href="#" class="active">About Me</a> <span>|</span>
			       	<a href="#">R&eacute;sum&eacute;</a> -->
			    </div>
			    <hr>
			  </header>
			
			  <main>
			    <h2>Title</h2>
			    <!-- <div class="detailImg"> -->
				<div class="avatar-upload">
					<div class="avatar-edit">
						<input type='file' id="imageUpload" accept=".png, .jpg, .jpeg" />
				        <label for="imageUpload"></label>
				    </div>
				    <div class="avatar-preview">
				        <div id="imagePreview" style="background-image: url(http://i.pravatar.cc/500?img=7);"></div>
				    </div>
				</div>
			    <!-- </div> -->
				<textarea rows="30" style="width: 100%;"></textarea>
			  </main>
			<hr>
			  <div class="bottom">
			  	<button class="check">Check</button>
			  	<span>|</span>
			  	<button class="delete">Back</button>
			    <!-- <a href="#">Facebook</a> -->
<!-- 			    <span>|</span> <a href="#">Twitter</a> -->
<!-- 			    <span>|</span> <a href="#">Instagram</a> -->
<!-- 			    <span>|</span> <a href="#">LinkedIn</a>  -->
			  </div>

		</div>

	</div>

	<div>
		<jsp:include page="../default/footer.jsp" />
	</div>
</body>
</html>