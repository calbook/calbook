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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
/* 모임_일정 css */
html, body {
	height: 100%;
	width: 100%;
	margin: 0;
	padding: 0;
	background-color: #BDC3C7;
	font-family: 'Raleway';
}

.top {
  background-color: #264356;
  height: 200px;
  margin:0;
  padding:0;
  box-shadow: 2px 2px 4px rgb(0, 0, 0, .25);
}

.form {
  height: 590px;
  width: 400px;
  background-color: #fff;
  margin: -110px auto;
  border-radius: 10px;
  color: #666;
  padding: 0px 0px;
  box-shadow: 2px 2px 4px rgb(0, 0, 0, .25);
}

.info {
  padding: 10px;
}

h1, h2, p {
  text-align: center;
  padding: 0px;
  margin: 5px 5px;
}

h2 {
  font-family: 'Great Vibes', cursive;
  font-weight: 100;
}

p.line {
  margin: 0px auto 20px auto;
  color: #999;
}

.form input {
  font-size: 15px;
  color: #666;
  padding: 6px;
  margin: 25px auto 20px;
  display: block;
  width: 75%;  
}

input:focus {
  outline: 0;
}

.button button {
  display: inline-block;
  width: 400px;
}

button.accept {
  border-radius: 0px 0px 0px 10px;
  border-right: solid 1px #cc919a;
   color: #666;
  background-color: #ffbdc7;
  border: none;
  font-family: 'Raleway';
  font-size: 18px;
  font-weight: 600;
  padding: 15px 32px;
  width: 200px;
  margin: 20px auto 0px auto; 
  float:left;
}

button.regret {
  border-radius: 0px 0px 10px 0px;
   color: #666;
  background-color: #ffbdc7;
  border: none;
  font-family: 'Raleway';
  font-size: 18px;
  font-weight: 600;
  padding: 15px 32px;
  width: 200px;
  margin: 20px auto 0px auto; 
  float:left;
}

button:hover {
  background-color: #cc919a;
  transition: .5s;
}

button:focus {
  outline: 0;
}

</style>
<script>
	$(function(){
		$('.pagination-inner a').on('click', function() {
			$(this).siblings().removeClass('pagination-active');
			$(this).addClass('pagination-active');
		})
		
		$('#modalBtn').click(function(){
			$('#myModal').css({
				"display":"block"
			});
			
			$('.item__details').css({
				"z-index":"0"
			});
		});
		
		$('.close').click(function(){
			$('#myModal').css({
				"display":"none"
			});
			
			$('.item__details').css({
				"z-index":"1"
			});
		});
	});
	
/* 	// Get the modal
	var modal = document.getElementById('myModal');

	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	// When the user clicks the button, open the modal 
	btn.onclick = function() {
	    modal.style.display = "block";
	}

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	    modal.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	} */
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
		
		<!-- 모임 뷰, 수정   -->
		

		<div class="container-fluid">
			<div id="container" class="col-md-8">
				<br><br><br><br><br>
				<div class="top">
				</div>
				<div class="form">
					<div class ="info">
						<h1>RSVP</h1>
						<h2>for the wedding of</h2>
						<h1>Allison & Daniel</h1>
						  <p class= "line">________________________________________</p>
						  <h2>The Details</h2>
						  <p>Saturday, June 18, 2016</p>
						  <p>5:00 PM</p>
						  <br>
						  <h2>Ceremony & Reception</h2>
						  <p>Chapel of Our Saviour</p>
						  <p>8 4th St, Colorado Springs, CO 80906</p>
						  <p class= "line">________________________________________</p>
						<input type="text" placeholder="Name">
						<input type="number" placeholder="# of Guests">
					</div>
				  <button class ="accept">UPDATE</button>
				  <button class ="regret">DELETE</button>
				</div>
			</div>		
		</div>
	</div>
	<div>
		<jsp:include page="../default/footer.jsp" />
	</div>
</body>
</html>