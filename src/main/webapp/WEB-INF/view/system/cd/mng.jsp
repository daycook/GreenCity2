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
					<h3 class="box-title"><i class='material-icons' style='font-size:16px;'>play_arrow</i>&nbsp;&nbsp;코드 분류</h3>
				</div>

				 <div class="box-body">
					<div class="row">
						<div class="col-xs-12">
							<div class="form-group">
								<!-- <div class="col-sm-2 radio">
									<label> 
										<input type="radio" id="all" name="checkUseSt" value="">전체
									</label>
									<label>
										<input type="radio" id="use" name="checkUseSt" value="Y">사용
									</label>
									<label>
										<input type="radio" id="nonUse" name="checkUseSt" value="N">사용안함
									</label>
								</div> -->
								
								<div class="col-sm-4">
									<select class="form-control" id="cdSelect" name="cdSelect">
										<!-- <option value="">코드를 선택하십시오</option> -->
										<c:forEach var="cd" items="${cdList}">
											<option value="${cd.cdId}">${cd.cdNm} [${cd.cdId}]</option>
										</c:forEach>
									</select>
								</div>
								
								<button type="button" class="btn btn-outline-primary" data-toggle="tooltip" title="등록" onclick="cdModal(0)" ><i class="material-icons">playlist_add</i></button>
								<button type="button" class="btn btn-outline-primary" data-toggle="tooltip" title="수정" onclick="cdModal(1)" ><i class="material-icons">create</i></button>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-xs-12">
						    <input type="hidden" id="cdClsSelect" name="cdClsSelect" value="cms">
							<input type="hidden" id="cdClsSelectId" name="cdClsSelectId" value="cms">
							<input type="hidden" id="cdClsSelectNm" name="cdClsSelectNm"  value="cms">
							<input type="hidden" id="cdClsSelectUseSt" name="cdClsSelectUseSt">
							<textarea id="cdClsSelectDesc" class="form-control" readonly>
							</textarea>
						</div>
					</div>
				</div>
				<!-- 
				<div class="box-footer">
				</div>
				 -->
			</div>
		</div>
		
		<!-- <div class="col-xs-6">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title"><i class='material-icons' style='font-size:16px;'>play_arrow</i>&nbsp;&nbsp;코드</h3>
				</div>
				<div class="box-body">
					<table id="datatable" class="table table-bordered table-striped" style="width:98%; table-layout:fixed;"></table>
				</div>
				<div class="box-footer">
					<div class="box-tools pull-right">
						<button type="button" class="btn btn-outline-primary pull-right" onclick="cdModal(0)">등록</button>
					</div>
				</div>
			</div>
		</div>
		 -->
		<div class="col-xs-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title"><i class='material-icons' style='font-size:16px;'>play_arrow</i>&nbsp;&nbsp;상세 코드</h3>
				</div>
				<div class="box-body">
					<table id="datatableDetail" class="table table-bordered table-striped" style="width:98%; table-layout:fixed;"></table>
				</div>
				<div class="box-footer">
					<div class="box-tools pull-right">
						<button type="button" class="btn btn-outline-primary pull-right" onclick="cdDtlModal(0)">등록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- 코드분류 모달 -->
<div class="modal fade cdCls-modal" data-keyboard="false" data-backdrop="static" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h2>코드 분류</h2>
			</div>
			<div class="modal-body">
				<form id="cdClsForm" name="cdClsForm" class="form-horizontal form-label-left">
					<input type="hidden" name="saveUrl" id="saveUrlClass" value="" />
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">코드분류ID <span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" name="cdClsId" id="cdClsId" data-name="코드분류ID를" class="form-control col-md-7 col-xs-12 req" placeholder="코드분류ID를 입력">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">코드분류명 <span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" name="cdClsNm" id="cdClsNm" data-name="코드분류 명이" class="form-control col-md-7 col-xs-12 req" placeholder="코드분류명을 입력">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">코드분류 설명 </label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<textarea name="cdClsDesc" id="cdClsDesc" data-name="코드분류 설명이" class="form-control col-md-7 col-xs-12" placeholder="코드분류 설명을 입력"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">사용여부 <span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<select id="cdClsUseSt" name="useSt" data-name="사용여부가" class="form-control req">
								<option value="Y">사용</option>
								<option value="N">사용안함</option>
							</select>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-primary" onclick="cdClsInsert ()">저장</button>
				<button type="button" class="btn btn-outline-primary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- 코드 모달 -->
<div class="modal fade cd-modal" data-keyboard="false" data-backdrop="static" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h2>코드</h2>
			</div>
			<div class="modal-body">
				<form id="cdForm" name="cdForm" class="form-horizontal form-label-left">
					<input type="hidden" name="saveUrl" id="saveUrl" value="" />
					<input type="hidden" name="cdClsId" id="cdClsId1" value="cms" />
					<input type="hidden" name="cdClsNm" id="cdClsNm1" value="cms" />
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">코드ID <span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" name="cdId" id="cdId" data-name="코드ID가" class="form-control col-md-7 col-xs-12 req" placeholder="코드ID를 입력">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">코드명 <span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" name="cdNm" id="cdNm" data-name="코드명이" class="form-control col-md-7 col-xs-12 req" placeholder="코드명를 입력">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">코드설명 </label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<textarea name="cdDesc" id="cdDesc" class="form-control col-md-7 col-xs-12" placeholder="코드설명을 입력"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">사용여부 <span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<select id="cdUseSt" name="useSt" data-name="사용여부가" class="form-control req">
								<option value="Y">사용</option>
								<option value="N">사용안함</option>
							</select>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-primary" onclick="cdInsert()">저장</button>
				<button type="button" class="btn btn-outline-primary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- 상세코드 모달 -->
<div class="modal fade cdDtl-modal" data-keyboard="false" data-backdrop="static" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h2>상세코드</h2>
			</div>
			<div class="modal-body">
				<form id="cdDtlForm" name="cdDtlForm" class="form-horizontal form-label-left">
					<input type="hidden" name="saveUrl" id="saveUrlDetail" value="" />
					<input type="hidden" name="cdId" id="cdId1">
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">코드명 </label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" name="cdNm" id="cdNm1" data-name="코드명이" class="form-control col-md-7 col-xs-12 req" readOnly disabled>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">상세코드ID<span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" name="cdDtlId" id="cdDtlId" data-name="상세코드ID 가" class="form-control col-md-7 col-xs-12 req" placeholder="상세코드명ID를 입력">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">상세코드명 <span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" name="cdDtlNm" id="cdDtlNm" data-name="상세코드명이" class="form-control col-md-7 col-xs-12 req" placeholder="상세코드명을 입력">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">라벨<span class="required">*</span></label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<label>
	                 				<input type="radio" name="cdDtlLabel" value="default" checked >
	                 				<span class="label label-default">&nbsp; &nbsp; &nbsp; &nbsp;</span>
	               				</label>
	               				<label>
	               					<input type="radio" name="cdDtlLabel" value="primary">
	               					<span class="label label-primary">&nbsp; &nbsp; &nbsp; &nbsp;</span>
	               				</label>
	               				<label>
	               					<input type="radio" name="cdDtlLabel" value="success">
	               					<span class="label label-success">&nbsp; &nbsp; &nbsp; &nbsp;</span>
	               				</label>
	               				<label>
	               					<input type="radio" name="cdDtlLabel" value="info" >
	               					<span class="label label-info">&nbsp; &nbsp; &nbsp; &nbsp;</span>
	               				</label>
	               				<label>
	               					<input type="radio" name="cdDtlLabel" value="warning">
	               					<span class="label label-warning">&nbsp; &nbsp; &nbsp; &nbsp;</span>
	               				</label>
	               				<label>
	               					<input type="radio" name="cdDtlLabel" value="danger" >
	               					<span class="label label-danger">&nbsp; &nbsp; &nbsp; &nbsp;</span>
	               				</label>
							</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">상세코드 설명 </label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<textarea name="cdDtlDesc" id="cdDtlDesc" class="form-control col-md-7 col-xs-12" placeholder="상세코드 설명을 입력"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">상세코드 순서</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" name="cdDtlOrd" id="cdDtlOrd" class="form-control col-md-7 col-xs-12" placeholder="상세코드 순서를 입력">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">사용여부 <span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<select id="cdDtlUseSt" name="useSt" data-name="사용여부가" class="form-control req">
								<option value="Y">사용</option>
								<option value="N">사용안함</option>
							</select>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-primary" onclick="cdDtlInsert ()">저장</button>
				<button type="button" class="btn btn-outline-primary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<script>

	var datatableDetail;
	
	$(document).ready(function(){
		
		$("#cdDtlOrd").numeric ({
			allowSpace: false
		});
		
		//모달창이동
		$('.modal-content').draggable({
			handle: ".modal-header"
		});
		
		$('#all').attr("checked", true);
		$("#cdClsSelectDesc").hide();
		
			datatableDetail = $("#datatableDetail").DataTable({
			"searching" : false
			,"paging": true
			,"bPaginate": true
			,"responsive": true
			,"language": lang_kor
			,"ajax" : {
				"url" : "<c:url value='/system/cdDtl/list.json' />"
				,"method" : "post"
				,"data" : function(d) {
					d.cdId = $("#cdSelect").val();
				}
			}
			,"processing": true
			,"serverSide": true
			,"order" : [[0, 'desc']]
			,"columns": [
				{ "name" : "CD_DTL_ID", "title" : "상세 코드", "data" : "cdDtlId", "className" : "dt-head-center dt-body-left"},
				{ "name" : "CD_DTL_NM", "title" : "상세 코드명",
					"render" : function (data, type, row) {
						return "<span class='label label-"+row["cdDtlLabel"]+"'>"+row["cdDtlNm"]+"</span>";
					}, "className" : "dt-head-center dt-body-center"},
				{ "name" : "CD_DTL_DESC", "title" : "상세 코드 설명", "data" : "cdDtlDesc", "className" : "dt-head-center dt-body-left"},
				{ "name" : "CD_DTL_ORDER", "title" : "순서", "data" : "cdDtlOrd", "className" : "dt-head-center dt-body-left"},
				{ "name" : "USE_YN", "title" : "사용여부", "data" : "useSt", "className" : "dt-head-center dt-body-left", 
					  "render" : function (data, type, row) {
						  if(data=="Y"){
							  return "사용"
						  }else if(data=="N"){
							  return "사용안함"
						  }
					  }, "searchable": true
					},
				{ "render" : 
					function (data, type, row) {
						var html = "";
						html += "<button type='button' class='btn btn-xs btn-outline-primary' data-toggle='tooltip' title='수정' onclick='cdDtlModal(\""+row["cdDtlId"]+"\", \""+row["cdDtlNm"]+"\", \""+(row["cdDtlDesc"] == null ? '' : row["cdDtlDesc"])+"\", \""+row["cdDtlOrd"]+"\" ,\""+row["useSt"]+"\")'><i class='material-icons'>create</i></button>&nbsp;";
						html += "<button type='button' class='btn btn-xs btn-outline-primary' data-toggle='tooltip' title='삭제' onclick='cdDtlDelte(\""+row["cdDtlId"]+"\", \""+row["cdId"]+"\")'><i class='material-icons'>delete</i></button>&nbsp;";
						return html;  
					},
					"title":"기능", "className": "dt-head-center dt-body-center", "orderable" : false
				}
			],
		});//datatableDetail
		
		$("#cdSelect").change(function(){//코드 분류 값이 바뀔 때
			// datatable.ajax.reload(); //데이터 테이블 리로드
			datatableDetail.ajax.reload(); //데이터 테이블 리로드
		});
		
		$('input:radio[name="checkUseSt"]').click(function(){
			cdClsList($(this).val());
		});
		
	});
	
	function cdClsModal(id){//코드 분류 모달 오픈
		
		if (id == 0){
			$("#saveUrlClass").val("<c:url value='/system/cdCls/insert.json' />");
			$('#cdClsId').val(""); $("#cdClsId").removeAttr('readOnly');
			$('#cdClsNm').val("");
			$('#cdClsDesc').val("");
		} else {
			
			if(isEmptyString ($("#cdClsSelect").val())){
				alert("코드 분류를 선택하여 주십시오.");
				return;
			}
			
			$("#saveUrlClass").val("<c:url value='/system/cdCls/update.json' />");
			$('#cdClsId').val($("#cdClsSelectId").val()); $("#cdClsId").attr('readOnly', true); $("#cdClsId").attr('disabled', true);
			$('#cdClsNm').val($("#cdClsSelectNm").val());
			//$('#cdClsDesc').val($("#cdClsSelectDesc").text());
			$('#cdClsDesc').val($("#cdClsSelectDesc").val());
			if($("#cdClsSelectUseSt").val() == "Y"){
				$("#cdClsUseSt").val("Y");
			}else{
				$("#cdClsUseSt").val("N");
			}
		}
		$('.cdCls-modal').modal("show");
	}	
	
	function cdModal(id, name, desc, useSt){ //코드 모달 오픈
		if(isEmptyString ($("#cdClsSelect").val())){
			alert("코드 분류를 선택하여 주십시오.");
			return;
		}

		$("#cdClsId1").val($("#cdClsSelectId").val());
		$("#cdClsNm1").val($("#cdClsSelectNm").val());
		if (id == 0) {
			$("#saveUrl").val("<c:url value='/system/cd/insert.json' />");
			$('#cdId').val("");
			$("#cdId").removeAttr('readOnly'); 
			$('#cdNm').val("");
			$('#cdDesc').val("");
			$('.cd-modal').modal("show");
		}else {
			
			$.ajax({
				url : "/system/cd/select.json",
				type : "POST",
				data : { "cdClsId" : $("#cdClsSelectId").val(), "cdId" : $("#cdSelect").val() },
				dataType : "json" ,
				success : function(res) {
					if ("success" == res.result) {
						$("#cdForm #saveUrl").val("<c:url value='/system/cd/update.json' />");						
						$("#cdForm #cdId").attr('readOnly', true);
						$("#cdForm #cdId").val(res.data.cdId);
						$("#cdForm #cdNm").val(res.data.cdNm);
						$("#cdForm #cdDesc").val(res.data.cdDesc);
						$("#cdForm #cdUseSt").val(res.data.cdUseSt);						
						$('.cd-modal').modal("show");
					}else if("duplicate" == res.result){
						alert(res.message);
					}else {
						alert(res.message);
					}
				}
			});
		}		
	}

	function cdDtlModal(id, name, desc, order, useSt) { //코드 상세 모달 오픈
		if (isEmptyString ($("#cdSelect").val())) {
			alert("코드를 선택하여 주십시오");
			return
		}
		
		if (id == 0) {
			$("#saveUrlDetail").val("<c:url value='/system/cdDtl/insert.json' />");
			$("#mode").val("cdDtlInsert");
			$("#cdId1").val($("#cdSelect").val());
			$("#cdNm1").val($("#cdSelect option:selected").text());
			$("#cdDtlId").removeAttr('readOnly');
			$('#cdDtlId').val("");
			$('#cdDtlNm').val("");
			$('#cdDtlDesc').val("");
			$('#cdDtlOrd').val("");
		} else {
			$("#saveUrlDetail").val("<c:url value='/system/cdDtl/update.json' />");
			$("#cdId1").val($("#cdSelect").val());
			$("#cdNm1").val($("#cdSelect option:selected").text());
			$("#cdDtlId").attr('readOnly', true);
			$("#cdDtlId").val(id); 
			$("#cdDtlNm").val(name);
			$("#cdDtlDesc").val(desc);
			$("#cdDtlOrd").val(order);
			$("#cdDtlUseSt").val(useSt);
		}
		$('.cdDtl-modal').modal("show");
	}
	
	function cdClsInsert(){//코드 분류 등록 및 수정
		if (checkForm ("cdClsForm") && confirm ("저장하시겠습니까?")) {
			$.ajax({
				url : $("#saveUrlClass").val() ,
				type : "POST" ,
				data : $("#cdClsForm").serialize(),
				dataType : "json" ,
				success : function(res) {
					if ("success" == res.result) {
						alert("저장되었습니다.");
						$('.cdCls-modal').modal("hide");
						cdClsList();
					}else if("duplicate" == res.result){
						alert(res.message);
					}else {
						alert(res.message);
					}
				}
			});
		}
	}
	
	function cdInsert(){//코드 등록
		if (checkForm ("cdForm") && confirm ("저장하시겠습니까?")) {
			$.ajax({
				url : $("#saveUrl").val(),
				type : "POST" ,
				data : $("#cdForm").serialize(),
				dataType : "json" ,
				success : function(res) {
					if ("success" == res.result) {						
						var option = $("<option value='"+$('#cdId').val()+"'>" +$('#cdNm').val()+" ["+ $('#cdId').val() +"]"+ "</option>");
		                $('#cdSelect').append(option);
		                $('#cdSelect').val($('#cdId').val());
		                $('#cdSelect').change();
		                
						alert("저장되었습니다.");
						$('.cd-modal').modal("hide");
						
						//datatable.ajax.reload(); // 데이터 테이블 리로드
					}else if("duplicate" == res.result){
						alert(res.message);
					}else {
						alert(res.message);
					}
				}
			});
		}
	}
	
	function cdDtlInsert(){//코드상세 등록
		if (checkForm ("cdDtlForm") && confirm ("저장하시겠습니까?")) {	
			$.ajax({
				url : $("#saveUrlDetail").val(),
				type : "POST" ,
				data : $("#cdDtlForm").serialize(),
				dataType : "json" ,
				success : function(res) {
					if ("success" == res.result) {
						alert("저장되었습니다.");
						$('.cdDtl-modal').modal("hide");
						datatableDetail.ajax.reload(); // 데이터 테이블 리로드
					}else if("duplicate" == res.result){
						alert(res.message);
					}else {
						alert(res.message);
					}
				}
			});
		}
	}
	
	function cdClsList(useSt){//코드 분류 리스트 전송
		$.ajax({
			url : "<c:url value='/system/cdCls/list.json' />",
			type : "POST" ,
			data : {"useSt" : useSt} ,
			dataType : "json" ,
			success : function(res) {
				var list = res.result;
				$("#cdClsSelect").find('option').each(function(){
					$(this).remove();	
				});
				$("#cdClsSelect").append("<option value=''>코드 분류를 선택하십시오</option>");
				for(var i=0; i<list.length; i++){
					$("#cdClsSelect").append("<option value="+list[i].cdClsId+">"+list[i].cdClsNm+"</option>");
				}
				datatable.ajax.reload();
				$("#cdSelectId").val('');
				datatableDetail.ajax.reload();
			}
		});
	}
	
	function cdDelte(cdId ,cdClsId){
		if (confirm ("삭제 하시겠습니까?")) {
			$.ajax({
				url : "<c:url value='/system/cd/delete.json' />",
				type : "POST" ,
				data : {"cdId" : cdId, "cdClsId":cdClsId} ,
				dataType : "json" ,
				success : function(res) {
					if(res.result == "cntFail"){
						alert("하위코드가 있습니다.");
					}else if(res.result = "success"){
						alert("삭제 되었습니다.");
						datatable.ajax.reload();	
					}
				}
			});
		}
	}
	
	function cdClsDelte(cdClsId){
		if (confirm ("삭제 하시겠습니까?")) {
			$.ajax({
				url : "<c:url value='/system/cdCls/delete.json' />",
				type : "POST" ,
				data : {"cdClsId" : cdClsId} ,
				dataType : "json" ,
				success : function(res) {
					if(res.result == "cntFail"){
						alert("하위코드가 있습니다.");
					}else if(res.result = "success"){
						alert("삭제 되었습니다.");
						datatableDetail.ajax.reload();	
					}
				}
			});
		}
	}
	
	function cdDtlDelte(cdDtlId , cdId){
		if (confirm ("삭제 하시겠습니까?")) {
			$.ajax({
				url : "<c:url value='/system/cdDtl/delete.json' />",
				type : "POST" ,
				data : {"cdDtlId" : cdDtlId,"cdId" : cdId} ,
				dataType : "json" ,
				success : function(res) {
					alert("삭제 되었습니다.");
					datatableDetail.ajax.reload();
				}
			});
		}
	}
</script>