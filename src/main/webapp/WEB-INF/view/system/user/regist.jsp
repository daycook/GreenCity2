<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf"%>

<section class="content-header">
	<tg:menuInfoTag />
</section>

<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title"><i class='material-icons' style='font-size:16px;'>play_arrow</i>&nbsp;&nbsp;사용자 등록</h3>
				</div>
				<div class="box-body">
					<form id="insertForm" name="insertForm" class="form-horizontal form-label-left">
						<%--c:set value="${Selectuser}" var = "user"/> --%>
						
						<!-- 등록 -->
						<c:if test="${empty Selectuser}">
							<div class="form-group">															
								<label class="control-label col-md-3 col-sm-3 col-xs-6">사용자ID <span class="required">*</span></label>
								<div class="col-md-3 col-sm-6 col-xs-9">
									<small>*영문  4~20자 이내로 입력</small>
									<input type="text" name="userLoginId" data-name="사용자ID가" id="userLoginId" class="form-control col-md-6 col-xs-6 req" maxlength="30" placeholder="사용자ID를 입력">
								</div>
								<div class="col-md-3 col-xs-3">
									<span class="duplicateCheck"></span>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-6">사용자명 <span class="required">*</span></label>
								<div class="col-md-3 col-sm-6 col-xs-9">
									<input type="text" name="userNm" data-name="사용자명이" id="userNm" class="form-control col-md-6 col-xs-6 req" value="${Selectuser.userNm}" maxlength="20" placeholder="사용자명을 입력">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-6">비밀번호 <span class="required">*</span></label>
								<div class="col-md-3 col-sm-6 col-xs-9">
									<small>* 비밀번호 : 숫자, 영문자, 특수문자 포함 8~20자 이내로 입력</small>
									<input type="password" name="userPwd" data-name="비밀번호가" id="userPwd"  onkeypress="checkInsertPwd(this);"  class="form-control col-md-6 col-xs-6 req" maxlength="20" placeholder="비밀번호를 입력"> 
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-6">비밀번호 확인 <span class="required">*</span></label> 
								<div class="col-md-3 col-sm-6 col-xs-9">
									<input type="password" name="userPwd2" data-name="비밀번호 확인이" id="userPwd2" onkeypress="checkInsertPwd(this);" class="form-control col-md-6 col-xs-6 req" maxlength="20" placeholder="비밀번호를 재입력">
								</div>
								<div class="col-md-3 col-xs-3">
									<span class="pwdcheck"></span>
								</div>
							</div>
							<div class="form-group">
							<label for="" class="control-label col-md-3 col-sm-3 col-xs-6">Email <span class="required">*</span></label>
								<div class="col-md-3 col-sm-6 col-xs-9">
									<input type="text" name="email" id="email" data-name="Email이" class="form-control col-md-6 col-xs-6 req" maxlength="30" placeholder="Email을 입력">
								</div>
							</div>
						</c:if>
						
						<!-- 수정 -->
						<c:if test="${!empty Selectuser}">
							<input type="hidden" id="userId" name="userId" value="${Selectuser.userId }">
							<input type="hidden" id="userLoginId" name="userLoginId" value="${Selectuser.userLoginId }">
							<div class="form-group">															
								<label class="control-label col-md-3 col-sm-3 col-xs-12">사용자ID <span class="required">*</span></label>
								<div class="col-md-3 col-sm-6 col-xs-9">
									<label class="control-label col-md-3 col-sm-3 col-xs-12">${Selectuser.userLoginId }</label>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-6">사용자명 <span class="required">*</span></label>
								<div class="col-md-3 col-sm-6 col-xs-9">
									<input type="text" name="userNm" data-name="사용자 명이" id="userNm" class="form-control col-md-6 col-xs-6 req" value="${Selectuser.userNm}" maxlength="20">
								</div>
							</div>
							<div class="form-group">
								<label for="" class="control-label col-md-3 col-sm-3 col-xs-6">이메일 <span class="required">*</span></label>
								<div class="col-md-3 col-sm-6 col-xs-9">
									<input type="text" name="email" id="email" data-name="이메일이" class="form-control col-md-6 col-xs-6 req" maxlength="30" value="${Selectuser.email}">
								</div>
							</div>
							<div class="form-group enabled">
								<label class="control-label col-md-3 col-sm-3 col-xs-6">사용상태 <span class="required">*</span></label> 
								<div class="col-md-3 col-sm-6 col-xs-9">
									<%-- <select id="useSt" name="useSt" data-name="사용여부가" class="form-control req">
										<option value="">선택</option>
										<option value="Y"  <c:if test="${Selectuser.useSt == 'Y'}"> selected</c:if>>사용</option>
										<option value="N" <c:if test="${Selectuser.useSt == 'N'}"> selected</c:if>>사용정지</option>
									</select> --%>
									<tg:cdDtl type="select" cd="userStCd" name="userStCd" styleClass="form-control selectpicker" id="userStCd" labelYn="N"/>
								</div>
							</div>	
						</c:if>                    
					</form>
				</div>
				
				<div class="box-footer">
					<div class="btn-group pull-right">
						<c:if test="${empty Selectuser}">
							<button type="button" class="btn btn-outline-primary" onclick="insert('insert')">등록</button>
						</c:if>
						<c:if test="${!empty Selectuser}">
							<button type="button" class="btn btn-outline-primary" onclick="insert('update')">수정</button>
						</c:if>
						<a href="<c:url value='/system/user/list.mng'/>"><button type="button" class="btn btn-outline-primary">취소</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
	
	$(document).ready(function(){
		
		//등록, 수정 구분 : 수정일때 사용여부 체크
		var type = "<c:out value='${Selectuser}'/>";
		if(type != ""){
			selectedStCd();
			$("#userLoginId").attr('disabled', true);
			$("#userLoginId").attr('readOnly', true);
		}
		
		$("#userLoginId").keyup (function () {
			var value = $(this).val();
			if (!(event.keyCode >=37 && event.keyCode<=40)) { //한글입력
	            var inputVal = $(this).val();
	            $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
	        }
			if(value.length == 0){
				$(".duplicateCheck").empty();
			}else if((value.length < 5) || (value.length > 20)){
				$(".duplicateCheck").text("아이디는 5~20자이내만 가능합니다.");
			}else{
				$.ajax ({
					url : "<c:url value='/system/user/duplicate.json' />" ,
					type : "POST" ,
					data : {"userLoginId": value} ,
					dataType : "json" , 
					success : function(res) {
						if(res.result == "exist"){
							text = res.message;
						}else if(res.result == "nonExist") {
							text = res.message;
						}
						$(".duplicateCheck").html("<font color='red'>"+text+"</font>");
					}
				})
			}
		});
		
		$("#userPwd2").keyup (function(){
			var text;
			$(".pwdcheck").empty();
			($(this).val() == $("#userPwd").val() ? text="비밀번호 일치" : text="비밀번호 불일치" );
			$(".pwdcheck").html("<font color='red'>"+text+"</font>");
		});
	});	
	
	/*
	function FormCheck(type){
		var result = true;
		$("#"+type+"Form").find(".req").each(function(){
			if(isEmptyString ($(this).val())){
				alert($(this).data("name")+" 비었습니다!");
				result = false;
				$(this).focus();
				return false;
			}
		});
		return result;
	}
	
	function isEmptyString (value){
		return value == null || (/^\s*$/).test (value) ;
	}
	
	function chkEmail(str){
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		if(!reg_email.test(str)){
			return false;
		}
		return true;
	}
	*/
	
	function insert(type){
		
		var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		if(type == 'insert'){
			if($.trim($("#userLoginId").val()) == ""){
				alert("사용자ID를 확인 해주세요.");
				$("#userId").focus();
				return false;
			}
		}
		
		if($.trim($("#userNm").val()) == ""){
			alert("사용자명을확인 해주세요.");
			$("#userNm").focus();
			return false;
		}
		
		if(type == 'insert'){
			if(!checkInsertPwd($("#userPwd").val())){
				$("#userPwd").focus();
				return false;
			}
			if($("#userPwd2").val() != $("#userPwd").val()) {
				alert("숫자, 영문자, 특수문자 포함 8~20자 이내로 입력해주세요.");
				return false;
			}	
		}

		if(!regEmail.test($("#email").val())){
			alert("이메일을 확인하세요.");
			$("#email").focus();
			return false;
		}
		
		if(type == 'insert'){
			$.ajax ({
				url : "<c:url value='/system/user/duplicate.json' />" ,
				type : "POST" ,
				data : {"userLoginId": $("#userLoginId").val()} ,
				dataType : "json" , 
				success : function(res) {
					if(res.result == "exist"){
						alert("이미 사용중인 사용자ID 입니다.");
						$("#userLoginId").focus();
						return false;
					}else if(res.result == "nonExist") {
						if (confirm ("등록하시겠습니까?")) {
							$.ajax({
								url :  "<c:url value='/system/user/insert.json' />" ,
								type : "POST" ,
								data : $("#insertForm").serialize(),
								dataType : "json" ,
								success : function(res) {
									if ("success" == res.result) {
										alert("저장되었습니다.");
										reset();
										location.href="<c:url value='/system/user/list.mng'/>";
									}else {
										alert(res.message);
									}
								}
							})
						}
					}
				}
			})
		}else if(type == 'update'){
			if (confirm ("수정하시겠습니까?")) {
				$.ajax({
					url :  "<c:url value='/system/user/regist.json' />" ,
					type : "POST" ,
					data : $("#insertForm").serialize(),
					dataType : "json" ,
					success : function(res) {
						if ("success" == res.result) {
							alert("수정되었습니다.");
							reset();
							location.href="<c:url value='/system/user/list.mng'/>";
						}else {
							alert(res.message);
						}
					}
				})
			}
		}	
	}
	
	function selectedStCd(){
		var userStCd = "<c:out value='${Selectuser.userStCd}'/>";
		for(var i = 0; i < document.insertForm.userStCd.length; i++) {
			if(userStCd == document.insertForm.userStCd[i].value){
				document.insertForm.userStCd[i].selected = true;
			}
		}
	}
	
	function reset() {
		$("userId").val("");
		$("#userLoginId").val("");
		$("#userNm").val("");
		$("#userPwd").val("");
		$("#userPwd2").val("");
	}
	
	/**
	 * 비밀번호 체크, 8~20자 이내, 숫자, 영문자, 특수문자 포함
	 * @param value
	 * @returns {Boolean}
	 */
	 function checkInsertPwd(value){
		 
		var pw = value;
		var num = pw.search(/[0-9]/g);
		var eng = pw.search(/[a-z]/ig);
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩';:₩/?]/gi);

		if((pw.length < 8) || (pw.length > 20)){
			alert("8자리 ~ 20자리 이내로 입력해주세요.");
			return false;
		}
		
		if(pw.search(/₩s/) != -1){
			alert("비밀번호는 공백업이 입력해주세요.");
			return false;
		} 
		
		if((num < 0) || (eng < 0) || (spe < 0) ){
			alert("숫자, 영문자, 특수문자 포함 8~20자 이내로 입력해주세요.");
			return false;
		}
		return true;
	}
	 
</script>