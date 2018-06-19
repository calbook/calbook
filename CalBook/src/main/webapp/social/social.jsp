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
         url: "searchFriends.do",   
         type: "GET",
         data: {"searchSelect":$("#searchSelect").val(), "search":$("#search").val(), "searchNewFriends":$("#searchNewFriends").is(":checked")},
         contentType: "application/x-www-form-urlencoded; charset=UTF-8",
         error: function(jqXHR){
            alert(jqXHR.status);
            alert(jqXHR.statusText);
         },
         dataType: "json",
         success: function(resData){ 
            var checkNewFriends = $("#searchNewFriends").is(":checked");
            printData(resData, checkNewFriends);
         }
      });   
   });
   
   $(document).on("click", ".btnDelFriend", function(){
      $.ajax({
         url: "delFriendProc.do",   
         type: "GET",
         data: {"f_email":$(this).prev().val(), "searchSelect":$("#searchSelect").val(), "search":$("#search").val(), "searchNewFriends":$("#searchNewFriends").is(":checked")},
         error: function(jqXHR){
            alert(jqXHR.status);
            alert(jqXHR.statusText);
         },
         dataType: "json",
         success: function(resData){
            var checkNewFriends = $("#searchNewFriends").is(":checked");
            printData(resData, checkNewFriends);
         }
      });
   });
   
   $(document).on("click", ".btnAddFriend", function(){
      $.ajax({
         url: "AddFriendProc.do",   
         type: "GET",
         data: {"f_email":$(this).prev().val(), "searchSelect":$("#searchSelect").val(), "search":$("#search").val()},
         error: function(jqXHR){
            alert(jqXHR.status);
            alert(jqXHR.statusText);
         },
         dataType: "json",
         success: function(resData){
            var checkNewFriends = true;
            printData(resData, checkNewFriends);
         }
      });
   });
   
   $(document).on("click", ".btnCancelFriend", function(){
      $.ajax({
         url: "CancelFriendProc.do",   
         type: "GET",
         data: {"f_email":$(this).prev().val(), "searchSelect":$("#searchSelect").val(), "search":$("#search").val()},
         error: function(jqXHR){
            alert(jqXHR.status);
            alert(jqXHR.statusText);
         },
         dataType: "json",
         success: function(resData){
            var checkNewFriends = true;
            printData(resData, checkNewFriends);
         }
      });
   });
   
   $(document).on("click", ".btnSignOutGroup", function(){
       $.ajax({
          url: "SignOutGroupProc.do",   
          type: "GET",
          data: {"g_num":$(this).prev().val()},
          error: function(jqXHR){
             alert(jqXHR.status);
             alert(jqXHR.statusText);
          },
          dataType: "json",
          success: function(resData){
        	  var groupList = resData;
        	  getGroupMembers(groupList);
          }
       });
    });
   
   $(document).on("click", ".btnRemoveGroup", function(){
	   $.ajax({
	        url: "RemoveGroupProc.do",   
	        type: "GET",
	        data: {"g_num":$(this).prev().val()},
	        error: function(jqXHR){
	           alert(jqXHR.status);
	           alert(jqXHR.statusText);
	        },
	        dataType: "json",
	        success: function(resData){
	        	var groupList = resData;
	        	getGroupMembers(groupList);
	        }
	     });
    });
});
   
   
// 친구 리스트 출력
function printData(resData, checkNewFriends){
	var s='';
	if(checkNewFriends == true){
	   if(resData == null){
	      s += '<br><h3 style="color:white; text-align:center;">조회된 친구가 없습니다.</h3>';
	   }else{
		  s += '<figure class="snip1157">';
		  if(resData['profile'] == null){
			  s += '<img src="../images/profile.jpg" alt="sq-sample3" />';
		  }else{
			  s += '<img src="upload/'+resData['profile']+'" alt="sq-sample3" />';
		  }
	      s += '<div class="author"><h5><span style="font-size: 17px;">';
	      s += resData['nick']+'</span><br><span>'+resData['email']+'</span></h5><input class="email" type="hidden" name="f_email" value="'+resData['email']+'" />';
	      if(resData['relation']==3){
	         s += '<button class="btnAddFriend" type="button"><i class="fa fa-plus"></i></button>';
	      }else if(resData['relation']==1){
	         s += '<button class="btnDelFriend" type="button"><i class="fa fa-minus"></i></button>';
	      }else if(resData['relation']==0){
	         s += '<button class="btnCancelFriend" type="button"><i class="fa fa-close"></i></button>';
	      }
	      s += '<a href="individual_page.do?cEmail='+resData['email']+'"><button type="button"><i class="fa fa-home"></i></button></a></div></figure>';
	   }
	}else if(checkNewFriends == false){
	   for(var i in resData){
		  s += '<figure class="snip1157">';
		  if(resData[i]['profile'] == null){
			  s += '<img src="../images/profile.jpg" alt="sq-sample3" />';
		  }else{
			  s += '<img src="upload/'+resData[i]['profile']+'" alt="sq-sample3" />';
		  }
	      s += '<div class="author"><h5><span style="font-size: 17px;">';
	      s += resData[i]['nick']+'</span><br><span>'+resData[i]['email']+'</span></h5><input class="email" type="hidden" name="f_email" value="'+resData[i]['email']+'" />';
	      s += '<button class="btnDelFriend" type="button"><i class="fa fa-minus"></i></button><a href="individual_page.do?cEmail='+resData[i]['email']+'"><button type="button"><i class="fa fa-home"></i></button></a></div></figure>';
	   }
	}
	$("#scroll").empty();
	$("#scroll").append(s);
}

function getGroupMembers(groupList){
	$.ajax({
        url: "getGroupMembers.do",   
        type: "GET",
        data: {},
        error: function(jqXHR){
           alert(jqXHR.status);
           alert(jqXHR.statusText);
        },
        dataType: "json",
        success: function(resData){
       	var myEmail = $('#myEmail').val()
           printData4(groupList, resData, myEmail);
        }
     });
}

/* group list 출력 */
function printData4(groupList, resData, myEmail){
	var s='<div class="adr-article-container"><div id="group" style="max-width: 500px;">';
	
	for(var i in groupList){
		s += '<div class="box acco"><img class="ico-accordion" src="http://via.placeholder.com/45x45" /><span class="accordion-title">'+groupList[i]["name"]+'</span></div>';
		s += '<div class="contenuto" id="contenuto1"><div class="row"><div class="column middle">';
		s += '<h1>'+groupList[i]["name"]+'</h1><h3>'+groupList[i]["content"]+'</h3><div class="groupMemberDiv"><table class="groupMemberTable"><tr><th>모임 멤버 <i class="fa fa-group"></i></th></tr>';
			for(var j in resData){
				if(resData[j]['g_num']==groupList[i]['num']){
					if(resData[j]['email']==groupList[i]['owner']){
						s += '<tr><td>'+resData[j]['nick']+' <i class="fa fa-fort-awesome"></i></td></tr>';
					}else if(resData[j]['email']!=groupList[i]['owner']){
						s += '<tr><td>'+resData[j]['nick']+'</td></tr>';
					}
				}
				
			}
		s += '</table></div></div>';
		s += '<div class="column oneside"><input type="hidden" name="g_num" value="'+groupList[i]["num"]+'">';
	 
			if(groupList[i]['owner'] != myEmail){
				s += '<button class="faBtn btnSignOutGroup" type="button"><i class="fa fa-sign-out"></i></button><a href="group_schedule.do?g_num='+groupList[i]["num"]+'"><button class="faBtn" type="button"><i class="fa fa-home"></i></button></a>';
			}else if(groupList[i]['owner'] == myEmail){
				s += '<button class="faBtn btnRemoveGroup" type="button"><i class="fa fa-sign-out"></i></button><a href="editGroups.do?g_num='+groupList[i]["num"]+'"><button class="faBtn" type="button"><i class="fa fa-edit"></i></button></a><a href="group_schedule.do?g_num='+groupList[i]["num"]+'"><button class="faBtn" type="button"><i class="fa fa-home"></i></button></a>';
			}
		s += '</div></div></div>';
		}
		s += '</div></div>';
	
	$('#groupsScroll').empty();
	$('#groupsScroll').append(s);
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
   width: 40%;
}

/* Middle column */
.column.middle {
    width: 60%;
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
  min-width: 640px;
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
  width: 40%;
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
   width: 100%;
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
   font-size: 14px;
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
 .friendModal-content {
		background-color: black;
		margin: 10% auto; /* 10% from the top and centered */
		padding: 20px;
		border: 1px solid #888;
		width: 60%;
		height: 80%; /* Could be more or less, depending on screen size */
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
      width: 100%;
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
	width:33.33%;
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
    display: block;
    height:80%;
    padding: 6px 12px;
   /*  border: 1px solid #ccc; */
    border-top: none;
}

.acceptedG, .apply{
	display: none;
}

.friendModal_scroll{
   width: 100%;
   height: 100%;
   overflow: auto;
}
/* 모달 안 tab css  */

@media (max-width: 1100px) {
	 .friendModal-content {
		background-color: black;
		margin: 10% auto; /* 10% from the top and centered */
		padding: 20px;
		border: 1px solid #888;
		width: 60%;
		height: 80%; /* Could be more or less, depending on screen size */
	}
}

/* 모달 css  */


/* group css */

.move{
	color: white;
    font-size: 20px;
    font-weight: bold;
}

.form{
	 background: transparent;
	 border: 1px solid #f0f0f0;
	 border-radius: 0px;
	 box-shadow: none;
	 font-size: 16px;
	 margin-bottom: 16px;
	 transition: all 0.4s ease-in-out;
	 
	 height:50px;
	 color: white;
}

#groupclosebtn { 
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
   float:right;
}

.groupMemberTable{
	width: 100%;
}
.groupMemberTable tr th{
	text-align: left;
	border-bottom: 1px solid #ffffff;
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
	
		<!-- FRIEND -->
		<div class="column half">
			<h1 class="menuTitle">FRIEND</h1>
       
			<div class="search-box">
				<select id="searchSelect" class="searchSelect" name="searchSelect">
					<option value="EMAIL">Email</option>
					<option value="NICK">Nick</option>
					<!-- <option value="PHONE">Phone</option> -->
				</select>
				<input id="search" class="search" placeholder="Search" autocomplete="off"/>
				<button id="btnSearch" class="new"><span><i class="fa fa-search"></i></span></button>
				<button id ="btnBell" class="new"><span><i class="fa fa-bell"></i></span></button>
				<c:if test="${!empty ckNewFriend}">
					<button class="new"><span><input id="searchNewFriends" type="checkbox" name="searchNewFriends"  checked="checked"><i class="fa fa-user-plus"></i></span></button>
				</c:if>
				<c:if test="${empty ckNewFriend}">
					<button class="new"><span><input id="searchNewFriends" type="checkbox" name="searchNewFriends"><i class="fa fa-user-plus"></i></span></button>
				</c:if>
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
						<%-- <h5>${m.nick}<br><span>${m.email}</span></h5> --%>
							<h5><span style="font-size: 17px;">${m.nick}</span><br><span>${m.email}</span></h5>
							<input class="email" type="hidden" name="f_email" value="${m.email}" />
							<button class="btnDelFriend" type="button"><i class="fa fa-minus"></i></button>
							<a href="individual_page.do?cEmail=${m.email}"><button type="button"><i class="fa fa-home"></i></button></a>
						</div>
					</figure>
				</c:forEach>
			</div>
		</div>
    
		<!-- friends Modal -->
		<div id="friendModal" class="friendModal">
			<!-- Modal content -->
			<div class="friendModal-content">
				<div class="friendModal_tab">
				<button class="friendModal_tablinks active" onclick="openCity(event, 'accepted')" id="defaultOpen acceptedFriends">신청 받은 친구 목록</button>
				<button class="friendModal_tablinks" onclick="openCity(event, 'apply')" id="applyFriends">신청 한 친구 목록</button>
				<button class="friendModal_tablinks" onclick="openCity(event, 'acceptedG')" id="acceptedGroups">초대 받은 모임 목록</button>
				</div>
				
				<div id="accepted" class="friendModal_tabcontent">
					<div id="acceptedFriendModal_scroll" class="friendModal_scroll">
					<c:forEach var="m" items="${acceptedFriends}">
						<figure class="snip1157">
						<c:if test="${m.profile == null }">
							<img src="../images/profile.jpg" alt="sq-sample3" />
						</c:if>
						<c:if test="${m.profile != null }">
							<img src="upload/${m.profile}" alt="sq-sample3" />
						</c:if>
						<div class="author">
							<h5><span style="font-size: 17px;">${m.nick}</span><br><span>${m.email}</span></h5>
							<input class="email" type="hidden" name="f_email" value="${m.email}" />
							<button class="btnModalAcceptFriend" type="button"><i class="fa fa-check-circle-o"></i></button>
							<button class="btnModalRefuseFriend" type="button"><i class="fa fa-close"></i></button>
						</div>
						</figure>
					</c:forEach>
					</div>
				</div>
				
				<div id="apply" class="friendModal_tabcontent apply">
					<div id="applyFriendModal_scroll" class="friendModal_scroll">
					</div>
				</div>
				
				<div id="acceptedG" class="friendModal_tabcontent acceptedG">
					<div id="acceptedGroupsModal_scroll" class="friendModal_scroll">
					</div>
				</div>
				
				<a href="social.do"><span class="close">close</span></a>
			</div>
		</div>
		<!-- friends Modal end -->
		<!-- FRIEND end -->
    
   
		<!-- GROUP -->
		<div class="column half">
			<h1 class="menuTitle">GROUP</h1>
	       
			<div class="search-box">
				<button class="group" id="newGroup">New Group</button>
			</div>
		      
			<div id="createGroup"></div>
			<input type="hidden" id="myEmail" value="${email}" />
			
			<div id="groupsScroll" class="scroll center">
				<div class="adr-article-container">
					<div id="group" style="max-width: 500px;">
						<!-- ACCORDION-->
						<c:forEach var="g" items="${groups}" >
							<div class="box acco">
								<img class="ico-accordion" src="http://via.placeholder.com/45x45" />
								<span class="accordion-title">${g.name}</span>
							</div>
							<div class="contenuto" id="contenuto1">
								<div class="row">
									<div class="column middle">
										<h1>${g.name}</h1>
										<h3>${g.content}</h3>
										<div class="groupMemberDiv">
											<table class="groupMemberTable">
												<tr><th>모임 멤버 <i class="fa fa-group"></i></th></tr>
												<c:forEach var="gm" items="${groupMembers}">
												
													<c:if test="${gm.g_num == g.num}">
														<c:if test="${gm.email == g.owner}">
															<tr><td>${gm.nick} <i class="fa fa-fort-awesome"></i></td></tr>
														</c:if>
														<c:if test="${gm.email != g.owner}">
															<tr><td>${gm.nick}</td></tr>
														</c:if>
													</c:if>
												</c:forEach>
											</table>
										</div>
									</div>
									
									<div class="column oneside">
										<input type="hidden" name="g_num" value="${g.num}">
										<c:if test="${g.owner != email }">
											<button class="faBtn btnSignOutGroup" type="button"><i class="fa fa-sign-out"></i></button>
											<a href="group_schedule.do?g_num=${g.num}"><button class="faBtn" type="button"><i class="fa fa-home"></i></button></a>
										</c:if>	                      	
										<c:if test="${g.owner == email}">
											<button class="faBtn btnRemoveGroup" type="button"><i class="fa fa-sign-out"></i></button>
											<a href="editGroups.do?g_num=${g.num}"><button class="faBtn" type="button"><i class="fa fa-edit"></i></button></a>
                                 			<a href="group_schedule.do?g_num=${g.num}"><button class="faBtn" type="button"><i class="fa fa-home"></i></button></a>
										</c:if>
									</div>
								</div>
							</div>
						</c:forEach>  
						<!-- ACCORDION-->
					</div>
				</div>
			</div>
	    </div>
	    <!-- GROUP end -->
	</div>
  
	<div class="column side"></div>
</div>

<div>
   <jsp:include page="../default/footer.jsp" />
</div>
 
<script>
/* accordion */
$(document).ready(function() {
	 $(document).on("click", "div.acco", this, function(){
      	$(this).next().slideToggle("fast").addClass("view_content");
      	$(this).toggleClass("position_barra");
      });
});
</script>


<script>
/* make a new Group form */
$("#newGroup").click(function(){
   var newGroup = $('<form action="createGroup.do" method="post" autocomplete="off"><div class="newGroup"><h1>모임 생성<button type="button" id="groupclosebtn"><i class="fa fa-close"></i></button></h1><span>모임명</span><input name="name" type="text"><span>내용</span><input name="content" type="text"/><br><br><input class = "form" type = "submit" value = "모임생성 후 멤버초대 하러가기"></div></form>');
  
   $("#createGroup").empty();
   $("#createGroup").prepend(newGroup);
});
</script>

<!-- modal 안 tab script  -->
<script>
function openCity(evt, category) {
    var i, tabcontent, tablinks;
    friendModal_tabcontent = document.getElementsByClassName("friendModal_tabcontent");
    
    for (i = 0; i < friendModal_tabcontent.length; i++) {
		friendModal_tabcontent[i].style.display = "none";
    }
    
    friendModal_tablinks = document.getElementsByClassName("friendModal_tablinks");
    for (i = 0; i < friendModal_tablinks.length; i++) {
       friendModal_tablinks[i].className = friendModal_tablinks[i].className.replace(" active", "");
    }
    document.getElementById(category).style.display = "block";
    evt.currentTarget.className += " active";
}

//Get the element with id="defaultOpen" and click on it
// document.getElementById("defaultOpen").click();
</script>

<!-- modal script  -->
<script>
//Get the modal
// var modal1 = document.getElementById('friendModal');

// Get the button that opens the modal
// var btn1 = document.getElementById("btnBell");

// Get the <span> element that closes the modal
/* var span1 = document.getElementsByClassName("close")[0]; */

// When the user clicks on the button, open the modal 
/* btn1.onclick = function() {
	$("#acceptedFriends").trigger('click');
	modal1.style.display = "block";
}
 */

$(function(){
	$(document).on("click", "#btnBell", function(){
// 	$('#btnBell').click(function(){
		$('#friendModal').css({
			"display":"block"
		});
// 		$('#acceptedFriends').trigger('click');
		$('#acceptedFriends').show();
// 	});
	});
	$(document).on("click", "#groupclosebtn", function(){
		$("#createGroup").empty();
	});
	
	$('#acceptedFriends').click(function(){
		$.ajax({
	        url: "getAcceptedFriends.do",   
	        type: "GET",
	        data: {},
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error: function(jqXHR){
	           alert(jqXHR.status);
	           alert(jqXHR.statusText);
	        },
	        dataType: "json",
	        success: function(resData){ 
	           printData1(resData);
	        }
	     });
	});
   
   $('#applyFriends').click(function(){
      $.ajax({
         url: "getApplyFriends.do",   
         type: "GET",
         data: {},
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
   
   $('#acceptedGroups').click(function(){
      $.ajax({
         url: "getAcceptedGroups.do",   
         type: "GET",
         data: {},
         contentType: "application/x-www-form-urlencoded; charset=UTF-8",
         error: function(jqXHR){
            alert(jqXHR.status);
            alert(jqXHR.statusText);
         },
         dataType: "json",
         success: function(resData){ 
            printData3(resData);
         }
      });   
   });
   
   $(document).on("click", ".btnModalCancelFriend", function(){
      $.ajax({
         url: "ModalCancelFriendProc.do",   
         type: "GET",
         data: {"f_email":$(this).prev().val()},
         error: function(jqXHR){
            alert(jqXHR.status);
            alert(jqXHR.statusText);
         },
         dataType: "json",
         success: function(resData){
            var checkNewFriends = true;
            printData2(resData);
         }
      });
   });
   
   $(document).on("click", ".btnModalAcceptFriend", function(){
      $.ajax({
         url: "ModalAcceptFriendProc.do",   
         type: "GET",
         data: {"f_email":$(this).prev().val()},
         error: function(jqXHR){
            alert(jqXHR.status);
            alert(jqXHR.statusText);
         },
         dataType: "json",
         success: function(resData){
            var checkNewFriends = true;
            printData1(resData);
         }
      });
   });
   
   $(document).on("click", ".btnModalRefuseFriend", function(){
      $.ajax({
         url: "ModalRefuseFriendProc.do",   
         type: "GET",
         data: {"f_email":$(this).prev().prev().val()},
         error: function(jqXHR){
            alert(jqXHR.status);
            alert(jqXHR.statusText);
         },
         dataType: "json",
         success: function(resData){
            var checkNewFriends = true;
            printData1(resData);
         }
      });
   });
   
   $(document).on("click", ".btnModalAcceptGroup", function(){
      $.ajax({
         url: "ModalAcceptGroupProc.do",   
         type: "GET",
         data: {"g_num":$(this).prev().val()},
         error: function(jqXHR){
            alert(jqXHR.status);
            alert(jqXHR.statusText);
         },
         dataType: "json",
         success: function(resData){
            var checkNewFriends = true;
            printData3(resData);
         }
      });
   });
   
   $(document).on("click", ".btnModalRefuseGroup", function(){
      $.ajax({
         url: "ModalRefuseGroupProc.do",   
         type: "GET",
         data: {"g_num":$(this).prev().prev().val()},
         error: function(jqXHR){
            alert(jqXHR.status);
            alert(jqXHR.statusText);
         },
         dataType: "json",
         success: function(resData){
            var checkNewFriends = true;
            printData3(resData);
         }
      });
   });
});

/* modal get accepted friend list */
function printData1(resData){
	var s='';
	for(var i in resData){
		s += '<figure class="snip1157">';
		if(resData[i]['profile']==null){
			s += '<img src="../images/profile.jpg" alt="sq-sample3" />';
		}else{
			s += '<img src="upload/'+resData[i]['profile']+'" alt="sq-sample3" />';
		}
		s += '<div class="author"><h5><span style="font-size: 17px;">';
		s += resData[i]['nick']+'</span><br><span>'+resData[i]['email']+'</span></h5><input class="email" type="hidden" name="f_email" value="'+resData[i]['email']+'" />';
		s += '<button class="btnModalAcceptFriend" type="button"><i class="fa fa-check-circle-o"></i></button><button class="btnModalRefuseFriend" type="button"><i class="fa fa-close"></i></button></div></figure>';
	}
	$("#acceptedFriendModal_scroll").empty();
	$("#acceptedFriendModal_scroll").append(s);
}

/* modal get apply friend list  */
function printData2(resData){
	var s='';
	for(var i in resData){
		s += '<figure class="snip1157">';
		if(resData[i]['profile']==null){
			s += '<img src="../images/profile.jpg" alt="sq-sample3" />';
		}else{
			s += '<img src="upload/'+resData[i]['profile']+'" alt="sq-sample3" />';
		}
		s += '<div class="author"><h5><span style="font-size: 17px;">';
		s += resData[i]['nick']+'</span><br><span>'+resData[i]['email']+'</span></h5><input class="email" type="hidden" name="f_email" value="'+resData[i]['email']+'" />';
		s += '<button class="btnModalCancelFriend" type="button"><i class="fa fa-close"></i></button></div></figure>';
	}
	$("#applyFriendModal_scroll").empty();
	$("#applyFriendModal_scroll").append(s);
}

/* modal get accepted group list  */
function printData3(resData){
	var s='';
	for(var i in resData){
		s += '<figure class="snip1157">';
		if(resData[i]['profile']==null){
			s += '<img src="http://via.placeholder.com/45x45" />';
		}else{
			s += '<img src="upload/'+resData[i]['profile']+'" alt="sq-sample3" />';
		}
		s += '<div class="author"><h5><span style="font-size: 17px;">';
		s += resData[i]['name']+'</span><br><span>'+resData[i]['content']+'</span></h5><input class="email" type="hidden" name="g_num" value="'+resData[i]['num']+'" />';
		s += '<button class="btnModalAcceptGroup" type="button"><i class="fa fa-check-circle-o"></i></button><button class="btnModalRefuseGroup" type="button"><i class="fa fa-close"></i></button></div></figure>';
	}
	$("#acceptedGroupsModal_scroll").empty();
	$("#acceptedGroupsModal_scroll").append(s);
}

function acceptedFriends(){
	$.ajax({
        url: "getAcceptedFriends.do",   
        type: "GET",
        data: {},
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        error: function(jqXHR){
           alert(jqXHR.status);
           alert(jqXHR.statusText);
        },
        dataType: "json",
        success: function(resData){ 
           printData1(resData);
        }
     }); 
}
</script>


</body>
</html>