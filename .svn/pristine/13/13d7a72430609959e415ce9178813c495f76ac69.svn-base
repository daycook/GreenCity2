<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf"%>

<section class="content-header">
	<tg:menuInfoTag />
</section>

<form id="updateForm" name="updateForm">
	<input type="hidden" name="bodId" value="${bod.bodId}" />
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title"><i class='material-icons' style='font-size:16px;'>play_arrow</i>&nbsp;&nbsp;수정</h3>
					</div>
					<div class="box-body">
						<table class="table table-bordered">
							<tr>
								<th>게시판명 <span class="required">*</span></th>
								<td colspan="3"><input type="text" name="bodNm" value="${bod.bodNm}" class="form-control col-md-7 col-xs-12" /></td>
							</tr>
							<tr style="display: none;">
								<th>게시판 형태 <span class="required">*</span></th>
								<td colspan="3">
									<tg:cdDtl type="radio" cd="board" name="bodTp" id="bodTp" labelYn="Y" event="onchange=\"changeBodType()\"" value="${bod.bodTp}"/>
								</td>
							</tr>
							<tr>
								<th>쓰기그룹</th>
								<td colspan="3">
									<c:forEach var="result" items="${roleList}">
										<c:set value="false" var="checkYn" />
										<c:forEach var="role" items="${bod.writeRoleList}">
											<c:if test="${role eq result.roleAuth}">
												<c:set value="true" var="checkYn" />												
											</c:if>
										</c:forEach>
										<label class="mr10">
											<input type="checkbox" name="writeRole" <c:if test="${checkYn}">checked</c:if> value="${result.roleAuth}"/>&nbsp;${result.roleNm}
										</label>
									</c:forEach>
								</td>
							</tr>
							<tr class="normal">
								<th>공지관리 그룹</th>
								<td colspan="3">
									<c:forEach var="result" items="${roleList}">
										<c:set value="false" var="checkYn" />
										<c:forEach var="role" items="${bod.notiRoleList}">
											<c:if test="${role eq result.roleAuth}">
												<c:set value="true" var="checkYn" />												
											</c:if>
										</c:forEach>
										<label class="mr10">
											<input type="checkbox" name="notiRole" <c:if test="${checkYn}">checked</c:if> value="${result.roleAuth}"/>&nbsp;${result.roleNm}
										</label>
									</c:forEach>
									<br/>
									<small>* 권한이 있는 경우에만 공지글 등록이 가능합니다.</small>
								</td>
							</tr>
							<tr>
								<th>뎃글 기능</th>
								<td colspan="3">
									<input type="checkbox" id="cmntYn" name="cmntYn" <c:if test="${bod.cmntYn}">checked</c:if> data-toggle="toggle"  data-on="사용" data-off=" ">
								</td>
							</tr>
							<tr>
								<th>비밀글 기능</th>
								<td colspan="3">
									<input type="checkbox" id="scrtYn" name="scrtYn" <c:if test="${bod.scrtYn}">checked</c:if> data-toggle="toggle"  data-on="사용" data-off=" ">
								</td>
							</tr>
							<tr>
								<th>비밀글관리 그룹</th>
								<td colspan="3">
									<c:forEach var="result" items="${roleList}">
										<c:set value="false" var="checkYn" />
										<c:forEach var="role" items="${bod.scrtRoleList}">
											<c:if test="${role eq result.roleAuth}">
												<c:set value="true" var="checkYn" />												
											</c:if>
										</c:forEach>
										<label class="mr10">
											<input type="checkbox" name="scrtRole" <c:if test="${checkYn}">checked</c:if> value="${result.roleAuth}"/>&nbsp;${result.roleNm}
										</label>
									</c:forEach>
									<br/>
									<small>* 권한이 있는 경우에 비밀글 조회가 가능합니다.</small>
								</td>
							</tr>
							<tr class="normal">
								<th>답변 기능</th>
								<td colspan="3">
									<input type="checkbox" id="answYn" name="answYn" <c:if test="${bod.answYn}">checked</c:if> data-toggle="toggle"  data-on="사용" data-off=" ">
								</td>
							</tr>
							<tr class="normal">
								<th>답변관리 그룹</th>
								<td colspan="3">
									<c:forEach var="result" items="${roleList}">
										<c:set value="false" var="checkYn" />
										<c:forEach var="role" items="${bod.answRoleList}">
											<c:if test="${role eq result.roleAuth}">
												<c:set value="true" var="checkYn" />												
											</c:if>
										</c:forEach>
										<label class="mr10">
											<input type="checkbox" name="answRole" <c:if test="${checkYn}">checked</c:if> value="${result.roleAuth}"/>&nbsp;${result.roleNm}
										</label>
									</c:forEach>
									<br/>
									<small>* 체크하지 않을 시 누구나 답변이 가능합니다.</small>
								</td>
							</tr>
							<tr>
								<th>머리글</th>
								<td colspan="3">
									<textarea class="form-control ckeditor" rows="3" id="bodHeader" name="bodHeader">${bod.bodHeader}</textarea>
								</td>
							</tr>
							<tr>
								<th>바닥글</th>
								<td colspan="3">
									<textarea class="form-control ckeditor" rows="3" id="bodFooter" name="bodFooter">${bod.bodFooter}</textarea>
								</td>
							</tr>
							<tr>
								<th class="normal">업로드 수</th>
								<td class="normal">
									<select name="fileUploadCnt" class="form-control">
										<c:forEach var="result" begin="0" end="20">
											<option value="${result}" <c:if test="${result == bod.fileUploadCnt}">selected</c:if>>${result} 개</option>
										</c:forEach>
									</select>
								</td>
								<th>새글 표시 일시</th>
								<td>
									<select name="newArtiDt" class="form-control">
										<c:forEach var="result" begin="1" end="10">
											<option value="${result}" <c:if test="${result == bod.newArtiDt}">selected</c:if>>${result} 일</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th>게시물 수</th>
								<td>
									<select name="artiCnt" class="form-control">
										<c:forEach var="result" begin="0" end="20">
											<option value="${result}" <c:if test="${result == bod.artiCnt}">selected</c:if>>${result} 개</option>
										</c:forEach>
									</select>
								</td>
								<th>사용유무</th>
								<td>
									<input type="checkbox" id="useSt" name="useSt" <c:if test="${bod.useSt}">checked</c:if> data-toggle="toggle"  data-on="사용" data-off=" ">
								</td>
							</tr>
						</table>
					</div>
					<div class="box-footer">
						<div class="btn-group pull-right">
							<button type="button" class="btn btn-outline-primary" onclick="update()">수정</button>
							<button type="button" class="btn btn-default" onclick="preList()">목록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</form>
<script>
	$(document).ready(function() {
		changeBodType();
		$("#bod.bodTp").val("normal");
	});
	
	function update() {
		var form = document.updateForm;
		if($.trim(form.bodNm.value) == "") {
			alert("게시판명을 입력 해 주세요.");
			form.bodNm.focus();
		}else {
			var contents = eval("CKEDITOR.instances.bodHeader.getData()");
			$("#bodHeader").val(contents);
			contents = eval("CKEDITOR.instances.bodFooter.getData()");
			$("#bodFooter").val(contents);
			
			if(confirm("수정하시겠습니까?")) {
				$.ajax({
					url : "<c:url value='/system/bod/update.json' />",
					type : "POST",
					data : $("#updateForm").serialize(),
					dataType : "json",
					success : function(res) {
						if ("success" == res.result) {
							alert("수정되었습니다.");
							location.href = "<c:url value='/system/bod/view.mng' />?bodId=${bod.bodId}";
						}else {
							alert(res.message);
						}
					}
				});
			}
		}
	}
	
	function changeBodType() {
		var bodTpList = $("input[name='bodTp']"); 
		for (i=0; i < bodTpList.length; i++) {
            $("."+bodTpList[i].value).hide();
        }
            
		var val = $("input:radio[name='bodTp']:checked").val();
		$("."+val).show();
	}
	
	var selectEditor;
	function setImage(hash) {
		var editor = eval("CKEDITOR.instances."+selectEditor.name);
		var cont = editor.getData();
		cont += "<img src='/public/media/image.json?hash="+hash+"' class='img-rounded img-responsive'>";
		editor.setData(cont);
	}
	
	function preList(){
		location.href = "/system/bod/list.mng";
	}
	
</script>