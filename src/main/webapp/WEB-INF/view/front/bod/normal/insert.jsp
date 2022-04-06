<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf" %>

<div class="contentWrap">	
	<div class="baseTableCont"> 
		<form id="insertForm" name="insertForm" method="post">
			<input title='입력' type="hidden" name="bodId" value="${bod.bodId}" />
			<input title='입력' type="hidden" name="depth" value="1" />
			<input title='입력' type="hidden" id="fileId" name="fileId"/>
			<input title='입력' type="hidden" name="itemIdList" />
			<table class="baseTable" summary="제목,비밀글,본문내용,첨부내용 항목입니다.">
				<colgroup>
					<col width="15%" />
					<col width="35" />
					<col width="15%" />
					<col width="35%" />
				</colgroup>
				<caption>
					<h3>게시글 등록하기</h3>
				</caption>
				<tbody>
					<tr>
						<th scope="row" class="blNone">제목</th>
						<td colspan="3"><input title='입력' name="title" type="text" class="form-control" style="width:98%; box-sizing: border-box;"></td>
					</tr>
					<tr>
						<c:if test="${bod.scrtYn}">
							<th scope="row" class="blNone">비밀글 여부</th>
							<td><input title='입력' type="checkbox" name="scrtYn" <c:if test="${bodArti.scrtYn}">checked</c:if>></td>
						</c:if>
						<c:if test="${isAuthNoti}">
							<th scope="row" class="blNone">공지글 여부</th>
							<td><input title='입력' type="checkbox" name="notiYn" <c:if test="${bodArti.notiYn}">checked</c:if>></td>
						</c:if>
					</tr>
					<tr>
						<td colspan="4" class="tdEditor">
							<textarea id="cont" name="cont" class="form-control ckeditor" rows="5"></textarea>
						</td>
					</tr>
					<tr class="app_input" id="uploaded-files">
						<th scope="row" class="blNone">첨부<br>
							<div class="fileUpload btn-group btn btn-outline-black mt5 web"> <span>업로드</span>
								<input title='입력' id="fileupload" type="file" name="files[]" class="upload" onchange="fileUpload()">
							</div>
							<input type="button" value="추가" class="mobile" onclick="fileuploadClick()">
						</th>
						<td colspan="3">
							
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="btnWrap text-center" style="float:right; margin-top:10px;">
			<button type="button" class="btn btn-outline-black" onclick="insert()">등록</button>
			<button type="button" class="btn btn-outline-black" onclick="goList()">목록</button>
		</div>
	</div>
</div>
<script src="<c:url value='/js/file.js' />"></script>
<script>
$(document).ready(function(){
	fileInit(); //파일 init
	fileUploadCnt = "${bod.fileUploadCnt}";
});

function fileuploadClick(){
	$("#fileupload").click();
}

function goList() {
	location.href = window.location.pathname;
}

function insert() {
	var form = document.insertForm;
	if(form.title.value == "") {
		alert("제목을 입력 해 주세요.");
		form.title.focus();
	}else {
		if(confirm("등록하시겠습니까?")) {
			form.itemIdList.value = itemIdList;
			$("#cont").val(CKEDITOR.instances.cont.getData());
			$.ajax({
				url : "<c:url value='/public/bodArti/multi/insert.json' />",
				type : "POST",
				data : $("#insertForm").serialize(),
				dataType : "json",
				success : function(res) {
					if ("success" == res.result) {
						alert("등록되었습니다.");
						goList();
					}else {
						alert(res.message);
					}
				}
			});
		}
	}
}

var itemIdList = new Array();
function completeFileUpload(fileItem) {
	$("#uploaded-files > td").append("<p><a href='/file/download.json?itemId="+fileItem.itemId+"' title='파일 다운로드'>"+fileItem.fileNm+" <strong>("+fileItem.fileSize+" KB / 다운로드 : 0)</strong></a></p>");
	
	itemIdList.push(fileItem.itemId);
}

function fileUpload(){
	$("#insertForm").ajaxSubmit({
		url : "<c:url value='/public/file/upload.json' />",
		type : "POST",
		dataType : "json",
		success : function(res) {
			completeFileUpload(res.fileItem);
		}
	});
}
</script>