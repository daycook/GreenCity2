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
					<h3 class="box-title"><i class='material-icons' style='font-size:16px;'>play_arrow</i>&nbsp;&nbsp;검색조건</h3>
				</div>
				
				<div class="box-body">
					<form name="searchForm">
						<div class="row">
							<div class="col-xs-4">						
                            	<div class="input-group">
                               		<span class="input-group-addon">사용자 ID</span>
                               		<input type="text" id="userLoginIdLike" class="form-control" placeholder="사용자 ID 입력" maxlength="30">
                             	</div>
							</div>
							<div class="col-xs-4">						
                             	<div class="input-group">
                                	<span class="input-group-addon">사용자명</span>
                                	<input type="text" id="userNmLike" class="form-control" placeholder="사용자명 입력" maxlength="30">
                            	</div>
                            </div>
							<div class="col-xs-4">						
                            	<div class="input-group">
                                	<span class="input-group-addon">로그인 IP</span>
                                	<input type="text" id="loginIpLike" class="form-control" placeholder="로그인 IP 입력" maxlength="30">
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
				</div>
				-->
				<div class="box-body">
					<table id="datatable" class="table table-bordered table-striped" style="width:100%; table-layout:fixed;"></table>
				</div>
			</div>
		</div>
	</div>
</section>

<div class="modal fade useLog-modal" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h2>사용이력</h2>
			</div>
			<div class="modal-body">
				<div class="row-mod">
					<div class="col-xs-6">						
                    	<div class="input-group-mod">
                       		<span class="input-group-addon">사용자ID</span>
                       		<input type="text" id="userLoginId" name="userLoginId" class="form-control">
                     	</div>
					</div>
					<div class="col-xs-6">						
                    	<div class="input-group-mod">
                       		<span class="input-group-addon">로그인</span>
                       		<input type="text" id="loginDt" class="form-control">
                     	</div>
					</div>
					<div class="col-xs-6">						
                    	<div class="input-group-mod">
                       		<span class="input-group-addon">사용자명</span>
                       		<input type="text" id="userNm" class="form-control">
                     	</div>
					</div>
					<div class="col-xs-6">						
                    	<div class="input-group-mod">
                       		<span class="input-group-addon">로그아웃</span>
                       		<input type="text" id="logoutDt" class="form-control">
                     	</div>
					</div>
				</div>
				<table id="useLogDatatable" class="table table-bordered table-striped" style="width:95%; table-layout:fixed;"></table>
			</div>
		</div>
	</div>
</div>
<div class="modal fade parameterDetail-modal" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h2>파라미터 상세보기</h2>
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
								<th class="text-center">파라미터</th>
								<td><textarea name="reqParam" id="reqParam" class="form-control col-md-7 col-xs-12  plan" rows="5" readonly="readonly"></textarea></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
<script>

	var datatable;
	var loginLogId = '<%=session.getAttribute("loginLogId")%>';
	
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
				"url" : "<c:url value='/system/scur/loginLogList.json' />"
				,"method" : "post"
				,"data" : function(d) {
					if ($('#userLoginIdLike').val() != "") {d.userLoginIdLike = $('#userLoginIdLike').val();}
					if ($('#userNmLike').val() != "") {d.userNmLike = $('#userNmLike').val();	}
					if ($('#loginIpLike').val() != "") {d.loginIpLike = $('#loginIpLike').val();	}
				}
			},"processing": true
			,"serverSide": true
			,"order" : [[3, 'desc']]
			,"columns": [
				{ "name" : "LOGIN_LOG_ID", "title" : "번호", "data" : "loginLogId", "className" : "dt-head-center dt-body-center"}, 
				{ "name" : "USER_LOGIN_ID", "title" : "사용자", "render" :
					function (data, type, row) {
						var loginInfo = row["user"]["userLoginId"]+"("+row["user"]["userNm"]+")";  
						return loginInfo; 
				}, "className" : "dt-head-center dt-body-left"},
				{ "name" : "LOGIN_IP", "title" : "로그인 IP", "data" : "loginIp", "className" : "dt-head-center dt-body-center"},
				{ "name" : "LOGIN_DT", "title" : "로그인일시", "render" :
					function (data, type, row) {
						return new Date(row["loginDt"]).format("yyyy-MM-dd HH:mm:ss");
				}, "className" : "dt-head-center dt-body-center"},
				{ "name" : "LOGOUT_DT", "title" : "로그아웃일시", "render" :
					function (data, type, row) {
						if(row["logoutDt"] != null){
							return new Date(row["logoutDt"]).format("yyyy-MM-dd HH:mm:ss");
						}else{ 
							if(row["loginLogId"] ==  loginLogId ){
								return "로그인중";
							}else{
								return "세션아웃";
							}
						}
				}, "className" : "dt-head-center dt-body-center"},
				/* { "render" : 
					function (data, type, row) {
						var html = "";
						html += "<button type='button' class='btn btn-xs btn-outline-primary' data-toggle='tooltip' title='사용이력' onclick='showUseLog(\""+row["loginLogId"]+"\",\""+row["user"]["userLoginId"]+"\",\""+row["user"]["userNm"]+"\",\"";
						html += ""+new Date(row["loginDt"]).format("yyyy-MM-dd HH:mm:ss")+"\",\"";
						if(row["logoutDt"] != null){
							html +=  new Date(row["logoutDt"]).format("yyyy-MM-dd HH:mm:ss");
						}else{ 
							if(row["loginLogId"] ==  loginLogId ){
								html += "로그인중";
							}else{
								html += "세션아웃";
							}
						}
						html += "\")'><i class='material-icons'>list_alt</i></button>&nbsp;";
						return html;
					},
					"title":"기능", "className": "dt-head-center dt-body-center", "orderable" : false, 
				} */
			],"fnRowCallback": function(nRow, aData, iDisplayIndex) {
				$(nRow).on('click', function() {
					getSearchCondition(document.searchForm);
				});
			}	
		});
		setSearchCondition(document.searchForm);
	});
	
	function showParameter(webLogId){
		$.ajax({
			url : "<c:url value='/system/webLog/selectOne.json' />" ,
			type : "POST" ,
			data : {"webLogId": webLogId} ,
			dataType : "json" , 
			success : function(res) {
				if(res.result == "success"){
					if(res.data.reqParam == ""){
						var msg = "파라미터가 없습니다.";
						$("#reqParam").val(msg);
					}else{
						$("#reqParam").val(res.data.reqParam);
					}
				}else {
					alert(res.message);
				}
			}
		})
		$('div.parameterDetail-modal').modal("show");
	}
	
	
	function showUseLog(loginLogId, userLoginId, userNm, loginDt, logoutDt){
		$('#userLoginId').val(userLoginId);
		$('#userNm').val(userNm);
		$('#loginDt').val(loginDt);
		$('#logoutDt').val(logoutDt);
		dataUseLogtable = $("#useLogDatatable").DataTable({
			"searching" : false
			,"destroy" : true
			,"paging": true
			,"bPaginate": true
			,"responsive": true
			,"language": lang_kor
			,"ajax" : {
				"url" : "<c:url value='/system/webLog/list.json' />"
				,"method" : "post"
				,"data" : {"loginLog.loginLogId" : loginLogId }
			},"processing": true
			,"serverSide": true
			,"order" : [[0, 'desc']]
			,"columns": [
				{ "name" : "WEB_LOG_ID", "title" : "번호", "data" : "webLogId", "className" : "dt-head-center dt-body-center" },
				{ "name" : "PGM_NM", "title" : "프로그램", "render" :
					function (data, type, row) {
						if(row["pgmNm"] != null)
							return row["pgmNm"];
						else
							return row["reqUrl"]; 
				}, "className" : "dt-head-center dt-body-left" },
				{ "name" : "REQ_MTHD", "title" : "형식", "data" : "reqMthd", "className" : "dt-head-center dt-body-center" },
				{ "render" : 
					function (data, type, row) {
						var html = "";
						html += "<button type='button' class='btn btn-xs btn-outline-primary' data-toggle='tooltip' title='파라미터' onclick='showParameter(\""+row["webLogId"]+"\")'><i class='material-icons'>message</i></button>&nbsp;";
						return html;
					},
					"title":"파라미터", "className": "dt-head-center dt-body-center", "orderable" : false, 
				},
				{ "name" : "REG_DT", "title" : "사용일시", "render" :
					function (data, type, row) {
						return new Date(row["regDt"]).format("yyyy-MM-dd HH:mm:ss");
				}, "className" : "dt-head-center dt-body-center" },
			],"fnRowCallback": function(nRow, aData, iDisplayIndex) {
			}	
		});
		$('div.useLog-modal').modal("show");
	}
	
	$("#searchBtn").click(function() {
		datatable.ajax.reload();
	});
	
	$("#resetBtn").click(function() {
		$('#userLoginIdLike').val("");
		$('#userNmLike').val("");
		$('#loginIpLike').val("");
		datatable.ajax.reload();
	});
	
</script>