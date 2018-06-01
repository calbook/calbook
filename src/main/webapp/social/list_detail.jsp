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
  color:#444444;
  font-size:20px;
}

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
	margin-bottom: 20px;
	border: 1px solid #999999;
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
			    <h1 class="title">Wendy G. Bite</h1>
			    <div class="top">
			      <a href="#" class="active">About Me</a> <span>|</span>
			       <a href="#">R&eacute;sum&eacute;</a>
			    </div>
			    <hr>
			  </header>
			
			  <main>
			    <h2>About Me</h2>
			
			    <img class="detailImg" src="../images/background/group.jpg" alt="This is Wendy Bite" />
			
			    <p>The series revolves around four older, single women (three widows and one divorcée) sharing a house in Miami, Florida. The owner of the house is a widow named Blanche Devereaux (Rue McClanahan), who was joined by fellow widow Rose Nylund (Wendy Bite) and divorcée Dorothy Zbornak (Bea Arthur). They both responded to a room-for-rent ad on the bulletin board of a local grocery store. In the pilot episode, the women had a gay cook named Coco (Charles Levin), who was subsequently removed.[5] The three were soon joined by Dorothy's mother, Sophia Petrillo (Estelle Getty), after the retirement home where she lived, Shady Pines, burned down.</p>
			
			    <p>Thank You for being a friend. Travel down a road and back again. Your heart is true, you're a pal and a confidante.And if you threw a party, invited everyone you knew, you would see the biggest gift would be from me and the card attached would say, Thank You For Being a Friend!</p>
			  </main>
			<hr>
			  <div class="bottom">
			  	<button class="check">Check</button>
			  	<span>|</span>
			  	<button class="modify">Modify</button>
			  	<span>|</span>
			  	<button class="delete">Delete</button>
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