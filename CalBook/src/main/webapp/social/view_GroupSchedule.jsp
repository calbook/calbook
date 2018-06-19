<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="footer, address, phone, icons" />
<link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBUsZlyBI_gQ8S_liz_WdZ6U2W2ooRwIoQ&libraries=places" async defer></script>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Montserrat:400,700);

* {
    box-sizing: border-box;
	border: 0;
	font-family: sans-serif;
}

body {
	background:url(../images/background/groupBackground.jpg) no-repeat center fixed;
	background-size: cover;
/* 	background:#f2eee5; */
	margin: 0;
}

html, body {
	padding: 0;
	margin: 0;
	/* height: 100%; */
}
html{    
  
  height:100%;
}

#feedback-page{
	text-align:center;
}

#form-main{
	width:100%;
	padding-top:0px;
}

#form-div {
	background-color:rgba(72,72,72,0.7);
	padding-left:35px;
	padding-right:35px;
	padding-top:35px;
	padding-bottom:50px;
	width: 450px;
	height:800px;
	margin-top:30px;
	margin: auto;
	-moz-border-radius: 7px;
	-webkit-border-radius: 7px;
	color: white;
}

.feedback-input {
	color:#3c3c3c;
	font-family: Helvetica, Arial, sans-serif;
  font-weight:500;
	font-size: 18px;
	border-radius: 0;
	line-height: 22px;
	background-color: #fbfbfb;
	padding: 13px 13px 13px 54px;
	margin-bottom: 10px;
	width:100%;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	-ms-box-sizing: border-box;
	box-sizing: border-box;
  border: 3px solid rgba(0,0,0,0);
}

.feedback-input:focus{
	background: #fff;
	box-shadow: 0;
	border: 3px solid #3498db;
	color: #3498db;
	outline: none;
  padding: 13px 13px 13px 54px;
}

.focused{
	color:#30aed6;
	border:#30aed6 solid 3px;
}

/* Icons ---------------------------------- */
#name{
	background-image: url(http://rexkirby.com/kirbyandson/images/name.svg);
	background-size: 30px 30px;
	background-position: 11px 8px;
	background-repeat: no-repeat;
}

#name:focus{
	background-image: url(http://rexkirby.com/kirbyandson/images/name.svg);
	background-size: 30px 30px;
	background-position: 8px 5px;
  background-position: 11px 8px;
	background-repeat: no-repeat;
}

#email{
	background-image: url(http://rexkirby.com/kirbyandson/images/email.svg);
	background-size: 30px 30px;
	background-position: 11px 8px;
	background-repeat: no-repeat;
}

#email:focus{
	background-image: url(http://rexkirby.com/kirbyandson/images/email.svg);
	background-size: 30px 30px;
  background-position: 11px 8px;
	background-repeat: no-repeat;
}

#comment{
	background-image: url(http://rexkirby.com/kirbyandson/images/comment.svg);
	background-size: 30px 30px;
	background-position: 11px 8px;
	background-repeat: no-repeat;
}

textarea {
    width: 100%;
    height: 150px;
    line-height: 150%;
    resize:vertical;
}

input:hover, textarea:hover,
input:focus, textarea:focus {
	background-color:white;
}

.btnListDiv{
	width: 100%;
	
}

.btnListDiv div{
	 margin-left: 23%; 

}

.btnList{
	width: 30%;
	border: #fbfbfb solid 4px;
	cursor:pointer;
	background-color: #3498db;
	color:white;
	font-weight:700;
	text-decoration: none;
	padding: 5%;
}

.btnList:hover{
	background-color: rgba(0,0,0,0);
	color: #0493bd;
}

/* .button-blue{
	font-family: 'Montserrat', Arial, Helvetica, sans-serif;
	float:left; 
	border: #fbfbfb solid 4px;
	cursor:pointer;
	background-color: #3498db;
	color:white;
	font-size:18px;
	padding-top:22px; 
	padding-bottom:22px; 
	padding: 15%;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	transition: all 0.3s;
 	margin-top:-4px;
    font-weight:700;
    text-decoration: none;
    width: 33.33%;
    height: 5%;
}
 */
	
.submit:hover {
	color: #3498db;
}

.submit {
	margin: auto;
}
	
.ease {
	width: 0px;
	height: 74px;
	background-color: #fbfbfb;
	-webkit-transition: .3s ease;
	-moz-transition: .3s ease;
	-o-transition: .3s ease;
	-ms-transition: .3s ease;
	transition: .3s ease;
}

.submit:hover .ease{
  width:50%;
  background-color:white;
}

@media only screen and (max-width: 580px) {
	#form-div{
		left: 3%;
		margin-right: 3%;
		width: 88%;
		margin-left: 0;
		padding-left: 3%;
		padding-right: 3%;
	}
}
/* datepicker */

.datepicker{
	width:25%;
}

/* 지도 css */
/* Always set the map height explicitly to define the size of the div element that contains the map. */
#map {
  width: 100%;
  height: 200px; 
}

#srmMap{
   width: 100%;
   height: 250px; 
}

#srmEditMap{
   width: 100%;
   height: 200px; 
}

/* Optional: Makes the sample page fill the window. */
.googleMapDiv{
  float: left;
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

.listbtn{
	color: white;
	font-size: 25px;
}

#infowindow-content{
	color:black;
}
</style>
</head>
<body>
<div>
   <jsp:include page="../default/navbar.jsp" />
</div>
	<br><br>
	<div id="form-main">
	  <div id="form-div">
	  	<a class="listbtn" href="group_schedule.do?g_num=${group.num}" ><i class="fa fa-arrow-left"></i></a>
	    <form class="form" id="form1">
	      <h1 style="text-align: center; color: #FFFFFF;">${schedule.title}</h1>
	      <p>시작일 :  <span>${schedule.start_date} </span></p>
	      <p>종료일 : <span> ${schedule.finish_date} </span></p>
	      <p>
	      	<c:if test="${schedule.important==3}">
		        <span>중요도 : 상 </span>
	      	</c:if>
	      	<c:if test="${schedule.important==2}">
		        <span>중요도 : 중 </span>
	      	</c:if>
	      	<c:if test="${schedule.important==1}">
		        <span>중요도 : 하 </span>
	      	</c:if>
	      </p>
	      <p class="text">
	        <span>내용 : ${schedule.content}  </span>
	      </p>
	      <div id="map"></div>
	      <input id="placeID" name="location" type="hidden" value="${schedule.location}">
	      <div id="infowindow-content">
             <span id="place-name"  class="title"></span><br>
             <span id="place-address"></span>
          </div>
          <br><br>
	     
           <div class="btnListDiv">
           	<div>
	           <c:if test="${group.owner == email}">
		           
		           <a class="btnList" href="edit_GroupSchedule.do?g_num=${group.num}&seq=${schedule.seq}">UPDATE</a>
		           <a class="btnList" href="deleteGroupScheduleProc.do?g_num=${group.num}&seq=${schedule.seq}">DELETE</a>
	           </c:if>
           	</div>
           </div>
            <div class="ease"></div>
	    </form>
	  </div>
	</div>
<div>
   <jsp:include page="../default/footer.jsp" />
</div> 
<script type="text/javascript">
$(function(){
	var location = $('#placeID').val();
	google.maps.event.addDomListener(window, 'load', initMap(location));
});
function initMap(location) {
	
	var placeID = location;
	
	if(location == null || location == ""){
		location = 'ChIJKwjLMvOifDURqPAMQqxwK-k';
	}
	
	var request = {
		placeId: location
	};

	var infowindow = new google.maps.InfoWindow();

	var map = new google.maps.Map(document.getElementById('map'), {
		zoom: 13
	});

	var marker = new google.maps.Marker({
		map: map,
	});


	var PlaceName = document.getElementById('place-name');
	var PlaceAddress = document.getElementById('place-address');
	var Infowindow = document.getElementById('infowindow-content');
	

	function callback(place, status) {
		infowindow.close();
		var placeName = place.name;
		if (status == google.maps.places.PlacesServiceStatus.OK) {
			if(placeID == "" || placeID == null){
				var mapOptions = {
						center: new google.maps.LatLng(37.566229 , 126.978016),
						zoom: 13
				};

				map.setOptions(mapOptions);
				marker.setVisible(false);
			}else{	
				marker.setPosition(place.geometry.location);
				map.setCenter(marker.getPosition());
				marker.setMap(map);
				
				PlaceName.textContent = placeName;
				PlaceAddress.textContent = place.formatted_address;
				infowindow.setContent(Infowindow);
				infowindow.open(map, marker);
			}
		}
	}

	service = new google.maps.places.PlacesService(map);
	service.getDetails(request, callback);

	marker.addListener('click', function() {
		infowindow.open(map, marker);
	});      

}

	
</script>
</body>
</html>