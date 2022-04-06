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
                        <div class="col-xs-4">
							<div class="input-group">
								<span class="input-group-addon">팝업 타입</span>
								<!-- <tg:cdDtl cd="popup" id="popupTp" styleClass="selectpicker" headerText="전체" labelYn="Y" /> -->
								<tg:cdDtl cd="popup" id="popupTp" styleClass="form-control" headerText="전체" labelYn="Y" />
							</div>
						</div>
				   		<div class="col-xs-4">						
                         	<div class="input-group">
                            	<span class="input-group-addon">팝업명</span>
                               	<input type="text" id="popupNmLike" class="form-control" placeholder="팝업명 입력" maxLength="30">
                         	</div>
                        </div>
						<div class="col-xs-4">						
                        	<div class="input-group">
                           		<span class="input-group-addon">링크 URL</span>
                               	<input type="text" id="linkUrlLike" class="form-control" placeholder="링크 URL입력" maxLength="30">
                            </div>
						</div>
					</div>
					<br/>
					<div class="row">
                      	<div class="col-xs-6">
	                        <div class="input-group">
								<span class="input-group-addon">시작일</span>
								<div class="input-group">
                          	 		<input type="text" class="form-control datepicker" id="startDtThanOrEquals">
                           			<span class="input-group-addon" style="border:0px"> ~ </span>
                           			<input type="text" class="form-control datepicker" id=startDtLessOrEquals>
                         		</div>
	                        </div>
	                  	</div>
	                  	<div class="col-xs-6">
	                        <div class="input-group">
								<span class="input-group-addon">종료일</span>
								<div class="input-group">
                          	 		<input type="text" class="form-control datepicker" id="endDtThanOrEquals">
                           			<span class="input-group-addon" style="border:0px"> ~ </span>
                           			<input type="text" class="form-control datepicker" id=endDtLessOrEquals>
                         		</div>
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
				<h2 id="func-modal-title"></h2>
			</div>
			<div class="modal-body">
				<form id="funcForm" name="funcForm" class="form-horizontal form-label-left">
					<input type="hidden" name="popupId" />
					<input type="hidden" name="fileId" />
					<input type="hidden" name="itemId" />
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">팝업명<span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" name="popupNm" class="form-control" placeholder="팝업명 입력" maxlength="50">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">팝업형태</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<tg:cdDtl type="radio" cd="popup" name="popupTp" labelYn="Y"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">게시기간</label>
						<div class="input-group col-md-6 col-sm-6 col-xs-12">
							<input type="text" class="form-control datepicker" id="startDt" name="startDt" placeholder="시작일 입력">
							<span class="input-group-addon bg-gray"> ~ </span>
							<input type="text" class="form-control datepicker" id="endDt" name="endDt" placeholder="종료일 입력">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">크기(px)</label>
						<div class="input-group col-md-6 col-sm-6 col-xs-12">
							<input type="text" name="width" class="form-control" placeholder="너비 입력" maxlength="4">
							<span class="input-group-addon bg-gray"> X </span>
							<input type="text" name="height" class="form-control" placeholder="높이 입력" maxlength="4">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">링크 URL</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" name="linkUrl" class="form-control" placeholder="이미지 링크 URL 입력" maxlength="70">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-3 col-sm-3 col-xs-12"></div>
						<div class="col-md-6 col-sm-6 col-xs-12" id="previewDiv"></div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">이미지 파일</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<div class="fileUpload btn-group btn btn-outline-primary">
							    <span>업로드</span>
							    <input id="fileupload" type="file" name="files[]" data-url="/public/file/upload.json" class="upload">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">이미지 맵</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<code>&lt;map&gt;</code><br/>
							<textarea class="form-control" rows="3" name="imgMap" placeholder="이미지맵 입력"></textarea>
							<code>&lt;/map&gt;</code>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">이미지 설명(alt)</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" name="alt" class="form-control" maxlength="75" placeholder="이미지 줄임설명 입력">
						</div>
					</div>
				</form>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-primary" onclick="func()">등록</button>
				<button type="button" class="btn btn-outline-primary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<script>

	var datatable;
	
	$(document).ready(function() {
		
		fileInit("image");
		
		datatable = $("#datatable").DataTable({
			"searching" : false
			,"paging": true
			,"bPaginate": true
			,"responsive": true
			,"language": lang_kor
			,"ajax" : {
				"url" : "<c:url value='/system/popup/list.json' />"
				,"method" : "post"
				,"data" : function(d) {
					if ($('#popupNmLike').val() != "") {d.popupNmLike = $('#popupNmLike').val();	}
					if ($('#linkUrlLike').val() != "") {d.linkUrlLike = $('#linkUrlLike').val();	}
					if ($('#popupTp').val() != "") {d.popupTp = $('#popupTp').val();	}
					if ($('#startDtThanOrEquals').val() != "") {d.startDtThanOrEquals = $('#startDtThanOrEquals').val();	}
					if ($('#startDtLessOrEquals').val() != "") {d.startDtLessOrEquals = $('#startDtLessOrEquals').val();	}
					if ($('#endDtThanOrEquals').val() != "") {d.endDtThanOrEquals = $('#endDtThanOrEquals').val();	}
					if ($('#endDtLessOrEquals').val() != "") {d.endDtLessOrEquals = $('#endDtLessOrEquals').val();	}
				}
			},"processing": true
			,"serverSide": true
			,"order" : [[7, 'desc']]
			,"columns": [
				{ "name" : "POPUP_TP", "title" : "팝업타입", "render" : 
					function (data, type, row) {
						return "<span class='label label-"+row["popupTpLabel"]+"'>"+row["popupTpNm"]+"</span>";  
					}, "className" : "dt-head-center dt-body-center"},         
				{ "name" : "POPUP_NM", "title" : "팝업명", "data" : "popupNm", "className" : "dt-head-center dt-body-left"},				
				{ "name" : "WIDTH", "title" : "너비", "data" : "width", "className" : "dt-head-center dt-body-right"},
				{ "name" : "HEIGHT", "title" : "높이", "data" : "height", "className" : "dt-head-center dt-body-right"},
				{ "name" : "LINK_URL", "title" : "링크 URL", "data" : "linkUrl", "className" : "dt-head-center dt-body-left ellipsis",
					'fnCreatedCell': function(nTd, sData, oData, iRow, iCol) {
				        nTd.title = sData;
					}
				},
				{ "name" : "START_DT", "title" : "시작일", "render" : 
					function (data, type, row) {
						return new Date(row["startDt"]).format("yyyy-MM-dd");  
					}, "className" : "dt-head-center dt-body-center"},
				{ "name" : "END_DT", "title" : "종료일", "render" : 
					function (data, type, row) {
						return new Date(row["endDt"]).format("yyyy-MM-dd");  
					}, "className" : "dt-head-center dt-body-center"},
				{ "name" : "REG_DT", "title" : "등록일", "render" : 
						function (data, type, row) {
							return new Date(row["regDt"]).format("yyyy-MM-dd");  
						}, "className" : "dt-head-center dt-body-center"},
				{ "render" : 
					function (data, type, row) {
						var html = "";
						html += "<button type='button' class='btn btn-xs btn-outline-primary' data-toggle='tooltip' title='수정' onclick='showUpdateModal(\""+row["popupId"]+"\")'><i class='material-icons'>create</i></button>&nbsp;";
						html += "<button type='button' class='btn btn-xs btn-outline-primary' data-toggle='tooltip' title='삭제' onclick='delPopup(\""+row["popupId"]+"\")'><i class='material-icons'>delete</i></button>&nbsp;";
						return html;  
					},
				   "className": "dt-head-center dt-body-center", "orderable" : false, "title":"기능"
				}
			]
		});
	});
	
	$("#searchBtn").click(function() {
		if(selectCheckDate()){
			datatable.ajax.reload();
		}
	});
	
	$("#popupTp").change(function() {
		if(selectCheckDate()){
			datatable.ajax.reload();
		}
	});

	$("#resetBtn").click(function() {
		$('#popupNmLike').val("");
		$('#linkUrlLike').val("");
		$('#startDtThanOrEquals').val("");
		$('#startDtLessOrEquals').val("");
		$('#endDtThanOrEquals').val("");
		$('#endDtLessOrEquals').val("");
		$('.selectpicker').selectpicker('deselectAll');
		datatable.ajax.reload();
	});
	
	function selectCheckDate(){

		if($('#startDtThanOrEquals').val() > $('#startDtLessOrEquals').val()){
			alert("시작기간 : 시작일은 종료일보다 클 수 없습니다.");
			return false;
		}
		
		if($('#endDtThanOrEquals').val() > $('#endDtLessOrEquals').val()){
			alert("종료기간 : 시작일은 종료일보다 클 수 없습니다.");
			return false;
		}
		return true;
	}
	
	function insertCheckDate(){

		if($('#startDt').val() == ""){
			alert("시작일을 입력해주세요.");
			return false;
		}
		
		if($('#endDt').val() == ""){
			alert("종료일을 입력해주세요.");
			return false;
		}
		
		if($('#startDt').val() > $('#endDt').val()){
			alert("시작일은 종료일보다 클 수 없습니다.");
			return false;
		}
		return true;
	}

	function completeFileUpload(fileItem) {
		var html = "<a href='/file/image.mng?itemId="+fileItem.itemId+"&"+new Date().getTime()+"' rel='lightbox'>";
		html += "<img src='/file/image.mng?itemId="+fileItem.itemId+"&"+new Date().getTime()+"&thumnail=true' class='img-rounded img-responsive'>";
		html += "</a>";
		$("#previewDiv").html(html);
		
		var form = document.funcForm;
		form.itemId.value = fileItem.itemId;
	}
	
	function showInsertModal() {
		var form = document.funcForm;
		form.popupNm.value = "";
		form.popupTp[1].checked = true;
		form.width.value = "";
		form.height.value = "";
		form.linkUrl.value = "";
		form.imgMap.value = "";
		form.alt.value = "";
		form.startDt.value = "";
		form.endDt.value = "";
		form.fileId.value = "";
		form.itemId.value = "";
		$("#previewDiv").html("");
		
		$("#funcForm").attr("action","<c:url value='/system/popup/insert.json' />");
		$("#func-modal-title").html("등록");
		$('.func-modal').modal("show");
	}

	function showUpdateModal(popupId) {
		$.ajax({
			url : "<c:url value='/system/popup/view.json' />",
			type : "POST",
			data : {"popupId" : popupId},
			dataType : "json",
			success : function(res) {
				if ("success" == res.result) {
					var data = res.data;
					var form = document.funcForm;			
					form.popupId.value = data.popupId;
					form.popupNm.value = data.popupNm;
					for(var i = 0; i < form.popupTp.length; i++) {
						if(form.popupTp[i].value.trim() == data.popupTp.trim()) {
							form.popupTp[i].checked = true;
						}
					}
					form.width.value = data.width;
					form.height.value = data.height;
					form.linkUrl.value = data.linkUrl;
					fileId = data.fileId;
					form.fileId.value = data.fileId;
					form.itemId.value = "";

					if(data.imgMap == null || data.imgMap == ""){
						form.imgMap.value = "";	
					}else{
						form.imgMap.value = data.imgMap;	
					}
					
					form.alt.value = data.alt;
					form.startDt.value = new Date(data.startDt).format("yyyy-MM-dd");
					form.endDt.value = new Date(data.endDt).format("yyyy-MM-dd");
					
					var preview = "<a href='/file/image.mng?fileId="+data.fileId+"&"+new Date().getTime()+"' rel='lightbox'>";
					preview += "<img src='/file/image.mng?thumnail=true&fileId="+data.fileId+"&"+new Date().getTime()+"' class='img-rounded img-responsive'>";
					preview += "</a>";
					$("#previewDiv").html(preview);
					
					$("#funcForm").attr("action","<c:url value='/system/popup/update.json' />");
					$("#func-modal-title").html("수정");
					$('.func-modal').modal("show");
				}else {
					alert(res.message);
				}
			}
		});
	}
	
	function func() {
		var form = document.funcForm;
		if(isEmptyString(form.popupNm.value)) {
			alert("팝업명을 입력 해 주세요.");
			form.popupNm.focus();
		}else if(!insertCheckDate()){
		}else {
			if(confirm($("#func-modal-title").html()+" 하시겠습니까?")) {
				$.ajax({
					url : $("#funcForm").attr("action"), 
					type : "POST",
					data : $("#funcForm").serialize(),
					dataType : "json",
					success : function(res) {
						if ("success" == res.result) {
							alert($("#func-modal-title").html()+"되었습니다.");
							$('.func-modal').modal("hide");
							
							datatable.ajax.reload();
						} else {
							alert(res.message);
						}
					}
				});
			}
		}
	}
	
	function delPopup(popupId){
		if(confirm("해당 팝업을 삭제하시겠습니까?")){
			$.ajax({
				url : "<c:url value='/system/popup/delete.json' />" ,
				type : "POST" ,
				data : {"popupId": popupId} ,
				dataType : "json" , 
				success : function(res) {
					if(res.result == "success"){
						alert("삭제되었습니다");
						datatable.ajax.reload();
					}else {
						alert(res.message);
					}
				}
			})
		}
	}
</script>