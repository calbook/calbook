<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="../css/scheduleBook.css" />
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
<script src='../js/scheduleBook.js'></script>
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
				<div class="tabs accountbook">
				   <div class="topSection">
				      <div>
				         <span class="accountTitle">가계부(${today})</span>
				         <button class="btn-report" id="saleReport"><img src="../images/icon/account.png"></button>
				      </div>
				      <!-- <div class="btnSection">
				     </div> -->
				  </div>
				  <br><br>
				  <table class="totalBudget">
				     <tr>
				        <td>총 수입 : <span id="income">${tAccount.income}</span></td>
				        <td>총 지출 : <span id="expense">${tAccount.expense}</span></td>
				        <td>총 계 : <span id="sum">${tAccount.sum}</span></td>
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
				           	수입
				        </td>
				        <td>
				           <select name="kind">
				              <option value="월급">월급</option>
				              <option value="부수입">부수입</option>
				              <option value="용돈">용돈</option>
				              <option value="상여">상여</option>
				              <option value="금융소득">금융소득</option>
				              <option value="기타">기타</option>
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
				     <tr>
				        <td>
				           	지출
				        </td>
				        <td>
				           <select name="kind">
				              <option value="식비">식비</option>
				              <option value="교통/차량">교통</option>
				              <option value="문화생활">문화생활</option>
				              <option value="마트/편의점">마트</option>
				              <option value="패션">패션</option>
				              <option value="생활용품">생활용품</option>
				              <option value="기타">기타</option>
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
				           <th>수입/지출</th>
				           <th>종류</th>
				           <th>내용</th>
				           <th>금액</th>
				           <th></th>
				        </tr>
				        <!-- DB 가계부 데이터 start -->
				        <c:forEach items="${abList}" var="ab">
				        	<tr>
				        		<td class="kind">${ab.kind}</td>
				        		<td class="sub_kind">
				        			<span>${ab.sub_kind}</span>
				        		</td>
				        		<td class="content">
				        			<span>${ab.content}</span>
				        		</td>
				        		<td class="amount">
				        			<span>${ab.amount}</span>
				        		</td>
				        		<td>
					              <div style="text-align: center">
					                 <i class="fa fa-trash-o removebtn"></i>
					                 <i class="fa fa-pencil modifybtn"></i>
					              </div>
					           </td>
				        	</tr>
				        </c:forEach>
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
	<input id="myEmail" type="hidden" value="${email}">
</div>

</body>
</html>