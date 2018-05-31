
$(function(){
	
	var clickedDate;	// 클릭 날짜
	var today = moment().format('YYYY/MM/DD');
	var startD;
	var endD;
	
    var email = $("#myEmail").val();
    
	
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
	   /* $("#fullcalendar").fullCalendar({
	         eventSources: [ $.fullCalendar.gcalFeed("https://www.google.com/calendar/feeds/en.usa%23holiday%40group.v.calendar.google.com/public/basic", {
	            className: "bmesevents"
	        }), $.fullCalendar.gcalFeed("https://www.google.com/calendar/feeds/en.german%23holiday%40group.v.calendar.google.com/public/basic", {
	            className: "wsubmesevents"
	        }), $.fullCalendar.gcalFeed("https://www.google.com/calendar/feeds/usa__en%40holiday.calendar.google.com/public/basic", {
	            className: "holidaysevents"
	        }) ],
	       
	        header: {
	            left: "month,agendaList",
	            center: "title",
	            right: "prev,today,next"
	        },
	        selectable: true,
	        select: function(startDate, endDate) {
// 	            alert('selected ' + startDate.format() + ' to ' + endDate.format());
	            startD = startDate.format().replace(/-/gi,"/");
	            endD = endDate.format().replace(/-/gi,"/");
	            var sdate;
	            var edate;
	            
	            if(startD.substr(8,1)==0){
	        		sdate = startD.substr(9,1);
	        	}else{
	        		sdate = startD.substr(8,2);
	        	}
	            if(endD.substr(8,1)==0){
	            	edate = endD.substr(9,1);
	        	}else{
	        		edate = endD.substr(8,2);
	        		$("#sDate").text(edate);
	        	}
	            if(startD.substr(5,2)==endD.substr(5,2)){
	            	if((edate-sdate)==1){
	            		$("#sDate").text(sdate+"일");
	            	}else{
	            		$("#sDate").text(sdate+"~"+edate+"일");
	            	}
//	            	$("#sDate").css("font-size","")
	            }
	            
	            $(".plusicon").css("opacity","1");
	    		$("#newSchedule").prop("disabled", false);
	    		$("#newSchedule").css("cursor", "pointer");
	          },
	        eventClick: function(a, b, c) {
	        	startD = a.start.format().replace(/-/gi,"/");
	            var d = $.fullCalendar.formatDate(a.start, "dddd, YYYY/MM/DD");
	            var f = $.fullCalendar.formatDate(a.end, "dddd, YYYY/MM/DD");
//	            var g = '<h5 style="margin:0;padding:0;">' + a.title + "</h5>";
//	            var h = '<p style="margin:0;padding:2px;"><b>Start:</b> ' + d + "<br />" + (f && '<p style="margin:0;padding:2px;"><b>End:</b> ' + f + "</p>" || "") + (a.description && '<p style="margin:0;padding:2px;"><b>What:</b> ' + a.description + "</p>" || "") + (a.location && '<p style="margin:0;padding:2px;"><b>Where:</b> ' + a.location + "</p>" || "");
//	            e.set({
//	                "content.title": g,
//	                "content.text": h
//	            }).reposition(b).show(b);
//	            var i = b.pageX;
//	            var j = b.pageY;
//	            $("td").each(function(a) {
//	                var b = $(this).offset();
//	                if (b.left + $(this).outerWidth() > i && b.left < i && b.top + $(this).outerHeight() > j && b.top < j) {
//	                    if ($(this).hasClass("fc-cell-overlay")) 
//	                    	$(this).addClass("fc-cell-overlay"); 
//	                    else 
//	                    	$("td").removeClass("fc-cell-overlay");
//	                    $(this).addClass("fc-cell-overlay");
//	                }
//	            });
	            if(startD.substr(8,1)==0){
	        		var date = startD.substr(9,1)+"일";
	        		$("#sDate").text(date);
	        	}else{
	        		var date = startD.substr(8,2)+"일";
	        		$("#sDate").text(date);
	        	}
	            $(".plusicon").css("opacity","1");
	    		$("#newSchedule").prop("disabled", false);
	    		$("#newSchedule").css("cursor", "pointer");
	        },
	        dayClick: function(date) {
// 	        	var moment = $('#fullcalendar').fullCalendar('getDate');
// 				alert("The current date of the calendar is " + moment.format())
	            e.hide();
	            $("td").removeClass("fc-cell-overlay");
//	            $(this).addClass('fc-cell-overlay');
	             클릭한 날짜 잡아오기 
// 	            alert('Clicked on: ' + date.format());
	            clickedDate = date.format().replace(/-/gi,"/");
// 				alert(clickedDate.substr(0,4));
// 				alert(clickedDate.substr(5,2));
// 				alert(clickedDate.substr(8,2));
// 				alert('Clicked on: ' + clickedDate);
	        },
	        eventResizeStart: true,
	        eventDragStart: false,
	        viewDisplay: function() {
	            e.hide();
	        },
	       events : [
	                       일정 출력 
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
	                  		end: '2018-05-26',
	                  		color: 'lightpink',
	                      }
	                ]
	    });*/
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
	
	$('.fc-today-button').click(function() {
// 		var moment = $('#fullcalendar').fullCalendar('getDate');
// 		alert(typeof moment);
//     	alert("The current date of the calendar is " + moment.format());
		today = moment().format('YYYY/MM/DD');
		
		if(today.substr(8,1)==0){
    		var date = today.substr(9,1)+"일";
    		$("#sDate").text(date);
    	}else{
    		var date = today.substr(8,2)+"일";
    		$("#sDate").text(date);
    	}
		
		$(".plusicon").css("opacity","1");
		$("#newSchedule").prop("disabled", false);
		$("#newSchedule").css("cursor", "pointer");
	});
	
	$('.fc-prev-button').click(function() {
		var date = $("#fullcalendar").fullCalendar("getDate");
		var selectedM = date.format('YYYY/MM/DD');
		
		alert(intervalEnd);
		if(selectedM.substr(5,1)==0){
			var month = selectedM.substr(6,1)+"월";
			$("#sDate").text(month);
		}else{
			var month = selectedM.substr(5,2)+"월";
			$("#sDate").text(month);
		}
		
		$(".plusicon").css("opacity","0");
		$("#newSchedule").prop("disabled", true);
		$("#newSchedule").css("cursor", "default");
	});
	
	$('.fc-next-button').click(function() {
		var date = $("#fullcalendar").fullCalendar("getDate");
		var selectedM = date.format('YYYY/MM/DD');
		if(selectedM.substr(5,1)==0){
			var month = selectedM.substr(6,1)+"월";
			$("#sDate").text(month);
		}else{
			var month = selectedM.substr(5,2)+"월";
			$("#sDate").text(month);
		}
		
		$(".plusicon").css("opacity","0");
		$("#newSchedule").prop("disabled", true);
		$("#newSchedule").css("cursor", "default");
	});
	
	
	$("#monthB").click(function(){
// 		$("#monthB").css("margin-left","20px");
		$(".plusicon").css("opacity","0");
		$("#newSchedule").prop("disabled", true);
		$("#newSchedule").css("cursor", "default");
		
		var date = $("#fullcalendar").fullCalendar("getDate");
		var selectedM = date.format('YYYY/MM/DD');
		if(selectedM.substr(5,1)==0){
			var month = selectedM.substr(6,1)+"월";
			$("#sDate").text(month);
		}else{
			var month = selectedM.substr(5,2)+"월";
			$("#sDate").text(month);
		}
	});
	
	$("#dayB").click(function(){
// 		$("#monthB").css("margin-left","0px");
// 		$("#newSchedule").show();
		$(".plusicon").css("opacity","1");
		$("#newSchedule").prop("disabled", false);
		$("#newSchedule").css("cursor", "pointer");
		
		alert(startD);
		if(startD.substr(8,1)==0){
    		var sdate = startD.substr(9,1)+"일";
    		$("#sDate").text(sdate);
    	}else{
    		var date = startD.substr(8,2)+"일";
    		$("#sDate").text(sdate);
    	}
	});
	
	
	
	///////////////////* 일정  *//////////////////////////
	
	/* init 일정 */
	initSchedule(today);
	
	
	function initSchedule(today){
//		alert(today);
		
		if(today.substr(5,1)==0){
			var date = today.substr(6,1)+"월";
			$("#sDate").text(date);
		}else{
			var date = today.substr(5,2)+"월";
			$("#sDate").text(date);
		}
		
		$(".plusicon").css("opacity","0");
		$("#newSchedule").prop("disabled", true);
		$("#newSchedule").css("cursor", "default");
		
//		getSchedulesDates(today,today);
		getSchedulesMonth(today);
	}
	
	
	function getSchedulesMonth(date){
		var month = date.substr(2,7);
		
		$.ajax({				
			url: "getScheduleMonth.do",
			type:"GET",					
				data:{"month":month},
			error: function(jqXHR){
				alert(jqXHR.status);
				alert(jqXHR.statusText)
			},					
			dataType: "json",						
			success: function(resData){
//				alert(resData);
				printSchedule(resData);
				/*var result = $.trim(resData);
				if(result != "null"){
					
				} else if (result == "null") {
						$("#joinEF").text("등록된 일정이 없습니다.").css({
								'color' : '#00A591',
								'text-align' : 'center',
					});
				}*/
			}
		});
	}
	
	function getSchedulesDates(startDate, endDate){
//		alert(startDate);
//		alert(endDate)
		$.ajax({				
			url: "getScheduleDate.do",
			type:"GET",					
				data:{"startDate":startDate, "endDate":endDate},
			error: function(jqXHR){
				alert(jqXHR.status);
				alert(jqXHR.statusText)
			},					
			dataType: "json",						
			success: function(resData){
//				alert(resData);
				printSchedule(resData);
				if(result != null){
				} else if (result == null) {
						/*$("#joinEF").text("등록된 일정이 없습니다.").css({
								'color' : '#00A591',
								'text-align' : 'center',
					});*/
				}
			}
		});
	}
	
	function printSchedule(resData){
		 /* 일정 출력 */
		 /*for(var i in resData){
			 for(var key in resData[i]){
				 alert(resData[i][key]);
			 }
		 }*/
		 
		 /*var schData="[{title: '어린이날',start: '2018-05-05',end: '2018-05-06',color: 'lightblue'}," +
		 		"{title: '제주도 여행',start: '2018-05-11',end: '2018-05-14',color: 'lightpink'}," +
		 		"{title: '맛집탐방',start: '2018-05-25',end: '2018-05-26',color: 'lightpink'}]";
		
		 		alert(schData);*/
		
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
	        select: function(startDate, endDate) {
//	            alert('selected ' + startDate.format() + ' to ' + endDate.format());
	            startD = startDate.format().replace(/-/gi,"/");
	            endD = endDate.format().replace(/-/gi,"/");
	            var sdate;
	            var edate;
	            
	            if(startD.substr(8,1)==0){
	        		sdate = startD.substr(9,1);
	        	}else{
	        		sdate = startD.substr(8,2);
	        	}
	            if(endD.substr(8,1)==0){
	            	edate = endD.substr(9,1);
	        	}else{
	        		edate = endD.substr(8,2);
	        		$("#sDate").text(edate);
	        	}
	            if(startD.substr(5,2)==endD.substr(5,2)){
	            	if((edate-sdate)==1){
	            		$("#sDate").text(sdate+"일");
	            	}else{
	            		$("#sDate").text(sdate+"~"+edate+"일");
	            	}
//	            	$("#sDate").css("font-size","")
	            }
	            
	            $(".plusicon").css("opacity","1");
	    		$("#newSchedule").prop("disabled", false);
	    		$("#newSchedule").css("cursor", "pointer");
	          },
	        eventClick: function(a, b, c) {
	        	startD = a.start.format().replace(/-/gi,"/");
	            var d = $.fullCalendar.formatDate(a.start, "dddd, YYYY/MM/DD");
	            var f = $.fullCalendar.formatDate(a.end, "dddd, YYYY/MM/DD");
//	            var g = '<h5 style="margin:0;padding:0;">' + a.title + "</h5>";
//	            var h = '<p style="margin:0;padding:2px;"><b>Start:</b> ' + d + "<br />" + (f && '<p style="margin:0;padding:2px;"><b>End:</b> ' + f + "</p>" || "") + (a.description && '<p style="margin:0;padding:2px;"><b>What:</b> ' + a.description + "</p>" || "") + (a.location && '<p style="margin:0;padding:2px;"><b>Where:</b> ' + a.location + "</p>" || "");
//	            e.set({
//	                "content.title": g,
//	                "content.text": h
//	            }).reposition(b).show(b);
//	            var i = b.pageX;
//	            var j = b.pageY;
//	            $("td").each(function(a) {
//	                var b = $(this).offset();
//	                if (b.left + $(this).outerWidth() > i && b.left < i && b.top + $(this).outerHeight() > j && b.top < j) {
//	                    if ($(this).hasClass("fc-cell-overlay")) 
//	                    	$(this).addClass("fc-cell-overlay"); 
//	                    else 
//	                    	$("td").removeClass("fc-cell-overlay");
//	                    $(this).addClass("fc-cell-overlay");
//	                }
//	            });
	            if(startD.substr(8,1)==0){
	        		var date = startD.substr(9,1)+"일";
	        		$("#sDate").text(date);
	        	}else{
	        		var date = startD.substr(8,2)+"일";
	        		$("#sDate").text(date);
	        	}
	            $(".plusicon").css("opacity","1");
	    		$("#newSchedule").prop("disabled", false);
	    		$("#newSchedule").css("cursor", "pointer");
	        },
	        dayClick: function(date) {
//	        	var moment = $('#fullcalendar').fullCalendar('getDate');
//				alert("The current date of the calendar is " + moment.format())
	            e.hide();
	            $("td").removeClass("fc-cell-overlay");
//	            $(this).addClass('fc-cell-overlay');
	            /* 클릭한 날짜 잡아오기 */
//	            alert('Clicked on: ' + date.format());
	            clickedDate = date.format().replace(/-/gi,"/");
//				alert(clickedDate.substr(0,4));
//				alert(clickedDate.substr(5,2));
//				alert(clickedDate.substr(8,2));
//				alert('Clicked on: ' + clickedDate);
	        },
	        eventResizeStart: true,
	        eventDragStart: false,
	        viewDisplay: function() {
	            e.hide();
	        },
	       events : resData
		 });
	}
	
	
	
	//////////////////모달/////////////////////////
	
	//Get schedule row
	var row = document.getElementById('sdrow');
	
	//Get the modal
	var sModal = document.getElementById('scheduleModal');
	var aModal = document.getElementById('accountModal');
	var srModal = document.getElementById('sRowModal');
	var srModalEdit = document.getElementById('sRowModalEdit');
	
	//Get the button that opens the modal
	var nsbtn = document.getElementById("newSchedule");
	var srbtn = document.getElementById("saleReport");
	
	//Get the <span> element that closes the modal
	var scheduleClose = document.getElementsByClassName("close")[0];
	var accountClose = document.getElementsByClassName("accountM_close")[0];
	var sRowClose = document.getElementsByClassName("sRowModal_close")[0];
	var sRowEditClose = document.getElementsByClassName("sRowModalEdit_close")[0];
	
	//When the user clicks the button, open the modal 
	nsbtn.onclick = function() {
		sModal.style.display = "block";
		$("#datepicker").css("cssText","z-index:0 !important;");
		$(".fc-toolbar .fc-state-active, .fc-toolbar .ui-state-active").css({
			"z-index":"0"
		})
	
		alert(startD);
	}
	
	srbtn.onclick = function() {
		aModal.style.display = "block";
		$("#datepicker").css("cssText","z-index:0 !important;");
		$(".fc-toolbar .fc-state-active, .fc-toolbar .ui-state-active").css({
			"z-index":"0"
		})
	}
	
	row.onclick = function(){
		srModal.style.display = "block";
		$("#datepicker").css("cssText","z-index:0 !important;");
		$(".fc-toolbar .fc-state-active, .fc-toolbar .ui-state-active").css({
			"z-index":"0"
		})
	
	}
	
	//When the user clicks on <span> (x), close the modal
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
	
	sRowClose.onclick = function() {
		srModal.style.display = "none";
		$("#datepicker").css({
			"z-index":"9"
		});
		$(".fc-toolbar .fc-state-active, .fc-toolbar .ui-state-active").css({
			"z-index":"4"
		})
	}
	
	sRowEditClose.onclick = function(){
		srModalEdit.style.display = "none";
		$("#datepicker").css({
			"z-index":"9"
		});
		$(".fc-toolbar .fc-state-active, .fc-toolbar .ui-state-active").css({
			"z-index":"4"
		})
	}
	
	
	//When the user clicks anywhere outside of the modal, close it
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
	
		if (event.target == srModal) {
			srModal.style.display = "none";
			$("#datepicker").css({
				"z-index":"9"
			});
			$(".fc-toolbar .fc-state-active, .fc-toolbar .ui-state-active").css({
				"z-index":"4"
			})
		
		}
		
		if (event.target == srModalEdit) {
			srModalEdit.style.display = "none";
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
	var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"];
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


		//checkSelected();
		//checkBookings();
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


	$("#edit").click(function() {
		srModal.style.display = "none";
		srModalEdit.style.display = "block";
	});

	
	
});






////////////////////////지도////////////////////////


/* 일정 등록 모달 지도 */
 
	function initAutocomplete() {
		var map = new google.maps.Map(document.getElementById('map'), {
			center : {
				lat : 37.565609,
				lng : 126.977421
			},
			zoom : 14,
			mapTypeId : 'roadmap'
		});

		// Create the search box and link it to the UI element.
		var input = document.getElementById('pac-input');
		var searchBox = new google.maps.places.SearchBox(input);
		map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

		// Bias the SearchBox results towards current map's viewport.
		map.addListener('bounds_changed', function() {
			searchBox.setBounds(map.getBounds());
		});

		var markers = [];
		// Listen for the event fired when the user selects a prediction and retrieve
		// more details for that place.
		searchBox.addListener('places_changed', function() {
			var places = searchBox.getPlaces();

			if (places.length == 0) {
				return;
			}

			// Clear out the old markers.
			markers.forEach(function(marker) {
				marker.setMap(null);
			});
			markers = [];

			// For each place, get the icon, name and location.
			var bounds = new google.maps.LatLngBounds();
			places.forEach(function(place) {
				if (!place.geometry) {
					console.log("Returned place contains no geometry");
					return;
				}
				var icon = {
					url : place.icon,
					size : new google.maps.Size(71, 71),
					origin : new google.maps.Point(0, 0),
					anchor : new google.maps.Point(17, 34),
					scaledSize : new google.maps.Size(25, 25)
				};

				// Create a marker for each place.
				markers.push(new google.maps.Marker({
					map : map,
					icon : icon,
					title : place.name,
					position : place.geometry.location
				}));

				if (place.geometry.viewport) {
					// Only geocodes have viewport.
					bounds.union(place.geometry.viewport);
				} else {
					bounds.extend(place.geometry.location);
				}
			});
			map.fitBounds(bounds);
		});

		for(var i=0; i<markers.length; i++){
		google.maps.event.addListener(markers, 'click', function() {
			alert("마커!");
			/* var zoom = mapObj.getZoom();
			mapObj.setZoom(16);
			mapObj.setCenter(markers.getPosition());
			var infoWin = new google.maps.InfoWindow({
				content : infoWindowContent3
			});
			infoWin.open(mapObj, marker);
			
			window.setTimeout(function() {
				infoWin.close(); 
				mapObj.setZoom(zoom);
			}, 3000);
			
			if (marker3.getAnimation() !== null) { 
				marker3.setAnimation(null);
			} else {
				marker3.setAnimation(google.maps.Animation.BOUNCE);
			} */
		});
		}
	}

	google.maps.event.addDomListener(window, 'load', initAutocomplete);

	/* 상세일정 모달 지도 */
	function initsrmMap() {

		var srmMap = new google.maps.Map(document.getElementById('srmMap'), {
			center : {
				lat : 37.565609,
				lng : 126.977421
			},
			zoom : 14,
			mapTypeId : 'roadmap'
		});

		var marker = new google.maps.Marker({
			position : {
				lat : 37.565609,
				lng : 126.977421
			},
			title : '서울시청'
		});

		marker.setMap(srmMap);

		var infoWin = new google.maps.InfoWindow({
			content : '위도: 37.565609 , 경도: 126.977421'
		});

		infoWin.open(srmMap, marker);
	}

	google.maps.event.addDomListener(window, 'load', initsrmMap);

	/* 일정 수정 모달 지도 */
	function initsrmEditMap() {
		var srmEditMap = new google.maps.Map(document
				.getElementById('srmEditMap'), {
			center : {
				lat : 37.565609,
				lng : 126.977421
			},
			zoom : 14,
			mapTypeId : 'roadmap'
		});

		var marker = new google.maps.Marker({
			position : {
				lat : 37.565609,
				lng : 126.977421
			},
			title : '서울시청'
		});

		marker.setMap(srmEditMap);

		var infoWin = new google.maps.InfoWindow({
			content : '위도: 37.565609 , 경도: 126.977421'
		});

		infoWin.open(srmEditMap, marker);

		// Create the search box and link it to the UI element.
		var input = document.getElementById('srmEdit_pac-input');
		var searchBox = new google.maps.places.SearchBox(input);
		srmEditMap.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

		// Bias the SearchBox results towards current map's viewport.
		map.addListener('bounds_changed', function() {
			searchBox.setBounds(map.getBounds());
		});

		var markers = [];
		// Listen for the event fired when the user selects a prediction and retrieve
		// more details for that place.
		searchBox.addListener('places_changed', function() {
			var places = searchBox.getPlaces();

			if (places.length == 0) {
				return;
			}

			// Clear out the old markers.
			markers.forEach(function(marker) {
				marker.setMap(null);
			});
			markers = [];

			// For each place, get the icon, name and location.
			var bounds = new google.maps.LatLngBounds();
			places.forEach(function(place) {
				if (!place.geometry) {
					console.log("Returned place contains no geometry");
					return;
				}
				var icon = {
					url : place.icon,
					size : new google.maps.Size(71, 71),
					origin : new google.maps.Point(0, 0),
					anchor : new google.maps.Point(17, 34),
					scaledSize : new google.maps.Size(25, 25)
				};

				// Create a marker for each place.
				markers.push(new google.maps.Marker({
					map : srmEditMap,
					icon : icon,
					title : place.name,
					position : place.geometry.location
				}));

				if (place.geometry.viewport) {
					// Only geocodes have viewport.
					bounds.union(place.geometry.viewport);
				} else {
					bounds.extend(place.geometry.location);
				}
			});
			srmEditMap.fitBounds(bounds);
		});
	}

	google.maps.event.addDomListener(window, 'load', initsrmEditMap);