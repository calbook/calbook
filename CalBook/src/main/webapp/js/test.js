$(function(){
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
   
   // latitude&longitude
   var latitude;
   var longitude;
   
   
   // accountbook
   var calendarType = "daily";   // daily&monthly
   var today = moment().format('YYYY/MM/DD');
   var clickedDate = today;
   var modalDate;   // 가계부 모달 날짜
   
   // Get the element that SumAccountBook data
   var income = $("#income");
   var expense = $("#expense");
   var sum = $("#sum");
   
   // Get the element that AccountBook title, ex) (clickedDate: 2018/05/31)
   var accountTitle = $(".accountTitle");
   accountTitle.html('가계부(선택된 날짜: <span>'+today+'</span>)');
   
   // Get Data SumAccountBook&AccountBook
   getDaily(today);
   
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
         select: function(startDate, endDate) {
         //alert('selected ' + startDate.format() + ' to ' + endDate.format());
             startD = startDate.format().replace(/-/gi,"/");
             endD = endDate.add(-1, 'days').format().replace(/-/gi,"/");
             
             // if not one day -> get data of period SumAccountBook&AccountBook
             if(startD != endD){
                getPeriod(startD, endD);                
             }
             
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
               //$("#sDate").text(edate);
             }
             
//             if(startD.substr(5,2)==endD.substr(5,2)){
//                if((edate-sdate)==1){
//                   $("#sDate").text(sdate+"일");
//                }else{
//                   $("#sDate").text(sdate+"~"+edate+"일");
//                }
//             }
//             $(".plusicon").css("opacity","1");
//           $("#newSchedule").prop("disabled", false);
//           $("#newSchedule").css("cursor", "pointer");
           },
           dayClick: function(date) {
            e.hide();
            $("td").removeClass("fc-cell-overlay");
            /* 클릭한 날짜 잡아오기 */
            clickedDate = date.format().replace(/-/gi,"/");
            calendarType = "daily";
            getDaily(clickedDate);
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

   
   // click event - today button
   $('.fc-today-button').click(function() {
      clickedDate = today;
      calendarType = "daily";
      getDaily(clickedDate);
   });

   
   
   // click event - Monthly button
   $("#monthB").click(function(){
      calendarType = "monthly";
      //if(clickedDate == null || clickedDate == "" || clickedDate == "null"){
      if(clickedDate == today){
         getMonthly(today);
      }else{
         getMonthly(clickedDate);
      }
   });
   
   
   // click event - Daily button
   $("#dayB").click(function(){
      calendarType = "daily";
      //if(clickedDate == null || clickedDate == "" || clickedDate == "null"){
      if(clickedDate == today){
         getDaily(today);
      }else{
         getDaily(clickedDate);
      }
      
   });
   
   
   // click event - prev button
   $(".fc-prev-button").click(function(){
      clickedDate = $("#fullcalendar").fullCalendar('getDate').format().replace(/-/gi,"/").substr(0,10);
      alert(clickedDate);
      if(calendarType == "daily"){
         getDaily(clickedDate);
      }else{
         getMonthly(clickedDate);
      }
   });
   
   
   // click event - next button
   $(".fc-next-button").click(function(){
      clickedDate = $("#fullcalendar").fullCalendar('getDate').format().replace(/-/gi,"/").substr(0,10);
      if(calendarType == "daily"){
         getDaily(clickedDate);
      }else{
         getMonthly(clickedDate);
      }
   });
   
   
   


/*   
    getCurrentPostion() 
   function getLocation() {
       if (navigator.geolocation) {
           navigator.geolocation.getCurrentPosition(showPosition);
       } else {
          alert("Geolocation is not supported by this browser.")
       }
   }
   
   function showPosition(position) {
      latitude = position.coords.latitude;
      longitude = position.coords.longitude
      //alert("Latitude: " + position.coords.latitude + "<br>Longitude: " + position.coords.longitude);
   }
   
   
   function initMap(){
      var mapCanvas = document.getElementById("googleMap");
      var mapOption = {
            center: new google.maps.LatLng(37.556556, 126.919485),       ,로 구분 
            zoom: 17                                        마지막꺼에는 , 넣지 않음  
      };
      
      //var mapObj = new google.maps.Map(맵이 표시될 div, 맵의 옵션);
      var mapObj = new google.maps.Map(mapCanvas, mapOption);
   }
   
   google.maps.event.addDomListener(window, 'load', initMap);    window가 다 load되면 initMap이 실행됨 
   
    google Map & google Place Api 
   var map;
   var service;
   var infowindow;
   
   function initMap(){
      var pyrmont = {lat: latitude, lng: longitude};
      
      map = new google.maps.Map(document.getElementById('googleMap'), {
         center: pyrmont,
         zoom: 15
      });
            
      var request = {
         location: pyrmont,
         radius: 500,
         types: ['store']
      };
      
      infowindow = new google.maps.InfoWindow();
      service = new google.maps.places.PlacesService(map);
      service.nearbySearch(request, callback);
   }
   
   function callback(results, status){
      if(status == google.maps.places.PlacesServiceStatus.OK){
         for(var i = 0; i < results.length; i++){
            var place = results[i];
            createMarker(results[i]);
         }
      }
   }
   
    function createMarker(place) {
        var placeLoc = place.geometry.location;
        var marker = new google.maps.Marker({
          map: map,
          position: place.geometry.location
        });

        google.maps.event.addListener(marker, 'click', function() {
          infowindow.setContent(place.name);
          infowindow.open(map, this);
        });
      }*/
   
   
   
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
              alert(place.place_id);
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

      
      }

      google.maps.event.addDomListener(window, 'load', initAutocomplete);
   
   
   
   
   
   
   
   
   
   // When the user clicks the button, open the modal 
   nsbtn.onclick = function() {
      sModal.style.display = "block";
      $("#datepicker").css("cssText","z-index:0 !important;");
      $(".fc-toolbar .fc-state-active, .fc-toolbar .ui-state-active").css({
         "z-index":"0"
      })
      
//      getLocation();
//      initMap();
   }
   
   
   // click event - AccountBook Modal button 
   srbtn.onclick = function() {
      modalDate = clickedDate.substr(0,7);
      var year = Number(modalDate.substr(0,4));
       var month = Number(modalDate.substr(5,2));       
       if(month < 10){
          modalDate = String(year) + "/0" + String(month);          
       }else{
          modalDate = String(year) + "/0" + String(month);
       }
       
      aModal.style.display = "block";
      $("#datepicker").css("cssText","z-index:0 !important;");
      $(".fc-toolbar .fc-state-active, .fc-toolbar .ui-state-active").css({
         "z-index":"0"
      })
      $("#accountM-date").text(modalDate);
      getModalSumAccountBook(modalDate);
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
   

    
    $("#accountM_left").on("click", function() {
       var year = Number(modalDate.substr(0,4));
       var month = Number(modalDate.substr(5,2));
       if(month == 1){
          year -= 1;
          month = 12;
       }else{
          month -= 1;
       }
       
       if(month < 10){
          modalDate = String(year) + "/0" + String(month);          
       }else{
          modalDate = String(year) + "/0" + String(month);
       }
       $("#accountM-date").text(modalDate);
       getModalSumAccountBook(modalDate);
    });
    
    
    $("#accountM_right").on("click", function() {
       var year = Number(modalDate.substr(0,4));
       var month = Number(modalDate.substr(5,2));
       if(month == 12){
          year += 1;
          month = 1;
       }else{
          month += 1;
       }
       
       if(month < 10){
          modalDate = String(year) + "/0" + String(month);          
       }else{
          modalDate = String(year) + "/0" + String(month);
       }
       $("#accountM-date").text(modalDate);
       getModalSumAccountBook(modalDate);
       
    });

   
   ///////////////////////////////////////////////////////////////////////////////////
   ///////////////////////            가계부            ///////////////////////////
   ///////////////////////////////////////////////////////////////////////////////////
   
    // Get the element of save AccountBook button
   var saveIncome = $("#saveIncome");
   var saveExpense = $("#saveExpense");
   
   
   // Get daily data of SumAccountBook&AccountBook
   function getDaily(date){
      accountTitle.html('가계부(선택된 날짜: <span>'+clickedDate+'</span>)');
      $.ajax({
         url: "getDailySumAccountBook.do",
         type: "POST",
         data: {"date":date},
         error: function(jqXHR){
            alert("jqXHR.status: " + jqXHR.status);
            alert("jqXHR.statusText(): " + jqXHR.statusText());
         },
         dataType: "json",
         success: function(resData){
            income.text(resData.income);
            expense.text(resData.expense);
            sum.text(resData.sum);
         }
      });
      
      $.ajax({
         url: "getDailyAccountBook.do",
         type: "POST",
         data: {"date":date},
         error: function(jqXHR){
            alert("jqXHR.status: " + jqXHR.status);
            alert("jqXHR.statusText(): " + jqXHR.statusText());
         },
         dataType: "json",
         success: function(resData){
            var accountTable = $(".accountTableDiv");
            accountTable.empty();
            var table = '<table class="accountTable"><col style="width:15%;"><col style="width:15%;"><col style="width:40%;"><col style="width:20%;"><col style="width:10%;"><tr class="accountTableTh"><th>수입/지출</th><th>종류</th><th>내용</th><th>금액</th><th></th></tr>';
            for(var i = 0; i < resData.length; i++){
               table += '<tr><td class="kind">' + resData[i].kind + '</td><td class="sub_kind"><span>' + resData[i].sub_kind + '</span></td><td class="content"><span>' + resData[i].content + '</span></td><td class="amount"><span>' + resData[i].amount + '</span></td><td><div style="text-align: center"><i id="rmAccountBook" class="fa fa-trash-o removebtn"></i><i id="modiAccountBook"class="fa fa-pencil modifybtn"></i><input type="hidden" value="' + resData[i].num + '"></div></td></tr>';               
            }
            table += '</table>';
            accountTable.html(table);
         }
      });
   }
   
   
   // Get Monthly data of SumAccountBook&AccountBook
   function getMonthly(date){
      accountTitle.html('가계부(선택된 날짜: <span>'+clickedDate+'</span>)');
      date = date.substr(0,7);
      $.ajax({
         url: "getMonthlySumAccountBook.do",
         type: "POST",
         data: {"date":date},
         error: function(jqXHR){
            alert("jqXHR.status: " + jqXHR.status);
            alert("jqXHR.statusText(): " + jqXHR.statusText());
         },
         dataType: "json",
         success: function(resData){
            income.text(resData.income);
            expense.text(resData.expense);
            sum.text(resData.sum);
         }
      });
      
      $.ajax({
         url: "getMonthlyAccountBook.do",
         type: "POST",
         data: {"date":date},
         error: function(jqXHR){
            alert("jqXHR.status: " + jqXHR.status);
            alert("jqXHR.statusText(): " + jqXHR.statusText());
         },
         dataType: "json",
         success: function(resData){
            var accountTable = $(".accountTableDiv");
            accountTable.empty();
            var table = '<table class="accountTable"><col style="width:15%;"><col style="width:15%;"><col style="width:40%;"><col style="width:20%;"><col style="width:10%;"><tr class="accountTableTh"><th>수입/지출</th><th>종류</th><th>내용</th><th>금액</th><th></th></tr>';
            for(var i = 0; i < resData.length; i++){
               table += '<tr><td class="kind">' + resData[i].kind + '</td><td class="sub_kind"><span>' + resData[i].sub_kind + '</span></td><td class="content"><span>' + resData[i].content + '</span></td><td class="amount"><span>' + resData[i].amount + '</span></td><td><div style="text-align: center"><i id="rmAccountBook" class="fa fa-trash-o removebtn"></i><i id="modiAccountBook" class="fa fa-pencil modifybtn"></i><input type="hidden" value="' + resData[i].num + '"></div></td></tr>';               
            }
            table += '</table>';
            accountTable.html(table);
         }
      });
   }
   
   
   // Get period data of SumAccountBook&AccountBook
   function getPeriod(startD, endD){
      $.ajax({
         url: "getPeriodSumAccountBook.do",
         type: "POST",
         data: {"startD":startD, "endD":endD},
         error: function(jqXHR){
            alert("jqXHR.status: " + jqXHR.status);
            alert("jqXHR.statusText(): " + jqXHR.statusText());
         },
         dataType: "json",
         success: function(resData){
            income.text(resData.income);
            expense.text(resData.expense);
            sum.text(resData.sum);
         }
      });
      
      $.ajax({
         url: "getPeriodAccountBook.do",
         type: "POST",
         data: {"startD":startD, "endD":endD},
         error: function(jqXHR){
            alert("jqXHR.status: " + jqXHR.status);
            alert("jqXHR.statusText(): " + jqXHR.statusText());
         },
         dataType: "json",
         success: function(resData){
            var accountTable = $(".accountTableDiv");
            accountTable.empty();
            var table = '<table class="accountTable"><col style="width:15%;"><col style="width:15%;"><col style="width:40%;"><col style="width:20%;"><col style="width:10%;"><tr class="accountTableTh"><th>수입/지출</th><th>종류</th><th>내용</th><th>금액</th><th></th></tr>';
            for(var i = 0; i < resData.length; i++){
               table += '<tr><td class="kind">' + resData[i].kind + '</td><td class="sub_kind"><span>' + resData[i].sub_kind + '</span></td><td class="content"><span>' + resData[i].content + '</span></td><td class="amount"><span>' + resData[i].amount + '</span></td><td><div style="text-align: center"><i id="rmAccountBook" class="fa fa-trash-o removebtn"></i><i id="modiAccountBook" class="fa fa-pencil modifybtn"></i><input type="hidden" value="' + resData[i].num + '"></div></td></tr>';               
            }
            table += '</table>';
            accountTable.html(table);
         }
      });
   }
   
   
   // Get modal data of SumAccountBook
   function getModalSumAccountBook(date){
      $.ajax({
         url: "getModalSumAccountBook.do",
         type: "POST",
         data: {"date":modalDate},
         error: function(jqXHR){
            alert("jqXHR.status: " + jqXHR.status);
            alert("jqXHR.statusText(): " + jqXHR.statusText());
         },
         dataType: "json",
         success: function(resData){
            if(resData.length == 0){
               alert("지출이 없습니다.");
               Highcharts.chart('container', {
                   chart: {
                       plotBackgroundColor: null,
                       plotBorderWidth: null,
                       plotShadow: false,
                       type: 'pie'
                   },
                   title: {
                       text: date + ' 지출 그래프'
                   },
                   tooltip: {
                       pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                   },
                   series: [{
                       name: '비율',
                       colorByPoint: true,
                       data: resData
                   }]
               });
            }else{
               Highcharts.chart('container', {
                   chart: {
                       plotBackgroundColor: null,
                       plotBorderWidth: null,
                       plotShadow: false,
                       type: 'pie'
                   },
                   title: {
                       text: date + ' 지출 그래프'
                   },
                   tooltip: {
                       pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                   },
                   series: [{
                       name: '비율',
                       colorByPoint: true,
                       data: resData
                   }]
               });
            }
         }
      });
   }
   
   
   // Save data of AccountBook
   function saveAccountBook(kind, sub_kind, amount, content){
      $.ajax({
         url: "saveAccountBook.do",
         type: "POST",
         data: {"kind":kind, "sub_kind":sub_kind, "amount":amount, "content":content, "adate":clickedDate},
         error: function(jqXHR){
            alert("jqXHR.status: " + jqXHR.status);
            alert("jqXHR.statusText(): " + jqXHR.statusText());
         },
         dataType: "text",
         success: function(resData){
            var result = $.trim(resData);
            if(result == "1"){
               if(calendarType == "daily"){
                  getDaily(clickedDate);
               }else{
                  getMonthly(clickedDate);
               }
               
            }else{
               alert("가계부 작성에 실패하였습니다.");
            }
         }
      });
   }
   
   
   // click event - saveIncom button
   saveIncome.click(function(){
      saveAccountBook($.trim($("#IncomeKind").text()), $("#IncomeSub_Kind").val(), $("#IncomeAmount").val(), $("#IncomeContent").val());
      $("#IncomeAmount").val("");
      $("#IncomeContent").val("");
   });
   
   
   // click event - saveExpense button
   saveExpense.click(function(){
      saveAccountBook($.trim($("#ExpenseKind").text()), $("#ExpenseSub_Kind").val(), $("#ExpenseAmount").val(), $("#ExpenseContent").val());
      $("#ExpenseAmount").val("");
      $("#ExpenseContent").val("");
   });
   
   
   var amount;
   var content;
   
   
   // click event - modi AccountBook button
   // change, text element -> input element
   $(document).on("click", "#modiAccountBook", function(){
      amount = $(this).parent().parent().prev().children();
      content = $(this).parent().parent().prev().prev().children();
      amount.html('<input class="accountInput" type="text" value="' + amount.text() + '" style="width: 100%; text-align: center;">');
      content.html('<input class="accountInput" type="text" value="' + content.text() + '" style="width: 100%; text-align: center;">');
      $(this).attr({
         "id":"modiCheckAccountBook"
      });
   });
   
   
   // click event - modiCheck AccountBook button
   // save data of AccountBook
   $(document).on("click", "#modiCheckAccountBook", function(){
      var num = $(this).next().val();
      $(this).attr({
         "id":"modiAccountBook"
      });
      
      $.ajax({
         url: "modiAccountBook.do",
         type: "POST",
         data: {"num":num, "content":content.children().val(), "amount":amount.children().val()},
         error: function(jqXHR){
            alert("jqXHR.status: " + jqXHR.status);
            alert("jqXHR.statusText(): " + jqXHR.statusText());
         },
         dataType: "text",
         success: function(resData){
            var result = $.trim(resData);
            if(result == '1'){
               if(calendarType == "daily"){
                  getDaily(clickedDate);
               }else{
                  getMonthly(clickedDate);
               }
               amount.text(amount.children().val());
               content.text(content.children().val());
            }else {
               alert("가계부 수정에 실패했습니다.");
            }
         }
      });
   });
   
   
   // click event - remove AccountBook
   // delete data of AccountBook
   $(document).on("click", "#rmAccountBook", function(){
      var num = $(this).next().next().val();

      $.ajax({
         url: "rmAccountBook.do",
         type: "POST",
         data: {"num":num},
         error: function(jqXHR){
            alert("jqXHR.status: " + jqXHR.status);
            alert("jqXHR.statusText(): " + jqXHR.statusText());
         },
         dataType: "text",
         success: function(resData){
            var result = $.trim(resData);
            if(result == '1'){
               if(calendarType == "daily"){
                  getDaily(clickedDate);
               }else{
                  getMonthly(clickedDate);
               }
            }else {
               alert("가계부 삭제에 실패했습니다.");
            }
         }
      });
   });
   

});
