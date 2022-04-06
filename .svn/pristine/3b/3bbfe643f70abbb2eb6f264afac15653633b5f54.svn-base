<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf" %>
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <!-- Navbar Brand-->
    <span style="height: 30px;"><a href="<c:url value='/'/>"><img src="<c:url value='/images/front/whiteJejuLogo.png'/>" style="height: 30px; margin-left: 30px;"/></span>
    <a class="navbar-brand ps-3" href="<c:url value='/'/>">스마트그린도시</a>
    <button class="btn btn-link btn-sm" id="sidebarToggle" style="display:none; flex: lefthref="#!"><i class="fas fa-bars"></i></button>
    <div style="width: 100%;">
    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4 ms-auto" style="float: right;" >
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" onclick="$('.userInfoModal').show()" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
        </li>
    </ul>
    </div>
</nav>

<div class="userInfoModal">
	<c:choose>
		<c:when test="${user.userId eq null || user.userId eq ''}">
			<span><a class="dropdown-item" onclick="logout()">로그인</a></span>
			<span><a class="dropdown-item" onclick="fn_signUp()">회원가입</a></span>
		</c:when>
		<c:otherwise>
			<span><a class="dropdown-item" onclick="getUserInfo()">내정보</a></</span>
			<span><a class="dropdown-item" onclick="logout()">로그아웃</a></span>
			<span><a class="dropdown-item onlyManager" style="display: none;" onclick="goCms()">관리자페이지</a></span>
		</c:otherwise>
	</c:choose>
</div>


<div id="profileModal" class="modal">
  <form id="profileForm">
  <input type="hidden" id="type" value="0">
  <input type="hidden" id="userId">
  <!-- Modal content -->
  <div class="modal-content" style="width: 500px; height: 350px; margin: 10% auto;">
        <div style="width: 100%; text-align: right;">
	    <span class="material-icons" style="cursor: pointer;" onclick="javascript:$('#profileModal').hide()">
			<i class="fas fa-times"></i>
		</span>
		</div>
           <p style="text-align: center;"><span style="font-size: 14pt; height: 100px;"><b><span id="title" style="font-size: 24pt;">내정보</span></b></span></p>
		<br>
		<div style="height: 650px;">
			<table class="subComtTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="profileTable" style="width: 450px;">
				<colgroup>
						<col width="30%"/>
						<col width="70%"/>
					</colgroup>
					<tbody style="text-align: center;">
					</tbody>
			</table>
			<div style="text-align: right; margin-top: 10px;">
				<input type="button" class="btn btn-outline-blue" value="비밀번호 변경" onclick="fn_change_pw()">
    		</div>
		</div>
  </div>
  </form>
</div>

<a id="topBtn" title="맨위로"><i class="fas fa-arrow-circle-up"></i></a>

<style>
	.dropdown-item{
		cursor: pointer;
	}
</style>

<script>
	/* $( window ).resize(function() {
		alert($( window ).width());
	}); */
	$(document).ready(function() {
		var userRole = "${userRole}";
		if(userRole == "ROLE_SYSTEM" || userRole == "ROLE_MANAGER"){
			$(".onlyManager").show();
			if(userRole == "ROLE_SYSTEM"){
				$(".onlySystem").show();
			}
		}
		
		
		$("html, body").on('mousewheel DOMMouseScroll', function(e) {
            if($(window).scrollTop() > 300){
            	$("#topBtn").show();
            }else{
            	$("#topBtn").hide();
            }
        });
		if("${paramMap.mobileYn}" == "MOBI"){
			mobileChg();
		}
		$('body').click(function(e){
			var id = e.target.getAttribute('id');
			if(id != "navbarDropdown"){
				$(".userInfoModal").hide()
			}
		});
	});
	
	$("#topBtn").click(function(){
		window.scrollTo(0,0);
		$("#topBtn").hide();
	})
	
	function mobileChg(){
		$(".onlyWeb").hide();
		$(".mapModal").attr("class", "modal")
		$(".mapModal-content").attr("class", "modal-content");
		$(".modal-content").css("width", "100%");
		$(".subComtTable").css("width", "100%");
		$("main").css("font-size", "11px");
		$(".subComtTable").css("font-size", "11px");
		$(".form-control").css("font-size", "11px");
		$(".mt-4").css("font-size", "23px");
		$(".onlySystem").hide();
		$(".onlyMobi").show();
		$("#siteDtlDiv").css("float", "");
		$(".siteImg").css("width", "100%");
		$("#sidebarToggle").show();
	}
	
	function getUserInfo(){
		$("#profileForm #type").val("0");
		$("#userId").val("${paramMap.userId}");
		
		var formData = $("#profileForm").serialize();
		
		$.ajax({
			url : "<c:url value='/front/user/selectUserInfo.json'/>",
			type : "POST",
			data : formData,
			dataType : "json",
			success : function(result){
				if(result.message == "success"){
					
					var data = result.userInfo;
					var html = "";
					
					html += '<tr>';
					html += '<th>아아디</th>';
					html += '<td>'+data.userLoginId+'</td>';
					html += '</tr>';
					html += '<tr>';
					html += '<th>이름</th>';
					html += '<td>'+data.userNm+'</td>';
					html += '</tr>';
					html += '<tr>';
					html += '<th>이메일</th>';
					html += '<td>'+data.email+'</td>';
					
					$("#profileTable tbody").html(html);
					$("#profileModal").show();
					
				}else if(result.message == "fail"){
					alert("에러");
				}
			},
			error:function(request,status,error){
		    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
	}
	
	function fn_change_pw(){
		if($("#profileForm #type").val() == "1"){
			if($("#profileForm #oldPwd").val() == null || $("#profileForm #oldPwd").val() == ""){
				alert("기존 비밀번호를 입력하여 주십시오.");
				return;
			}
			if($("#profileForm #chgPwd").val() == null || $("#profileForm #chgPwd").val() == ""){
				alert("변경할 비밀번호를 입력하여 주십시오.");
				return;
			}
			if($("#profileForm #chkPwd").val() == null || $("#profileForm #chkPwd").val() == ""){
				alert("확인 비밀번호를 입력하여 주십시오.");
				return;
			}
			if($("#profileForm #chgPwd").val() != $("#profileForm #chkPwd").val()){
				alert("변경할 비밀번호와 확인 비밀번호가 다릅니다.");
				return;
			}
			
			if(checkInsertPwd($("#profileForm #chgPwd").val())){
				var formData = $("#profileForm").serialize();
				$.ajax({
					url : "<c:url value='/front/user/changeUserPswd.json'/>",
					type : "POST",
					data : formData,
					dataType : "json",
					success : function(result){
						if(result.message == "success"){
							if(result.err == "1"){
								alert("기존 비밀번호가 잘못되었습니다.");
								return;
							}else{
								alert("비밀번호가 변경되었습니다.");
								getUserInfo();
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
		}else{
			$("#profileForm #type").val("1");
			var html = "";
			
			html += '<tr>';
			html += '<th>기존 비밀번호</th>';
			html += '<td><input type="password" id="oldPwd" name="oldPwd"></td>';
			html += '</tr>';
			html += '<tr>';
			html += '<th>변경할 비밀번호</th>';
			html += '<td><input type="password" id="chgPwd" name="chgPwd"></td>';
			html += '</tr>';
			html += '<tr>';
			html += '<th>비밀번호 확인</th>';
			html += '<td><input type="password" id="chkPwd" name="chkPwd"></td>';
			
			$("#profileTable tbody").html(html);
		}
	}
	
	function login(){
		$("#map").hide();
		$("#loginModal").show();
	}
	
	function logout(){
		var path = window.location.pathname;
		location.href = "<c:url value='/logout.mng'/>";
	}
	
	function goCms(){
		if("${userRole}" == "ROLE_SYSTEM"){
			location.href = "<c:url value='/system/main.mng'/>";
		}else{
			location.href = "<c:url value='/system/user/list.mng?currentMenuId=9'/>";
		}
		
	}
	
	function fn_login_modal_hide(){
		$("#loginModal").hide();
		$("#map").show();
	}
	
	function fn_profile(){
		$("#profileModal").show();
	}
	
	$("#loginButton").click(function(){
		if($("#userLoginId").val() == ""){
			alert("아이디를 입력해주세요.");
		}else if($("#userPwd").val() == ""){
			alert("비밀번호를 입력해주세요.");
		}else{
			/* if($("#saveID").is(":checked")){
				var userInputId = $("#userLoginId").val();
 		        setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
			}else{
				deleteCookie("userInputId");
			} */
 			$("#loginForm").submit();
		}
	});
</script>