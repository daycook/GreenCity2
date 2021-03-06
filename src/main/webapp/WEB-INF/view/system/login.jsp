<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf"%>
<title>스마트그린도시</title>
<%@ include file="/WEB-INF/view/front/include.jsp" %>
<div class="container-scroller d-flex">
    <div class="container-fluid page-body-wrapper full-page-wrapper d-flex">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo" style="text-align: center;">
                <img src="../images/front/jejuLogo.png" alt="logo" style="height: 80px; width: 150px;"><span style="font-size: 40px; height: 100px;  vertical-align: middle;"><b>스마트그린도시</b></span>
              </div>
            
              <form class="pt-3" action="<c:url value='/login/login.mng'/>" method="post" id="loginForm">
              	<input type="hidden" value="${path}" name="path">
                <div class="form-group">
                	<input type="text" id="userLoginId" name="userLoginId" value="" class="form-control form-control-lg" placeholder="아이디">
                </div>
                <div class="form-group">
                	<input type="password" id="userPwd" name="userPwd" value="" class="form-control form-control-lg" placeholder="비밀번호">
                </div>
                <div class="mt-3">
                  <a class="btn btn-block btn-primary" id="loginButton" style="color: white; font-weight: bold; font-size: 15px; line-height: 20px; cursor: pointer; background-color: #2b2d46;">로그인</a>
                  <a class="btn btn-block btn-primary" id="signUp" style="color: white; font-weight: bold; font-size: 15px; line-height: 20px; cursor: pointer; background-color: #2b2d46;">회원가입</a>
                </div>
                <div class="my-2 d-flex justify-content-between align-items-center">
                  <div class="form-check">
                    <label class="form-check-label text-muted">
                     	<input type="checkbox" class="form-control" id="saveID" name="saveID">
                     	 아이디 저장
                    </label>
                  </div>
                  <!--<a href="#" class="auth-link text-black">패스워드 찾기</a>-->
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  
  <div id="singUpModal" class="modal">
	  <form id="signUpForm">
	  <!-- Modal content -->
	  <div class="modal-content" style="width: 500px; height: 350px; margin: 10% auto;">
	        <div style="width: 100%; text-align: right;">
		    <span class="material-icons" style="cursor: pointer;" onclick="javascript:$('#singUpModal').hide()">
				close
			</span>
			</div>
	           <p style="text-align: center;"><span style="font-size: 14pt; height: 100px;"><b><span style="font-size: 24pt;">회원가입</span></b></span></p>
			<br>
			<div style="height: 650px;">
				<table class="subComtTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="insertTable" style="width: 450px;">
					<colgroup>
						<col width="30%"/>
						<col width="70%"/>
					</colgroup>
					<tbody style="text-align: center;">
						<tr>
							<th>아아디</th>
							<td><input type="text" id="userLoginId" name="userLoginId"></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" id="userPwd" name="userPwd"></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" id="userNm" name="userNm"></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" id="email" name="email"></td>
						</tr>
					</tbody>
				</table>
				<div style="text-align: right; margin-top: 10px;">
					<input type="button" class="btn btn-outline-blue" value="회원가입" onclick="fn_insert_user_info()">
       			</div>
			</div>
	  </div>
	  </form>
	</div>
  
  <script src="../js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="../js/off-canvas.js"></script>
  <script src="../js/hoverable-collapse.js"></script>
  <script src="../js/template.js"></script>
  <script src="../js/settings.js"></script>
  <script src="../js/todolist.js"></script>
  <!-- endinject -->
  <!-- plugin js for this page -->
  <script src="../vendors/moment/moment.min.js"></script>
<script src="../js/calendar.js"></script> 
<script src="../js/fullcalendar.min.js"></script>

<script src="<c:url value='/js/jquery/jQuery-2.1.4.min.js' />"></script>
<script src="<c:url value='/js/plugins/iCheck/icheck.min.js' />"></script>
<script>

	$(document).ready(function() {
		$("#loginForm #userLoginId").focus();

		var error = '<c:out value="${param.error}" />';
		if(error == '-1') {
			alert("아이디 또는 비밀번호를 다시 확인하세요. 등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.");
		} else if(error == '-2') {
			alert("패스워드 5회 이상 실패(관리자에게 문의하세요.)");
		} else {
			var userInputId = getCookie("userInputId");
			if(userInputId == ""){
				$("#loginForm #saveID").attr("checked", false);	
			}else{
				$("#loginForm #userLoginId").val(userInputId);
				$("#loginForm #saveID").attr("checked", true);
			}		
		}	
	});
	
	$("#signUp").click(function(){
		$("#singUpModal").show();
	})
	
	function fn_insert_user_info(){
		if($("#signUpForm #userLoginId").val() == ""){
			alert("아이디를 입력해주세요.");
			return;
		}
		if($("#signUpForm #userPwd").val() == ""){
			alert("비밀번호를 입력해주세요.");
			return;
		}
		if($("#signUpForm #userNm").val() == ""){
			alert("이름을 입력해주세요.");
			return;
		}
		if($("#signUpForm #email").val() == ""){
			alert("이메일을 입력해주세요.");
			return;
		}
		if(checkInsertPwd($("#signUpForm #userPwd").val())){
			var formData = $("#signUpForm").serialize();
			$.ajax({
				url : "<c:url value='/front/user/insertUserInfo.json'/>",
				type : "POST",
				data : formData,
				dataType : "json",
				success : function(result){
					if(result.message == "success"){
						if(result.err == "1"){
							alert("해당 아이디로 가입된 계정이 존재합니다.");
						}else{
							alert("회원가입 완료");
							$("#singUpModal").hide();
						}
					}else if(result.message == "fail"){
						alert("에러");
					}
				},
				error:function(request,status,error){
			    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			});
		}
	}

	/*
	$("input").on('ifClicked', function (event) {
		alert("111");
	    var value = $(this).val();
	    if(value == "on"){
	    	deleteCookie("userInputId");
	    	$("#saveID").attr("checked", false);
	    }else{
	    	$("#saveID").attr("checked", true);
	    }  
	});
	*/
	
	$("#loginButton").click(function(){
		fn_login()
	});
	
	function fn_login(){
		if($("#loginForm #userLoginId").val() == ""){
			event.preventDefault()
			alert("아이디를 입력해주세요.");
		}else if($("#loginForm #userPwd").val() == ""){
			event.preventDefault()
			alert("비밀번호를 입력해주세요.");
		}else{
		var formData = $("#loginForm").serialize();
			$.ajax({
				url : "<c:url value='/front/user/loginInfoChk.json'/>",
				type : "POST",
				data : formData,
				dataType : "json",
				success : function(result){
					if(result.err == "1"){ //아이디체크
						alert("해당 ID로 등록된 사용자가 존재하지 않습니다.");
					}else if(result.err == "2"){ //비밀번호체크
						alert("비밀번호가 잘못되었습니다.");
					}else if(result.err == "3"){ //권한체크
						alert("해당 ID는 접속 권한이 없습니다. 관리자에게 승인요청 바랍니다.");
					}else if(result.err == "0"){
						if($("#loginForm #saveID").is(":checked")){
							var userInputId = $("#userLoginId").val();
			 		        setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
						}else{
							deleteCookie("userInputId");
						}
						event.preventDefault();
			 			$("#loginForm").submit();
					}
				},
				error:function(request,status,error){
			    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			});
		}
	}
	
	$("input").keypress(function(event) {
		if(event.which == 13) {
			fn_login()
		}
	});
	
	//쿠키 등록 함수
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	
	//쿠키 삭제 함수
	function deleteCookie(name){
	    today   = new Date();
	    today.setDate(today.getDate() - 1);
	    document.cookie = name + "=; path=/; expires=" + today.toGMTString() + ";";
	}
	
	//쿠키 호출 함수
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
	
	/*
	function loginPage() {
		$.ajax({
			url : "<c:url value='/login/login.mng'/>",
			type : "POST",
			data : $("#loginForm").serialize(),
			dataType : "json",
			success : function(res){
				if ("success" == res.result) {
					alert("실패");
					location.href="/system/main.mng";
				}else {
					alert("실패");
					alert(res.message);
				}
			}
		})
	} 
	*/
	
</script>	