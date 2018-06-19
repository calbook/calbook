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
<link rel="stylesheet" href="../css/ScheduleBook.css">
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
<!-- googleChart & highCharts -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

<style type="text/css">

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
				<div class="tabs accountbook">
	               <div class="topSection">
	                  <div>
	                     <span class="accountTitle"></span>
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
	                 <col style="width:15%;">
	                 <col style="width:15%;">
	                 <col style="width:40%;">
	                 <col style="width:20%;">
	                 <col style="width:10%;">
	                <tr>
	                   <td id="IncomeKind">수입</td>
	                   <td>
	                      <select id="IncomeSub_Kind" name="IncomeKind">
	                         <option value="월급">월급</option>
	                           <option value="부수입">부수입</option>
	                           <option value="용돈">용돈</option>
	                           <option value="상여">상여</option>
	                           <option value="금융소득">금융소득</option>
	                           <option value="기타">기타</option>
	                        </select>
	                    </td>
	                    <td>
	                       <input class="accountInput" id="IncomeContent" type="text" placeholder="내용" style="width: 100%; text-align: center;" value="">
	                    </td>
	                    <td>
	                       <!-- <span> / </span> -->
	                       <input class="accountInput" id="IncomeAmount" type="text" placeholder="금액" style="width: 100%; text-align: center;" required>
	                    </td>
	                    <td>
	                       <button id="saveIncome" class="accountRowSavebtn">저장</button>
	                    </td>
	                 </tr>
	                    
	                 <tr>
	                    <td id="ExpenseKind">지출</td>
	                    <td>
	                       <select id="ExpenseSub_Kind" name="ExpenseKind">
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
	                       <input class="accountInput" id="ExpenseContent" type="text" placeholder="내용" style="width: 100%; text-align: center;" value="">
	                    </td>
	                    <td>
	                       <!-- <span> / </span> -->
	                       <input class="accountInput" id="ExpenseAmount" type="text" placeholder="금액" style="width: 100%; text-align: center;" required>
	                    </td>
	                    <td>
	                       <button id="saveExpense" class="accountRowSavebtn">저장</button>
	                    </td>
	                 </tr>
	              </table>
	              <!-- 가계부 추가 end -->
	              <br>
	              
	              <div class="accountTableDiv">
	<!--                  <table class="accountTable"> -->
	<%--                     <col style="width:15%;"> --%>
	<%--                       <col style="width:15%;"> --%>
	<%--                       <col style="width:40%;"> --%>
	<%--                       <col style="width:20%;"> --%>
	<%--                     <col style="width:10%;"> --%>
	<!--                     <tr class="accountTableTh"> -->
	<!--                        <th>수입/지출</th> -->
	<!--                        <th>종류</th> -->
	<!--                        <th>내용</th> -->
	<!--                        <th>금액</th> -->
	<!--                        <th></th> -->
	<!--                     </tr> -->
	<!--                     DB 가계부 데이터 start -->
	<%--                     <c:forEach items="${abList}" var="ab"> --%>
	<!--                        <tr> -->
	<%--                           <td class="kind">${ab.kind}</td> --%>
	<!--                           <td class="sub_kind"> -->
	<%--                              <span>${ab.sub_kind}</span> --%>
	<!--                           </td> -->
	<!--                           <td class="content"> -->
	<%--                              <span>${ab.content}</span> --%>
	<!--                           </td> -->
	<!--                           <td class="amount"> -->
	<%--                              <span>${ab.amount}</span> --%>
	<!--                           </td> -->
	<!--                           <td> -->
	<!--                              <div style="text-align: center"> -->
	<!--                                 <i class="fa fa-trash-o removebtn"></i> -->
	<!--                                 <i class="fa fa-pencil modifybtn"></i> -->
	<!--                              </div> -->
	<!--                           </td> -->
	<!--                        </tr> -->
	<%--                     </c:forEach> --%>
	<!--                     DB 가계부 데이터 end -->
	<!--                   </table> -->
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
					       	<P><span class="spanDS">시작 날짜 : </span><input class = "border borderDate startD" type = "text" name = "sdate" size = "20" disabled></P>
					       	<p><span class="spanDE">끝 날짜 : </span><input class = "border borderDate endD" type = "text" name = "edate" size = "20" disabled></p>
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
					    <input id="placeID" type="hidden">
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
                     <span id="accountM-date"></span>
                     <div id="accountM_right" class="flex row center-vh">
                        <span> > </span>
                     </div>
                     <div id="accountM_calender-content" class="flex row wrap disable-select"></div>
                  </div>
               </div>
               <br>
               <!-- <img  class ="accountM_image" alt="스마일" src="../images/icon/happy.png"><br><span class="accountM_comment">Splendid!  WellDone!</span> -->
              <!-- <div id="donutchart"></div> -->
              <div id="container"></div>
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
<!-- 					    	<div id="srm-infowindow-content"> -->
<!-- 						    	<span id="srm-place-name"  class="title"></span><br> -->
<!-- 						    	<span id="srm-place-address"></span> -->
<!-- 						    </div> -->
						    <input id="srmplaceID" type="hidden">
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
					       	<p><span class="spanDS">시작 날짜 : </span><input class = "border borderDate startD" type = "text" name = "sdate" size = "20" disabled></p>
					        <p><span class="spanDE">끝 날짜 : </span><input class = "border borderDate endD" type = "text" name = "edate" size = "20" disabled></p>
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
						<input id="srmEditplaceID" type="hidden">
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