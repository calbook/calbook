<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="../css/background.css">
<link rel="stylesheet" href="../css/calendar.css">
<link rel="stylesheet" href="../css/fullcalendar/fullcalendar.css" />
<!-- <link rel="stylesheet" href="../css/tab2.css"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Baloo|Ubuntu" rel="stylesheet">
<!-- jquery-ui -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- qtip -->
<script type="text/javascript" src="../js/jquery.qtip.custom/jquery.qtip.min.js"></script>
<!-- googlemap -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBUsZlyBI_gQ8S_liz_WdZ6U2W2ooRwIoQ"></script>
<!-- fullcalendar -->
<script src='../css/fullcalendar/lib/moment.min.js'></script>
<script src='../css/fullcalendar/fullcalendar.js'></script>
<script type="text/javascript">

$(function(){
	$("#datepicker").datepicker({
	    changeMonth: true,
	    changeYear: true,
	    showOtherMonths: true,
	    selectOtherMonths: true,
	    showAnim: "drop",
	    inline: true,
	    onSelect: function(a, b) {
	        var c = new Date(a);
	        $("#fullcalendar").fullCalendar("gotoDate", c);
	        $("#fullcalendar").fullCalendar("select", c);
	    }
	});


	!function() {
	    var a = new Date();
	    var b = a.getDate();
	    var c = a.getMonth();
	    var d = a.getFullYear();
	    var e = $("<div/>").qtip({
	        id: "fullcalendar",
	        prerender: true,
	        content: {
	            text: " ",
	            title: " ",
	            button: true
	        },
	        events: {
	            render: function(a, b) {
	                var c = b.elements.bgiframe;
	            }
	        },
	        position: {
	            my: "bottom center",
	            at: "top center",
	            target: "event",
	            viewport: $(window),
	            adjust: {
	                mouse: false,
	                scroll: true,
	                method: "shift",
	                resize: true
	            }
	        },
	        show: {
	            modal: {
	                on: false,
	                blur: true,
	                stealfocus: false
	            }
	        },
	        hide: false,
	        style: {
	            classes: "qtip-bootstrap qtip-shadow qtip-events",
	            border: {
	                radius: 2
	            }
	        }
	    }).qtip("api");
	    $("#fullcalendar").fullCalendar({
	       /*  eventSources: [ $.fullCalendar.gcalFeed("https://www.google.com/calendar/feeds/en.usa%23holiday%40group.v.calendar.google.com/public/basic", {
	            className: "bmesevents"
	        }), $.fullCalendar.gcalFeed("https://www.google.com/calendar/feeds/en.german%23holiday%40group.v.calendar.google.com/public/basic", {
	            className: "wsubmesevents"
	        }), $.fullCalendar.gcalFeed("https://www.google.com/calendar/feeds/usa__en%40holiday.calendar.google.com/public/basic", {
	            className: "holidaysevents"
	        }) ],*/
	       
	        header: {
	            left: "month,agendaList",
	            center: "title",
	            right: "prev,today,next"
	        },
	        selectable: true,
	        eventClick: function(a, b, c) {
	            var d = $.fullCalendar.formatDate(a.start, "dddd, MMM yyyy @ HH:mmtt");
	            var f = $.fullCalendar.formatDate(a.end, "dddd, MMM yyyy @ HH:mmtt");
	            var g = '<h5 style="margin:0;padding:0;">' + a.title + "</h5>";
	            var h = '<p style="margin:0;padding:2px;"><b>Start:</b> ' + d + "<br />" + (f && '<p style="margin:0;padding:2px;"><b>End:</b> ' + f + "</p>" || "") + (a.description && '<p style="margin:0;padding:2px;"><b>What:</b> ' + a.description + "</p>" || "") + (a.location && '<p style="margin:0;padding:2px;"><b>Where:</b> ' + a.location + "</p>" || "");
	            e.set({
	                "content.title": g,
	                "content.text": h
	            }).reposition(b).show(b);
	            var i = b.pageX;
	            var j = b.pageY;
	            $("td").each(function(a) {
	                var b = $(this).offset();
	                if (b.left + $(this).outerWidth() > i && b.left < i && b.top + $(this).outerHeight() > j && b.top < j) {
	                    if ($(this).hasClass("fc-cell-overlay")) $(this).addClass("fc-cell-overlay"); else $("td").removeClass("fc-cell-overlay");
	                    $(this).addClass("fc-cell-overlay");
	                }
	            });
	        },
	        dayClick: function(date) {
	            e.hide();
	            $("td").removeClass("fc-cell-overlay");
	            /* 클릭한 날짜 잡아오기 */
	            alert('Clicked on: ' + date.format());
	        },
	        eventResizeStart: true,
	        eventDragStart: false,
	        viewDisplay: function() {
	            e.hide();
	        },
	       events : [
	                      /* 일정 출력 */
	                      {
	                    	title: '어린이날',
	                  		start: '2018-05-05',
	                  		end: '2018-05-06',
	                  		color: 'lightblue'
	                      },
	                      {
	                    	title: '제주도 여행',
	                  		start: '2018-05-11',
	                  		end: '2018-05-14',
	                  		color: 'lightpink'
	                      },
	                      {
	                    	title: '맛집탐방',
	                  		start: '2018-05-25',
	                  		end: '2018-05-25',
	                  		color: 'lightpink',
	                      }
	                      ]
	    });
	}();
	
	$("[title]").qtip({
	    style: {
	        classes: "qtip-blue qtip-shadow qtip-rounded qtip-custom"
	    },
	    position: {
	        my: "top center",
	        at: "bottom center",
	        viewport: $(window),
	        adjust: {
	            mouse: false,
	            scroll: true,
	            method: "shift",
	            resize: true
	        }
	    }
	});

	
	$("#monthB").click(function(){
		alert("월별");
	});
	
	
	$('#my-today-button').click(function() {
		var moment = $('#calendar').fullCalendar('today');
	  	  alert(moment.format());
	});
	
	
});
	


</script>
<script type="text/javascript">

	function initMap(){
		var mapCanvas = document.getElementById("googleMap");
		var mapOption = {
				center: new google.maps.LatLng(37.556556, 126.919485),		/* ,로 구분 */
				zoom: 17													/* 마지막꺼에는 , 넣지 않음  */
		};
		
		//var mapObj = new google.maps.Map(맵이 표시될 div, 맵의 옵션);
		var mapObj = new google.maps.Map(mapCanvas, mapOption);
	}
	
	google.maps.event.addDomListener(window, 'load', initMap);	/* window가 다 load되면 initMap이 실행됨 */

</script>
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

.modal2 {
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
	width: 50%;
	/*     height: 65%; /* Could be more or less, depending on screen size */
}

/* The Close Button */
.close {
	color: white;
	font-size: 20px;
	font-weight: bold;
	float: right;
	width: 10%;
	margin-right: 10%;
	margin-bottom: 50px;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.save {
	color: white;
	font-size: 20px;
	font-weight: bold;
	float: right;
	width: 10%;
	margin-right: 12%;
	margin-bottom: 50px;
}

/* 모달 안 내용 */
.icon {
	margin-left: 20px;
}

.content {
	margin-top: 50px;
}

.border {
	border-radius: 5px;
	width: 50%;
}

.borderContent {
	height: 200px;
}

.add {
	color: white;
	font-weight: bold;
	display: table;
	margin-left: auto;
	margin-right: auto;
	font-size: 25px;
}


.modalR {
/* 	margin: 0 3px 0 3px; */
	color: #ffb6c1;
}

.modalO {
/* 	margin: 0 3px 0 3px; */
	color: #ffc966;
}

.modalG {
/* 	margin: 0 3px 0 3px; */
	color: #add8e6;
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
	width: 60px;
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
		width: 40px;
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
	width: 15%;
}

.tab-btn {
	width: 10%;
	margin: 0;
	/* 	text-align: right; */
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

/* 가계부 css */
.account {
	margin-top: 10px;
}

.topSection {
	margin-top: 2%;
	margin-bottom: 2%;
}

.titleSection {
	float: left;
	width: 20%;
}

.titleContents {
	float: left;
	text-align: right;
	width: 70%;
}

.btnSection {
	float: left;
	width: 6%;
	margin-top: 3px;
}

.accountTitle {
	color: #3f3f3f;
	width: 15%;
	font-size: 20px;
}

.accountText {
	color: #747474;
	text-align: right;
}

.accountInput {
	background-color: transparent;
	color: black;
	height: 5px;
	padding: 10px;
	width: 100px;
	outline: none;
}

.btn-report {
	background-color: transparent;
	border: 0px solid;
	cursor: pointer;
}

.report_img {
	width: 32px;
	height: 32px;
}

.account_contents {
	float: left;
	width: 100%;
}

.plusRow {
	text-align: center;
}

.accountPlusbtn {
	color: #747474;
	background: transparent;
	border: 0;
	outline: none;
	padding-bottom: 0;
}

.accountPlusbtn:HOVER {
	color: #aaa;
}

.accountCRow {
	background-color: transparent;
	border: 1px solid #ddd;
	padding: 5px;
	overflow: hidden;
}

.rowContents {
	float: left;
}

.rowbtn {
	float: right;
}

.accountRowSavebtn {
	color: #747474;
	background: transparent;
	border: 0;
	outline: none;
	padding-bottom: 0;
	cursor: pointer;
}

.accountRowSavebtn:HOVER {
	color: #aaa;
}

.account_contents span {
	color: #747474;
}

.removebtn {
	color: #747474;
	margin: 3px;
	cursor: pointer;
}

.modifybtn {
	color: #747474;
	margin: 4px;
	cursor: pointer;
}

.removebtn:HOVER {
	color: #aaa;
}

.modifybtn:HOVER {
	color: #aaa;
}

/* account table CSS */
.accountTable, .totalBudget, .accountTableReg{
   width: 100%;

}
.accountTableDiv{
   width: 100%;
   height: 40%;
   overflow: auto;
}
.accountTableReg{
   border-top: 1px solid #747474;
   border-bottom: 1px solid #747474;
   text-align: center;
} 
.accountTitle{
   float: left;
}
.btn-report{
   float: right;
}
.adate, .kind, .balance, .content{
   text-align: center;
}
.accountTableTh th{
   background-color: #f2eee5;
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
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.accountM_modal-content {
    background: url("../images/background/accountbook.jpg");
    margin: 15% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 3px solid #888;
    width: 30%;
    height: 50%;
    align-items: center;
   justify-content: center;
   flex-direction: column;
   font-family: "Baloo";
   
     /* Could be more or less, depending on screen size */
}

/* The Close Button */
.accountM_close {
    color: black;
    font-size: 30px;
    font-weight: bold;
    display:table; 
    margin-left:auto; 
    margin-right:auto;

    
}

.accountM_close:hover,
.accountM_close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

body {
   
   
}

.flex {
   display: flex;
}
.flex.center-v {
   align-items: center;
}
.flex.center-h {
   justify-content: center;
}
.flex.center-vh {
   align-items: center;
   justify-content: center;
}
.flex.start {
   justify-content: flex-start;
}
.flex.end {
   justify-content: flex-end;
}
.flex.around {
   justify-content: space-around;
}
.flex.between {
   justify-content: space-between;
}
.flex.row {
   flex-direction: row;
}
.flex.column {
   flex-direction: column;
}
.flex.wrap {
   flex-wrap: wrap;
}
.disable-select {
  -webkit-user-select: none;  
  -moz-user-select: none;    
  -ms-user-select: none;      
  user-select: none;
}
/* calneder */
.clickable, #accountM_calender-title, 
#calender-panel, #calender-buttons {
   cursor: pointer;
}
.colorRed {
   color: #FF6B6B;
}
.bgColorRed {
   background-color: #FF6B6B;
}
.bgColorDarkRed {
   background-color: #bc6969;   
}
.width-full {
   width: 100%;
}
.width-half {
   width: 50%;
}
.width-3-4 {
   width: 75%;
}
.width-1-4 {
   width: 25%;
}
.overflow-hidden {
   overflow: hidden;
}
#accountM_calender-title {
   background: transparent ;
   color: black;
   font-size: 35pt;
   height: 60px;
   width:200px;
   margin:auto;
}

#accountM_calender-title div {
   height: 60px;
   width: 60px;
   text-align: center;
}

#accountM_calender-title p {
   height: 60px;
   width: 150px;   
   text-align: center;

}

#accountM_left {
   margin-left: 25px;
}

#accountM_calender-title #accountM_left:hover span {
   padding-right: 10px;
   transition: .2s;
   float: right;
}
#accountM_calender-title #accountM_right:hover span {
   padding-left: 10px;
   transition: .2s;
   float: left;
}

.month {
   width: 100px;
   height: 100px;
   transition: .4s;
}

#days p {
   width: 100px;
   text-align: center;   
   font-size: 15pt;
}

.month-selector {
   width: 100%;
   height: 100%;
   transition: .4s;
   position: relative;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%);
}
.month-selector.clicked {
      background: #FF6B6B;
      color: white;
}
.month-selector.booked {
      background: #743131;
      color: white;
      overflow: hidden;
}
.month-selector.booked:after {
         content: 'X';
         position: absolute;
         margin-top: -3px;
         font-size: 100pt;
         font-family: "Ubuntu";
         opacity: 0.1;
} 
.month-selector.booked.clicked {
      background: #894747;
      color: white;
      overflow: hidden;
}

.clickable:hover {
   z-index: 3;
   height: 110px;
   width: 110px;
   box-shadow: 0px 0px 13px 4px rgba(0, 0, 0, 0.14);
   background: #FF6B6B;
   color: white;
}

.accountM_image {
   width:200px;
   height:200px;
   display: block;
   margin-left: auto;
   margin-right: auto;
}
.accountM_comment{
   color: black;
    font-size: 30px;
    display:table; 
    margin-left:auto; 
    margin-right:auto;
    font-style: sans-serif;
}
#accountM_calender-wrapper {
   text-align: center;
}
</style>
</head>
<body>
<div>
	<jsp:include page="../default/navbar.jsp" />
</div>
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
			<div class="schedule" style="">
				<div class="tabs">
				  <input type="radio" id="tab1" name="tab-control" hidden checked>
				  <input type="radio" id="tab2" name="tab-control" hidden>
				  <input type="radio" id="tab3" name="tab-control" hidden>  
				  <input type="radio" id="tab4" name="tab-control" hidden>
				  <div class="inner-tabs">
				  	<ul class="tablist date">
					  <li class="scheduleList_date"><span>5월</span></li>
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
					<div class="content">
						<section class="all">
							<h2>전체</h2>
							<div id="sdrow" class="todo" style="background-color: #add8e6">
								<div class="todo_date">5일</div>
								<div class="todo_content">어린이날</div>
                                <div class="todo-btn"><i class="fa fa-minus minus-btn"></i></div>
							</div> 
							<div class="todo" style="background-color: #ffb6c1">
								<div class="todo_date">11~13일</div>
								<div class="todo_content">제주도 여행</div>
                                <div class="todo-btn"><i class="fa fa-minus minus-btn"></i></div>
							</div>
							<div class="todo" style="background-color: #ffb6c1">
								<div class="todo_date">25일</div>
								<div class="todo_content">맛집탐방</div>
                                <div class="todo-btn"><i class="fa fa-minus minus-btn"></i></div>
							</div>
                            <div class="todo" style="background-color: #FFB52B">
								<div class="todo_date">25일</div>
								<div class="todo_content">약속</div>
                                <div class="todo-btn"><i class="fa fa-minus minus-btn"></i></div>
							</div>
						</section>
						<section class="first">
							<h2>
							</h2>
							<div class="todo">
								<div class="todo_date">11~13일</div>
								<div class="todo_content">제주도 여행</div>
                                <div class="todo-btn"><i class="fa fa-minus minus-btn"></i></div>
							</div>
							<div class="todo" >
								<div class="todo_date">25일</div>
								<div class="todo_content">맛집탐방</div>
                                <div class="todo-btn"><i class="fa fa-minus minus-btn"></i></div>
							</div>  
						</section>
						<section class="second">
							<h2>
							</h2>
							<div class="todo" >
								<div class="todo_date">25일</div>
								<div class="todo_content">약속</div>
                                <div class="todo-btn"><i class="fa fa-minus minus-btn"></i></div>
							</div>
						</section>
						<section class="third">
							<h2>
							</h2>
							<div class="todo">
								<div class="todo_date">5일</div>
								<div class="todo_content">어린이날</div>
                                <div class="todo-btn"><i class="fa fa-minus minus-btn"></i></div>
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
			Modal content
			<div class="modal-content">

				<div class="modal-body">
					 <div class = "add">일정추가</div>
				     <br><br>
				    <form>
				    	<div>
				       	<input class = "border borderTitle" type = "text" name = "title" size = "50" placeholder="제목을 입력해주세요"><br><br>
				       	<input class = "border borderDate" type = "text" name = "date" size = "20" placeholder="날짜를 입력해주세요"><br><br>
				       	<span class="importantSpan">중요도 : </span>
				       	<select name="importantSelect">
				              <option value="3" class="modalR">상</option>
				              <option value="2" class="modalO" selected>중</option>
				              <option value="1" class="modalG">하</option>
				        </select>
				        <br> <br>
						<textarea class = "border borderContent" rows="20" cols="50" placeholder="내용을 입력해주세요."></textarea><br><br><br>
				    	</div>
				    	<div id="googleMap" style="width: 700px; height: 500px"></div>
				       <span class = "close">CLOSE</span>
				       <a href = "#"><span class="save">SAVE</span></a>
				    </form>
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
			               <span> > </span>
			            </div>
			            <div id="accountM_calender-content" class="flex row wrap disable-select"></div>
			         </div>
			      </div>
			      <br>
			      <img  class ="accountM_image" alt="스마일" src="../images/icon/happy.png"><br><span class="accountM_comment">Splendid!  WellDone!</span>
			      <br><br>
			      <span  class="accountM_close">CLOSE</span>
			   </div>
			</div>

	</div>
	
<script>
	// Get schedule row
	var row = document.getElementById('sdrow');

    // Get the modal
	var sModal = document.getElementById('scheduleModal');
	var aModal = document.getElementById('accountModal');

	// Get the button that opens the modal
	var nsbtn = document.getElementById("newSchedule");
	var srbtn = document.getElementById("saleReport");

	// Get the <span> element that closes the modal
	var scheduleClose = document.getElementsByClassName("close")[0];
	var accountClose = document.getElementsByClassName("accountM_close")[0];
	
	// When the user clicks the button, open the modal 
	nsbtn.onclick = function() {
		sModal.style.display = "block";
		$("#datepicker").css("cssText","z-index:0 !important;");
		$(".fc-toolbar .fc-state-active, .fc-toolbar .ui-state-active").css({
			"z-index":"0"
		})
		
		initMap();
	}
	
	srbtn.onclick = function() {
		aModal.style.display = "block";
		$("#datepicker").css("cssText","z-index:0 !important;");
		$(".fc-toolbar .fc-state-active, .fc-toolbar .ui-state-active").css({
			"z-index":"0"
		})
	}

	// When the user clicks on <span> (x), close the modal
	scheduleClose.onclick = function() {
		sModal.style.display = "none";
		$("#datepicker").css({
			"z-index":"9"
		});
		$(".fc-toolbar .fc-state-active, .fc-toolbar .ui-state-active").css({
			"z-index":"4"
		})
	}
	
	accountClose.onclick = function() {
		aModal.style.display = "none";
		$("#datepicker").css({
			"z-index":"9"
		});
		$(".fc-toolbar .fc-state-active, .fc-toolbar .ui-state-active").css({
			"z-index":"4"
		})
	}
	
	row.onclick = function(){
		sModal.style.display = "block";
		$("#datepicker").css("cssText","z-index:0 !important;");
		$(".fc-toolbar .fc-state-active, .fc-toolbar .ui-state-active").css({
			"z-index":"0"
		})
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == sModal) {
			sModal.style.display = "none";
			$("#datepicker").css({
				"z-index":"9"
			});
			$(".fc-toolbar .fc-state-active, .fc-toolbar .ui-state-active").css({
				"z-index":"4"
			})
		
		}
		
		if (event.target == aModal) {
			aModal.style.display = "none";
			$("#datepicker").css({
				"z-index":"9"
			});
			$(".fc-toolbar .fc-state-active, .fc-toolbar .ui-state-active").css({
				"z-index":"4"
			})
		}
	}
	
	var currentMonth = new Date().getMonth();
    var currentYear = new Date().getFullYear();
    var clickedDays = 0;
    var bookingSteps = 0;
    var lastClickedDay;
    var startDate = "";
    var endDate = "";
    var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "June",
       "July", "Aug", "Sept", "Oct", "Nov", "Dec"
    ];
    var monthShortNames = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    var bookedDates = [];
    var selectedDates = [];
    
    Date.prototype.addDays = function(days) {
       var dat = new Date(this.valueOf())
       dat.setDate(dat.getDate() + days);
       return dat;
    }
    function clearCalender() {
       clickedDays = 0;
       $(".month div").removeClass("clicked");
       $("#startdate").html("");
       $("#enddate").html("");
    
       startDate = "";
       endDate = "";
       selectedDates = [];
       bookingSteps = 0;
    }
    
    function daysInMonth(month) {
       return new Date(currentYear, month, 0).getDate();
    }
    function displayCalender() {
       var days = daysInMonth(currentMonth + 1);
    
       $("#accountM_calender-title p").html(monthNames[currentMonth].toUpperCase());
       $("#accountM_calender-content").html("");
    
    
//        checkSelected();
//        checkBookings();
    }
    function monthClick(e) {
          clickedDays += 1;
    
          if (clickedDays == 1) {
             $(e).toggleClass("clicked");
             startDateIndex = parseInt($(e).attr('id').split('-')[1]);
             startDate = new Date(currentYear, currentMonth, startDateIndex);
          }
          if (clickedDays > 1) {
             endDateIndex = parseInt($(e).attr('id').split('-')[1]);
             endDate = new Date(currentYear, currentMonth, endDateIndex);
          }
          if (endDate > startDate) {
             var clicked = $(".clicked");
             $(clicked).not(clicked[0]).removeClass("clicked");
             $(e).toggleClass("clicked");
    
             dateArray = getDates(startDate, endDate);
             dateArray = formatDates(dateArray)
             selectedDates = dateArray;
    
             for (var i = 0; i < dateArray.length; i++) {
                $("#" + dateArray[i]).addClass("clicked");
             }
          }
          $("#startdate").html(startDate.toString().split(' ').slice(0, 3).join(' '));
          $("#enddate").html(endDate.toString().split(' ').slice(0, 3).join(' '));
    }
    function firstDayOffset(date) {
       return new Date(currentYear, currentMonth, 1).getDay();
    }
    
    
    $(function() {
       displayCalender(currentMonth)
       $("#date").append(new Date);
    });
    
    $("#accountM_left").on("click", function() {
       if (currentMonth > 0)
          currentMonth -= 1;
       else {
          currentMonth = 11;
          currentYear -= 1;
       }
       displayCalender();
    });
    $("#accountM_right").on("click", function() {
       if (currentMonth < 11)
          currentMonth += 1;
       else {
          currentMonth = 0;
          currentYear += 1;
       }
       displayCalender();
    });

</script>
<div>
	<jsp:include page="../default/footer.jsp" />
</div>

</body>
</html>