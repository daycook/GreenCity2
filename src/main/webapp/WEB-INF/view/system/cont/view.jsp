<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf"%>

<section class="content-header">
	<tg:menuInfoTag />
</section>

<form id="insertForm" name="insertForm">
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title"><i class='material-icons' style='font-size:16px;'>play_arrow</i>&nbsp;&nbsp;수정</h3>
						<div class="box-tools pull-right">
							즐겨찾기<input type="checkbox" id="bookmarkYn" data-toggle="toggle"  data-on="사용" data-off=" ">
						</div>
					</div>
					<div class="box-body">
						<table class="table table-bordered table-striped" style="width:100%; table-layout:fixed;">
							<tr>
								<th><span class="required">콘텐츠명*</span></th>
								<td><input type="text" id="contNm" value="${cont.contNm}" class="form-control col-md-7 col-xs-12"></td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="row">
										<div class="col-xs-12">
											<ul class="nav nav-tabs">
												<c:forEach var="lang" items="${basicList}">
													<li class="active"><a data-toggle="tab" href="#${lang.langId}">${lang.langTpCd.cdDtlNm}(${lang.dispNm})</a></li>
												</c:forEach>
											</ul>
											<div class="tab-content">
												<c:forEach var="lang" items="${basicList}">
													<c:set value="${emptyContItem}" var="contItem"/>
													<c:forEach var="result" items="${contItemList}">
														<c:if test="${result.langId eq lang.langId}">
															<c:set value="${result}" var="contItem"/>		
														</c:if>
													</c:forEach>	
													<div id="${lang.langId}" class="tab-pane fade in active">
														<div class="box box-info">
															<div class="box-body">
																<table class="table table-bordered" style="width:100%; table-layout:fixed;">
																	<tr>
																		<th>콘텐츠 항목명</th>
																		<td>
																			<input type="text" id="ContItemNm${lang.langId}" class="form-control col-md-7 col-xs-12" value="${contItem.contItemNm}">																
																		</td>
																	</tr>
																	<tr>
																		<td colspan="2">
																			<textarea id="ContItemCont${lang.langId}">${contItem.cont}</textarea>
																			<script>CKEDITOR.replace('ContItemCont${lang.langId}');</script>																
																		</td>
																	</tr>
																</table>
															</div>
															<div class="box-footer">
																<button type="button" class="btn btn-outline-primary" onclick="showHistoryModal('${contItem.contId}','${contItem.langId}')"><i class="fa fa-list-ol"></i> 변경내역</button>
																<div class="btn-group pull-right">
																	<button type="button" class="btn btn-outline-primary" onclick="update('${lang.langId}')">수정</button>
																</div>
															</div>
														</div>
													</div>
												</c:forEach>
											</div>
										</div>
										<div class="col-xs-6">
											<ul class="nav nav-tabs">
												<c:forEach var="lang" items="${etcList}" varStatus="status">
													<li <c:if test="${status.count == 1}">class="active"</c:if>><a data-toggle="tab" href="#${lang.langId}">${lang.langTpCd.cdDtlNm}(${lang.dispNm})</a></li>
												</c:forEach>
											</ul>
											<div class="tab-content">
												<c:forEach var="lang" items="${etcList}" varStatus="status">
													<c:set value="${emptyContItem}" var="contItem"/>
													<c:forEach var="result" items="${contItemList}">
														<c:if test="${result.langId eq lang.langId}">
															<c:set value="${result}" var="contItem"/>		
														</c:if>
													</c:forEach>
													<c:choose>
														<c:when test="${status.count == 1}">
															<div id="${lang.langId}" class="tab-pane fade in active">
																<div class="box box-info">
																	<div class="box-body">
																		<table class="table table-bordered" style="width:100%; table-layout:fixed;">
																			<tr>
																				<th>콘텐츠 항목명</th>
																				<td>
																					<input type="text" id="ContItemNm${lang.langId}" class="form-control col-md-7 col-xs-12" value="${contItem.contItemNm}">																
																				</td>
																			</tr>
																			<tr>
																				<td colspan="2">
																					<textarea id="ContItemCont${lang.langId}">${contItem.cont}</textarea>
																					<script>CKEDITOR.replace('ContItemCont${lang.langId}');</script>																
																				</td>
																			</tr>
																		</table>
																	</div>
																	<div class="box-footer">
																		<button type="button" class="btn btn-outline-primary" onclick="showHistoryModal('${contItem.contId}','${contItem.langId}')"><i class="fa fa-list-ol"></i> 변경내역</button>
																		<div class="btn-group pull-right">
																			<button type="button" class="btn btn-outline-primary" onclick="update('${lang.langId}')">수정</button>
																		</div>
																	</div>
																</div>
															</div>		
														</c:when>
														<c:otherwise>
															<div id="${lang.langId}" class="tab-pane fade">
																<div class="box box-info">
																	<div class="box-body">
																		<table class="table table-bordered" style="width:100%; table-layout:fixed;">
																			<tr>
																				<th>콘텐츠 항목명</th>
																				<td>
																					<input type="text" id="ContItemNm${lang.langId}" class="form-control col-md-7 col-xs-12" value="${contItem.contItemNm}">																
																				</td>
																			</tr>
																			<tr>
																				<td colspan="2">
																					<textarea id="ContItemCont${lang.langId}" >${contItem.cont}</textarea>
																					<script>CKEDITOR.replace('ContItemCont${lang.langId}');</script>																
																				</td>
																			</tr>
																		</table>
																	</div>
																	<div class="box-footer">
																		<button type="button" class="btn btn-success" onclick="showHistoryModal('${contItem.contId}','${contItem.langId}')"><i class="fa fa-list-ol"></i> 변경내역</button>
																		<div class="btn-group pull-right">
																			<button type="button" class="btn btn-success" onclick="update('${lang.langId}')">수정</button>
																		</div>
																	</div>
																</div>
															</div>
														</c:otherwise>
													</c:choose>	
												</c:forEach>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</table>
					</div>
					<div class="box-footer">
						<div class="btn-group pull-right">
							<button type="button" class="btn btn-outline-primary" onclick="update()">전체 수정</button>
							<button type="button" class="btn btn-outline-primary" onclick="preList()">목록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</form>
<!-- 
<div class="modal fade history-modal" data-keyboard="false" data-backdrop="static" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
				</button>
				<h4>변경내역</h4>
			</div>
			<div class="modal-body no-padding">
				<div class="box box-primary">
					<div class="box-body">
						<table id="historyTable" class="table table-bordered table-striped no-margin">
							<thead>
								<tr>
									<th class="text-center">제목</th>
									<th class="text-center">수정일</th>
									<th class="text-center">수정자</th>
									<th class="text-center">기능</th>
								</tr>
							</thead>
							<tbody>								
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
-->

<div class="modal fade history-modal" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h2>변경이력</h2>
			</div>
			<div class="modal-body">
				<table id="historyTable" class="table table-bordered table-striped" style="width:99%; table-layout:fixed;"></table>
				<div id="editorContDiv" style="display: none;">
					<textarea id="editorCont" name="editorCont" class="form-control ckeditor" rows="5"></textarea>
				</div>
			</div>
		</div>
	</div>
</div>

<script>

	window.parent.CKEDITOR.tools.callFunction('콜백의 식별 ID 값', '/file/image.mng?itemId="+fileItem.itemId+"&thumnail=true&"+new Date().getTime()+"', '전송완료 메시지')
	$(document).ready(function() {
		
		//모달창이동
		$('.modal-content').draggable({
			handle: ".modal-header"
		});
		
		$("#bookmarkYn").change(function(){
			$.ajax({
				url : "<c:url value='/system/cont/updateBkmak.mng' />",
				type : "POST",
				data : {"contId": "${cont.contId}", "bookmarkYn" : $("input:checkbox[id='bookmarkYn']").is(":checked")},
				dataType : "json"
			});
		});
		
		<c:if test="${cont.bookmarkYn}">
			$("#bookmarkYn").bootstrapToggle('on');
		</c:if>
	});
	
	function update(langId) {

		<c:forEach var="lang" items="${langList}">
			var contents = eval("CKEDITOR.instances.ContItemCont${lang.langId}.getData()");
			$("#ContItemCont${lang.langId}").val(contents);
		</c:forEach>
		if($.trim($("#contNm").val()) == '') {
			alert("콘텐츠명을 입력 해 주세요.");
			$("#contNm").focus();
		}else {
			var contItemNmList = new Array();
			var contItemContList = new Array();
			var langIdList = new Array();
			if(langId != null) {
				var contItemNm = $("#ContItemNm"+langId+"").val();
				contItemNmList.push(contItemNm);
				var contItemCont = $("#ContItemCont"+langId+"").val();
				contItemContList.push(contItemCont);
				langIdList.push(langId);
			}else {
				<c:forEach var="lang" items="${langList}">
					var contItemNm = $("#ContItemNm${lang.langId}").val();
					contItemNmList.push(contItemNm);
					var contItemCont = $("#ContItemCont${lang.langId}").val();
					contItemContList.push(contItemCont);
					langIdList.push("${lang.langId}");
				</c:forEach>
			}
			if(confirm("수정하시겠습니까?")) {
				$.ajax({
					url : "<c:url value='/system/cont/update.mng' />",
					type : "POST",
					data : {"contId": "${cont.contId}", "contNm" : $("#contNm").val(), "langIdList" : langIdList, "contItemNmList" : contItemNmList, "contItemContList" : contItemContList},
					dataType : "json",
					success : function(res) {
						if ("success" == res.result) {
							alert("수정되었습니다.");
							location.href = "/system/cont/list.mng";
						}else {
							alert(res.message);
						}
					}
				});				
			}			
		}
	}
	
	function preList(){
		location.href = "/system/cont/list.mng";
	}
	
	/*
	function showHistoryModal(contId, langId) {
		$.ajax({
			url : "<c:url value='/system/contItemHist/list.json' />",
			type : "POST",
			data : {"contId": contId, "langId" : langId},
			dataType : "json",
			success : function(res) {
				if ("success" == res.result) {
					$("#historyTable > tbody").html("");
					var html = "";
					for(idx in res.data) {
						var contItemHist = res.data[idx];
						html += "<tr>";
						html += "<td>"+contItemHist.contItemNm+"</td>";
						html += "<td>"+contItemHist.User.userNm+"("+contItemHist.User.userLoginId+")"+"</td>";
						html += "<td class='text-center'>"+new Date(contItemHist.regDt).format("yyyy-MM-dd HH:mm:ss")+"</td>";
						html += "<td class='text-center'><button type='button' class='btn btn-xs btn-outline-primary' data-toggle='tooltip' title='내용보기' onclick='showViewModal()'><i class='fa fa-search'></i></td>";
						html += "</tr>";
					}
					$("#historyTable > tbody").html(html);
					$(".history-modal").modal("show");					
				}else {
					alert(res.message);
				}
			}
		});	
	}
	*/
	
	function showHistoryModal(contId, langId){
		$('#contId').val(contId);
		$('#langId').val(langId);
		
		datatable = $("#historyTable").DataTable({
			"searching" : false
			,"destroy" : true
			,"paging": true
			,"bPaginate": true
			,"responsive": true
			,"language": lang_kor
			,"ajax" : {
				"url" : "<c:url value='/system/contItemHist/list.json' />"
				,"method" : "post"
				,data : {"contId": contId, "langId" : langId}
			},"processing": true
			,"serverSide": true
			,"order" : [[3, 'desc']]
			,"columns": [
				{ "name" : "CONT_ITEM_HIST_ID", "title" : "콘텐츠 번호", "data" : "contItemHistId", "className" : "dt-head-center dt-body-center" , "render" : 
					function (data, type, row) {
						return row["contId"] + "-" + row["contItemHistId"];
					}
				},
				{ "name" : "CONT_ITEM_NM", "title" : "콘텐츠명", "data" : "contItemNm", "className" : "dt-head-center dt-body-left"},
				{ "name" : "CONT_REG_NM", "title" : "등록자", "data" : "contRegNm", "className" : "dt-head-center dt-body-left", "render" : 
					function (data, type, row) {
						return row["contRegNm"] +"(" + row["contRegId"] + ")";
					}
				},
				{ "name" : "REG_DT", "title" : "등록일", "data" : "regDt", "className" : "dt-head-center dt-body-center", "render" :
					function (data, type, row) {
						return new Date(row["regDt"]).format("yyyy-MM-dd HH:mm:ss");
					}
				},
				{ "render" : 
					function (data, type, row) {
						var html = "";
						html += "<td class='text-center'><button type='button' class='btn btn-xs btn-outline-primary' data-toggle='tooltip' title='내용보기' onclick='showViewModal(\""+escape(row["cont"])+"\")'><i class='fa fa-search'></i></td>";
						html += "<td class='text-center'><button type='button' class='btn btn-xs btn-list' data-toggle='tooltip' title='적용' onclick='applyCont(\""+escape(row["cont"])+"\",\""+row["langId"]+"\")'><i class='fa fa-list'></i></td>";
						return html;
					},
					"title":"기능", "className": "dt-head-center dt-body-center", "orderable" : false, 
				}
			],"fnRowCallback": function(nRow, aData, iDisplayIndex) {
			}	
		});
		$('div.history-modal').modal("show");
		$("div #editorContDiv").css("display", "none");
	}
	
	function showViewModal(cont){
		
		$("div #editorContDiv").css("display", "block");
		var cont = unescape(cont);
		CKEDITOR.instances.editorCont.setData(cont);
	}
	
	function applyCont(cont, langId){
		
		var cont = unescape(cont);
		eval("CKEDITOR.instances.ContItemCont" + langId).setData(cont);
	}
	
	var selectEditor;
	function setImage(hash) {
		var editor = eval("CKEDITOR.instances."+selectEditor.name);
		var cont = editor.getData();
		cont += "<img src='/public/media/image.json?hash="+hash+"' class='img-rounded img-responsive'>";
		editor.setData(cont);
	}
</script>