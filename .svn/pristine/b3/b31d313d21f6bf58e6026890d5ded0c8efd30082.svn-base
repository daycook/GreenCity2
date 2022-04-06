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
					<div class="box-tools pull-right">
						<button class="btn btn-outline-primary" data-widget="collapse"><i class="fa fa-minus"></i></button>
						<button class="btn btn-outline-primary" data-widget="remove"><i class="fa fa-times"></i></button>
					</div>
				</div>
				
				<div class="box-body">
					<div class="row">
						<div class="col-xs-6">						
                            <div class="input-group">
                            	<span class="input-group-addon">언어 구분</span>
								<!-- <tg:cdDtl cd="lang" id="langTp" styleClass="selectpicker" headerText="전체" labelYn="Y" /> -->
								<tg:cdDtl cd="lang" id="langTp" styleClass="form-control" headerText="전체" labelYn="Y" />
                            </div>
                        </div>
						<div class="col-xs-6">						
                            <div class="input-group">
                               	<span class="input-group-addon">표시명</span>
                               	<input type="text" id="dispNmLike" class="form-control" placeholder="표시명 입력" maxlength="30">
                            </div>
                        </div>
					</div>
				</div>
				
				<div class="box-footer">
					<div class="btn-group pull-right">
						<button type="button" class="btn btn-outline-primary" id="searchBtn"><i class="fa fa-search"></i> 검색</button>
						<button type="button" class="btn btn-outline-primary" id="resetBtn"><i class="fa fa-undo"></i> 리셋</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-xs-12">
			<div class="box box-primary">
				<!-- 
				<div class="box-header">
					<h3 class="box-title">목록</h3>
				</div>
				 -->
				<div class="box-body">
					<table id="datatable" class="table table-bordered table-striped" style="width:100%; table-layout:fixed;"></table>
				</div>
				<div class="box-footer">
					<button type="button" class="btn btn-outline-primary pull-right" onclick="showInsertModal()">등록</button>
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
				<form id="saveForm" name="saveForm" class="form-horizontal form-label-left" onSubmit="return false">
					<input type="hidden" name="langId" />
					<table class="table table-condensed">
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tbody>
							<tr>
								<th class="text-center">언어 구분<span class="required">*</span></th>
								<td>
									<tg:cdDtl type="radio" cd="lang" name="langTp" labelYn="Y" value="ko"/>
								</td>
							</tr>
							<tr>
								<th class="text-center">표시명(영문)<span class="required">*</span></th>
								<td>
									<input type="text" id="dispNm" name="dispNm" class="form-control col-md-7 col-xs-12" placeholder="표시명을 영문으로 입력 ">
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-primary" onclick="saveCheck()">확인</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<script>

	var changedispNm = "";
	var datatable;
	
	$(document).ready(function() {
		datatable = $("#datatable").DataTable({
			"searching" : false
			,"paging": true
			,"bPaginate": true
			,"responsive": true
			,"language": lang_kor
			,"ajax" : {
				"url" : "<c:url value='/system/lang/list.json' />"
				,"method" : "post"
				,"data" : function(d) {
					if ($('#langTp').val() != "") {d.langTp = $('#langTp').val();	}
					if ($('#dispNmLike').val() != "") {d.dispNmLike = $('#dispNmLike').val();	}
				}
			},"processing": true
			,"serverSide": true
			,"order" : [[0, 'desc']]
			,"columns": [
				{ "name" : "LANG_TP", "title" : "언어 구분", "render" : 
					function (data, type, row) {
						return "<span class='label label-"+row["langTpCd"].cdDtlLabel+"'>"+row["langTpCd"].cdDtlNm+"</span>";  
					}, "className" : "dt-head-center dt-body-center"},
				{ "name" : "DISP_NM", "title" : "표시명(영문)", "data" : "dispNm", "className" : "dt-head-center dt-body-left"},
				{ "name" : "REG_DT", "title" : "등록일", "render" : 
					function (data, type, row) {
					return new Date(row["regDt"]).format("yyyy-MM-dd");  
				}, "className" : "dt-head-center dt-body-center"},
				{ "render" : 
					function (data, type, row) {
						var html = "";
						html += "<button type='button' class='btn btn-xs btn-update' data-toggle='tooltip' title='수정' onclick='showUpdateModal(\""+row["langId"]+"\")'><i class='fa fa-pencil-square-o'></i></button>&nbsp;";
						/* html += "<button type='button' class='btn btn-xs btn-danger";
						if(row["basicYn"]) {
							html += "disabled' data-toggle='tooltip' title='기본언어는 삭제가 불가능합니다.'";
						}else {
							html += "' data-toggle='tooltip' title='삭제' onclick='del(\""+row["langId"]+"\")'";							
						}
						html += "><i class='fa fa-trash'></i></button>&nbsp;"; */
						return html;  
					},
				   "className": "dt-head-center dt-body-center", "orderable" : false, "title":"기능"
				}
			]
		});
	});

	$("#searchBtn").click(function() {
		datatable.ajax.reload();
	});
	
	$("#langTp").change(function() {
		datatable.ajax.reload();
	});
	
	$("#resetBtn").click(function() {
		$("#langTp option:eq(0)").attr("selected", "selected");
		$("#langTp").selectpicker("val","");
		$('#dispNmLike').val("");
		datatable.ajax.reload();
	});

	function showInsertModal() {
		var form = document.saveForm;
		form.dispNm.value = "";
		$("#saveForm").attr("action","<c:url value='/system/lang/insert.json' />");
		$("#save-modal-title").html("등록");
		$('.save-modal').modal("show");
	}
	
	function showUpdateModal(langId) {
		$.ajax({
			url : "<c:url value='/system/lang/view.json' />",
			type : "POST",
			data : {"langId" : langId},
			dataType : "json",
			success : function(res) {
				if ("success" == res.result) {
					var data = res.data;
					var form = document.saveForm;
					form.langId.value = data.langId;
					for(var i = 0; i < form.langTp.length; i++) {
						if(form.langTp[i].value == data.langTp) {
							form.langTp[i].checked = true;
						}
					}
					form.dispNm.value = data.dispNm;
					changedispNm = data.dispNm;
					$("#saveForm").attr("action","<c:url value='/system/lang/update.json' />");
					$("#save-modal-title").html("수정");
					$('.save-modal').modal("show");			
				}else {
					alert(res.message);
				}
			}
		});
	}

	function saveCheck() {
		var form = document.saveForm;
		if(form.dispNm.value == "") {
			alert("표시명을 입력 해 주세요.");
			form.dispNm.focus();
		}else {
			var dispNm = form.dispNm.value;
			if($("#save-modal-title").html() == "등록" || changedispNm != dispNm){
				dispNmdupcheck(dispNm);
			}else{
				save();
			}
		}
	}
	
	function save(){
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
	
	function dispNmdupcheck(dispNm){
		$.ajax({
			url : "<c:url value='/system/lang/duplecheck.json' />",
			type : "POST",
			data : {"dispNm" : dispNm},
			dataType : "json",
			success : function(res) {
				if ("success" == res.result) {
					var data = res.data;
					var form = document.saveForm;
					if(data > 0){
						alert("표시명이 중복되었습니다.");
						form.dispNm.focus();
					}else{
						save();
					}
				}else {
					alert(res.message);
				}
			}
		});
	}
	
	/*
	function del(langId) {
		if(confirm("삭제하시겠습니까?")) {
		}
	}
	*/
	
	$("#dispNm").keyup(function(event){ 
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
			var inputVal = $(this).val();
	    	$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
	   	}
	});
	
</script>