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
                            	<span class="input-group-addon">미디어명</span>
                               	<input type="text" id="mediaNmLike" name="mediaNmLike" class="form-control" placeholder="미디어명 입력" maxlength="50">
                         	</div>
                        </div>
						<div class="col-xs-6">						
                        	<div class="input-group">
                           		<span class="input-group-addon">해쉬 URL</span>
                               	<input type="text" id="hashUrlLike" name="hashUrlLike" class="form-control" placeholder="해쉬 URL 입력" maxlength="50">
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
				<!-- <div class="box-header">
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

<div class="modal fade func-modal" data-keyboard="false" data-backdrop="static" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h2 id="header_name">등록</h2>
			</div>
			<div class="modal-body">
				<form id="funcForm" name="funcForm" class="form-horizontal form-label-left" method="post" enctype="multipart/form-data" onSubmit="return false">
					<input type="hidden" name="mediaId" />
					<div class="form-group upd">
						<div class="col-md-3 col-sm-3 col-xs-12"></div>
						<div class="col-md-6 col-sm-6 col-xs-12" id="mediaDiv"></div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">미디어명 <span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" name="mediaNm" class="form-control col-md-7 col-xs-12" placeholder="미디어명 입력">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">파일</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="file" name="file" class="form-control">
						</div>
					</div>
					<div class="form-group upd">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">타입</label>
						<div class="col-md-6 col-sm-6 col-xs-12" id="mediaTypeDiv">
							
						</div>
					</div>
					<div class="form-group upd">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">해쉬</label>
						<div class="col-md-6 col-sm-6 col-xs-12" id="hashDiv">
							
						</div>
					</div>
					<div class="form-group upd">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">등록일</label>
						<div class="col-md-6 col-sm-6 col-xs-12" id="regDtDiv">
							
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-primary" onclick="func()">저장</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
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
				"url" : "<c:url value='/system/media/list.json' />"
				,"method" : "post"
				,"data" : function(d) {
					if ($('#mediaNmLike').val() != "") {d.mediaNmLike = $('#mediaNmLike').val();	}
					if ($('#hashUrlLike').val() != "") {d.hashUrlLike = $('#hashUrlLike').val();	}
				}
			},"processing": true
			,"serverSide": true
			,"order" : [[4, 'desc']]
			,"columns": [
				{ "name" : "MEDIA_NM", "title" : "미디어명", "data" : "mediaNm", "className" : "dt-head-center dt-body-left", "width" : "10%"},
				{ "name" : "MEDIA_TP", "title" : "파일 타입", "data" : "mediaType", "className" : "dt-head-center dt-body-left", "width" : "10%"},
				{ "name" : "FILE_NM", "title" : "파일명", "data" : "fileNm", "className" : "dt-head-center dt-body-left", "width" : "40%"},
				{ "name" : "HASH", "title" : "해쉬 URL", "data" : "hash", "className" : "dt-head-center dt-body-center", "width" : "10%"},
				{ "name" : "REG_DT", "title" : "등록일", "render" : 
					function (data, type, row) {
						return new Date(row["regDt"]).format("yyyy-MM-dd");  
					}, "className" : "dt-head-center dt-body-center", "width" : "10%"},
				{ "render" : 
					function (data, type, row) {
						var html = "";
						html += "<button type='button' class='btn btn-xs btn-update' data-toggle='tooltip' title='수정' onclick='showUpdateModal(\""+row["mediaId"]+"\")'><i class='fa fa-pencil-square-o'></i></button>&nbsp;";
						html += "<button type='button' class='btn btn-xs btn-danger' data-toggle='tooltip' title='삭제' onclick='mediaDelete(\""+row["mediaId"]+"\")'><i class='fa fa-trash'></i></button>&nbsp;";
						return html;  
					},
				   "className": "dt-head-center dt-body-center", "orderable" : false, "title":"기능",  "width" : "10%"
				}
			]
		});
		
		$('#funcForm').ajaxForm({
			complete: function (xhr) {
				var res = xhr.responseJSON; 
            	if(res.result == "success"){
            		alert("저장되었습니다.");
					$('.func-modal').modal("hide");
					datatable.ajax.reload();
            	}
            }
		});
	});
	
	$("#searchBtn").click(function() {
		datatable.ajax.reload();
	});
	
	$("#resetBtn").click(function() {
		$('#mediaNmLike').val("");
		$('#hashUrlLike').val("");
		datatable.ajax.reload();
	});
	
	function showInsertModal() {
		var form = document.funcForm;
		form.mediaId.value = "";
		form.mediaNm.value = "";
		form.file.value = "";
		$("#mediaTypeDiv").html("");
		$("#hashDiv").html("");
		$("#regDtDiv").html("");
		$("#header_name").html("등록");
		$(".upd").hide();
		$('.func-modal').modal("show");
	}
	
	function showUpdateModal(mediaId) {
		$.ajax({
			url : "<c:url value='/system/media/view.json' />",
			type : "POST",
			data : {"mediaId" : mediaId},
			dataType : "json",
			success : function(res) {
				if ("success" == res.result) {
					var data = res.data;
					var form = document.funcForm;
					form.mediaId.value = data.mediaId;
					form.mediaNm.value = data.mediaNm;
					$("#mediaTypeDiv").html(data.mediaType);
					$("#hashDiv").html(data.hash);
					$("#regDtDiv").html(new Date(data.regDt).format("yyyy-MM-dd"));
					
					var mediaHtml = "";
					if(data.fileExt == 'JPG' || data.fileExt == 'jpeg' || data.fileExt == 'jpg' 
							|| data.fileExt == 'png' || data.fileExt == 'gif') {
						mediaHtml += "<img src='/public/media/image.json?hash="+data.hash+"' class='img-rounded img-responsive'>";
					}
					$("#mediaDiv").html(mediaHtml);
					$("#header_name").html("수정");
					$(".upd").show();
					$('.func-modal').modal("show");			
				}else {
					alert(res.message);
				}
			}
		});
	}
	
	function func() {
		var form = document.funcForm;
		if($.trim(form.mediaNm.value) == "") {
			alert("미디어명을 입력 해 주세요.");
			form.mediaNm.focus();
		}else if(form.file.value == "") {
			alert("파일을 등록 해 주세요.");
		}else {
			if(form.mediaId.value == "") { //등록
				form.action = "<c:url value='/system/media/insert.json' />";
				if(confirm("등록하시겠습니까?")) {
					$("#funcForm").submit();					
				}
			}else { 						//수정
				form.action = "<c:url value='/system/media/update.json' />";
				if(confirm("수정하시겠습니까?")) {
					$("#funcForm").submit();
				}
			}
		}
	}
	
	function mediaDelete(mediaId){
		if(confirm("삭제하시겠습니까?")) {
			$.ajax({
				url : "<c:url value='/system/media/delete.json' />",
				type : "POST",
				data : {"mediaId" : mediaId},
				dataType : "json",
				success : function(res){
					if("success" == res.result){
						alert("삭제 되었습니다.");
						datatable.ajax.reload();
					}else{
						alert(res.message);
					}
				}
			});
		}	
	}
</script>