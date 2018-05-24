$(function(){
	
	var clickedDate;	// 클릭 날짜
	var moment = $('#fullcalendar').fullCalendar('getDate');
    var today = moment.format();
    
    var email = $("#myEmail").val();
	var income = $("#income");
	var expense = $("#expense");
	var sum = $("#sum");
	
	
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
				var moment = $('#fullcalendar').fullCalendar('getDate');
				alert("The current date of the calendar is " + moment.format())
				e.hide();
				$("td").removeClass("fc-cell-overlay");
				/* 클릭한 날짜 잡아오기 */
				clickedDate = date.format().replace(/-/gi,"/");
				alert(clickedDate.substr(0,4));
				alert(clickedDate.substr(5,2));
				alert(clickedDate.substr(8,2));
				alert('Clicked on: ' + clickedDate);
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

	
	$('.fc-today-button').click(function() {
		var moment = $('#fullcalendar').fullCalendar('getDate');
		alert(typeof moment.format());
	});


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
		var month = date.substr(0,7);
		// 가계부 월별 금액 불러오기
		$.ajax({
			url: "getMonthlySumAccountBook.do",
			type: "POST",
			data: {"email":email, "date":2, "amount":amount},
			error: function(jqXHR){
				alert("jqXHR.status: " + jqXHR.status);
				alert("jqXHR.statusText(): " + jqXHR.statusText());
			},
			dataType: "json",
			success: function(resData){
				//alert(resData.pwd);
				var result = $.trim(resData);
				//alert("result : "+result);
				if(result == 'ok'){
					//alert("로그인 성공");
					//event.preventDefault();
					//window.location.reload();
					window.location.assign("http://localhost/web/joinus/selectMenu.do");
				}else {
					alert("이메일 혹은 비밀번호가 틀렸습니다.");
					event.preventDefault();
				}
			}
		});
		
		
	});
	
	

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
	
	
	
	
	
	
	
	
	
	
	
	
	///////////////////////////////////////////////////////////////////////////////////
	///////////////////////				가계부				///////////////////////////
	///////////////////////////////////////////////////////////////////////////////////
	
	var budget = $("#budget");
	var budgetOk = 0;
	budget.click(function(){
		if(budgetOk == 0){
			var budgetText = budget.text();
			budget.text("");
			$('<input></input>').attr({
				"type":"text",
				"value":budgetText,
				"id":"budget"
			}).addClass("accountInput").appendTo(budget);
			
			$('<button></button>').text("저장").attr({
				"type":"button",
				"id":"saveBudget"
			}).addClass("accountRowSavebtn").appendTo(budget);
			budgetOk = 1;
		}else{
		}
	});
	
	$(document).on("click", "#saveBudget", function(){
		var amount;
		$('input[id^="budget"]').each(function(input){
			amount= $(this).val();
		});
		alert(amount);
		
		$.ajax({
			url: "saveBudget.do",
			type: "POST",
			data: {"email":email, "kind":2, "amount":amount},
			error: function(jqXHR){
				alert("jqXHR.status: " + jqXHR.status);
				alert("jqXHR.statusText(): " + jqXHR.statusText());
			},
			dataType: "json",
			success: function(resData){
				//alert(resData.pwd);
				var result = $.trim(resData);
				//alert("result : "+result);
				if(result == 'ok'){
					//alert("로그인 성공");
					//event.preventDefault();
					//window.location.reload();
					window.location.assign("http://localhost/web/joinus/selectMenu.do");
				}else {
					alert("이메일 혹은 비밀번호가 틀렸습니다.");
					event.preventDefault();
				}
			}
		});
	});



});

