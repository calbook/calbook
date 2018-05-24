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
					printData1(resData);
				}
			});	
		});
		
		$(document).on("click", ".btnDelFriend", function(){
			$.ajax({
				url: "delFriendProc.do",   
				type: "GET",
				data: {"f_email":$(this).prev().val()},
				error: function(jqXHR){
					alert(jqXHR.status);
					alert(jqXHR.statusText);
				},
				dataType: "json",
				success: function(resData){ 
					printData(resData);
				}
			});
		});
		
	});
	
	function printData(resData){
		var s='';
		for(var i in resData){
			s += '<figure class="snip1157"><img src="../images/basicProfile.jpg" alt="sq-sample3" /><div class="author"><h5><span style="font-size: 17px;">';
			s += resData[i]['nick']+'</span><br><span>'+resData[i]['email']+'</span></h5><input class="email" type="hidden" name="f_email" value="'+resData[i]['email']+'" />';
			s += '<button type="button"><i class="fa fa-minus"></i></button><button type="button"><i class="fa fa-home"></i></button></div></figure>';
		}
		$("#scroll").empty();
		$("#scroll").append(s);
	}
	
	function printData1(resData){
		var s='';
			s += '<figure class="snip1157"><img src="../images/basicProfile.jpg" alt="sq-sample3" /><div class="author"><h5><span style="font-size: 17px;">';
			s += resData['nick']+'</span><br><span>'+resData['email']+'</span></h5><input class="email" type="hidden" name="f_email" value="'+resData['email']+'" />';
			s += '<button type="button"><i class="fa fa-minus"></i></button><button type="button"><i class="fa fa-home"></i></button></div></figure>';
		$("#scroll").empty();
		$("#scroll").append(s);
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
	width: 30%;
}

/* Middle column */
.column.middle {
    width: 70%;
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
  width: 45%;
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
	width: 95%;
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
	font-size: 30px;
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
		width: 80%;
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

</style>
</head>
<body>
<div>
   <jsp:include page="../default/navbar.jsp" />
</div>

<div class="row">
  <div class="column side"></div>
  
  <div class="column middle">  
    <div class="column half">
    	<h1 class="menuTitle">FRIEND</h1>
    	
    	<div class="search-box">
    		<select id="searchSelect" class="searchSelect" name="searchSelect">
    			<option value="EMAIL">Email</option>
    			<option value="NICK">Nick</option>
    			<!-- <option value="PHONE">Phone</option> -->
    		</select>
  			<input id="search" class="search" placeholder="Search"/>
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
		  			<img src="../images/basicProfile.jpg" alt="sq-sample3" />
		  			<div class="author">
		    			<%-- <h5>${m.nick}<br><span>${m.email}</span></h5> --%>
		    			<h5><span style="font-size: 17px;">${m.nick}</span><br><span>${m.email}</span></h5>
		    			<input class="email" type="hidden" name="f_email" value="${m.email}" />
		    			<button class="btnDelFriend" type="button"><i class="fa fa-minus"></i></button>
		    			<button type="button"><i class="fa fa-home"></i></button>
		  			</div>
				</figure>
			</c:forEach>
			<!-- <figure class="snip1157">
	  			<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample3.jpg" alt="sq-sample3" />
	  			<div class="author">
	    			<h5>Pelican Steve <span> LIttleSnippets.net</span></h5>
	    			<button type="button"><i class="fa fa-minus"></i></button>
	    			<button type="button"><i class="fa fa-home"></i></button>
	  			</div>
			</figure>
		
			<figure class="snip1157 hover">
	  			<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample27.jpg" alt="sq-sample27" />
	  			<div class="author">
	    			<h5>Max Conversion<span> LIttleSnippets.net</span></h5>
	    			<button type="button"><i class="fa fa-plus"></i></button>
	    			<button type="button"><i class="fa fa-home"></i></button>
	  			</div>
			</figure>
			
			<figure class="snip1157">
	  			<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample17.jpg" alt="sq-sample17" />
	  			<div class="author">
	    			<h5>Eleanor Faint<span> LIttleSnippets.net</span></h5>
	    			<button type="button"><i class="fa fa-check-circle-o"></i></button>
	    			<button type="button"><i class="fa fa-home"></i></button>
	  			</div>
			</figure> -->
			
		</div>
    </div>
    
    
    
    <div class="column half">
    	<h1 class="menuTitle">GROUP</h1>
    	
    	<div class="search-box">
  			<button class="group" id="newGroup">New Group</button>
		</div>
		
		
		
		
    	
    	<div class="scroll center">
    		<div class="adr-article-container">
    			<div id="group" style="max-width: 500px;">
        		<!-- PAGE -->

        		<!-- ACCORDION 1 -->
        			<div class="box" id="box1">
            			<img class="ico-accordion" src="http://via.placeholder.com/45x45" />
            			<span class="accordion-title">ACCORDION 1</span>
        			</div>

        			<div class="contenuto" id="contenuto1">
                		<div class="row">
                			<div class="column middle">
                				<h1>Title</h1>
                				<h3>Content</h3>
                			</div>
                			<div class="column oneside">
                				<button class="faBtn" type="button"><i class="fa fa-sign-out"></i></button>
                				<button class="faBtn" type="button"><i class="fa fa-edit"></i></button>
                			</div>
                		</div>
        			</div>
        		<!-- ACCORDION 1 -->

        		<!-- ACCORDION 2 -->
        			<div class="box" id="box2">
            			<img class="ico-accordion" src="http://via.placeholder.com/45x45" />
            			<span class="accordion-title">ACCORDION 2</span>
        			</div>

        			<div class="contenuto" id="contenuto2">
            			<div class="contenuto-bianco">
                			<span class="accordion-subtitle">Title </span>
                			<span class="accordion-text">Tante soluzioni di parcheggio per ogni tipo di sosta e di budget, con la possibilità di prenotare o acquistare online risparmiando con speciali tariffe scontate sul web.</span>
            			</div>
        			</div>
        		<!-- ACCORDION 2 -->

        		<!-- ACCORDION 3 -->
        			<div class="box" id="box3">
            			<img class="ico-accordion" src="http://via.placeholder.com/45x45" />
            			<span class="accordion-title">ACCORDION 3</span>
        			</div>

        			<div class="contenuto" id="contenuto3">
            			<div class="contenuto-bianco">
	                		<span class="accordion-subtitle">Title </span>
    	            		<span class="accordion-text">Tante soluzioni di parcheggio per ogni tipo di sosta e di budget, con la possibilità di prenotare o acquistare online risparmiando con speciali tariffe scontate sul web.</span>	                	
        	    		</div>
        			</div>
        			<!-- ACCORDION 3 -->
        			
        			<script>
        			 $(document).ready(function() {
        				    $("div#box1").click(function() {
        				            $("div#contenuto1").slideToggle("fast").addClass("view_content");
        				    $("div#box1").toggleClass("position_barra");
        				        });

        				        $("div#box2").click(function() {
        				            $("div#contenuto2").slideToggle("fast").addClass("view_content");
        				            $("div#box2").toggleClass("position_barra");
        				        });

        				        $("div#box3").click(function() {
        				            $("div#contenuto3").slideToggle("fast").addClass("view_content");
        				            $("div#box3").toggleClass("position_barra");
        				        });
        				 });
        			</script>
        			
        			
        			<script>
        			// Get the modal
        			var modal = $("#myModal");
        			//var modal = document.getElementById('myModal');

        			// Get the button that opens the modal
        			var btn = $("#newGroup");
        			
        			// Get the <span> element that closes the modal
        			//var span = document.getElementsByClassName("close")[0];
        			

        			// When the user clicks the button, open the modal 
        			btn.click(function(){
        				//alert("hello");
        				//modal.css({"display":"block"});
        				var newGroup = $('<div class="newGroup"><h1>모임 생성</h1><span>모임명</span><input type="text"><span>내용</span><input type="text"></div>');
        				$("#group").prepend(newGroup);
        			});

        			// When the user clicks on <span> (x), close the modal
        			/* span.onclick = function() {
        			    modal.style.display = "none";
        			} */

        			// When the user clicks anywhere outside of the modal, close it
        			/* window.onclick = function(event) {
        			    if (event.target == modal) {
        			        modal.style.display = "none";
        			    }
        			} */
        			</script>
    			</div>
    			<!-- FINE PAGE -->
			</div>
		</div>
    </div>
  </div>
  
  
  
  <div class="column side"></div>
</div>

<div>
   <jsp:include page="../default/footer.jsp" />
</div>
</body>
</html>
