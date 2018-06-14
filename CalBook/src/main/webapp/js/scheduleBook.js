
$(function(){
	
	var clickedDate;	// 클릭 날짜
	var now = new Date();
	var today = moment().format('YYYY/MM/DD');
	var firstD = new Date(now.getFullYear(), now.getMonth(), 1);
	var tempT = firstD.getHours()+9;
	firstD.setHours(tempT);
	firstD = firstD.toISOString().slice(0,10).replace(/-/gi,"/");
	var lastD = new Date(now.getFullYear(), now.getMonth()+1, 0);
	tempT = lastD.getHours()+9;
	lastD.setHours(tempT);
	lastD = lastD.toISOString().slice(0,10).replace(/-/gi,"/");
	
	var startD = today;
	var endD = new Date(now);
	tempT = endD.getDate()+1;
	endD.setDate(tempT);
	tempT = endD.getHours()+9;
	endD.setHours(tempT);
	endD = endD.toISOString().slice(0,10).replace(/-/gi,"/");
	
//	var plusstartD = startD.add(1, 'days').format('YYYY/MM/DD');
//	var subendD = endD.add(1, 'days').format('YYYY/MM/DD');
//	alert(startD+", "+endD);
	var selectedM = moment().format('YYYY/MM/DD');
	
    var email = $("#myEmail").val();
	
	$("#datepicker").datepicker({
	    changeMonth: true,
	    changeYear: true,
	    showOtherMonths: true,
	    selectOtherMonths: true,
	    showAnim: "drop",
	    inline: true,
	    onSelect: function(a,b) {
	        var c = new Date(a);
	        var d = new Date(a);
	        d.setDate(d.getDate()+1); 
	        $("#fullcalendar").fullCalendar("gotoDate", c);
	        $("#fullcalendar").fullCalendar("select", c, d);
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
	       select: function(startDate, endDate) {
//	    	   var a = new Date(endDate);
//	           alert('selected ' + startDate.format() + ' to ' + endDate.format());
	           startD = startDate.format().replace(/-/gi,"/");
	           endD = endDate.format().replace(/-/gi,"/");
	           var subendD = endDate.add(-1, 'days').format().replace(/-/gi,"/");
//	           plusstartD = startDate.add(1, 'days').format().replace(/-/gi,"/");
//	           var subendD = endD;
//	           alert(startD+","+subendD);
	           var sdate;
	           var edate;
	           
	           if(startD.substr(8,1)==0){
	        	   sdate = startD.substr(9,1);
	           }else{
	        	   sdate = startD.substr(8,2);
	           }
	           if(subendD.substr(8,1)==0){
	        	   edate = subendD.substr(9,1);
	           }else{
	        	   edate = subendD.substr(8,2);
	           }
	           
	           //선택한 시작날의 달과 끝 날의 달이 같을때
	           if(startD.substr(5,2) == subendD.substr(5,2)){
	        	   var tempS = sdate;
	        	   if(startD.substr(5,2) != firstD.substr(5,2)){
	        		   if(startD.substr(5,1)==0){
	        			   sdate = startD.substr(6,1)+"/"+sdate;
		        	   }else{
		        		   sdate = startD.substr(5,2)+"/"+sdate;
		        	   }
	        	   }
        		   if((edate-tempS)==0){
        			   $("#sDate").text(sdate+"일");
        		   }else{
        			   $("#sDate").text(sdate+"~"+edate+"일");
	        	   }
	           }else{ 
	        	   if(startD.substr(5,1)==0){
	        		   sdate = startD.substr(6,5);
	        	   }else{
	        		   sdate = startD.substr(5,5);
	        	   }
	        	   if(subendD.substr(5,1)==0){
	        		   edate = subendD.substr(6,1)+"/"+edate;
	        		   $("#sDate").text(sdate+"~"+edate+"일");
	        	   }else{
	        		   edate = subendD.substr(5,2)+"/"+edate;
	        		   $("#sDate").text(sdate+"~"+edate+"일");
	        	   }
	           }

	           $(".plusicon").css("opacity","1");
	           $("#newSchedule").prop("disabled", false);
	           $("#newSchedule").css("cursor", "pointer");
	           
//	           alert(startD +", "+endD);
	           getSchedulesDates(startD, endD);
	         },
	       eventClick: function(a, b, c) {
//	       		startD = a.start.format().replace(/-/gi,"/");
//	           var d = $.fullCalendar.formatDate(a.start, "dddd, YYYY/MM/DD");
//	           var f = $.fullCalendar.formatDate(a.end, "dddd, YYYY/MM/DD");
//	           var g = '<h5 style="margin:0;padding:0;">' + a.title + "</h5>";
//	           var h = '<p style="margin:0;padding:2px;"><b>Start:</b> ' + d + "<br />" + (f && '<p style="margin:0;padding:2px;"><b>End:</b> ' + f + "</p>" || "") + (a.description && '<p style="margin:0;padding:2px;"><b>What:</b> ' + a.description + "</p>" || "") + (a.location && '<p style="margin:0;padding:2px;"><b>Where:</b> ' + a.location + "</p>" || "");
//	           e.set({
//	               "content.title": g,
//	               "content.text": h
//	           }).reposition(b).show(b);
//	           var i = b.pageX;
//	           var j = b.pageY;
//	           $("td").each(function(a) {
//	               var b = $(this).offset();
//	               if (b.left + $(this).outerWidth() > i && b.left < i && b.top + $(this).outerHeight() > j && b.top < j) {
//	                   if ($(this).hasClass("fc-cell-overlay")) 
//	                   	$(this).addClass("fc-cell-overlay"); 
//	                   else 
//	                   	$("td").removeClass("fc-cell-overlay");
//	                   $(this).addClass("fc-cell-overlay");
//	               }
//	           });
	          /* if(startD.substr(8,1)==0){
	        	   var date = startD.substr(9,1)+"일";
	        	   $("#sDate").text(date);
	           }else{
	        	   var date = startD.substr(8,2)+"일";
	        	   $("#sDate").text(date);
	           }*/
//	           $(".plusicon").css("opacity","1");
//	           $("#newSchedule").prop("disabled", false);
//	           $("#newSchedule").css("cursor", "pointer");
	       },
	       dayClick: function(date) {
//	    	   var moment = $('#fullcalendar').fullCalendar('getDate');
//	    	   alert("The current date of the calendar is " + moment.format())
	    	   e.hide();
	    	   $("td").removeClass("fc-cell-overlay");
//	    	   $(this).addClass('fc-cell-overlay');
	    	   /* 클릭한 날짜 잡아오기 */
//	    	   alert('Clicked on: ' + date.format());
	    	   clickedDate = date.format().replace(/-/gi,"/");
//	    	   alert(clickedDate.substr(0,4));
//	    	   alert(clickedDate.substr(5,2));
//	    	   alert(clickedDate.substr(8,2));
//	    	   alert('Clicked on: ' + clickedDate);
	       },
	       eventResizeStart: true,
	       eventDragStart: false,
	       viewDisplay: function() {
	    	   e.hide();
	       },
	       displayEventTime: false,
	       events : {
	    	   url: './getcalSchedules.do',
	    	   cache: true
	       }
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
	
	/*오늘날짜*/
	$('.fc-today-button').click(function() {
		var date = $("#fullcalendar").fullCalendar("getDate");
		selectedM = date.format('YYYY/MM/DD');
		
		var now = new Date(date);
		firstD = new Date(now.getFullYear(), now.getMonth(), 1);
		var tempT = firstD.getHours()+9;
		firstD.setHours(tempT);
		firstD = firstD.toISOString().slice(0,10).replace(/-/gi,"/");
		lastD = new Date(now.getFullYear(), now.getMonth()+1, 0);
		tempT = lastD.getHours()+9;
		lastD.setHours(tempT);
		lastD = lastD.toISOString().slice(0,10).replace(/-/gi,"/");
		
		today = moment().format('YYYY/MM/DD');
		todayP1 = new Date(today);
		var n = todayP1.getDate()+1;
		todayP1.setDate(n);
		tempT = todayP1.getHours()+9;
		todayP1.setHours(tempT);
		todayP1 = todayP1.toISOString().slice(0,10).replace(/-/gi,"/");
		
		startD = today;
		endD = todayP1;
		
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
		
		getSchedulesDates(today, todayP1);
	});
	
	/*이전달*/
	$('.fc-prev-button').click(function() {
		var date = $("#fullcalendar").fullCalendar("getDate");
		selectedM = date.format('YYYY/MM/DD');
		
		var now = new Date(date);
		firstD = new Date(now.getFullYear(), now.getMonth(), 1);
		var tempT = firstD.getHours()+9;
		firstD.setHours(tempT);
		firstD = firstD.toISOString().slice(0,10).replace(/-/gi,"/");
		lastD = new Date(now.getFullYear(), now.getMonth()+1, 0);
		tempT = lastD.getHours()+9;
		lastD.setHours(tempT);
		lastD = lastD.toISOString().slice(0,10).replace(/-/gi,"/");
		
		endP1 = new Date(date);
		var n = endP1.getDate()+1;
		endP1.setDate(n);
		tempT = endP1.getHours()+9;
		endP1.setHours(tempT);
		endP1 = endP1.toISOString().slice(0,10).replace(/-/gi,"/");
		
		startD = firstD;
		endD = endP1;
		
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
		
		
		getSchedulesMonth(firstD, lastD);
	});
	
	/*다음달*/
	$('.fc-next-button').click(function() {
		var date = $("#fullcalendar").fullCalendar("getDate");
		selectedM = date.format('YYYY/MM/DD');
		
		var now = new Date(date);
		firstD = new Date(now.getFullYear(), now.getMonth(), 1);
		var tempT = firstD.getHours()+9;
		firstD.setHours(tempT);
		firstD = firstD.toISOString().slice(0,10).replace(/-/gi,"/");
		lastD = new Date(now.getFullYear(), now.getMonth()+1, 0);
		tempT = lastD.getHours()+9;
		lastD.setHours(tempT);
		lastD = lastD.toISOString().slice(0,10).replace(/-/gi,"/");
		
		endP1 = new Date(date);
		var n = endP1.getDate()+1;
		endP1.setDate(n);
		tempT = endP1.getHours()+9;
		endP1.setHours(tempT);
		endP1 = endP1.toISOString().slice(0,10).replace(/-/gi,"/");
		
		startD = firstD;
		endD = endP1;
		
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
		
		getSchedulesMonth(firstD, lastD);
	});
	
	/*월별버튼*/
	$("#monthB").click(function(){
		$(".plusicon").css("opacity","0");
		$("#newSchedule").prop("disabled", true);
		$("#newSchedule").css("cursor", "default");
		
		var date = $("#fullcalendar").fullCalendar("getDate");
//		var selectedM = date.format('YYYY/MM/DD');
//		firstD=selectedM;
		if(firstD.substr(5,1)==0){
			var month = firstD.substr(6,1)+"월";
			$("#sDate").text(month);
		}else{
			var month = firstD.substr(5,2)+"월";
			$("#sDate").text(month);
		}
		
		var now = new Date(date);
		lastD = new Date(now.getFullYear(), now.getMonth()+1, 0);
		var tempT = lastD.getHours()+9;
		lastD.setHours(tempT);
		lastD = lastD.toISOString().slice(0,10).replace(/-/gi,"/")
		
		getSchedulesMonth(firstD, lastD);
	});
	
	/*일별버튼*/
	$("#dayB").click(function(){
		$(".plusicon").css("opacity","1");
		$("#newSchedule").prop("disabled", false);
		$("#newSchedule").css("cursor", "pointer");
		
//		var date = $("#fullcalendar").fullCalendar("getDate");
//		var selectedM = date.format('YYYY/MM/DD');
//		startD=selectedM;
//		if(startD.substr(8,1)==0){
//    		var sdate = startD.substr(9,1)+"일";
//    		$("#sDate").text(sdate);
//    	}else{
//    		var sdate = startD.substr(8,2)+"일";
//    		$("#sDate").text(sdate);
//    	}
		
		var subendD = new Date(endD);
		var tempT = subendD.getDate()-1;
		subendD.setDate(tempT);
		tempT = subendD.getHours()+9;
		subendD.setHours(tempT);
		subendD = subendD.toISOString().slice(0,10).replace(/-/gi,"/");
		
//		alert("sub:"+subendD);
		
         var sdate;
         var edate;
         
         if(startD.substr(8,1)==0){
      	   sdate = startD.substr(9,1);
         }else{
      	   sdate = startD.substr(8,2);
         }
         if(subendD.substr(8,1)==0){
      	   edate = subendD.substr(9,1);
         }else{
      	   edate = subendD.substr(8,2);
         }
         
         //선택한 시작날의 달과 끝 날의 달이 같을때
         if(startD.substr(5,2) == subendD.substr(5,2)){
      	   var tempS = sdate;
      	   if(startD.substr(5,2) != firstD.substr(5,2)){
      		   if(startD.substr(5,1)==0){
      			   sdate = startD.substr(6,1)+"/"+sdate;
	        	   }else{
	        		   sdate = startD.substr(5,2)+"/"+sdate;
	        	   }
      	   }
  		   if((edate-tempS)==0){
  			   $("#sDate").text(sdate+"일");
  		   }else{
  			   $("#sDate").text(sdate+"~"+edate+"일");
      	   }
         }else{ 
      	   if(startD.substr(5,1)==0){
      		   sdate = startD.substr(6,5);
      	   }else{
      		   sdate = startD.substr(5,5);
      	   }
      	   if(subendD.substr(5,1)==0){
      		   edate = subendD.substr(6,1)+"/"+edate;
      		   $("#sDate").text(sdate+"~"+edate+"일");
      	   }else{
      		   edate = subendD.substr(5,2)+"/"+edate;
      		   $("#sDate").text(sdate+"~"+edate+"일");
      	   }
         }
		
		getSchedulesDates(startD, endD);
	});
	
	
	
	/* init 일정 */
	initSchedule(firstD, lastD);
	
	
	//일정 클릭
	//row.onclick = function(){
	$(document).on("click",".todo_content", function(){
		var seq = $(this).parent().find(".todo_seq").val();
		
		srModal.style.display = "block";
		$("#datepicker").css("cssText","z-index:0 !important;");
		$(".fc-toolbar .fc-state-active, .fc-toolbar .ui-state-active").css({
			"z-index":"0"
		})
		
		$.ajax({		
			url: "getSchedule.do",
			type:"GET",					
				data:{"seq":seq},
			error: function(jqXHR){
				alert(jqXHR.status);
				alert(jqXHR.statusText)
			},					
			dataType: "json",						
			success: function(resData){
				for(var key in resData){
					if(key=="start_date"){
						start = resData[key];
						start = start.substr(0,10).replace(/-/gi,"/");
						$(".sRowSdate").text(start);
//						alert(start);
					}else if(key=="finish_date"){
						end = resData[key];
						end = end.substr(0,10);
						endm1 = new Date(end);
						var n = endm1.getDate()-1;
						endm1.setDate(n);
						var tempT = endm1.getHours()+9;
						endm1.setHours(tempT);
						endm1 = endm1.toISOString().slice(0,10).replace(/-/gi,"/");
						$(".sRowEdate").text(endm1);
//						alert(end);
					}else if(key=="title"){
						title = resData[key];
						$(".sRowtitle").text(title).css({"font-weight": "bold", "font-size": "20px"});
					}else if(key=="g_num"){
						if(resData[key]!=0){
							$(".edit").hide();
						}else{
							$(".edit").show();
						}
					}else if(key=="important"){
						if(resData[key]==1){
							$(".sRowimportant").text("하").css("color","#add8e6");
						}else if(resData[key]==2){
							$(".sRowimportant").text("중").css("color","#ffc966");
						}else{
							$(".sRowimportant").text("상").css("color","#ffb6c1");
						}
					}else if(key == "content"){
						$(".sRowcontent").text(resData[key]);
					}
				}
				$(".todo_modal_seq").remove();
				var text = '<input type="hidden" class="todo_modal_seq" value="'+seq+'">';
				$(".srm-body").append(text);
			}
		});
		
	});
	
	//일정 삭제
	$(document).on("click",".minus-btn", function(){
		var mdCheck = $(".plusicon").css('opacity');
		var seq = $(this).parent().parent().find(".todo_seq").val();
		
		$.ajax({		
			url: "delSchedule.do",
			type:"GET",					
				data:{"seq":seq},
			error: function(jqXHR){
				alert(jqXHR.status);
				alert(jqXHR.statusText)
			},					
			dataType: "text",						
			success: function(resData){
				if(resData == '1'){
					alert("삭제완료");
				}else{
					alert("삭제실패");
				}
				
				if(mdCheck == '0'){
					getSchedulesMonth(firstD, lastD);
				}else{
					getSchedulesDates(startD, endD);
				}
				
				$("#fullcalendar").fullCalendar('refetchEvents');
			}
		});
	});
	
	
	
	
	//////////////////모달/////////////////////////
	
	//Get schedule row
//	var row = document.getElementById('sdrow');
//	var row = document.getElementByClassName()
	
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
	
	//save modal's contents
	var scheduleSave = document.getElementsByClassName("save")[0];
	var editSave = document.getElementById("editSave");
	
	//When the user clicks the button, open the modal 
	
	//일정 등록 모달
	nsbtn.onclick = function() {
		$(".smtitle").val('');
		$(".smcontent").val('');
		$(".modalO").attr("selected","selected");
		
		sModal.style.display = "block";
		$("#datepicker").css("cssText","z-index:0 !important;");
		$(".fc-toolbar .fc-state-active, .fc-toolbar .ui-state-active").css({
			"z-index":"0"
		})
		
		$(".startD").attr("value",startD);
		var date = new Date(endD);
		var tempT = date.getDate()-1;
		date.setDate(tempT);
		tempT = date.getHours()+9;
		date.setHours(tempT);
		date = date.toISOString().slice(0,10).replace(/-/gi,"/");
		$(".endD").attr("value",date);
	}
	
	srbtn.onclick = function() {
		aModal.style.display = "block";
		$("#datepicker").css("cssText","z-index:0 !important;");
		$(".fc-toolbar .fc-state-active, .fc-toolbar .ui-state-active").css({
			"z-index":"0"
		})
	}
	
	/*일정 저장*/
	scheduleSave.onclick = function(){
		var title = $(".smtitle").val();
		var content = $(".smcontent").val();
		
		if(title == ""){
			alert("제목이 비었습니다.");
			$(".smtitle").focus();
		}else if(content == ""){
			alert("내용이 비었습니다.");
			$(".smcontent").focus();
		}else{
			var params = $("#scsaveForm").serialize();
			
	//		alert(params);
			
			$.ajax({				
				url: "addSchedule.do",
				type:"POST",			
	//			data:params,
				data:params+"&startDate="+startD+"&endDate="+endD,
				error: function(jqXHR){
					alert(jqXHR.status);
					alert(jqXHR.statusText)
				},					
				dataType: "text",
				success: function(resData){
					if(resData == '1'){
						alert("등록성공");
						
						getSchedulesDates(startD, endD);
						
						sModal.style.display = "none";
						$("#datepicker").css({
							"z-index":"9"
						});
						$(".fc-toolbar .fc-state-active, .fc-toolbar .ui-state-active").css({
							"z-index":"4"
						})
						
						$("#fullcalendar").fullCalendar('refetchEvents');
					}else{
						alert("등록실패");
					}
					
				}
			});
		
		}
	}
	
	/*일정 수정 저장*/
	editSave.onclick = function(){
		var title = $(".srmtitle").val();
		var content = $(".srmcontent").val();
		
		if(title == ""){
			alert("제목이 비었습니다.");
			$(".srmtitle").focus();
		}else if(content == ""){
			alert("내용이 비었습니다.");
			$(".srmcontent").focus();
		}else{
			
			var params = $("#srmsaveForm").serialize();
			var seq = $(".todo_modal_seq").val();
			
			$.ajax({				
				url: "updateSchedule.do",
				type:"POST",
	//			data:params,
				data:params+"&seq="+seq,
				error: function(jqXHR){
					alert(jqXHR.status);
					alert(jqXHR.statusText);
				},					
				dataType: "text",
				success: function(resData){
					if(resData == '1'){
						alert("수정 성공");
						
						if($("#newSchedule").prop("disabled")==true){
							getSchedulesDates(firstD, lastD);
						}else{
							getSchedulesDates(startD, endD);
						}
						
						srModalEdit.style.display = "none";
						$("#datepicker").css({
							"z-index":"9"
						});
						$(".fc-toolbar .fc-state-active, .fc-toolbar .ui-state-active").css({
							"z-index":"4"
						})
						
						$("#fullcalendar").fullCalendar('refetchEvents');
					}else{
						alert("수정 실패");
					}
					
				}
			});
		}
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
	
	
	sRowEditClose.onclick = function() {
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


	/*수정 클릭*/
	$("#edit").click(function() {
		var seq = $(".todo_modal_seq").val();
		var title = $(".sRowtitle").text();
		var sdate = $(".sRowSdate").text();
		var edate = $(".sRowEdate").text();
		var important = $(".sRowimportant").text();
		var content = $(".sRowcontent").text();

		srModal.style.display = "none";
		srModalEdit.style.display = "block";

//		alert(seq+" "+title+" "+sdate+" "+edate+" "+important+" "+content);
		
		$(".borderTitle").val(title);
		$(".startD").val(sdate);
		$(".endD").val(edate);
		if(important=="상"){
			$(".modalR").attr("selected", "selected");
		}else if(important=="중"){
			$(".modalO").attr("selected", "selected");
		}else{
			$(".modalG").attr("selected", "selected");
		}
		$(".borderContent").text(content);
		
	});

	
});



///////////////////* 일정  *//////////////////////////

/*일정 초기화*/
function initSchedule(fistDate, lastDate){
//	alert(startDate+"~~~~ "+endDate);
	
	if(fistDate.substr(5,1)==0){
		var date = fistDate.substr(6,1)+"월";
		$("#sDate").text(date);
	}else{
		var date = fistDate.substr(5,2)+"월";
		$("#sDate").text(date);
	}
	
	$(".plusicon").css("opacity","0");
	$("#newSchedule").prop("disabled", true);
	$("#newSchedule").css("cursor", "default");
	
	getSchedulesMonth(fistDate, lastDate);
//	getSchedulesDates(startDate, subendD, plusstartD, endDate)
}


/*일정 월별 출력*/
function getSchedulesMonth(fistDate, lastDate){
//	var month = date.substr(2,5);
//	alert(fistDate+", "+lastDate);
	
	$.ajax({		
		url: "getScheduleMonth.do",
		type:"GET",					
			data:{"startDate":fistDate, "endDate":lastDate},
		error: function(jqXHR){
			alert(jqXHR.status);
			alert(jqXHR.statusText)
		},					
		dataType: "json",						
		success: function(resData){
			printSchedule(resData);
			printScheduleTab(resData);
//			printScheduleOrange(resData);
//			printScheduleBlue(resData);
		}
	});
}

/*일정 날짜별 출력*/
function getSchedulesDates(startDate, endDate){
//	alert(startDate+", "+endDate);
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
//			alert(resData);
			printSchedule(resData);
			printScheduleTab(resData);
//			printScheduleOrange(resData);
//			printScheduleBlue(resData);
		}
	});
}

/*전체 탭 출력*/
function printSchedule(resData){
     /* 칸 비우기*/
	$(".allDiv").empty();
	
	 /* 일정 출력 */
	for(var i in resData){
		var $div1 = $("<div/>").addClass("todo");
		var $div2 = $("<div/>").addClass("todo_date");
		var $div3 = $("<div/>").addClass("todo_content");
		var $div4 = $("<div/>").addClass("todo-btn");
		
		var start;
		var end;
		
		for(var key in resData[i]){
				if(key=="start_date"){
					start = resData[i][key];
					if(start.substr(8,1)==0){
						start = start.substr(9,1);
//						alert("s "+start);
					}else{
						start = start.substr(8,2);
//						alert("s "+start);
					}
				}else if(key=="finish_date"){
					end = resData[i][key];
					if(end.substr(8,1)==0){
						end = end.substr(9,1);
//						alert("e "+end);
					}else{
						end = end.substr(8,2);
//						alert("e "+end);
					}
				}else if(key=="title"){
					$div3.text(resData[i][key]);
				}else if(key=="g_num"){
					if(resData[i][key] == 0){
						$div4.append('<i class="fa fa-minus minus-btn"></i>');
					}
				}else if(key=="important"){
					if(resData[i][key]==1){
						$div1.css({
							"background-color": "#add8e6"
						});
					}else if(resData[i][key]==2){
						$div1.css({
							"background-color": "#ffc966"
						});
					}else{
						$div1.css({
							"background-color": "#ffb6c1"
						});
					}
				}else if(key == "seq"){
					var text = '<input type="hidden" class="todo_seq" value="'+resData[i][key]+'">';
//					alert(text);
					$div1.append(text);
				}
		}
		
//		alert("e-s :"+ (end-start));
		if((end-start) <= 1 ){
//			alert("하루");
			$div2.text(start+"일");
		}else if((end-start) > 1){
//			alert("이틀이상");
			end = end-1;
			$div2.text(start+"~"+end+"일");
		}

		$div1.append($div2);
		$div1.append($div3);
		$div1.append($div4);
		
		$(".allDiv").append($div1);
	}
//		$(".all").append('<div id="sdrow" class="todo" style="background-color: #add8e6"><div class="todo_date">5일</div><div class="todo_content">어린이날</div><div class="todo-btn"><i class="fa fa-minus minus-btn"></i></div></div>');
}

/*나머지 탭 출력*/
function printScheduleTab(resData){
    /* 칸 비우기*/
	$(".firstDiv").empty();
	$(".secondDiv").empty();
	$(".thirdDiv").empty();
	
	 /* 일정 출력 */
	for(var i in resData){
		var $div1 = $("<div/>").addClass("todo");
		var $div2 = $("<div/>").addClass("todo_date");
		var $div3 = $("<div/>").addClass("todo_content");
		var $div4 = $("<div/>").addClass("todo-btn");
		
		var start;
		var end;
		
		for(var key in resData[i]){
				if(key=="start_date"){
					start = resData[i][key];
					if(start.substr(8,1)==0){
						start = start.substr(9,1);
					}else{
						start = start.substr(8,2);
					}
				}else if(key=="finish_date"){
					end = resData[i][key];
					if(end.substr(8,1)==0){
						end = end.substr(9,1);
					}else{
						end = end.substr(8,2);
					}
				}else if(key=="title"){
					$div3.text(resData[i][key]);
				}else if(key=="g_num"){
					if(resData[i][key] == 0){
						$div4.append('<i class="fa fa-minus minus-btn"></i>');
					}
				}else if(key=="important"){
					if(resData[i][key]==3){
						$div1.css({
							"background-color": "#ffb6c1"
						});
					}else if(resData[i][key]==2){
						$div1.css({
							"background-color": "#ffc966"
						});
					}else if(resData[i][key]==1){
						$div1.css({
							"background-color": "#add8e6"
						});
					}
				}else if(key == "seq"){
					var text = '<input type="hidden" class="todo_seq" value="'+resData[i][key]+'">';
//					alert(text);
					$div1.append(text);
				}
				
		}
		
//		alert("e-s :"+ (end-start));
		if((end-start) <= 1 ){
//			alert("하루");
			$div2.text(start+"일");
		}else if((end-start) > 1){
//			alert("이틀이상");
			end = end-1;
			$div2.text(start+"~"+end+"일");
		}

		$div1.append($div2);
		$div1.append($div3);
		$div1.append($div4);
		
		if(rgb2hex($div1.css("background-color"))=="#ffb6c1"){
			$(".firstDiv").append($div1);
		}else if(rgb2hex($div1.css("background-color"))=="#ffc966"){
			$(".secondDiv").append($div1);
		}else if(rgb2hex($div1.css("background-color"))=="#add8e6"){
			$(".thirdDiv").append($div1);
		}
	}
}

/*rgb hex 로 값 바꾸기*/
function rgb2hex(rgb) {
    if (  rgb.search("rgb") == -1 ) {
         return rgb;
    } else {
         rgb = rgb.match(/^rgba?\((\d+),\s*(\d+),\s*(\d+)(?:,\s*(\d+))?\)$/);
         function hex(x) {
              return ("0" + parseInt(x).toString(16)).slice(-2);
         }
         return "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
    }
}





////////////////////////지도////////////////////////

/* 일정 등록 모달 지도 */
	 
function initAutocomplete() {

	var map = new google.maps.Map(document.getElementById('map'), {
		center: {lat: 37.566229 , lng: 126.978016},
		zoom: 13
	});

	var input = document.getElementById('pac-input');

	var autocomplete = new google.maps.places.Autocomplete(input);
	autocomplete.bindTo('bounds', map);

	map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

	var infowindow = new google.maps.InfoWindow();
	var marker = new google.maps.Marker({
		map: map
	});

	marker.addListener('click', function() {
		infowindow.open(map, marker);
	});

	autocomplete.addListener('place_changed', function() {
		infowindow.close();
		var place = autocomplete.getPlace();
		if (!place.geometry) {
			return;
		}

		if (place.geometry.viewport) {
			map.fitBounds(place.geometry.viewport);
		} else {
			map.setCenter(place.geometry.location);
			map.setZoom(17);
		}

		// Set the position of the marker using the place ID and location.
		marker.setPlace({
			placeId: place.place_id,
			location: place.geometry.location
		});
		marker.setVisible(true);

		document.getElementById('place-name').textContent = place.name;
		document.getElementById('place-address').textContent = place.formatted_address;
		infowindow.setContent(document.getElementById('infowindow-content'));
		infowindow.open(map, marker);

	});
}

google.maps.event.addDomListener(window, 'load', initAutocomplete);

/* 상세일정 모달 지도 */
function initsrmMap() {

	var request = {
			placeId: 'ChIJPXacoeqifDURZFdnLXIyirI'
	};

	var infowindow = new google.maps.InfoWindow();

	var srmMap = new google.maps.Map(document.getElementById('srmMap'), {
		zoom: 17
	});

	var marker = new google.maps.Marker({
		map: srmMap,
	});


	function callback(place, status) {
		if (status == google.maps.places.PlacesServiceStatus.OK) {
			marker.setPosition(place.geometry.location);
			srmMap.setCenter(marker.getPosition());
			marker.setMap(srmMap);

			document.getElementById('srm-place-name').textContent = place.name;
			document.getElementById('srm-place-address').textContent = place.formatted_address;
			infowindow.setContent(document.getElementById('srm-infowindow-content'));
			infowindow.open(srmMap, marker);
		}
	}

	service = new google.maps.places.PlacesService(srmMap);
	service.getDetails(request, callback);

	marker.addListener('click', function() {
		infowindow.open(srmMap, marker);
	});      

}

google.maps.event.addDomListener(window, 'load', initsrmMap);

/* 일정 수정 모달 지도 */
function initsrmEditMap() {

	var request = {
			placeId: 'ChIJPXacoeqifDURZFdnLXIyirI'
	};

	var srmEditmap = new google.maps.Map(document.getElementById('srmEditMap'), {
		zoom: 17
	});

	var input = document.getElementById('srmEdit_pac-input');

	var autocomplete = new google.maps.places.Autocomplete(input);
	autocomplete.bindTo('bounds', srmEditmap);

	srmEditmap.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

	var infowindow = new google.maps.InfoWindow();

	var marker = new google.maps.Marker({
		map: srmEditmap
	});

	function callback(place, status) {
		if (status == google.maps.places.PlacesServiceStatus.OK) {
			marker.setPosition(place.geometry.location);
			srmEditmap.setCenter(marker.getPosition());
			marker.setMap(srmEditmap);

			document.getElementById('srmEdit-place-name').textContent = place.name;
			document.getElementById('srmEdit-place-address').textContent = place.formatted_address;
			infowindow.setContent(document.getElementById('srmEdit-infowindow-content'));
			infowindow.open(srmEditmap, marker);
		}
	}

	marker.addListener('click', function() {
		infowindow.open(srmEditmap, marker);
	});

	autocomplete.addListener('place_changed', function() {
		infowindow.close();
		var place = autocomplete.getPlace();
		if (!place.geometry) {
			return;
		}

		if (place.geometry.viewport) {
			srmEditmap.fitBounds(place.geometry.viewport);
		} else {
			srmEditmap.setCenter(place.geometry.location);
			srmEditmap.setZoom(13);
		}

		// Set the position of the marker using the place ID and location.
		marker.setPlace({
			placeId: place.place_id,
			location: place.geometry.location
		});
		marker.setVisible(true);

		document.getElementById('srmEdit-place-name').textContent = place.name;
		document.getElementById('srmEdit-place-address').textContent = place.formatted_address;
		infowindow.setContent(document.getElementById('srmEdit-infowindow-content'));
		infowindow.open(srmEditmap, marker);
	});

	service = new google.maps.places.PlacesService(srmEditmap);
	service.getDetails(request, callback);
}

google.maps.event.addDomListener(window, 'load', initsrmEditMap);