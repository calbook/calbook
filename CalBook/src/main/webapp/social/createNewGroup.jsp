<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>CSS Website Layout</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="footer, address, phone, icons" />
<link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#btnSearch').click(function(){
			$.ajax({
				url: "getSearchGroupFriends.do",   
				type: "GET",
				data: {"g_num":$("#g_num").val(), "searchSelect":$("#searchSelect").val(), "search":$("#search").val()},
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				error: function(jqXHR){
					alert(jqXHR.status);
					alert(jqXHR.statusText);
				},
				dataType: "json",
				success: function(resData){ 
					printData2(resData);
				}
			});	
		});
		
		
		$(document).on("click", ".btnCheckGroupM", function(){
	         $.ajax({
	            url: "addGroupMember.do",   
	            type: "GET",
	            data: {"f_email":$(this).prev().val(), "g_num":$("#g_num").val()},
	            error: function(jqXHR){
	               alert(jqXHR.status);
	               alert(jqXHR.statusText);
	            },
	            dataType: "json",
	            success: function(resData){
	               printData(resData);
	            }
	         });
	      });
		
		
		$(document).on("click", ".btnCancelGroupM", function(){
	         $.ajax({
	            url: "cancelGroupMember.do",   
	            type: "GET",
	            data: {"f_email":$(this).prev().val(), "g_num":$("#g_num").val()},
	            error: function(jqXHR){
	               alert(jqXHR.status);
	               alert(jqXHR.statusText);
	            },
	            dataType: "json",
	            success: function(resData){
	               printData(resData);
	            }
	         });
	      });
	});
	
	function printData(resData){
		var s='';
		var s2= '';
		for(var i in resData){
			s += '<figure class="snip1157">';
			if(resData[i]['profile'] == null){
				s += '<img src="../images/profile.jpg" alt="sq-sample3" />';
			}else{
				s += '<img src="upload/'+resData[i]['profile']+'" alt="sq-sample3" />';
			}
			s += '<div class="author"><h5><span style="font-size: 17px;">';
			s += resData[i]['nick']+'</span><br><span>'+resData[i]['email']+'</span></h5><input class="email" type="hidden" name="f_email" value="'+resData[i]['email']+'" />';
			
			if(resData[i]['status_accept']==0 && resData[i]['g_num']==$("#g_num").val()){
				s += '<button class="btnCancelGroupM" type="button"><i class="fa fa-close"></i></button></div></figure>';
				s2 += '<span>'+resData[i]['email']+'</span>';
			}else{
				s += '<button class="btnCheckGroupM" type="button"><i class="fa fa-check-circle-o"></i></button></div></figure>';
			}
		}
		$("#scroll").empty();
		$("#scroll").append(s);
		
		$("#groupMemberDiv").empty();
		$("#groupMemberDiv").append(s2);
		
		
	}
	
	function printData2(resData){
		var s='';
		
		for(var i in resData){
			s += '<figure class="snip1157">';
			if(resData[i]['profile'] == null){
				s += '<img src="../images/profile.jpg" alt="sq-sample3" />';
			}else{
				s += '<img src="upload/'+resData[i]['profile']+'" alt="sq-sample3" />';
			}
			s += '<div class="author"><h5><span style="font-size: 17px;">';
			s += resData[i]['nick']+'</span><br><span>'+resData[i]['email']+'</span></h5><input class="email" type="hidden" name="f_email" value="'+resData[i]['email']+'" />';
			if(resData[i]['status_accept']==0 && resData[i]['g_num']==$("#g_num").val()){
				s += '<button class="btnCancelGroupM" type="button"><i class="fa fa-close"></i></button></div></figure>';
			}else{
				s += '<button class="btnCheckGroupM" type="button"><i class="fa fa-check-circle-o"></i></button></div></figure>';
			}
		}
		$("#scroll").empty();
		$("#scroll").append(s);
		
	}
	
	
	
	
</script>
<style>
* {
    box-sizing: border-box;
}

body {
   margin: 0;
   background: url("../images/background/social_background.png") no-repeat center;
   background-size: cover;
}

/* Create three unequal columns that floats next to each other */
.column {
    float: left;
    padding: 10px;
}

/* Left and right column */
.column.side {
    width: 15%;
}

.column.oneside {
	width: 30%;
}

/* Middle column */
.column.middle {
    width: 70%;
}

/* Half column */
.column.half {
	width: 50%;
	padding: 30px;
}

.scroll {
	width: 100%;
	height: 900px;
	overflow: auto;
}

.center {
	margin: 0 10%;
}

/* width */
::-webkit-scrollbar {
    width: 10px;
}

/* Track */
::-webkit-scrollbar-track {
    background: #888; 
}
 
/* Handle */
::-webkit-scrollbar-thumb {
    background: #f1f1f1; 
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
    background: #555; 
}


/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}


.menuTitle {
	color: white;
	text-align: center;
	font-size: 50px;
	font-style: bold;
	border-bottom: 1px solid #FFFFFF;
	padding-bottom: 20px;
}

/* start of searchBar */
.search-box {
  max-width: 640px;
  position: relative;
  margin: auto;
  display: inline;
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

.searchSelect{
	height: 50px;
	padding: 0 10px;
	border-radius: 50px;
	transition: 0.3s;
	border: 2px solid #ddd;
	background: none;
	color: #fff;
	font-size: 18px;
}

.searchSelect option{
	background-color: #343436;
}

.search {
  height: 50px;
  width: 65%;
  padding: 5px 15px;
  border-radius: 50px;
  transition: 0.3s;
  border: 2px solid #ddd;
  background: none;
  color: #fff;
  font-size: 18px;
}

.group {
  height: 50px;
  width: 75%;
  padding: 5px 15px;
  margin: 0 15%;
  border-radius: 50px;
  transition: 0.3s;
  border: 2px solid #ddd;
  outline: none;
  background: none;
  color: #fff;
  font-size: 18px;
  cursor: pointer;
}

.group:HOVER {
  background: #FFFFFF;
  color: #ddd;
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
  color: #fff;
  font-size: 18px;
  cursor: pointer;
}

.new:HOVER {
  background: #FFFFFF;
  color: #ddd;
  outline: none;
  box-shadow: 0 0 0 3px #ddd;
}

.search:focus {
  outline: none;
  box-shadow: 0 0 0 3px #ddd;
}

/* end of SearchBar */



/* start of profile */

@import url(https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css);
@import url(https://fonts.googleapis.com/css?family=Raleway:400,800);
figure.snip1157 {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  float: left;
  overflow: hidden;
  margin: 10px 1%;
  /* margin: auto; */
  min-width: 220px;
  max-width: 400px;
  width: 100%;
  color: #333;
  text-align: left;
  box-shadow: none !important;
}
figure.snip1157 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.35s cubic-bezier(0.25, 0.5, 0.5, 0.9);
  transition: all 0.35s cubic-bezier(0.25, 0.5, 0.5, 0.9);
}
figure.snip1157 img {
  max-width: 100%;
  vertical-align: middle;
  height: 90px;
  width: 90px;
  border-radius: 50%;
  margin: 40px 0 0 10px;
}
figure.snip1157 blockquote {
  display: block;
  border-radius: 8px;
  position: relative;
  background-color: #fafafa;
  padding: 25px 50px 30px 50px;
  font-size: 0.8em;
  font-weight: 500;
  margin: 0;
  line-height: 1.6em;
  font-style: italic;
}
figure.snip1157 blockquote:before,
figure.snip1157 blockquote:after {
  font-family: 'FontAwesome';
  content: "\201C";
  position: absolute;
  font-size: 50px;
  opacity: 0.3;
  font-style: normal;
}
figure.snip1157 blockquote:before {
  top: 25px;
  left: 20px;
}
figure.snip1157 blockquote:after {
  content: "\201D";
  right: 20px;
  bottom: 0;
}
figure.snip1157 .arrow {
  top: 100%;
  width: 0;
  height: 0;
  border-left: 0 solid transparent;
  border-right: 25px solid transparent;
  border-top: 25px solid #fafafa;
  margin: 0;
  position: absolute;
}
figure.snip1157 .author {
  position: absolute;
  bottom: 45px;
  padding: 0 10px 0 120px;
  margin: 0;
  text-transform: uppercase;
  color: #ffffff;
  -webkit-transform: translateY(50%);
  transform: translateY(50%);
}
figure.snip1157 .author h5 {
  opacity: 0.8;
  margin: 0;
  font-weight: 800;
  display: inline;
}
figure.snip1157 .author h5 span {
  font-weight: 400;
  text-transform: none;
  padding-left: 5px;
}

figure.snip1157 button {
	background-color: Transparent;
	background-repeat: no-repeat;
	border: none;
	outline: none;
	margin: 0 0 0 20px;
	cursor: pointer;
	width: 35px;
	height: 35px;
	font-size: 30px;
	color: #7F8283;
}

figure.snip1157 button:HOVER {
	color: #FFFFFF;
}

.checked {
	/* background-image: url("../images/checked.png"); */
}

.unchecked {
	/* background-image: url("../images/unchecked.png"); */
}

.delete {
	/* background-image: url("../images/delete.png"); */
	font-size: 30px;
	color: #7F8283;
}

.add {
	/* background-image: url("../images/add.png"); */
}

.home {
	/* background-image: url("../images/home.png"); */
}

/* end of profile */



/* start of newGroup */

.newGroup {
	background-color: transparent;
	border-radius: 50px;
	border: 3px solid #ddd;
	width: 95%;
	margin: auto;
	margin-top: 25px;
	margin-bottom: 25px;
	padding: 30px;
}

.newGroup h1 {
	color: #ddd;
	margin: 0px;
	text-align: center;
}

.newGroup span {
	color: #ddd;
	padding: 10px;
	font-style: bold;
	display: block;
}

.newGroup input {
	opacity: 0.7;
	width: 100%;
	padding: 5px;
	font-size: 30px;
}

.newGroup input:FOCUS {
	outline: none;
}

/* end of newGroup */




/* start of accordion */
.accordion-header {
	background-color: #0057a7;
    color: #FFFFFF;
    padding: 15px 10px;
    font-family: Arial;
    font-size: 17px;
    font-weight: bold;
}

.box {
    background: url('http://resources.dnsee.com/Sprite_accordion.png') no-repeat top right Transparent;
    cursor: pointer;
    padding: 10px;
    position: relative;
    margin-top: 10px;
}

.ico-accordion {
    width: 45px;
    height: 45px;
}

.accordion-title {
    position: absolute;
    color: #ffffff;
    font-family: Arial;
    font-size: 13px;
    font-weight: 800;
    padding: 15px 40px 0 20px;
}

.position_barra {
    background-position: bottom right!important;
}

.contenuto {
    display: none;
    background-color: transparent;
    padding: 0 10px 10px;
    color: #FFFFFF;
}

.contenuto-bianco {
    background-color: transparent;
    padding: 25px 20px;
}

.accordion-subtitle {
    color: #ffffff;
    font-family: Arial;
    font-size: 17px;
    font-weight: bold;
    padding-bottom: 15px;
    display: block;
}

.accordion-text {
    color: #ffffff;
    font-family: Arial;
    font-size: 15px;
    line-height: 22px;
    display: block;
}


.view_content {
    display: block;
}

.faBtn {
	background-color: Transparent;
	background-repeat: no-repeat;
	border: none;
	outline: none;
	cursor: pointer;
	margin: 0 0 0 10px;
	width: 35px;
	height: 35px;
	font-size: 30px;
	color: #7F8283;
}

.faBtn:HOVER {
	color: #FFFFFF;
}

@media (max-width: 640px) {
 .accordion-title {
    font-size: 11px;
    line-height: 16px;
    font-weight: bold;
    padding: 0px 40px 0 20px;
 }
}
/* end of accordion */

/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media screen and (max-width: 1500px) {
    .column.side, .column.middle {
        width: 100%;
    }
}

/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media screen and (max-width: 1290px) {
	.newGroup {
		width: 80%;
		margin: 0 2%;
		margin-top: 25px;
		margin-bottom: 25px;
	}
}

/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media screen and (max-width: 1100px) {
    .new {
    	width: 10%;
    	padding: 0;
    }
}




/* 모달 css */
/* The Modal (background) */
.friendModal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.friendModal-content {
  /*  background: url("../images/modal_schedule.jpg"); */
   /*  background-color: #fefefe; */
   background-color: black;
    margin: 10% auto; /* 10% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    width: 40%;
    height: 65%; /* Could be more or less, depending on screen size */
    
}

/* The Close Button */
.close {
    color: white;
    font-size: 25px;
    font-weight: bold;
    float: right; 
    width: 10%;
    margin-left: 10%;
    /* margin-bottom: 50px;  */
}

.close:hover,
.close:focus {
    color: gray;
    text-decoration: none;
    cursor: pointer;
}

/* 모달 안 tab css  */
/* Style the tab */
.friendModal_tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.friendModal_tab button {
	width:50%;
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
}

/* Change background color of buttons on hover */
.friendModal_tab button:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
.friendModal_tab button.active {
    background-color: #ccc;
}

/* Style the tab content */
.friendModal_tabcontent {
    display: none;
    height:80%;
    padding: 6px 12px;
   /*  border: 1px solid #ccc; */
    border-top: none;
}

.friendModal_scroll{
	width: 100%;
	height: 100%;
	overflow: auto;
}
/* 모달 안 tab css  */

/* 모달 css  */


/* 그룹 페이지이동 CSS */

.move{
	color: white;
    font-size: 13px;
    font-weight: bold;
    float : right;
}

.btnList{
	width: 80%;
}

</style>
</head>
<body>
<div>
   <jsp:include page="../default/navbar.jsp" />
</div>

<div class="row">
  <div class="column side"></div>
  
  <div class="column middle">  
    <div class="column half">
    	<h1 class="menuTitle">FRIEND</h1>
    	
    	<div class="search-box">
    		<select id="searchSelect" class="searchSelect" name="searchSelect">
    			<option value="EMAIL">Email</option>
    			<option value="NICK">Nick</option>
    			<!-- <option value="PHONE">Phone</option> -->
    		</select>
  			<input id="search" class="search" placeholder="Search"/>
  			<button id="btnSearch" class="new"><span><i class="fa fa-search"></i></span></button>
  			
		</div>
		
		<div id="scroll" class="scroll">
			<c:forEach var="m" items="${friends}">
				<figure class="snip1157">
		  			<c:if test="${m.profile == null}">
						<img src="../images/profile.jpg" alt="sq-sample3" />
					</c:if>
					<c:if test="${m.profile != null}">
						<img src="upload/${m.profile}" alt="sq-sample3" />
					</c:if>
		  			<div class="author">
		    			<h5><span style="font-size: 17px;">${m.nick}</span><br><span>${m.email}</span></h5>
		    			<input class="email" type="hidden" name="f_email" value="${m.email}" />
		    			<button class="btnCheckGroupM" type="button"><i class="fa fa-check-circle-o"></i></button>
		  			</div>
				</figure>
			</c:forEach>
		 </div>
     </div>
	
    
	
    
    <!-- 	모임	-->    
    
    <div class="column half">
    	<h1 class="menuTitle">GROUP</h1>
		
		<div class="newGroup">
			<span>모임이 생성되었습니다. 멤버를 초대해주세요.</span>
			<h1>모임 멤버초대</h1>
			<span>모임명 : ${g.name}</span>
			<span>모임내용 : ${g.content}</span>
			<input type="hidden" id="g_num" name="g_num" value="${g.num}">
			<div style="height:300px;">
				<span>멤버</span>
				<div id="groupMemberScroll" class="scroll">
					<span>${g.owner}   
						<i class="fa fa-fort-awesome"></i>
					</span>
					<div id="groupMemberDiv">
					</div>
				</div>
			</div>
			
			<table class="btnList">
              <col style="width:47%;">
              <col style="width:6%;">
              <col style="width:47%;">
              <tr>
                 <td><a href="createGroupFinishProc.do?g_num=${g.num}"><span class = "move">멤버초대</span></a></td>
                 <td></td>
                 <td><a href="createGroupCancelProc.do?g_num=${g.num}"><span class = "move">멤버초대취소</span></a></td>
              </tr>
           	</table>
		</div>
    </div>
  </div>
  
  
  <div class="column side"></div>
 </div>


<div>
   <jsp:include page="../default/footer.jsp" />
</div>

</body>
</html>
