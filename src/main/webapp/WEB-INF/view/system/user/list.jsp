<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf"%>

<section class="content-header">
	<tg:menuInfoTag />
</section>

<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title"><i class='material-icons' style='font-size:16px;'>play_arrow</i>&nbsp;검색조건</h3>
				</div>
				
				<div class="box-body">
					<form name="searchForm">
						<div class="row">
							<div class="col-xs-4">	
                            	<div class="input-group">
                                	<span class="input-group-addon">사용상태</span>
                                	<tg:cdDtl type="select" cd="userStCd" name="userStCd" styleClass="form-control selectpicker" headerText="전체" id="userStCd" labelYn="N"/>
                                </div>
                      		</div>
							<div class="col-xs-4">						
	                            <div class="input-group">
	                               	<span class="input-group-addon">사용자 ID</span>
	                               	<input type="text" id="userLoginIdLike" class="form-control" placeholder="사용자ID 입력" maxlength="30">
	                            </div>
							</div>
							<div class="col-xs-4">						
                             	<div class="input-group">
                                	<span class="input-group-addon">사용자명</span>
                                	<input type="text" id="userNmLike" class="form-control" placeholder="사용자명 입력" maxlength="30">
                             	</div>
                            </div>
						</div>
					</form>
				</div>  
				<div class="box-footer">
					<div class="btn-group pull-right">
						<button type="button" class="btn btn-outline-primary" id="searchBtn">검색</button>
						<button type="button" class="btn btn-outline-primary" id="resetBtn">리셋</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-xs-12">
			<div class="box box-primary">
				<!-- <div class="box-header">
					<h3 class="box-title">목록</h3>
				</div> -->
				<div class="box-body">
					<table id="datatable" class="table table-bordered table-striped" style="width:100%; table-layout:fixed;"></table>
					<form action="<c:url value='/system/user/update.mng'/>" method="post" id="updateForm" name="updateForm">
						<input type="hidden" id="userLoginId" name="userLoginId">
						<input type="hidden" id="userId" name="userId">
					</form>
				</div>
				<div class="box-footer">
					<button type="button" class="btn btn-outline-primary pull-right" onclick="goInsert()">등록</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade userRole-modal" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h2>권한 롤 관리</h2>
				</div>
				<div class="modal-body">
					<form id="userRoleForm" name="userRoleForm" class="form-horizontal form-label-left">
						<input type="hidden" name="userRoleUrl" id="userRoleUrl" value="" />
						<input type="hidden" name="userRoleAuthority" id="userRoleAuthority" value="" />
						<input type="hidden" name="userId" id="userId" value="" />
						<table id="userRoleDatatable" class="table table-bordered table-striped"></table>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade userDetail-modal" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h2>사용자 상세보기</h2>
				</div>
				<div class="modal-body no-padding">
					<form id="userDetailForm" name="userDetailForm" class="form-horizontal form-label-left">
						<table class="table table-condensed">
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
							<tbody>
								<tr>
									<th class="text-center">사용자ID</th>
									<td><div id="userLoginIdDetail"></div></td>
								</tr>
								<tr>
									<th class="text-center">사용자명</th>
									<td><div id="userNmDetail"></div></td>
								</tr>
								<tr>
									<th class="text-center">이메일</th>
									<td><div id="userEmailDetail"></div></td>
								</tr>
								<tr>
									<th class="text-center">등록일</th>
									<td><div id="regDtDetail"></div></td>
								</tr>
								<!-- 
								<tr>
									<th class="text-center">주소</th>
									<td><div id="userAddrDetail"></div></td>
								</tr>
								 -->
								<tr>
									<th class="text-center">사용자상태</th>
									<td><div id="userStCdDetail"></div></td>
								</tr>
								<tr>
									<th class="text-center">탈퇴사유</th>
									<td><div id="userOutRsnDetail"></div></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
	var datatable;
	$(document).ready(function() {
		
		//모달창이동
		$('.modal-content').draggable({
			handle: ".modal-header"
		});
		
		//placeholder 브라우저호환
		$('input').placeholder();
		
		datatable = $("#datatable").DataTable({
			"searching" : false
			,"paging": true
			,"bPaginate": true
			,"responsive": true
			,"language": lang_kor
			,"ajax" : {
				"url" : "<c:url value='/system/user/list.json' />"
				,"method" : "post"
				,"data" : function(d) {
					if ($('#userLoginIdLike').val() != "") {d.userLoginIdLike = $('#userLoginIdLike').val();}
					if ($('#userNmLike').val() != "") {d.userNmLike = $('#userNmLike').val();	}
					if ($('#userStCd').val() != "") {d.userStCd = $('#userStCd').val();	}
				}
			},"processing": true
			,"serverSide": true 
			,"order" : [[2, 'desc']]
			,"columns": [
				{ "name" : "USER_ID", "title" : "사용자 ID", "data" : "userId", "className" : "dt-head-center","visible" : false} ,         
				{ "name" : "USER_LOGIN_ID", "title" : "사용자 ID", "data" : "userLoginId", "className" : "dt-head-center dt-body-left"} ,
				{ "name" : "USER_NM", "title" : "사용자명", "data" : "userNm", "className" : "dt-head-center dt-body-left"} ,
				{ "name" : "REG_DT", "title" : "등록일", "render" : 
					function (data, type, row) {
					return new Date(row["regDt"]).format("yyyy-MM-dd HH:mm:ss");  
				}, "className" : "dt-head-center dt-body-center"},
				{ "render" : 
					function (data, type, row) {
						var html = "";
						html += "<button type='button' class='btn btn-sm btn-outline-primary' data-toggle='tooltip' title='상세보기' onclick='goDetailUser(\""+row["userId"]+"\")'><i class='material-icons'>pageview</i></button>&nbsp;";
						html += "<button type='button' class='btn btn-sm btn-outline-primary' data-toggle='tooltip' title='수정' onclick='goUpdate(\""+row["userId"]+"\")'><i class='material-icons'>create</i></button>&nbsp;";
						if("${userRole}" == "ROLE_SYSTEM"){
							html += "<button type='button' class='btn btn-sm btn-outline-primary' data-toggle='tooltip' title='권한부여' onclick='autUser(\""+row["userId"]+"\")'><i class='material-icons'>assignment_ind</i></button>&nbsp;";
						}
						html += "<button type='button' class='btn btn-sm btn-outline-primary";
						if(row["failCnt"] < 5) {
							html += "disabled' data-toggle='tooltip' title='로그인 실패카운터 5 미만 입니다.' '><i class='material-icons'>lock_open</i>&nbsp;"+row["failCnt"]+"</button>&nbsp;";
						}else {
							html += "' data-toggle='tooltip' title='로그인 제한 풀기' onclick='initFailCntUpdate(\""+row["userId"]+"\")'><i class='material-icons'>lock</i>&nbsp;"+row["failCnt"]+"</button>&nbsp;";							
						}
						return html;  
					},
				    "title":"기능", "className": "dt-head-center dt-body-center", "orderable" : false,
				}	
			],"fnRowCallback": function(nRow, aData, iDisplayIndex) {
				$(nRow).on('click', function() {
					getSearchCondition(document.searchForm);
				});
			}	
		});
		setSearchCondition(document.searchForm);
	});
	
	$("#searchBtn").click(function() {
		datatable.ajax.reload();
	});
	
	$("#userStCd").change(function() {
		datatable.ajax.reload();
	});
	
	$("#resetBtn").click(function() {
		$('#userLoginIdLike').val("");
		$('#userNmLike').val("");
		$('#enabledLike').val("");
		datatable.ajax.reload();
	});
	
	function goInsert(){
		getSearchCondition(document.searchForm);
		location.href="<c:url value='/system/user/regist.mng'/>";
	}
	
	function goDetailUser(id){
		$.ajax({
			url : "<c:url value='/system/user/detailUser.json' />" ,
			type : "POST" ,
			data : {"userId": id} ,
			dataType : "json" , 
			success : function(res) {
				if(res.result == "success"){
					$("#userLoginIdDetail").html(res.data.userLoginId);
					$("#userNmDetail").html(res.data.userNm);
					$("#regDtDetail").html(new Date(res.data.regDt).format("yyyy-MM-dd"));
					$("#userEmailDetail").html(res.data.userEmail);
					//$("#userAddrDetail").html(res.data.userAddr);
					switch(res.data.userStCd){
						case "1":
							$("#userStCdDetail").html("사용중");
							$(".userOutRsnDetail").hide();
							break;
						case "8":
							$("#userStCdDetail").html("사용정지");
							$(".userOutRsnDetail").hide();
							break;
						case "9":
							$("#userStCdDetail").html("탈퇴");
							$("#userOutRsnDetail").html(res.data.userOutRsn);
							$(".userOutRsnDetail").show();
							break;
						default:
							break;
					}
				}else {
					alert(res.message);
				}
			}
		})
		$('div.userDetail-modal').modal("show");
	}
	
	function goUpdate(id){
		getSearchCondition(document.searchForm);
		$("#userId").val(id);
		$("#updateForm").submit();
	}
	
	function delUser(id){
		getSearchCondition(document.searchForm);
		if(confirm("해당 사용자를 삭제하시겠습니까?")){
			$.ajax({
				url : "<c:url value='/system/user/delete.json' />" ,
				type : "POST" ,
				data : {"userId": id} ,
				dataType : "json" , 
				success : function(res) {
					if(res.result == "success"){
						alert("삭제되었습니다");
						datatable.ajax.reload();
					}else {
						alert(res.message);
					}
				}//success
			})//ajax
		}//if
	}
	
	function autUser(id){
		$("#userId").val(id);
		datatable = $("#userRoleDatatable").DataTable({
			"destroy" : true,
			"searching" : false
			,"paging": true
			,"bPaginate": true
			,"responsive": true
			,"language": lang_kor
			,"ajax" : {
				"url" : "<c:url value='/system/userRole/list.json' />"
				,"method" : "post"
				,"data" : { userId : $("#userId").val()},
			},"processing": true
			,"serverSide": true
			,"order" : [[0, 'desc']]
			,"columns": [
						 { "name" : "ROLE_AUTH", "title" : "권한",  "data":"roleAuth", "className" : "dt-head-center dt-body-left" },
			             { "name" : "ROLE_NM", "title" : "역할명",  "data":"roleNm", "className" : "dt-head-center dt-body-left" },
			             { "name" : "ROLE_DESC", "title" : "설명",  "data":"roleDesc", "className" : "dt-head-center dt-body-left" },
			             { "name" : "USER_ID", "title" : "사용자ID",  "data":"userId", "className" : "dt-body-center", "visible" : false },
			             { "render" : 
						 	 function (data, type, row) {
								
			            	 	var html = "";
								html += "<select name='roleAuth' class='form-control col-md-7 col-xs-12 req' onchange='rolsUseSelect(this.value ,\""+row["roleAuth"]+"\")'>"
								html += "<option value='1'";
								
								if (row["userId"] == $("#userId").val()){
									html += "selected";
								}
								html += ">등록</option><option value='0'";
								
								if (row["userId"] != $("#userId").val()){
									html += "selected";	
								}
								html += ">미등록</option></select>";
								
								return html;
							 },
						   "className": "dt-body-center", "orderable" : false, //"title":"기능"
						 }
					    ],
			"fnRowCallback": function(nRow, aData, iDisplayIndex) {
			 }
		});
		$('div.userRole-modal').modal("show");
	}
	
	function rolsUseSelect(selectValue,userRoleAuthority){
		
		$("#userRoleAuthority").val(userRoleAuthority);
		
		if(selectValue == '1'){
			$("#userRoleUrl").val("<c:url value='/system/userRole/insert.mng' />");
		}else{
			$("#userRoleUrl").val("<c:url value='/system/userRole/delete.mng' />");
		}
		
		$.ajax({
			url : $("#userRoleUrl").val(),
			type : "POST",
			data : { userId : $("#userId").val(), roleAuth : $("#userRoleAuthority").val()},
			dataType : "json",
			success : function(res) {
				if("success" == res.result) {
					datatable.ajax.reload();
				}else if("duplicate" == res.result) {
					alert(res.message);
				}else{
					alert(res.message);
				}
			}
		});
	}

	function initFailCntUpdate(id){
		getSearchCondition(document.searchForm);
		if(confirm("해당 사용자 로그인 실패 카운터를 초기화 하시겠습니까?")){
			$.ajax({
				url : "<c:url value='/system/user/initFailCnt.json' />" ,
				type : "POST" ,
				data : {"userId": id} ,
				dataType : "json" , 
				success : function(res) {
					if(res.result == "success"){
						alert("로그인 실패 카운터가 초기화 되었습니다");
						datatable.ajax.reload();
					}else {
						alert(res.message);
					}
				}
			})
		}
	}
	
</script>