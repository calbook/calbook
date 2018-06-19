
$(function(){

	/* 이메일 중복 확인 */
	var idOK = 0;
	$("#btnCheckUid").click(function(){
		var email = $("#signUpEmail").val();
		if(email == "" || email == null || email == "null"){
			alert("이메일을 입력해주세요.");
		}else if(email.indexOf("@") <= 0){
			alert("이메일 형식이 아닙니다.");
		}else if(email != "" && email != null && email != "null"){
			$.ajax({
				url:"idCheck.do",
				type:"GET",
				data:{"email":email},
				error: function(jqXHR){
					alert(jqXHR.status);
					alert(jqXHR.statusText);
				},
				dataType : "text",
				success:function(resData){
//					alert(typeof resData);
//					alert(resData);
					//alert(resData[0]["title"]);
					if($.trim(resData)=='ok'){
						idOK = 1;
						alert("사용가능한 이메일 입니다.")
						$("#btnCheckUid").css({
							"background-color":"#1fa318"
						});
						$("#btnCheckUid").attr({
							"disabled":"true"
						});
					}else{
						idOK = 0;
						alert("이미 사용중인 이메일입니다.");
					}
				}
			});
		}
	});
	
	
	/* 닉네임 중복 확인 */
	var nickOK = 0;
	$("#btnCheckNick").click(function(){
		var nick = $("#signUpNick").val();
		if(nick == "" || nick == null || nick == "null"){
			alert("닉네임을 입력해주세요.");
		}else if(nick != "" && nick != null && nick != "null"){
			$.ajax({
				url:"nickCheck.do",
				type:"GET",
				data:{"nick":nick},
				error: function(jqXHR){
					alert(jqXHR.status);
					alert(jqXHR.statusText);
				},
				dataType : "text",
				success:function(resData){
//					alert(typeof resData);
//					alert(resData);
					//alert(resData[0]["title"]);
					if($.trim(resData)=='ok'){
						nickOK = 1;
						alert("사용가능한 닉네임 입니다.")
						$("#btnCheckNick").css({
							"background-color":"#1fa318"
						});
						$("#btnCheckNick").attr({
							"disabled":"true"
						});
					}else{
						nickOK = 0;
						alert("이미 사용중인 닉네임입니다.");
					}
				}
			});
		}
	});
	


	/* 회원가입 제약조건 검사 */
	$("#signupForm").submit(function(event){
		if(idOK != 1 || nickOK != 1){
			alert("이메일 또는 닉네임 중복을 확인해 주세요.");
			event.preventDefault();
		}else if($("#signUpPwd").val() == "" || $("#signUpPwd2").val() == ""){
			alert("비밀번호를 입력해 주세요.")
			event.preventDefault();
		}else if($("#signUpPwd").val() != $("#signUpPwd2").val()){
			alert("비밀번호가 일치하지 않습니다.");
			event.preventDefault();
		}else{
			alert("회원가입이 완료되었습니다.");
			window.location.reload();
		}
	});




	/* 로그인 */
	$("#signInForm").submit(function(event){
		event.preventDefault();
		var email = $("#signInEmail").val();
		var pwd = $("#signInPwd").val();
		var checkLogin = $("#checkLogin").is(":checked");

		if((email.indexOf("@")) >= 0){
			$.ajax({
				url: "login.do",
				type: "POST",
				data: {"email":email, "pwd":pwd, "checkLogin":checkLogin},
				error: function(jqXHR){
					alert("jqXHR.status: " + jqXHR.status);
					alert("jqXHR.statusText(): " + jqXHR.statusText());
				},
				dataType: "text",
				success: function(resData){
					//alert(resData.pwd);
					var result = $.trim(resData);
					//alert("result : "+result);
					if(result == 'ok'){
						var ip = location.host;
						//event.preventDefault();
						//window.location.reload();
						window.location.assign("http://"+ip+"/web/joinus/selectMenu.do");
					}else {
						alert("이메일 혹은 비밀번호가 틀렸습니다.");
						event.preventDefault();
					}
				}
			});
		}else{
			alert("이메일 형식이 아닙니다.");
			event.preventDefault();
		}
	});
		
	

});