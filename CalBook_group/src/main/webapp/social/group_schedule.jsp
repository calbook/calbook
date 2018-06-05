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
	font-family: sans-serif;
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

/* search CSS */
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

.search {
	height: 50px;
	width: 75%;
	margin-top: 10px;
	padding: 5px 15px;
	border-radius: 50px;
	transition: 0.3s;
	border: 2px solid #ddd;
	background: none;
	color: #fff;
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

.new a {
	color: #ddd;
	text-decoration: none;
}

.new i, .new a i {
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

/* modal */
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 50%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
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
/* 일정 css */
.hide{
  display: none;
}



#container {
  padding: 50px;
  background-color: white;
  border-radius: 5px;
}

#container .buttons {
  float: right;
  padding-right: 50px; 
}

#container .buttons button {
  border: 0;
  background-color: #dddddd;
  border-radius: 5px;
  
}

#container span.glyphicon {
  font-size: 2em;
  color: #FF4444;
  
}

#container ul, table{ 
  list-style: none; 
  margin-top: 50px;
}

#container .buttons { 
   margin-bottom: 20px;  
}

#container .table-hover img { 
  height: 50px; 
}

#container .grid li { 
  float: left; 
  width: 33%; 
  height: 250px;  
  text-align: center;  
  vertical-align: middle;
}

table .img-circle {
  height: 30px;
  width: 30px;
  background-color: #ff4444;
}

ul .img-circle {
  width: 150px;
  height: 150px;
  background-color: #ff4444;
  text-align: center; 
  display: block; 
  margin-left: auto; 
  margin-right: auto; 
  margin-top: 20px;
}

h3{
  display: block;
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
		
		<!-- 모임 일정  -->
		

	<div class="container-fluid">
		<div id="container" class="col-md-8">
			 <br><br><br>
			 <div class="buttons">
			 	<a href="register.jsp"><button class="table-hover"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button></a>
			 </div> 
			<table class="table table-hover" id="oi">
				<thead>
					<tr>
					  <th>#</th>
					  <th></th>
					  <th>Group Name</th>
					  <th>Schedule</th>
					  <th>Gender</th>
					  <th>Religion</th>
					  <th>Status</th>
					  </tr>
				</thead>
				<tbody>
				  <tr>
				    <th scope="row">1</th>
				    <td><div class="img-circle"></div></td>
				    <td><a href = "View_GroupSchedule.jsp">Robert</a></td>
				    <td>Baratheon</td>
				    <td>Male</a></td>
				    <td>Faith of the Seven</td>
				    <td>Deceased</td>
				  </tr>
				  <tr>
				    <th scope="row">2</th>
				    <td><div class="img-circle"></div></td>
				    <td>Eddard</td>
				    <td>Stark</td>
				    <td>Male</td>
				    <td>Old Gods of the Forest</td>
				    <td>Deceased</td>
				  </tr>
				</tbody>
			</table>
		</div>    
	</div>
	</div>
	<div>
		<jsp:include page="../default/footer.jsp" />
	</div>
</body>
</html>