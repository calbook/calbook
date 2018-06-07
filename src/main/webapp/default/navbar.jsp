<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../default/dnavbar.css">
<title>Insert title here</title>
</head>
<body>
<div class="navbar navbar-dark">
  <!--Left Link-->
	<a href="../joinus/selectMenu.do" class="left"><img class="navLogo" src = "../images/icon/white_calbook.png"></a>
    <a href="../social/social.do" class="left">모임</a>  
    <a href="../scheduleBook/scheduleBook.do" class="left">일정</a> 
    <a href="#" class="left">공지사항</a>  
  <!--Right Links-->
    <a href="../logout.do" class="right"><img class="navImg" src = "../images/icon/exit.png"></a>
    <a href="../social/individual_page.do?cEmail=${email}" class="right"><img class="navImg" src = "../images/icon/home.png"></a>
</div>
</body>
</html>