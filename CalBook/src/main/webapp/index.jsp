<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="">
<meta name="description" content="">

<!-- stylesheets css -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/et-line-font.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/vegas.min.css">
<link rel="stylesheet" href="css/style.css">
<link href='https://fonts.googleapis.com/css?family=Rajdhani:400,500,700' rel='stylesheet' type='text/css'>
</head>
<body>
<!-- preloader section -->
<section class="preloader">
	<div class="sk-circle">
       <div class="sk-circle1 sk-child"></div>
       <div class="sk-circle2 sk-child"></div>
       <div class="sk-circle3 sk-child"></div>
       <div class="sk-circle4 sk-child"></div>
       <div class="sk-circle5 sk-child"></div>
       <div class="sk-circle6 sk-child"></div>
      <div class="sk-circle7 sk-child"></div>
       <div class="sk-circle8 sk-child"></div>
       <div class="sk-circle9 sk-child"></div>
       <div class="sk-circle10 sk-child"></div>
       <div class="sk-circle11 sk-child"></div>
       <div class="sk-circle12 sk-child"></div>
     </div>
</section>
<!-- home section -->
<section id="home">
	<div class="container">
		<div class="row">
			<div class="col-md-offset-2 col-md-8 col-sm-12">
				<div class="home-thumb"> 
					<!-- <h1 class="wow fadeInUp" data-wow-delay="0.4s">Hello, we are comila</h1> -->
					<img alt="logo" src="images/icon/white_calbook.png">
          			<h3 class="wow fadeInUp" data-wow-delay="0.6s">Your <strong>time</strong> and <strong>money</strong> is cherish for us</h3>
          			<a href="#about" class="btn btn-lg btn-default smoothScroll wow fadeInUp hidden-xs" data-wow-delay="0.8s">Notice!</a>
          			<c:if test="${empty email}">
	        			<a href="#" id="modalLogin" data-toggle="modal" data-target="#modal1" class="btn btn-lg btn-success smoothScroll wow fadeInUp" data-wow-delay="1.0s">Login!</a>
						<a href="#" data-toggle="modal" data-target="#modal2" class="btn btn-lg btn-success smoothScroll wow fadeInUp" data-wow-delay="1.0s">Sign Up!</a>
          			</c:if>
          			<c:if test="${!empty email}">
          				<a href="logout.do" id="logout" class="btn btn-lg btn-success smoothScroll wow fadeInUp" data-wow-delay="1.0s">Logout!</a>
          				<a href="joinus/selectMenu.do" class="btn btn-lg btn-success smoothScroll wow fadeInUp" data-wow-delay="1.0s">Menu!</a>
          			</c:if>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- about section -->
<section id="about">
	<div class="container">
		<div class="row">
      		<div class="col-md-6 col-sm-12">
        		<img src="images/background/pic.jpg" class="img-responsive wow fadeInUp" alt="About">
     		 </div>
			 <div class="col-md-6 col-sm-12">
				<div class="about-thumb">
					<div class="section-title">
						<h1 class="wow fadeIn" data-wow-delay="0.2s">Our Notice</h1>
						<h3 class="wow fadeInUp" data-wow-delay="0.4s">Thank you for visiting our website!</h3><input class="btn btn-default" type="submit" value="더보기">
					</div>
					<div class="wow fadeInUp" data-wow-delay="0.6s">
						<a href = "#">공지사항 1</a><br><br>
						<a href = "#">공지사항2</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- feature section -->
<section id="feature">
  <div class="container">
    <div class="row">
      <svg preserveAspectRatio="none" viewBox="0 0 100 102" height="100" width="100%" version="1.1" xmlns="http://www.w3.org/2000/svg" class="svgcolor-light">
        <path d="M0 0 L50 100 L100 0 Z"></path>
      </svg>
      <div class="col-md-4 col-sm-6">
        <div class="media wow fadeInUp" data-wow-delay="0.4s">
          <div class="media-object media-left">
            <i class="icon icon-laptop"></i>
          </div>
          <div class="media-body">
            <h2 class="media-heading">Who</h2>
            <p>😀   We are CalBook! 😀</p>
          </div>
        </div>
      </div>
      <div class="col-md-4 col-sm-6">
        <div class="media wow fadeInUp" data-wow-delay="0.8s">
          <div class="media-object media-left">
            <i class="icon icon-refresh"></i>
          </div>
          <div class="media-body">
            <h2 class="media-heading">Are</h2>
            <p> Provide calender with accountbook in full of love! ❤ </p>
          </div>
        </div>
      </div>
      <div class="col-md-4 col-sm-8">
        <div class="media wow fadeInUp" data-wow-delay="1.2s">
          <div class="media-object media-left">
            <i class="icon icon-chat"></i>
          </div>
          <div class="media-body">
            <h2 class="media-heading">We</h2>
            <p>😉  Please feel free to use our site! 😉</p>
          </div>
        </div>
      </div>
      <div class="clearfix text-center col-md-12 col-sm-12">
        <a href="#contact" class="btn btn-default smoothScroll">Talk to us</a>
      </div>
    </div>
  </div>
</section>

<!-- contact section -->
<section id="contact">
	<div class="container">
		<div class="row">

			<div class="col-md-offset-2 col-md-8 col-sm-12">
				<div class="section-title">
					<h1 class="wow fadeInUp" data-wow-delay="0.3s">Get in touch</h1>
					<p class="wow fadeInUp" data-wow-delay="0.6s">If you have any question, please fill out this form.</p>
				</div>
				<div class="contact-form wow fadeInUp" data-wow-delay="1.0s">
					<form id="contact-form" method="post" action="#">
                        <div class="col-md-6 col-sm-6">
                          	<input name="name" type="text" class="form-control" placeholder="Your Name" required>
                        </div>
                        <div class="col-md-6 col-sm-6">
                          	<input name="email" type="email" class="form-control" placeholder="Your Email" required>
                        </div>
           			  	<div class="col-md-12 col-sm-12">
				   			<textarea name="message" class="form-control" placeholder="Message" rows="6" required></textarea>
           			  	</div>
						<div class="col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8">
							<input name="submit" type="submit" class="form-control submit" id="submit" value="SEND MESSAGE">
						</div>
					</form>
				</div>
			</div>
	
		</div>
	</div>
</section>

<!-- footer section -->
<footer>
	<div class="container">
		<div class="row">
	      <svg class="svgcolor-light" preserveAspectRatio="none" viewBox="0 0 100 102" height="100" width="100%" version="1.1" xmlns="http://www.w3.org/2000/svg">
	        <path d="M0 0 L50 100 L100 0 Z"></path>
	      </svg>
	
	      <div class="col-md-4 col-sm-6">
	        <h2>comila</h2>
	          <div class="wow fadeInUp" data-wow-delay="0.3s">
	             <p>We make a calender with accountbook. Also offer edit friends and can make a group with them!
             Please enjoy our program and site!</p>
	             <p class="copyright-text">Copyright &copy; 2018 CalBook <br>
	             Designed by <a rel="nofollow" href="http://www.google.com/+templatemo" target="_parent">Templatemo</a></p>
	          </div>
	      </div>
	
	      <div class="col-md-1 col-sm-1"></div>
	
	      <div class="col-md-3 col-sm-5">
	        <h2>Our Studio</h2>
	        <p class="wow fadeInUp" data-wow-delay="0.6s">
	           MapoGu WorldcupBookro 21<br>
	           Pungsung Building 2,3,4 floor<br>
	          Seoul, Korea
	        </p>
	        <ul class="social-icon">
	          <li><a href="#" class="fa fa-facebook wow bounceIn" data-wow-delay="0.9s"></a></li>
	          <li><a href="#" class="fa fa-twitter wow bounceIn" data-wow-delay="1.2s"></a></li>
	          <li><a href="#" class="fa fa-behance wow bounceIn" data-wow-delay="1.4s"></a></li>
	          <li><a href="#" class="fa fa-dribbble wow bounceIn" data-wow-delay="1.6s"></a></li>
	        </ul>
	      </div>
	      
	      <div class="col-md-1 col-sm-1"></div>
	      
	      <div class="col-md-4 col-sm-5">
	      	<img class="footerLogo" alt="logo" src="images/icon/white_calbook.png">
	      </div>

		</div>
	</div>
</footer>

<!-- modal signIn -->
<div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
      <div class="modal-content modal-popup">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h2 class="modal-title">Our Login</h2>
        </div>
        <!-- action=""생략 -->
        <form id="signInForm" method="GET" autocomplete="off">
          <c:if test="${empty ckEmail}">
	          <input id="signInEmail" name="email" type="text" class="form-control" placeholder="Email" required>
	          <input id="signInPwd" name="pwd" type="password" class="form-control" placeholder="Password" required>
	          <p><input id="checkLogin" type="checkbox" style="height: 13px;"> Remember me?</p>          
          </c:if>
          <c:if test="${!empty ckEmail}">
	          <input id="signInEmail" name="email" type="text" class="form-control" placeholder="Email" value="${ckEmail}" required>
	          <input id="signInPwd" name="pwd" type="password" class="form-control" placeholder="Password" value="${ckPwd}" required>
	          <p><input id="checkLogin" type="checkbox" style="height: 13px;" checked="checked"> Remember me?</p>          
          </c:if>
          <input type="submit" value="Login!">
        </form>
        <p>Thank you for your visiting!</p>
      </div>
  </div>
</div>

<!--modal signUp  -->
<div class="modal fade" id="modal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
      <div class="modal-content modal-popup">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h2 class="modal-title">Our SignUp</h2>
        </div>
		<form id="signupForm" action="join.do" method="post" autocomplete="off">
		   <div>
           	<table>
              <col style="width:65%;">
              <col style="width:5%;">
              <col style="width:30%;">
              <tr>
                 <td><input name="email" type="text" class="form-control EmailInput" id="signUpEmail" placeholder="Email" required></td>
                 <td></td>
                 <td><a id ="btnCheckUid" type="button" class="form-control" style="color:white; height: 50px;">EMAIL CHECK</a></td>
              </tr>
           	</table>
          </div>
          <input name="pwd" type="password" class="form-control" id="signUpPwd"  placeholder="Password" required>
          <input name="pwd2" type="password" class="form-control"  id="signUpPwd2" placeholder="Password check" required>
          	<table>
              <col style="width:65%;">
              <col style="width:5%;">
              <col style="width:30%;">
              <tr>
                 <td> <input name="nick" type="text" class="form-control" id = "signUpNick" placeholder="NickName" required></td>
                 <td></td>
                 <td><a id ="btnCheckNick" type="button" class="form-control" style="color:white; height: 50px;">NICK CHECK</a></td>
              </tr>
           	</table>
         
          <input name="phone" type="text" class="form-control" placeholder="PhoneNumber" required>
          <input type = "submit" value = "Sign up!">
        </form>
        <p>Email과 phone은 공개로 설정됩니다.<br>
			설정 변경하시려면 마이페이지에서 변경해주세요.</p>
      </div>
  </div>
</div>

<!-- Back top -->
<a href="#back-top" class="go-top"><i class="fa fa-angle-up"></i></a>
<!-- javscript js -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/vegas.min.js"></script>
<script src="js/wow.min.js"></script>
<script src="js/smoothscroll.js"></script>
<script src="js/custom.js"></script>
<script src="js/joinus.js"></script>
</body>
</html>