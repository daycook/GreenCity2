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
						<h3 class="box-title"><i class='material-icons' style='font-size:16px;'>play_arrow</i>&nbsp;&nbsp;등록</h3>
					</div>
					<div class="box-body">
						<table class="table table-bordered">
							<tr>
								<th>콘텐츠명 <span class="required">*</span></th>
								<td><input type="text" id="contNm" class="form-control col-md-7 col-xs-12" placeholder="콘텐츠명을 입력"></td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="row">
										<div class="col-xs-6">
											<ul class="nav nav-tabs">
												<c:forEach var="lang" items="${basicList}">
													<li class="active"><a data-toggle="tab" href="#${lang.langId}">${lang.langTpCd.cdDtlNm}(${lang.dispNm})</a></li>
												</c:forEach>
											</ul>
											<div class="tab-content">
												<c:forEach var="lang" items="${basicList}">
													<div id="${lang.langId}" class="tab-pane fade in active">
														<div class="box box-info">
															<div class="box-body">
																<table class="table table-bordered">
																	<tr>
																		<th>콘텐츠 항목명</th>
																		<td>
																			<input type="text" id="ContItemNm${lang.langId}" class="form-control col-md-7 col-xs-12" placeholder="${lang.langTpCd.cdDtlNm} 콘텐츠 항목명을 입력">																
																		</td>
																	</tr>
																	<tr>
																		<td colspan="2">
																			<textarea id="ContItemCont${lang.langId}"></textarea>
																			<script>CKEDITOR.replace('ContItemCont${lang.langId}');</script>																
																		</td>
																	</tr>
																</table>
															</div>
															<div class="box-footer">
																<div class="btn-group pull-right">
																	<button type="button" class="btn btn-outline-primary" onclick="insert('${lang.langId}')">등록</button>
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
													<c:choose>
														<c:when test="${status.count == 1}">
															<div id="${lang.langId}" class="tab-pane fade in active">
																<div class="box box-info">
																	<div class="box-body">
																		<table class="table table-bordered">
																			<tr>
																				<th>콘텐츠 항목명</th>
																				<td>
																					<input type="text" id="ContItemNm${lang.langId}" class="form-control col-md-7 col-xs-12" placeholder="${lang.langTpCd.cdDtlNm} 콘텐츠 항목명을 입력">																
																				</td>
																			</tr>
																			<tr>
																				<td colspan="2">
																					<textarea id="ContItemCont${lang.langId}"></textarea>
																					<script>CKEDITOR.replace('ContItemCont${lang.langId}');</script>																
																				</td>
																			</tr>
																		</table>
																	</div>
																	<div class="box-footer">
																		<div class="btn-group pull-right">
																			<button type="button" class="btn btn-outline-primary" onclick="insert('${lang.langId}')">등록</button>
																		</div>
																	</div>
																</div>
															</div>		
														</c:when>
														<c:otherwise>
															<div id="${lang.langId}" class="tab-pane fade">
																<div class="box box-info">
																	<div class="box-body">
																		<table class="table table-bordered">
																			<tr>
																				<th>콘텐츠 항목명</th>
																				<td>
																					<input type="text" id="ContItemNm${lang.langId}" class="form-control col-md-7 col-xs-12" placeholder="${lang.langTpCd.cdDtlNm} 콘텐츠 항목명을 입력">																
																				</td>
																			</tr>
																			<tr>
																				<td colspan="2">
																					<textarea id="ContItemCont${lang.langId}" ></textarea>
																					<script>CKEDITOR.replace('ContItemCont${lang.langId}');</script>																
																				</td>
																			</tr>
																		</table>
																	</div>
																	<div class="box-footer">
																		<div class="btn-group pull-right">
																			<button type="button" class="btn btn-success" onclick="insert('${lang.langId}')">등록</button>
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
							<button type="button" class="btn btn-outline-primary" onclick="insert()">전체 등록</button>
							<button type="button" class="btn btn-outline-primary" onclick="preList()">목록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</form>
<script type='text/javascript'></script>

<script>
window.parent.CKEDITOR.tools.callFunction('콜백의 식별 ID 값', '/file/image.mng?itemId="+fileItem.itemId+"&thumnail=true&"+new Date().getTime()+"', '전송완료 메시지')
	$(document).ready(function() {
		
	});
	
	var selectEditor;
	function setImage(hash) {
		var editor = eval("CKEDITOR.instances."+selectEditor.name);
		var cont = editor.getData();
		cont += "<img src='/public/media/image.json?hash="+hash+"' class='img-rounded img-responsive'>";
		editor.setData(cont);
	}
	
	function insert(langId) {
		<c:forEach var="lang" items="${langList}">
			var cont = eval("CKEDITOR.instances.ContItemCont${lang.langId}.getData()");
			$("#ContItemCont${lang.langId}").val(cont);
		</c:forEach>
		if($.trim($("#contNm").val()) == '') {
			alert("콘텐츠명을 입력 해 주세요.");
			$("#contNm").focus();
		}else {
			var contItemNmList = new Array();
			var contItemContList = new Array();
			var langIdList = new Array();
			if(langId != null) {
				var contItemNm = $("#ContItemNm"+langId).val();
				contItemNmList.push(contItemNm);
				var contItemCont = $("#ContItemCont"+langId).val();
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
			if(confirm("등록하시겠습니까?")) {
				$.ajax({
					url : "<c:url value='/system/cont/insert.mng' />",
					type : "POST",
					data : {"langIdList" : langIdList, "contItemNmList" : contItemNmList, "contItemContList" : contItemContList, "contNm" : $("#contNm").val()},
					dataType : "json",
					success : function(res) {
						if ("success" == res.result) {
							alert("등록되었습니다.");
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
</script>