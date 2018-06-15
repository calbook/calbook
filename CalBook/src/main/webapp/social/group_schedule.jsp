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
<style type="text/css">
* {
    box-sizing: border-box;
	border: 0;
	font-family: sans-serif;
}

body {
   margin: 0;
	background: url("../images/background/group_schedule.jpg") no-repeat;
	background-size: cover;
	height: 1500px;
}

.row{
	margin-top: 0;
	min-height: 1000px;
	
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

.profileimg {
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
	color:white;
  padding: 50px;
  background-color: transparent;
  border-radius: 5px;
  margin:auto;
}

.reg_icon {
	width:50px;
 	 height:50px; 
}

#container .buttons {
  float: right;
  padding-right: 50px;
  
 
}

#container .buttons button {
  border: 0;
  background-color: #dddddd;
  border-radius: 5px;
  height:30px;
  width:30px;
}

#container span.glyphicon {
  font-size: 2em;
  color: black;
  
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

.fa {
	    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
}

tbody tr td a, tbody tr td a:HOVER{
	color: white;
}

thead tr th {
	font-size: 20px;
	text-align: center;
}
tbody tr td {
	font-size: 16px;
	text-align: center;
}

</style>
</head>
<body>
<div>
	<jsp:include page="../default/navbar.jsp" />
</div>

	<div class="row">
		<%-- <div class="profile">
			<div class="container">
				<div class="card">
					<img class="profileimg" src="../images/groupImg1.jpg" alt="prof">
					<h1>${group.name}</h1>
					<p>${group.content}</p>
					<p>Owner: ${group.owner}</p>
				</div>
			</div>
		</div> --%>
		
		<!-- 모임 일정  -->
		
		<br><br><br><br><br>
		<div class="container-fluid">
			<div id="container" class="col-md-2"></div>
			<div id="container" class="col-md-8">
				<h1 style="color:white;">${group.name}(모임장 : ${group.owner})</h1>
				<h3 style="color:white;">${group.content}</h3>
				<c:if test="${group.owner == email}">
					<div class="buttons">
						<a href="register.do?g_num=${group.num}"><button class="table-hover"><i class="fa fa-plus"></i></button></a>
					</div> 
				</c:if>
				<table class="table" id="oi">
					<thead>
						<tr>
						  <th>제목</th>
						  <th>중요도</th>
						  <th>시작일</th>
						  <th>종료일</th>
						</tr>
					</thead>
					<tbody>
					  <c:forEach var="s" items="${gSchedules}">
					  	<tr>
						    <td><a href = "view_GroupSchedule.do?seq=${s.seq}&g_num=${group.num}">${s.title}</a></td>
						    <c:if test="${s.important==3}">
						    	<td>상</td>
						    </c:if>
						    <c:if test="${s.important==2}">
						    	<td>중</td>
						    </c:if>
						    <c:if test="${s.important==1}">
						    	<td>하</td>
						    </c:if>
						    <td>${s.start_date}</td>
						    <td>${s.finish_date}</td>
					  	</tr>
					  </c:forEach>
					</tbody>
				</table>
			</div>
			<div id="container" class="col-md-2"></div>    
		</div>
	</div>
	<div>
		<jsp:include page="../default/footer.jsp" />
	</div>
</body>
</html>