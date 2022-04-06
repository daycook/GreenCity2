<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf"%>

<section class="content-header">
	<tg:menuInfoTag />
</section>

<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="col-xs-6">
				<div class="col-xs-12">
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title"><i class='material-icons' style='font-size:16px;'>play_arrow</i>&nbsp;&nbsp;일정</h3>
						</div>
						<div class="box-body" >
							<div id='calendar' class="table table-bordered table-striped" style="width:100%; table-layout:fixed;"></div>
						</div>
						<div class="box-footer">
						</div>
					</div>
				</div>	
			</div>
			<div class="col-xs-6">
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
							<div class="col-xs-12">					
								<div class="input-group">
									<span class="input-group-addon">사이트 구분</span>	
		                            <select id="searchSiteId" name="searchSiteId" class="form-control selectpicker">
										<c:forEach var="site" items="${siteList}">
											<option value="${site.siteId}" <c:if test="${site.siteId eq 1}">selected</c:if>>${site.siteNm} (${site.domain})</option>
										</c:forEach>
									</select>
	                            </div>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">					
								<div class="input-group">
									<span class="input-group-addon">일정&nbsp;&nbsp;구분&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>	
		                            <tg:cdDtl type="select" cd="plan" name="planCtg" styleClass="form-control selectpicker" headerText="전체" id="planCtg" labelYn="N"/>
	                            </div>
							</div>
						</div>
					</div>
					<!-- 
					<div class="box-footer">
						<div class="btn-group pull-right">
							<button type="button" class="btn btn-search" id="searchBtn"><i class="fa fa-search"></i> 검색</button>
						</div>
					</div>
					 -->
				</div>
				<div class="box box-primary" >
					<div class="box-body">
						<table id="datatable" class="table table-bordered table-striped" style="width:100%; table-layout:fixed;"></table>
					</div>
					<div class="box-footer">
						<button type="button" class="btn btn-outline-primary pull-right" onclick="showInsertModal()">등록</button>
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
				<h2>일정관리</h2>
			</div>
			<div class="modal-body">
				<form id="funcForm" name="funcForm" class="form-horizontal form-label-left">
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">사이트<span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<select id="siteId" name="siteId" class="form-control">
								<c:forEach var="site" items="${siteList}">
									<option value="${site.siteId}" >${site.siteNm} (${site.domain})</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<input type="hidden" name="planId" id="planId" class="form-control">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">일정명<span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" name="planTitle" id="planTitle" class="form-control plan" maxlength="25" data-name="일정명이" placeholder="일정명을 입력">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">분류</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<tg:cdDtl type="radio" cd="plan" name="planCtg" labelYn="Y"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">내용</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<textarea class="form-control col-md-7 col-xs-12  plan" rows="5" name="planCont" id="planCont" maxlength="2000" data-name="일정 내용이" placeholder="일정내용을 입력"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">일정기간</label>
						<div class="input-group col-md-6 col-sm-6 col-xs-12">
							<input type="text" class="form-control datepicker  plan" name="startDt" id="startPlanDt" placeholder="시작일 선택" data-name="시작일이">
							<span class="input-group-addon"> ~ </span>
							<input type="text" class="form-control datepicker  plan" name="endDt" id="endPlanDt" placeholder="종료일 선택" data-name="종료일이">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">표시여부</label>
						<div class="input-group col-md-6 col-sm-6 col-xs-12">
							<input type="radio"  name="dispYn"  value="Y">표시
							<input type="radio"  name="dispYn"  value="N">미표시
						</div>
					</div>
				</form>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-primary" id="planInsert" onclick="planInsert()">등록</button>
				<button type="button" class="btn btn-outline-primary" id="planUpdate" onclick="planUpdate()">수정</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<script>
	var datatable;
	$(document).ready(function() {
		
		renderCalendar();
		
		datatable = $("#datatable").DataTable({
			"searching" : false
			,"paging": true
			,"bPaginate": true
			,"responsive": true
			,"language": lang_kor
			,"ajax" : {
				"url" : "<c:url value='/system/plan/list.json' />"
				,"method" : "post"
				,"data" : function(d) {
					if ($('#planCtg').val() != "") {d.planCtg = $('#planCtg').val();	}
					if ($('#searchSiteId').val() != "") {d.siteId = $('#searchSiteId').val();	}
				}
			},"processing": true
			,"serverSide": true
			,"order" : [[2, 'desc']]
			,"columns": [
				{ "name" : "PLAN_TITLE", "title" : "일정명", "data" : "planTitle", "className" : "dt-head-center dt-body-left"},
				{ "name" : "PLAN_CTG", "title" : "분류", "data" : "planCtg", "className" : "dt-head-center dt-body-left"},
				{ "name" : "START_DT", "title" : "시작일", "render" : 
					function (data, type, row) {
						return new Date(row["startDt"]).format("yyyy-MM-dd");  
					}, "className" : "dt-head-center dt-body-center"},
				{ "name" : "END_DT", "title" : "종료일", "render" : 
					function (data, type, row) {
						return new Date(row["endDt"]).format("yyyy-MM-dd");  
					}, "className" : "dt-head-center dt-body-center"},
				{ "name" : "DISP_YN", "data" : "dispYn", "render" : 
				 	 function (data, type, row) {
						var html = "";
						if (row["dispYn"] == "Y"){
							html += "표시";
						}
						if (row["dispYn"] == "N"){
							html += "미표시";
						}
						return html;
					},"className": "dt-head-center dt-body-center", "title":"표시여부"
				},
				{ "render" : 
					function (data, type, row) {
						var html = "";
						html += "<button type='button' class='btn btn-xs btn-info' data-toggle='tooltip' title='수정' onclick='showUpdateModal(\""+row["planId"]+"\")'><i class='fa fa-pencil-square-o'></i></button>&nbsp;";
						html += "<button type='button' class='btn btn-xs btn-danger' data-toggle='tooltip' title='삭제' onclick='planDelete(\""+row["planId"]+"\")'><i class='fa fa-trash'></i></button>&nbsp;";
						return html;  
					},
				   "className": "dt-head-center dt-body-center", "orderable" : false, "title":"기능"
				}
			]
		});
		
		$("#searchBtn").click(function() {
			datatable.ajax.reload();
			$('#calendar').fullCalendar('refetchEvents' );
		});
		
		$("#planCtg").change(function() {
			datatable.ajax.reload();
			$('#calendar').fullCalendar('refetchEvents' );
		});
		$("#searchSiteId").change(function() {
			datatable.ajax.reload();
			$('#calendar').fullCalendar('refetchEvents' );
		});
		
		$("#resetBtn").click(function() {
			$('#startDtThanOrEquals').val("");
			$('#endDtLessOrEquals').val("");
			$('.selectpicker').selectpicker('deselectAll');
			datatable.ajax.reload();
			$('#calendar').fullCalendar('refetchEvents' );
		});
	});
	
	var currentLangCode = 'ko';

	function renderCalendar() {
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month'
			},
			timezone: 'local',
			lang: 'ko',
			buttonIcons: false,
			editable: true,
			selectable: true,
			selectHelper: true,
			droppable: false,
			disableDragging: true,
			events: function(start,end,timezone,callback) {
				var data = {planCtg : $("#planCtg").val(),
							siteId : $("#searchSiteId").val(),
							start:0,
							length:999999,
							dispYn : "Y"
							};
				$.ajax({
		            url: "<c:url value='/system/plan/list.json'/>",
		            type : "POST",
		            data : data,
		            dataType: 'json',
		            success: function(res) {
		            	var events = [];
						$.each(res.data, function(p){
							var e = {
									planId: res.data[p].planId,
									siteId: res.data[p].siteId,
									title: res.data[p].planTitle,
									start: moment(res.data[p].startDt).format('YYYY-MM-DD'),
									end: moment(res.data[p].endDt).format('YYYY-MM-DD 23:00:00'),
									planCtg: res.data[p].planCtg,
									planCont: res.data[p].planCont,
									dispYn: res.data[p].dispYn,
									backgroundColor : $(".label-"+res.data[p].planCtgLabel+"").css("background-color")
							};
							events.push(e);
						});
						callback(events); 
		            }
		        });
			},
			select: function(start, end, e) {
				newEvent(start, end);
			},
			eventRender: function(events, el, calEvent) {
				$(el).data('event', events);
				$(el).click(function(){
					editEvent($(this).data('event'));
				});
	        },
	        eventAfterRender: function (events, element) {
	        	var t = events.title;
	        	$(element).tooltip({title:t, container: "body"});
	    	},
	        eventDrop: function(event, delta, revertFunc) {
				var data = {"planId":event.planId, 
							"siteId":event.siteId,
							"planTitle":event.title,
							"planCont" :event.planCont,
							"startDt":event.start.format(),
							"endDt":event.end.format(),
							"planCtg":event.planCtg,
							"dispYn":event.dispYn
							};
				$.ajax({
		            url: "<c:url value='/system/plan/update.json'/>",
		            type : "POST",
		            data : data,
		            dataType: 'json',
		            success: function(res) {
		            	if("success" == res.result){
							alert("수정 되었습니다.");
							datatable.ajax.reload();
				        }else{
							alert(res.message);
						}
					}
		        });
			}
		});
	}

	function showInsertModal() {
		
		var form = document.funcForm;
		form.planId.value = "";
		
		for(var i = 0; i < form.planCtg.length; i++) {
			form.planCtg[0].checked = true;
		}
		
		form.planTitle.value = "";
		form.planCont.value = "";
		form.startDt.value = "";
		form.endDt.value = "";
		
		for(var i = 0; i < form.dispYn.length; i++) {
			form.dispYn[0].checked = true;
		}
		
		$("#planUpdate").hide();
		$("#planInsert").show();
		$('.func-modal').modal("show");
	}	
	
	function planInsert(){
		if(FormCheck () && confirm("등록하시겠습니까?")) {
			$.ajax({
				url : "<c:url value='/system/plan/insert.json' />",
				type : "POST",
				data : $("#funcForm").serialize(),
				dataType : "json",
				success : function(res){
					if("success" == res.result){
						alert("등록 되었습니다.");
						$('#calendar').fullCalendar('refetchEvents' );
						datatable.ajax.reload();
						$('.func-modal').modal("hide");
					}else{
						alert(res.message);
					}
				}
			});
		}	
	}
	
	function planUpdate(){
		if(FormCheck () && confirm("수정하시겠습니까?")) {
			$.ajax({
				url : "<c:url value='/system/plan/update.json' />",
				type : "POST",
				data : $("#funcForm").serialize(),
				dataType : "json",
				success : function(res){
					if("success" == res.result){
						alert("수정 되었습니다.");
						$('#calendar').fullCalendar('refetchEvents' );
						datatable.ajax.reload();
						$('.func-modal').modal("hide");
			        }else{
						alert(res.message);
					}
				}
			});
		}	
	}
	
	function planDelete(planId){
		if(confirm("삭제하시겠습니까?")) {
			$.ajax({
				url : "<c:url value='/system/plan/delete.json' />",
				type : "POST",
				data : {"planId" : planId},
				dataType : "json",
				success : function(res){
					if("success" == res.result){
						alert("삭제 되었습니다.");
						$('#calendar').fullCalendar('refetchEvents' );
						datatable.ajax.reload();
					}else{
						alert(res.message);
					}
				}
			});
		}	
	}
	
	function showUpdateModal(planId) {
		$.ajax({
			url : "<c:url value='/system/plan/view.json' />",
			type : "POST",
			data : {"planId" : planId},
			dataType : "json",
			success : function(res) {
				if ("success" == res.result) {
					var data = res.data;
					var form = document.funcForm;			
					form.planId.value = data.planId;
					for(var i = 0; i < form.planCtg.length; i++) {
						if(form.planCtg[i].value == data.planCtg) {
							form.planCtg[i].checked = true;
						}
					}
					form.planTitle.value = data.planTitle;
					for(var i = 0; i < form.siteId.length; i++) {
						if(form.siteId[i].value == data.siteId) {
							form.siteId[i].selected = true;
 							break;
						}
					} 
					if(data.planCont == null || data.planCont == ""){
						form.planCont.value = "";	
					}else{
						form.planCont.value = data.planCont;	
					}
					form.startDt.value = new Date(data.startDt).format("yyyy-MM-dd");
					form.endDt.value = new Date(data.endDt).format("yyyy-MM-dd");
					for(var i = 0; i < form.dispYn.length; i++) {
						if(form.dispYn[i].value == data.dispYn) {
							form.dispYn[i].checked = true;
						}
					}
					
					$("#planUpdate").show();
					$("#planInsert").hide();
					$('.func-modal').modal("show");
				}else {
					alert(res.message);
				}
			}
		});
	}
	
	/**     fullCalendar editEvent      */
	function editEvent(event) {
		
		resetForm();
		var form = document.funcForm;	
		
		form.planId.value = event.planId;
		for(var i = 0; i < form.planCtg.length; i++) {
			if(form.planCtg[i].value == event.planCtg) {
				form.planCtg[i].checked = true;
			}
		}
		for(var i = 0; i < form.siteId.length; i++) {
			if(form.siteId[i].value == event.siteId) {
				form.siteId[i].selected = true;
					break;
			}
		} 
		form.planTitle.value = event.title;
		form.planCont.value = event.planCont;
		form.startDt.value = new Date(event.start).format("yyyy-MM-dd");
		form.endDt.value = new Date(event.end).format("yyyy-MM-dd");
		
		for(var i = 0; i < form.dispYn.length; i++) {
			if(form.dispYn[i].value == event.dispYn) {
				form.dispYn[i].checked = true;
			}
		}
		
		$("#planUpdate").show();
		$("#planInsert").hide();
		$('.func-modal').modal("show");
	}
	
	function resetForm(){
		
		var form = document.funcForm;	
		form.planId.value =  "";
		form.planTitle.value = "";
		
		$("input[name=planCtg]:radio").each(function() {
			$(this).attr("checked", false);
		});
		
		form.planCont.value = "";
		form.startDt.value = "";
		form.endDt.value = "";
		
		$("input[name=dispYn]:radio").each(function() {
			$(this).attr("checked", false);
		});
	}
	 
	function newEvent(start, end) {
		
		resetForm();
		
		var form = document.funcForm;			
		form.planId.value =  "";
		form.planTitle.value = "";
		
		$("input[name=planCtg]:radio").each(function() {
			$(this).attr("checked", false);
		});
		
		form.planCont.value = "";
		form.startDt.value = "";
		form.endDt.value = "";
		
		$("input[name=dispYn]:radio").each(function() {
			$(this).attr("checked", false);
		});
		
		$("#planTitle").select();
		$("#planUpdate").hide();
		$("#planDelete").hide();
		$("#planInsert").show();
	}
	
	function cdInsert(){
		location.href = "<c:url value='/system/cd/mng.mng'/>";
	}
	
	function FormCheck(){
		var result = true;
		$("#funcForm").find(".plan").each(function(){
			if(isEmptyString ($(this).val())){ //정규식 체크하기
				alert($(this).data("name")+" 비었습니다!");
				result = false;
				$(this).focus();
				return false;
			}
		});
		//일정체크
		if($('#startPlanDt').val() > $('#endPlanDt').val() && result){
			alert("시작일은 종료일보다 클 수 없습니다.");
			result = false;
			$('#startPlanDt').focus();
			return false;
		}
		return result;
	}
	
</script>