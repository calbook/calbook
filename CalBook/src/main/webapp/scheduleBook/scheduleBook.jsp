<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- googlemap -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBUsZlyBI_gQ8S_liz_WdZ6U2W2ooRwIoQ&libraries=places" async defer></script>
<!-- css -->
<link rel='stylesheet' href='../css/fullcalendar/fullcalendar.css' />
<link rel="stylesheet" href="../css/background.css">
<link rel="stylesheet" href="../css/calendar.css">
<link rel="stylesheet" href="../css/account.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Baloo|Ubuntu" rel="stylesheet">
<!-- jquery-ui -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- qtip -->
<script type="text/javascript" src="../js/jquery.qtip.custom/jquery.qtip.min.js"></script>
<!-- fullcalendar -->
<script src='../css/fullcalendar/lib/moment.min.js'></script>
<script src='../css/fullcalendar/fullcalendar.js'></script>
<script src='../js/scheduleBook.js'></script>

<style type="text/css">
.con {
	float: left;
	width: 55%;
	height: 100%;
}

.con2 {
	float: left;
	width: 45%;
	height: 100%;
}

.schedule, .account {
	width: 100%;
	height: 50%;
	/* 	min-width: 70vh; */
}

.row:after {
	content: "";
	display: table;
	clear: both;
}

.row {
	height: 80%;
}

@charset "UTF-8";

@import
	"https://fonts.googleapis.com/css?family=Montserrat:400,700|Raleway:300,400"
	;
/* colors */
/* tab setting */
/* breakpoints */
/* selectors relative to radio inputs */

/* 전체크기 */
.tabs {
	left: 50%;
	-webkit-transform: translateX(-50%);
	transform: translateX(-50%);
	position: relative;
	/*   background: white;  */
	padding: 10px;
	/*   padding-bottom: 80px; */
	width: 90%;
	margin-left: 0;
	margin-right: 10%;
	height: 100%;
	/*    box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);  */
	box-shadow: 0 1px 7px rgba(0, 0, 0, 0.2);
	/*    border: 2px solid;  */
	/*    border-color: #a79c8e;   */
	border-radius: 5px;
	/* 	box-shadow: 1px 7px rgba(0,0,0,0.2); */
	/*   min-width: 250px; */
	background-color: #fcf9f9;
}

.tabs input[name="tab-control"] {
	display: none;
}

.tabs .content section h2, .tabs ul li label {
	font-family: "Montserrat";
	font-weight: bold;
	font-size: 100%;
	color: #616161;
}

.tabs ul {
	list-style-type: none;
	padding-left: 0;
	display: flex;
	flex-direction: row;
	margin-bottom: 10px;
	justify-content: space-between;
	align-items: flex-end;
	/*   flex-wrap: wrap; */
}

.tabs ul li {
	box-sizing: border-box;
	/*   flex: 1; */
	/*   width: 25%; */
	padding: 0 6%;
	text-align: center;
}

.tabs ul li label {
	transition: all 0.3s ease-in-out;
	color: #929daf;
	/*   padding: 5px auto; */
	flex-direction: row;
	overflow: hidden;
	text-overflow: ellipsis;
	display: block;
	cursor: pointer;
	transition: all 0.2s ease-in-out;
	white-space: nowrap;
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.tabs ul li label br {
	display: none;
}

.tabs ul li label:hover, .tabs ul li label:focus, .tabs ul li label:active
	{
	outline: 0;
	color: #bec5cf;
}

.tabs .slider {
	position: relative;
	width: 25%;
	transition: all 0.33s cubic-bezier(0.38, 0.8, 0.32, 1.07);
}

.tabs .slider .indicator {
	position: relative;
	width: 50px;
	max-width: 100%;
	margin: 0 auto;
	height: 4px;
	background: #616161;
	border-radius: 1px;
}

.tabs .content {
	margin-top: 3%;
}

.sCon {
	text-align: left;
	height: 80%;
}

.tabs .content section {
	display: none;
	-webkit-animation-name: content;
	animation-name: content;
	-webkit-animation-direction: normal;
	animation-direction: normal;
	-webkit-animation-duration: 0.3s;
	animation-duration: 0.3s;
	-webkit-animation-timing-function: ease-in-out;
	animation-timing-function: ease-in-out;
	-webkit-animation-iteration-count: 1;
	animation-iteration-count: 1;
	/*   line-height: 1.4; */
}

.tabs .content section h2 {
	color: #616161;
	display: none;
}

.tabs .content section h2::after {
	content: "";
	position: relative;
	display: block;
	width: 30px;
	height: 3px;
	background: #616161;
	margin-top: 5px;
	left: 1px;
}

.tabs input[name="tab-control"]:nth-of-type(1):checked ~ ul>li:nth-child(1)>label
	{
	cursor: default;
	color: #616161;
}

@media ( max-width : 600px) {
	.tabs input[name="tab-control"]:nth-of-type(1):checked ~ ul>li:nth-child(1)>label
		{
		background: rgba(0, 0, 0, 0.08);
	}
}
/*  .tabs input[name="tab-control"]:nth-of-type(1):checked ~ .slider { 
   -webkit-transform: translateX(0%); 
           transform: translateX(0%); 
 }  */
.tabs input[name="tab-control"]:nth-of-type(1):checked ~ .content>section:nth-child(1)
	{
	display: block;
}

.tabs input[name="tab-control"]:nth-of-type(2):checked ~ ul>li:nth-child(2)>label
	{
	cursor: default;
	color: #616161;
}

@media ( max-width : 600px) {
	.tabs input[name="tab-control"]:nth-of-type(2):checked ~ ul>li:nth-child(2)>label
		{
		background: rgba(0, 0, 0, 0.08);
	}
}
/*  .tabs input[name="tab-control"]:nth-of-type(2):checked ~ .slider { 
   -webkit-transform: translateX(0%); 
           transform: translateX(0%); 
 }  */
.tabs input[name="tab-control"]:nth-of-type(2):checked ~ .content>section:nth-child(2)
	{
	display: block;
}

.tabs input[name="tab-control"]:nth-of-type(3):checked ~ ul>li:nth-child(3)>label
	{
	cursor: default;
	color: #616161;
}

@media ( max-width : 600px) {
	.tabs input[name="tab-control"]:nth-of-type(3):checked ~ ul>li:nth-child(3)>label
		{
		background: rgba(0, 0, 0, 0.08);
	}
}
/* .tabs input[name="tab-control"]:nth-of-type(3):checked ~ .slider { 
   -webkit-transform: translateX(0%); 
           transform: translateX(0%); 
 }  */
.tabs input[name="tab-control"]:nth-of-type(3):checked ~ .content>section:nth-child(3)
	{
	display: block;
}

.tabs input[name="tab-control"]:nth-of-type(4):checked ~ ul>li:nth-child(4)>label
	{
	cursor: default;
	color: #616161;
}

@media ( max-width : 600px) {
	.tabs input[name="tab-control"]:nth-of-type(4):checked ~ ul>li:nth-child(4)>label
		{
		background: rgba(0, 0, 0, 0.08);
	}
}
/*  .tabs input[name="tab-control"]:nth-of-type(4):checked ~ .slider { 
   -webkit-transform: translateX(0%); 
           transform: translateX(0%); 
 }  */
.tabs input[name="tab-control"]:nth-of-type(4):checked ~ .content>section:nth-child(4)
	{
	display: block;
}

@
-webkit-keyframes content {from { opacity:0;
	-webkit-transform: translateY(5%);
	transform: translateY(5%);
}

to {
	opacity: 1;
	-webkit-transform: translateY(0%);
	transform: translateY(0%);
}

}
@
keyframes content {from { opacity:0;
	-webkit-transform: translateY(5%);
	transform: translateY(5%);
}

to {
	opacity: 1;
	-webkit-transform: translateY(0%);
	transform: translateY(0%);
}

}
@media ( max-width : 1000px) {
	.tabs ul li label {
		white-space: initial;
	}
	.tabs ul li label br {
		display: initial;
	}
}

@media ( max-width : 600px) {
	.tabs ul li label {
		padding: 5px;
		border-radius: 5px;
	}
	.tabs ul li label span {
		display: none;
	}
	.tabs .slider {
		display: none;
	}
	.tabs .content {
		margin-top: 20px;
	}
	.tabs .content section h2 {
		display: block;
	}
}

/*  */
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

.accountM_modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background: url("../images/background/modal_schedule.jpg");
	background-color: #fefefe;
	margin: 8% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 60%;
	/*     height: 65%; /* Could be more or less, depending on screen size */
}

.smbtnDiv {
	margin: 10px 10px 10px 10px;
}

@media ( max-width : 1100px ) {
	.modal-content {
		width: 75%;
	}
}

.smbtnDiv {
	width: 100%;
	float: right;
}

/* The Close Button */
.save, .close, .sRowModalEdit_close {
	margin: 0px 10px 10px 20px;
	color: white;
	font-size: 20px;
	font-weight: bold;
	float: right;
	width: 10%;
	/* margin-right: 10%; */
	/* 	margin-bottom: 50px; */
}

.save:hover, .save:focus, .close:hover, .close:focus,
	.sRowModalEdit_close:hover, .sRowModalEdit_close:focus {
	color: gray;
	text-decoration: none;
	cursor: pointer;
}

.sRowModal_close {
	color: white;
	font-size: 20px;
	font-weight: bold;
	float: right;
	width: 10%;
	margin-right: 10%;
}

.sRowModal_close:hover, .sRowModal_close:focus {
	color: gray;
	text-decoration: none;
	cursor: pointer;
}

.edit {
	color: white;
	font-size: 20px;
	font-weight: bold;
	float: right;
	width: 10%;
	margin-right: 12%;
}

/* 모달 안 내용 */
.icon {
	margin-left: 20px;
}

.content {
	margin-top: 50px;
}

.border {
	margin: 10px 0 10px 0;
	border-radius: 5px;
	width: 100%;
}

.spanDE {
	padding: 6px;
}

.startD, .endD {
	width: 90%;
}

.borderContent {
	height: 200px;
}

.importantSpan {
	margin: 0 0 0 10px;
}

.modal-body {
	overflow: hidden;
	/* 	overflow:visible; */
}

.add {
	color: white;
	font-weight: bold;
	display: table;
	margin-left: auto;
	margin-right: auto;
	font-size: 25px;
	padding-top: 10px;
}

/* .smcontentsDiv{
	float: left;
	width: 40%;
} */

/* .importantSelect{
	background-color: #ffc966;
	color: white;
} */
.modalR div:hover {
	background-color: red;
}

.modalR {
	/* 	margin: 0 3px 0 3px; */
	background-color: #ffb6c1;
	/* 	color: #ffb6c1; */
}

.modalO {
	/* 	margin: 0 3px 0 3px; */
	background-color: #ffc966;;
	/* 	color: #ffc966; */
}

.modalG {
	/* 	margin: 0 3px 0 3px; */
	background-color: #add8e6;
	/* 	color: #add8e6; */
}

/* 추가css */
/* 일정 css */
.inner-tabs {
	content: "";
	display: flex;
	clear: both;
	height: 15%;
}

.tablist {
	margin: 0em 0em;
	margin-top: 0px;
}

.date {
	margin-left: 3%;
	margin-right: 0px;
	margin-top: 0px;
	color: #3f3f3f;
	font-size: 25px;
	font-family: "Montserrat";
	margin: 0;
}

.scheduleList_date {
	margin: 0 0;
	width: 115px;
}

.scheduleList {
	margin: 0 0em 0 0em;
}

.scheduleList_all {
	margin: 0 0;
	font-size: 20px;
	width: 70px;
	font-family: "Montserrat";
	margin: 0;
	color: #aaa;
}

@media ( max-width :1024px) {
	.scheduleList_date {
		width: 90px;
	}
	.date {
		font-size: 20px;
	}
	.scheduleList_all {
		font-size: 15px;
		width: 50px;
	}
}

.tab_importance {
	/* 	width: 50%; */
	margin: 0;
}

.scheduleList_all  label span:HOVER {
	color: #747474;
}

.btnRed {
	font-size: 15px;
	color: #ffb6c1;
}

.btnOrange {
	font-size: 15px;
	color: #ffc966;
}

.btnGreen {
	font-size: 15px;
	color: #add8e6;
}

.btnRed:HOVER {
	/*  	opacity: 0.5; */
	color: #ff8093;
}

.btnOrange:HOVER {
	/*  	opacity: 0.5; */
	color: #FFB52B;
}

.btnGreen:HOVER {
	/*  	opacity: 0.5; */
	color: #76bdd5;
}

.blank {
	width: 40%;
}

@media ( max-width :1024px) {
	.blank {
		width: 3%;
	}
}

.tab-btn {
	width: 10%;
	margin: 0;
}

#newSchedule {
	background: transparent;
	border: 0;
	height: 50px;
	outline: none;
	cursor: pointer;
	padding-bottom: 0;
}

.plusicon {
	color: #929daf;
	font-size: 20px;
	padding-top: 21px;
}

.plusicon:HOVER {
	color: #747474;
}

.schedule_btn {
	height: 30px;
	width: 45px;
	padding: 1px;
	margin: 0;
	border-radius: 50px;
	transition: 0.3s;
	border: 2px solid #aaa;
	outline: none;
	background: none;
	color: #929daf;
	font-size: 11px;
	cursor: pointer;
}

.todo {
	margin: 3px 1%;
	content: "";
	display: flex;
	clear: both;
	color: white;
}

.todo_date {
	width: 15%;
	margin-left: 5px;
}

.todo_content {
	width: 80%;
}

.minus-btn {
	margin-top: 30%;
	color: white;
	cursor: pointer;
}

.first .todo {
	background-color: #ffb6c1;
}

.second .todo {
	background-color: #ffc966;
}

.third .todo {
	background-color: #add8e6;
}

.schedule_btn:HOVER {
	color: #666666;
	outline: none;
	box-shadow: 0 0 0 2px #666666;
	border: 2px solid #666666;
}

.all, .first, .second, .third{
	height: 100%;
}

.allDiv, .firstDiv, .secondDiv, .thirdDiv{
	height: 100%;
	overflow: auto;
}

/* 지도 css */
/* Always set the map height explicitly to define the size of the div element that contains the map. */
#map {
	width: 100%;
	height: 200px;
}

#srmMap {
	width: 100%;
	height: 250px;
}

#srmEditMap {
	width: 100%;
	height: 200px;
}

/* Optional: Makes the sample page fill the window. */
.googleMapDiv {
	display: inline;
	/* float: left; */
	height: 50%;
	width: 59%;
	margin: 0;
	margin-left: 1%;
	padding: 0;
}

.controls {
	margin-top: 10px;
	border: 1px solid transparent;
	border-radius: 2px 0 0 2px;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	height: 32px;
	outline: none;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
}

#pac-input, #srmEdit_pac-input {
	background-color: #fff;
	font-family: Roboto;
	font-size: 15px;
	font-weight: 300;
	margin-left: 12px;
	padding: 0 11px 0 13px;
	text-overflow: ellipsis;
	width: 200px;
}

#pac-input:focus, #srmEdit_pac-input:focus {
	border-color: #4d90fe;
}

.pac-container {
	font-family: Roboto;
}

#type-selector {
	color: #fff;
	background-color: #4d90fe;
	padding: 5px 11px 0px 11px;
}

#type-selector label {
	font-family: Roboto;
	font-size: 13px;
	font-weight: 300;
}

#target {
	width: 345px;
}
</style>
</head>
<body>
<jsp:include page="../default/navbar.jsp" />
<br><br>
	<div class="row">
		<div class="con">
			<div class="edge">
				<p class="datepicker-wrapper">
					Datepicker: <input type="text" id="datepicker" placeholder="Search by Date" onfocus="">
				</p>
				<div id="fullcalendar"></div>
			</div>
		</div>
		<div class="con2">
			<div class="schedule">
				<div class="tabs">
				  <input type="radio" id="tab1" name="tab-control" hidden checked>
				  <input type="radio" id="tab2" name="tab-control" hidden>
				  <input type="radio" id="tab3" name="tab-control" hidden>  
				  <input type="radio" id="tab4" name="tab-control" hidden>
				  <div class="inner-tabs">
				  	<ul class="tablist date">
				  		<li class="scheduleList_date"><span id="sDate"></span></li>
				  	</ul>
					<ul class="tablist tab_importance" style="align-content: left">
					    <li class="scheduleList_all"><label for="tab1" role="button"><br><span>전체</span></label></li>
					    <li class="scheduleList"><label for="tab2" role="button"><br><span><i class="fa fa-circle btnRed"></i></span></label></li>
					    <li class="scheduleList"><label for="tab3" role="button"><br><span><i class="fa fa-circle btnOrange"></i></span></label></li>
					    <li class="scheduleList"><label for="tab4" role="button"><br><span><i class="fa fa-circle btnGreen"></i></span></label></li>
					</ul>
					<div class="blank"></div>
						<ul class="tablist tab-btn">
						  	 <li class="scheduleList"><button id="newSchedule"><i class="fa fa-plus plusicon"></i></button></li>
						  	 <li class="scheduleList"><button class="schedule_btn" id="monthB">월별</button></li>
						  	 <li class="scheduleList"><button class="schedule_btn" id="dayB">일별</button></li>
						</ul>
				  </div>
<!-- 				  <div class="slider"><div class="indicator"></div></div> -->
					<div class="content sCon">
						<section class="all">
							<div class="allDiv">
							</div>
						</section>
						<section class="first">
							<div class="firstDiv">
							</div>
						</section>
						<section class="second">
							<div class="secondDiv">
							</div>
						</section>
						<section class="third">
							<div class="thirdDiv">
							</div>
						</section>
					</div>
				</div>
			</div>
			<div class="account">
				<div class="tabs">
				   <div class="topSection">
				      <div>
				         <span class="accountTitle">가계부</span>
				         <button class="btn-report" id="saleReport"><img src="../images/icon/account.png"></button>
				      </div>
				      <!-- <div class="btnSection">
				     </div> -->
				  </div>
				  <br><br>
				  <table class="totalBudget">
				     <tr>
				        <td>예산 : 300000</td>
				        <td>남은 금액 : 298000</td>
				     </tr>
				     <tr>
				        <td>총 수입 : 0</td>
				        <td>총 지출 : 2000</td>
				        <td>총 계 : -2000</td>
				     </tr>
				  </table>
				  
				  <br>
				  <!-- 가계부 추가 start -->
				  <table class="accountTableReg">
				     <col style="width:10%;">
				       <col style="width:10%;">
				       <col style="width:50%;">
				       <col style="width:20%;">
				     <col style="width:10%;">
				     <tr>
				        <td>
				           5/15
				        </td>
				        <td>
				           <select name="kind">
				              <option value="0">지출</option>
				              <option value="1">수입</option>
				           </select>
				        </td>
				        <td>
				           <input class="accountInput" type="text" placeholder="내용" style="width: 100%; text-align: center;">
				        </td>
				        <td>
				           <!-- <span> / </span> -->
				           <input class="accountInput" type="text" placeholder="금액" style="width: 100%; text-align: center;">
				        </td>
				        <td>
				        <button class="accountRowSavebtn">저장</button>
				        </td>
				     </tr>
				  </table>
				  <!-- 가계부 추가 end -->
				  <br>
				  
				  <div class="accountTableDiv">
				     <table class="accountTable">
				        <col style="width:10%;">
				          <col style="width:10%;">
				          <col style="width:50%;">
				          <col style="width:20%;">
				        <col style="width:10%;">
				        <tr class="accountTableTh">
				           <th>날짜</th>
				           <th>수입/지출</th>
				           <th>내용</th>
				           <th>금액</th>
				           <th></th>
				        </tr>
				        <!-- DB 가계부 데이터 start -->
				        <tr>
				           <td class="adate">5/15</td>
				           <td class="kind">
				              <span>지출</span>
				           </td>
				           <td class="content">
				              <span>색종이</span>
				           </td>
				           <td class="balance">
				              <span>2000</span>
				           </td>
				           <td>
				              <div style="text-align: center">
				                 <i class="fa fa-trash-o removebtn"></i>
				                 <i class="fa fa-pencil modifybtn"></i>
				              </div>
				           </td>
				        </tr>
				        <tr>
				           <td class="adate">5/15</td>
				           <td class="kind">
				              <span>지출</span>
				           </td>
				           <td class="content">
				              <span>색종이</span>
				           </td>
				           <td class="balance">
				              <span>2000</span>
				           </td>
				           <td>
				              <div style="text-align: center">
				                 <i class="fa fa-trash-o removebtn"></i>
				                 <i class="fa fa-pencil modifybtn"></i>
				              </div>
				           </td>
				        </tr>
				        <tr>
				           <td class="adate">5/15</td>
				           <td class="kind">
				              <span>지출</span>
				           </td>
				           <td class="content">
				              <span>색종이</span>
				           </td>
				           <td class="balance">
				              <span>2000</span>
				           </td>
				           <td>
				              <div style="text-align: center">
				                 <i class="fa fa-trash-o removebtn"></i>
				                 <i class="fa fa-pencil modifybtn"></i>
				              </div>
				           </td>
				        </tr>
				        <tr>
				           <td class="adate">5/15</td>
				           <td class="kind">
				              <span>지출</span>
				           </td>
				           <td class="content">
				              <span>색종이</span>
				           </td>
				           <td class="balance">
				              <span>2000</span>
				           </td>
				           <td>
				              <div style="text-align: center">
				                 <i class="fa fa-trash-o removebtn"></i>
				                 <i class="fa fa-pencil modifybtn"></i>
				              </div>
				           </td>
				        </tr>
				        <tr>
				           <td class="adate">5/15</td>
				           <td class="kind">
				              <span>지출</span>
				           </td>
				           <td class="content">
				              <span>색종이</span>
				           </td>
				           <td class="balance">
				              <span>2000</span>
				           </td>
				           <td>
				              <div style="text-align: center">
				                 <i class="fa fa-trash-o removebtn"></i>
				                 <i class="fa fa-pencil modifybtn"></i>
				              </div>
				           </td>
				        </tr>
				        <tr>
				           <td class="adate">5/15</td>
				           <td class="kind">
				              <span>지출</span>
				           </td>
				           <td class="content">
				              <span>색종이</span>
				           </td>
				           <td class="balance">
				              <span>2000</span>
				           </td>
				           <td>
				              <div style="text-align: center">
				                 <i class="fa fa-trash-o removebtn"></i>
				                 <i class="fa fa-pencil modifybtn"></i>
				              </div>
				           </td>
				        </tr>
				        <tr>
				           <td class="adate">5/15</td>
				           <td class="kind">
				              <span>지출</span>
				           </td>
				           <td class="content">
				              <span>색종이</span>
				           </td>
				           <td class="balance">
				              <span>2000</span>
				           </td>
				           <td>
				              <div style="text-align: center">
				                 <i class="fa fa-trash-o removebtn"></i>
				                 <i class="fa fa-pencil modifybtn"></i>
				              </div>
				           </td>
				        </tr>
				        <tr>
				           <td class="adate">5/15</td>
				           <td class="kind">
				              <span>지출</span>
				           </td>
				           <td class="content">
				              <span>색종이</span>
				           </td>
				           <td class="balance">
				              <span>2000</span>
				           </td>
				           <td>
				              <div style="text-align: center">
				                 <i class="fa fa-trash-o removebtn"></i>
				                 <i class="fa fa-pencil modifybtn"></i>
				              </div>
				           </td>
				        </tr>
				        <tr>
				           <td class="adate">5/15</td>
				           <td class="kind">
				              <span>지출</span>
				           </td>
				           <td class="content">
				              <span>색종이</span>
				           </td>
				           <td class="balance">
				              <span>2000</span>
				           </td>
				           <td>
				              <div style="text-align: center">
				                 <i class="fa fa-trash-o removebtn"></i>
				                 <i class="fa fa-pencil modifybtn"></i>
				              </div>
				           </td>
				        </tr>
				        <tr>
				           <td class="adate">5/15</td>
				           <td class="kind">
				              <span>지출</span>
				           </td>
				           <td class="content">
				              <span>색종이</span>
				           </td>
				           <td class="balance">
				              <span>2000</span>
				           </td>
				           <td>
				              <div style="text-align: center">
				                 <i class="fa fa-trash-o removebtn"></i>
				                 <i class="fa fa-pencil modifybtn"></i>
				              </div>
				           </td>
				        </tr>
				        <tr>
				           <td class="adate">5/15</td>
				           <td class="kind">
				              <span>지출</span>
				           </td>
				           <td class="content">
				              <span>색종이</span>
				           </td>
				           <td class="balance">
				              <span>2000</span>
				           </td>
				           <td>
				              <div style="text-align: center">
				                 <i class="fa fa-trash-o removebtn"></i>
				                 <i class="fa fa-pencil modifybtn"></i>
				              </div>
				           </td>
				        </tr>
				        <tr>
				           <td class="adate">5/15</td>
				           <td class="kind">
				              <span>지출</span>
				           </td>
				           <td class="content">
				              <span>색종이</span>
				           </td>
				           <td class="balance">
				              <span>2000</span>
				           </td>
				           <td>
				              <div style="text-align: center">
				                 <i class="fa fa-trash-o removebtn"></i>
				                 <i class="fa fa-pencil modifybtn"></i>
				              </div>
				           </td>
				        </tr>
				        
				        <!-- DB 가계부 데이터 end -->
			         </table>
			      </div>
			   </div>
			</div>
		</div>
		
		
		<!-- schedule Modal -->
		<div id="scheduleModal" class="modal">
			<div class="modal-content">
				<div class="modal-body">
					 <div class = "add">일정추가</div>
				    <form id="scsaveForm">
				    	<div class="smcontentsDiv">
					       	<input class = "border borderTitle smtitle" type = "text" name = "title" size = "50" placeholder="제목을 입력해주세요" required>
					       	<span class="spanDS">시작 날짜 : </span><input class = "border borderDate startD" type = "text" name = "sdate" size = "20" disabled>
					       	<span class="spanDE">끝 날짜 : </span><input class = "border borderDate endD" type = "text" name = "edate" size = "20" disabled>
					       	<span class="importantSpan">중요도 : </span>
					       	<select class="importantSelect" name = "important" placeholder="중요도">
					              <option value="3" class="modalR">상</option>
					              <option value="2" class="modalO" selected>중</option>
					              <option value="1" class="modalG">하</option>
					        </select>
							<textarea class = "border borderContent smcontent" name="content" rows="20" cols="50" placeholder = "내용을 입력해주세요." required></textarea>
				    	</div>
				    </form>
					<div class="googleMapDiv">
						<div id="map"></div>
					    <input id="pac-input" class="controls" type="text" placeholder="Search Box">
					    <div id="infowindow-content">
					    	<span id="place-name"  class="title"></span><br>
					    	<span id="place-address"></span>
					    </div>
				    </div>
				    <div class="smbtnDiv">
					    <span class = "close">CLOSE</span>
					    <span class = "save">SAVE</span>
				    </div>
				</div>
			</div>
		</div>
		
		
		<!-- account Modal -->
		<div id="accountModal" class="accountM_modal">

			<!-- Modal content -->
			<div class="accountM_modal-content">
			   
			   <div style="text-align: center" id="accountM_calender-wrapper">
			         <div id="accountM_calender-title" class="disable-select flex row center-v around">
			            <div id="accountM_left" class="flex row center-vh">
			               <span> < </span>
			            </div>
			            <p class="flex row center-vh"></p>
			            <div id="accountM_right" class="flex row center-vh">
			               <span>></span>
			            </div>
			            <div id="accountM_calender-content" class="flex row wrap disable-select"></div>
			         </div>
			      </div>
			      <br>
			      <img  class ="accountM_image" alt="스마일" src="../images/icon/happy.png"><br><span class = "accountM_comment">Splendid!  WellDone!</span>
			      <br><br>
			      <span  class="accountM_close">CLOSE</span>
			   </div>
			</div>



		<!-- schedule row Modal -->
		<div id="sRowModal" class="modal">
			<div class="modal-content">
				<div class="modal-body srm-body">
					 <div class = "add">상세 일정</div>
				     <br><br>
				    	<div class="smcontentsDiv">
				       	<p class="sRowtitle"></p>
				       	<p><span>시작날짜: </span><span class="sRowSdate"></span></p>
				       	<p><span>끝날짜: </span><span class="sRowEdate"></span></p>
				       	<span>중요도 : </span>
				        <span class="sRowimportant"></span>
				        <p class="sRowcontent"></p>
				    	</div>
				    	<div class="googleMapDiv">
					    	<div id="srmMap"></div>
					    	<div id="srm-infowindow-content">
						    	<span id="srm-place-name"  class="title"></span><br>
						    	<span id="srm-place-address"></span>
						    </div>
				    	</div>
				    	<div class="smbtnDiv">
				    		<br>
					       <span class = "sRowModal_close">CLOSE</span>
					       <a href = "#"><span id="edit" class = "edit">EDIT</span></a>
				    	</div>
				</div>
			</div>
		</div>
		
		
		<!-- schedule row Modal edit -->
		<div id="sRowModalEdit" class="modal">
			<div class="modal-content">
				<div class="modal-body srm-body">
					 <div class = "add">일정 수정</div>
				    <form id="srmsaveForm">
				    	<div class="smcontentsDiv">
					    	<input class = "border borderTitle srmtitle" type = "text" name = "srmtitle" size = "50" placeholder="제목을 입력해주세요" required>
					       	<span class="spanDS">시작 날짜 : </span><input class = "border borderDate startD" type = "text" name = "sdate" size = "20" disabled>
					        <span class="spanDE">끝 날짜 : </span><input class = "border borderDate endD" type = "text" name = "edate" size = "20" disabled>
					       	<span class="importantSpan">중요도 : </span>
					       	<select class="importantSelect" name = "srmimportant" placeholder="중요도">
					              <option value="3" class="modalR">상</option>
					              <option value="2" class="modalO">중</option>
					              <option value="1" class="modalG">하</option>
					        </select>
							<textarea class = "border borderContent srmcontent" name="srmcontent" rows="20" cols="50" placeholder = "내용을 입력해주세요."></textarea>
				    	</div>
					</form>
			    	<div class="googleMapDiv">
				    	<div id="srmEditMap"></div>
				    	<input id="srmEdit_pac-input" class="controls" type="text" placeholder="Search Box">
			    		<div id="srmEdit-infowindow-content">
						    	<span id="srmEdit-place-name"  class="title"></span><br>
						    	<span id="srmEdit-place-address"></span>
						</div>
			    	</div>
			    	<div class="smbtnDiv">
				       <span class = "sRowModalEdit_close">CLOSE</span>
				       <span id="editSave" class = "save">SAVE</span>
			    	</div>
				</div>
			</div>
		</div>
		
	</div>

<jsp:include page="../default/footer.jsp" />
<input id="myEmail" type="hidden" value="${email}">

</body>
</html>