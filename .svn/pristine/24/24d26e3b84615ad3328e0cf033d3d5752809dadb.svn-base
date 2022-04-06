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
						<c:set value="${Selectuser}" var = "user"/>
							<input type="hidden" id="userId" name="userId" value="${user.userId }">
							<input type="hidden" id="userLoginId" name="userLoginId" value="${user.userLoginId }">
							<div class="form-group">															
								<label class="control-label col-md-3 col-sm-3 col-xs-12">사용자ID <span class="required">*</span></label>
								<div class="col-md-6 col-sm-9 col-xs-12">
									<label class="control-label col-md-3 col-sm-3 col-xs-12" style="text-align: left">${user.userLoginId }</label>
								</div>
							</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">사용자명 <span class="required">*</span></label>
							<div class="col-md-6 col-sm-9 col-xs-12">
								<input type="text" name="userNm" data-name="사용자 명이" id="userNm" class="form-control col-md-7 col-xs-12 req" value="${user.userNm}" placeholder="사용자명을 입력">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">비밀번호 <span class="required">*</span></label>
							<div class="col-md-6 col-sm-9 col-xs-12">
								<button type="button" class="btn btn-outline-primary" onclick="showPasswordUpdate()">비밀번호 변경</button> 
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">회원탈퇴</label>
							<div class="col-md-6 col-sm-9 col-xs-12">
								<button type="button" class="btn btn-outline-primary" onclick="showUserOut()">회원탈퇴 요청</button> 
							</div>
						</div>
						<%-- <div class="form-group enabled">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">사용여부 <span class="required">*</span></label> 
							<div class="col-md-6 col-sm-9 col-xs-12">
								<select id="useSt" name="useSt" data-name="사용여부가" class="form-control req">
									<option value="">선택</option>
									<option value="Y"  <c:if test="${user.useSt == 'Y'}"> selected</c:if>>사용</option>
									<option value="N" <c:if test="${user.useSt == 'N'}"> selected</c:if>>사용정지</option>
								</select>
							</div>
						</div> --%>	
						<div class="form-group">
							<label for="" class="control-label col-md-3 col-sm-3 col-xs-12">Email <span class="required">*</span></label>
							<div class="col-md-6 col-sm-9 col-xs-12">
								<input type="text" name="userEmail" id="userEmail" data-name="Email이" class="form-control col-md-7 col-xs-12 req" maxlength="30" value="${user.userEmail}" placeholder="Email를 입력">
							</div>
						</div>
						<div class="form-group enabled">
							<label class="control-label col-md-3 col-sm-3 col-xs-6">사용여부 <span class="required">*</span></label> 
							<div class="col-md-3 col-sm-6 col-xs-9">
								<tg:cdDtl type="select" cd="userStCd" name="userStCd" styleClass="form-control selectpicker" id="userStCd" labelYn="N"/>
							</div>
						</div>	
					</form>
				</div>
				<div class="box-footer">
					<div class="btn-group pull-right">
						<button type="button" class="btn btn-outline-primary" onclick="insert('update')">저장</button>
						<button type="button" class="btn btn-default" onclick="hisBack()">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<div class="modal fade func-modal" data-keyboard="false" data-backdrop="static" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h2>비밀번호 변경</h2>
			</div>
			<div class="modal-body">
				<form id="funcForm" name="funcForm" class="form-horizontal form-label-left">
					<div class="form-group">
						<input type="hidden" name="userId" value="${user.userId }">
						<input type="hidden" name="userLoginId" value="${user.userLoginId }">
						<input type="hidden" name="userNm"  value="${user.userNm}">
						<input type="hidden" name="useSt"  value="Y">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">현재 비밀번호<span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="password" name="nowUserPwd" id="nowUserPwd" class="form-control upd" placeholder="현재 비밀번호를 입력">
							<span class="nowUserPwdCheck"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">변경 비밀번호<span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<small>* 비밀번호 : 숫자, 영문자, 특수문자 포함 8~20자 이내로 입력</small>
							<input type="password" name="userPwd" id="userPwd" class="form-control upd" placeholder="변경할 비밀번호를 입력">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">변경 비밀번호 재확인<span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="password" name="userPwd2" id="userPwd2" class="form-control upd" placeholder="변경 비밀번호를 재입력">
							<span class="userPwdCheck"></span>
						</div>
					</div>
				</form>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-primary"  onclick="passwordUpdate('func')">수정</button>
				<button type="button" class="btn btn-outline-red" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<script>
	
	function FormCheck(type){
		var result = true;
		$("#"+type+"Form").find(".upd").each(function(){
			if(isEmptyString ($(this).val())){ //정규식 체크하기
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
	
	var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
	
	function insert(type){
		if (FormCheck (type) && confirm ("수정하시겠습니까?")) {
		//	if(){	
			if(!regEmail.test($("#userEmail").val())){
				alert("Email를 확인하세요.");
				$("#userEmail").focus();
				return false;
			}else{
				$.ajax({
					url :  "<c:url value='/system/user/regist.json' />" ,
					type : "POST" ,
					data : $("#insertForm").serialize(),
					dataType : "json" ,
					success : function(res) {
						if ("success" == res.result) {
							alert("저장되었습니다.");
							reset();
							location.href="/system/user/list.mng";
						}else {
							alert(res.message);
						}
					}
				})
			}
		//	}	
		}
	}
	
	function selectedStCd(){
		var userStCd = "<c:out value='${user.userStCd}'/>";
		for(var i = 0; i < document.insertForm.userStCd.length; i++) {
			if(userStCd == document.insertForm.userStCd[i].value){
				document.insertForm.userStCd[i].selected = true;
			}
		}
	}

	$(document).ready(function(){
		
		selectedStCd();
		
		$("#userPwd2").keyup (function(){
			var text;
			$(".userPwdCheck").empty();
			($(this).val() == $("#userPwd").val() ? text="비밀번호가 서로 일치합니다" : text="" );
			$(".userPwdCheck").html("<font color='red'>"+text+"</font>");
		});
	});	
	
	function showPasswordUpdate(){
		$('.func-modal').modal("show");
	}
	
	function passwordUpdate(type) {
		if (FormCheck (type)) {
			if($("#userPwd2").val() != $("#userPwd").val()) {
				alert("비밀번호확인 해주세요.");
				return false;
			} else {
				if(confirm ("비밀번호를 변경 하시겠습니까?")) {
					$.ajax({
						url :  "<c:url value='/system/user/password/update.json' />" ,
						type : "POST" ,
						data : $("#funcForm").serialize(),
						dataType : "json" ,
						success : function(res) {
							if ("exist" == res.result) {
								alert(res.message);	
							}else if ("success" == res.result) {
								alert("변경되었습니다.");
								$('.func-modal').modal("hide");
							}else {
								alert(res.message);
							}
						}
					})
				}
			}	
		}
	}
	
	function showUserOut(){
		if(confirm ("정말 탈퇴하시겠습니까?")) {
			$.ajax({
				url :  "<c:url value='/system/user/userOut.json' />" ,
				type : "POST" ,
				data : $("#funcForm").serialize(),
				dataType : "json" ,
				success : function(res) {
					if ("success" == res.result) {
						alert("탈퇴되었습니다.");
						location.href = "<c:url value='/logout.mng' />";
					}else {
						alert(res.message);
					}
				}
			})
		}
	}
	
	function hisBack(){
		history.back();
	}
	
</script>