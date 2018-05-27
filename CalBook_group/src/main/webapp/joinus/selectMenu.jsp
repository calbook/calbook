<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
@font-face {
  src: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/142996/decade.ttf");
  font-family: Decade;
}
*, *:before, *:after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

html, body {
  height: 100%;
  overflow: hidden;
  background: #000;
}
@media (max-width: 767px) {
  html, body {
    font-size: 80%;
  }
}
@media (max-width: 640px) {
  html, body {
    font-size: 60%;
  }
}
@media (max-width: 480px) {
  html, body {
    font-size: 40%;
  }
}

.inner, .nav-panel ul .nav-btn:after {
  content: "";
  position: absolute;
  top: 50%;
  left: 50%;
}

.scene {
  width: 100%;
  height: 100%;
  
}

.page {
  z-index: 1;
  position: absolute;
  align: center;
  width: 100%;
  height: 100%;
  transition: opacity .7s, z-index .7s, -webkit-transform .7s;
  transition: transform .7s, opacity .7s, z-index .7s;
  transition: transform .7s, opacity .7s, z-index .7s, -webkit-transform .7s;
  will-change: transform, opacity;
}
.page:nth-child(1) .left {
  background-image: url(../images/background/group.jpg);
}
.page:nth-child(1) .right {
  background-image: url(../images/background/plan.jpg);
}

.page.active {
  z-index: 5;
  transition: opacity .7s, z-index 0s .7s, -webkit-transform .7s;
  transition: transform .7s, opacity .7s, z-index 0s .7s;
  transition: transform .7s, opacity .7s, z-index 0s .7s, -webkit-transform .7s;
}
.page.active .half {
  -webkit-transform: translateX(0) !important;
          transform: translateX(0) !important;
  transition: -webkit-transform .7s ease-out;
  transition: transform .7s ease-out;
  transition: transform .7s ease-out, -webkit-transform .7s ease-out;
}
.page.previous {
  opacity: 0.4 !important;
  visibility: visible !important;
  transition: opacity .7s, z-index 0s, -webkit-transform .7s;
  transition: transform .7s, opacity .7s, z-index 0s;
  transition: transform .7s, opacity .7s, z-index 0s, -webkit-transform .7s;
}
.page.small {
  -webkit-transform: scale(0.8);
          transform: scale(0.8);
  opacity: 0;
}
.page.small .half {
  -webkit-transform: translateX(0) !important;
          transform: translateX(0) !important;
}


.half {
  position: absolute;
  top: 0;
  padding: 10px;
  width: 50%;
  height: 100%;
  background-size: cover;
  transition: -webkit-transform .7s ease-in;
  transition: transform .7s ease-in;
  transition: transform .7s ease-in, -webkit-transform .7s ease-in;
  will-change: transform;
 
 
}
.half.left {
  left: 0;
 
}
.half.right {
  left: 50%;
 
}
.half.withText:after {
  content: "";
  position: absolute;
  display: block;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  z-index: 10;
}

.heading {
  position: absolute;
  z-index: 500;
  top: 50%;
  left: 50%;
  -webkit-transform: translateX(-50%) translateY(-50%);
          transform: translateX(-50%) translateY(-50%);
  font-size: 3.5rem;
  color: #fff;
  font-family: Decade;
  
}
</style>
</head>
<body>
<div class="scene">
  <div class="page page-1 active">
    <div class="half left">
       <a href="../social/social.do" class="heading">Group</a>
    </div>
    <div class="half right withText">
      <a  href="../scheduleBook/scheduleBook.do" class="heading">Schedule</a>
    </div>
  </div>
</div>  
</body>
</html>