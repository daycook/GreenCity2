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
								<span class="input-group-addon">배너 타입</span>
								<!-- <tg:cdDtl cd="banner" id="bannerTp" styleClass="selectpicker" headerText="전체" labelYn="Y" /> -->
								<tg:cdDtl cd="banner" id="bannerTp" styleClass="form-control" headerText="전체" labelYn="Y" />
							</div>
						</div>
						
				   		<div class="col-xs-4">						
                         	<div class="input-group">
                            	<span class="input-group-addon">배너명</span>
                               	<input type="text" id="bannerNmLike" class="form-control" placeholder="배너명 입력" maxlength="30">
                         	</div>
                        </div>
						<div class="col-xs-4">						
                        	<div class="input-group">
                           		<span class="input-group-addon">링크 URL</span>
                               	<input type="text" id="linkUrlLike" class="form-control" placeholder="링크 URL 입력" maxlength="40">
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
					<input type="hidden" name="bannerId" />
					<input type="hidden" name="fileId" />
					<input type="hidden" name="itemId" />
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">사이트</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<select id="siteId" name="siteId" class="form-control">
								<c:forEach var="site" items="${siteList}">
									<option value="${site.siteId}" <c:if test="${site.siteId eq 1}">selected</c:if>>${site.siteNm} (${site.domain})</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">배너명<span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" name="bannerNm" class="form-control" placeholder="배너명 입력" maxlength="50">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">배너형태<span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<tg:cdDtl type="radio" cd="banner" name="bannerTp" labelYn="Y"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">게시기간</label>
						<div class="input-group col-md-6 col-sm-6 col-xs-12">
							<input type="text" class="form-control datepicker" id="startDt" name="startDt" placeholder="시작일 선택">
							<span class="input-group-addon bg-gray"> ~ </span>
							<input type="text" class="form-control datepicker" id="endDt" name="endDt" placeholder="종료일 선택">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">링크 URL</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" name="linkUrl" class="form-control" placeholder="링크 URL 입력" maxlength="70">
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
						<label class="control-label col-md-3 col-sm-3 col-xs-12">이미지 설명(alt)</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" name="bannerAlt" class="form-control" maxlength="75" placeholder="이미지 줄임설명 입력">
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

<script src="<c:url value='/js/file.js' />"></script>
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
				"url" : "<c:url value='/system/banner/list.json' />"
				,"method" : "post"
				,"data" : function(d) {
					if ($('#bannerNmLike').val() != "") {d.bannerNmLike = $('#bannerNmLike').val();	}
					if ($('#linkUrlLike').val() != "") {d.linkUrlLike = $('#linkUrlLike').val();	}
					if ($('#bannerTp').val() != "") {d.bannerTp = $('#bannerTp').val();	}
					if ($('#startDtThanOrEquals').val() != "") {d.startDtThanOrEquals = $('#startDtThanOrEquals').val();	}
					if ($('#startDtLessOrEquals').val() != "") {d.startDtLessOrEquals = $('#startDtLessOrEquals').val();	}
					if ($('#endDtThanOrEquals').val() != "") {d.endDtThanOrEquals = $('#endDtThanOrEquals').val();	}
					if ($('#endDtLessOrEquals').val() != "") {d.endDtLessOrEquals = $('#endDtLessOrEquals').val();	}
				}
			},"processing": true
			,"serverSide": true
			,"order" : [[5, 'desc']]
			,"columns": [
				{ "name" : "BANNER_TP", "title" : "배너타입", "render" : 
					function (data, type, row) {
						return "<span class='label label-"+row["bannerTpLabel"]+"'>"+row["bannerTpNm"]+"</span>";  
				}, "className" : "dt-head-center dt-body-center"},
				{ "name" : "BANNER_NM", "title" : "배너명", "data" : "bannerNm", "className" : "dt-head-center dt-body-left"},
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
						html += "<button type='button' class='btn btn-xs btn-outline-primary' data-toggle='tooltip' title='수정' onclick='showUpdateModal(\""+row["bannerId"]+"\")'><i class='material-icons'>create</i></button>&nbsp;";
						html += "<button type='button' class='btn btn-xs btn-outline-primary' data-toggle='tooltip' title='삭제' onclick='delBanner(\""+row["bannerId"]+"\")'><i class='material-icons'>delete</i></button>&nbsp;";
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
	
	$("#bannerTp").change(function() {
		if(selectCheckDate()){
			datatable.ajax.reload();
		}
	});
	
	$("#resetBtn").click(function() {
		$('#bannerNmLike').val("");
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
		form.bannerNm.value = "";
		/* form.bannerTp[1].checked = true; */
		form.linkUrl.value = "";
		form.bannerAlt.value = "";
		form.startDt.value = "";
		form.endDt.value = "";
		form.itemId.value = "";
		form.fileId.value = "";
		
		$("#funcForm").attr("action","<c:url value='/system/banner/insert.json' />");
		$("#previewDiv").html("");
		$("#func-modal-title").html("등록");
		$('.func-modal').modal("show");
	}

	function showUpdateModal(bannerId) {
		$.ajax({
			url : "<c:url value='/system/banner/view.json' />",
			type : "POST",
			data : {"bannerId" : bannerId},
			dataType : "json",
			success : function(res) {
				if ("success" == res.result) {
					var data = res.data;
					var form = document.funcForm;			
					form.bannerId.value = data.bannerId;
					form.bannerNm.value = data.bannerNm;
					for(var i = 0; i < form.bannerTp.length; i++) {
						if(form.bannerTp[i].value == data.bannerTp) {
							form.bannerTp[i].checked = true;
						}
					}
					form.linkUrl.value = data.linkUrl;
					fileId = data.fileId;
					form.fileId.value = data.fileId;
					form.itemId.value = "";
					form.bannerAlt.value = data.bannerAlt;
					form.startDt.value = new Date(data.startDt).format("yyyy-MM-dd");
					form.endDt.value = new Date(data.endDt).format("yyyy-MM-dd");
					
					var preview = "<a href='/file/image.mng?fileId="+data.fileId+"&"+new Date().getTime()+"' rel='lightbox'>";
					preview += "<img src='/file/image.mng?thumnail=true&fileId="+data.fileId+"&"+new Date().getTime()+"' class='img-rounded img-responsive'>";
					preview += "</a>";
					$("#previewDiv").html(preview);
					
					$("#funcForm").attr("action","<c:url value='/system/banner/update.json' />");
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
		if($.trim(form.bannerNm.value) == "") {
			alert("배너명을 입력 해 주세요.");
			form.bannerNm.focus();
		}else if(!$('input:radio[name=bannerTp]').is(':checked')){ //배너형태 라디오 박스 추가
			alert("배너형태를 선택 해 주세요.");
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
						}else {
							alert(res.message);
						}
					}
				});
				
			}
		}
	}
	
	function delBanner(bannerId){
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				url : "<c:url value='/system/banner/delete.json' />",
				type : "POST",
				data : {"bannerId" : bannerId},
				dataType : "json",
				success : function(res){
					if("success" == res.result){
						alert("삭제되었습니다.");
						datatable.ajax.reload();
					}else{
						alert(res.message)
					}
				}
			})
		}
	}
</script>