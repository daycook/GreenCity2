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
					<div class="row">
						<div class="col-xs-6">						
                           	<div class="input-group">
                              	<span class="input-group-addon">사이트명</span>
                              	<input type="text" id="siteNmLike" class="form-control" placeholder="사이트명 입력" maxlength="50">
                            </div>
                    	</div>
                    	<div class="col-xs-6">						
                           	<div class="input-group">
                           		<span class="input-group-addon">시작 URL</span>
                           		<input type="text" id="startUrlLike" class="form-control" placeholder="시작 URL 입력" maxlength="70">
                         	</div>
						</div>
					</div>
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
				<div class="box-footer">
					<button type="button" class="btn btn-outline-primary" style="float: right;" onclick="showInsertModal()">등록</button>
				</div>
			</div>
		</div>
	</div>
</section>

<div class="modal fade save-modal" data-keyboard="false" data-backdrop="static" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h2 id="save-modal-title"></h2>
			</div>
			
			<div class="modal-body no-padding">
				<form id="saveForm" name="saveForm" class="form-horizontal form-label-left">
					<input type="hidden" name="siteId" />
					<table class="table table-condensed">
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tbody>
							<tr>
								<th class="text-center">
									언어 <span class="required">*</span>
								</th>
								<td>
									<select name="langId" class="form-control">
										<c:forEach var="lang" items="${langList}">
											<option value="${lang.langId}">${lang.dispNm} (${lang.langTpCd.cdDtlNm})</option>	
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th class="text-center">
									사이트명 <span class="required">*</span>
								</th>
								<td>
									<input type="text" name="siteNm" class="form-control" maxlength="50" placeholder="사이트명을 입력">
								</td>
							</tr>
							<tr>
								<th class="text-center">
									도메인 <span class="required">*</span>
								</th>
								<td>
									<input type="text" name="domain" class="form-control" maxlength="100" placeholder="도메인을 입력 ex)localhost:8080">
								</td>
							</tr>
							<tr>
								<th class="text-center">
									시작 URL
								</th>
								<td>
									<div class="input-group">
										<div class="input-group-addon">/</div>
			                  			<input type="text" name="startUrl" class="form-control" maxlength="100" placeholder="도메인 이후 시작 URL를 입력">
									</div>
								</td>
							</tr>
							<tr>
								<th class="text-center">
									Copyright 문구
								</th>
								<td>
									<textarea rows="3" name="copyright" class="form-control" maxlength="2000" placeholder="홈페이지 Copyright영역의 문구를 입력"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-blue" onclick="save()">확인</button>
				<button type="button" class="btn btn-outline-red" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<script>

	var datatable;
	$(document).ready(function() {
		datatable = $("#datatable").DataTable({
			"searching" : false
			,"paging": true
			,"bPaginate": true
			,"responsive": true
			,"language": lang_kor
			,"ajax" : {
				"url" : "<c:url value='/system/site/list.json' />"
				,"method" : "post"
				,"data" : function(d) {
					if ($('#siteNmLike').val() != "") {d.siteNmLike = $('#siteNmLike').val();	}
					if ($('#startUrlLike').val() != "") {d.startUrlLike = $('#startUrlLike').val();	}
					if ($('#langId').val() != "") {d.langId = $('#langId').val();	}
					d.pagingYn = true;
				}
			},"processing": true
			,"serverSide": true
			,"order" : [[0, 'desc']]
			,"columns": [
				{ "name" : "SITE_NM", "title" : "사이트명", "data" : "siteNm", "className" : "dt-head-center dt-body-left"},
				{ "name" : "LANG_ID", "title" : "언어", "data" : "lang.langTpCd.cdDtlNm", "className" : "dt-head-center dt-body-left"},
				{ "name" : "DOMAIN", "title" : "도메인", "data" : "domain", "className" : "dt-head-center dt-body-left"},
				{ "name" : "START_URL", "title" : "시작 URL", "data" : "startUrl", "className" : "dt-head-center dt-body-left"},
				{ "name" : "REG_DT", "title" : "등록일", "render" : 
					function (data, type, row) {
					return new Date(row["regDt"]).format("yyyy-MM-dd");  
				}, "className" : "dt-head-center dt-body-center"},
				{ "render" : 
					function (data, type, row) {
						var html = "";
						html += "<button type='button' class='btn btn-sm btn-outline-primary' data-toggle='tooltip' title='수정' onclick='showUpdateModal(\""+row["siteId"]+"\")'><i class='material-icons'>create</i></button>&nbsp;";
						html += "<button type='button' class='btn btn-sm btn-outline-primary' data-toggle='tooltip' title='메뉴이동' onclick='linkMenu(\""+row["siteId"]+"\")'><i class='material-icons'>list</i></button>&nbsp;";
						/* html += "<button type='button' class='btn btn-xs btn-danger' data-toggle='tooltip' title='삭제' onclick='del(\""+row["siteId"]+"\")'><i class='fa fa-trash'></i></button>&nbsp;"; */
						return html;  
					},
					"title":"기능", "className": "dt-head-center dt-body-center", "orderable" : false
				}
			]
		});
		
		$("#searchBtn").click(function() {
			datatable.ajax.reload();
		});
		
		$("#resetBtn").click(function() {
			//$('#siteIdLike').val("");
			$('#siteNmLike').val("");
			$('#startUrlLike').val("");
			$('#langId').val("");
			datatable.ajax.reload();
		});
	});
	
	function showInsertModal() {
		var form = document.saveForm;
		form.siteNm.value = "";
		form.domain.value = "";
		form.startUrl.value = "";
		form.langId[0].selected = true;
		form.copyright.value = "";
		
		$("#saveForm").attr("action","<c:url value='/system/site/insert.json' />");
		$("#save-modal-title").html("등록");
		$('.save-modal').modal("show");
	}
	
	function showUpdateModal(siteId) {
		$.ajax({
			url : "<c:url value='/system/site/view.json' />",
			type : "POST",
			data : {"siteId" : siteId},
			dataType : "json",
			success : function(res) {
				if ("success" == res.result) {
					var data = res.data;
					var form = document.saveForm;
					form.siteId.value = data.siteId;
					form.langId.value = data.langId;
					form.siteNm.value = data.siteNm;
					form.domain.value = data.domain;
					form.startUrl.value = data.startUrl;

					if(data.copyright == null || data.copyright == ""){
						form.copyright.value = "";	
					}else{
						form.copyright.value = data.copyright;	
					}

					$("#saveForm").attr("action","<c:url value='/system/site/update.json' />");
					$("#save-modal-title").html("수정");
					$('.save-modal').modal("show");			
				}else {
					alert(res.message);
				}
			}
		});
	}
	
	function save() {
		var form = document.saveForm;
		if($.trim(form.siteNm.value) == "") {
			alert("사이트명을 입력 해 주세요.");
			form.siteNm.focus();
		}else if($.trim(form.domain.value) == "") {
			alert("도메인을 입력 해 주세요.");
			form.domain.focus();
		}else {
			if(confirm($("#save-modal-title").html()+" 하시겠습니까?")) {
				$.ajax({
					url : $("#saveForm").attr("action"),
					type : "POST",
					data : $("#saveForm").serialize(),
					dataType : "json",
					success : function(res) {
						if ("success" == res.result) {
							alert($("#save-modal-title").html()+"되었습니다.");
							datatable.ajax.reload();
							$('.save-modal').modal("hide");
						}else {
							alert(res.message);
						}
					}
				});
			}
		}
	}
	
	function del(siteId) {
		if(confirm("삭제하시겠습니까?")) {
			$.ajax({
				url : "<c:url value='/system/site/delete.json' />",
				type : "POST",
				data : {"siteId" : siteId},
				dataType : "json",
				success : function(res) {
					if ("success" == res.result) {
						alert("삭제 되었습니다.");
						datatable.ajax.reload();
					}else {
						alert(res.message);
					}
				}
			});
		}
	}
	
	function linkMenu(siteId){

		location.href = "/system/cmsMenu/list.mng?siteId="+siteId;
	}
</script>