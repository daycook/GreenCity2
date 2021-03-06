<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf" %>
<div class="contentWrap">
	<cs:cmsMenuInfoTag siteId="${currentSite.siteId}" menuId="${menu.menuId}" />
	<div class="baseTableCont"> 
		<form id="updateForm" name="updateForm">
			<input title='입력' type="hidden" name="bodId" value="${bod.bodId}" />
			<input title='입력' type="hidden" name="artiId" value="${bodArti.artiId}" />
			<input title='입력' type="hidden" name="fileId" value="${bodArti.fileId}"/>
			<input title='입력' type="hidden" name="itemIdList" />
			<table class="baseTable" summary="제목,비밀글,본문내용,첨부내용 항목입니다.">
				<colgroup>
					<col width="15%" />
					<col width="35" />
					<col width="15%" />
					<col width="35%" />
				</colgroup>
				<caption>
					게시글 수정하기
				</caption>
				<tbody>
					<tr>
						<th scope="row" class="blNone">제목</th>
						<td colspan="3"><input title='입력' name="title" type="text" class="form-control" value="${bodArti.title}"></td>
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
							<textarea id="cont" name="cont" class="form-control ckeditor" rows="5"><c:out value="${bodArti.cont}" /></textarea>
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
		<div class="btnWrap text-center">
			<button type="button" class="btn btn-outline-black" onclick="update()">수정</button>
			<button type="button" class="btn btn-outline-black" onclick="goView()">이전</button>
		</div>
	</div>
</div>

<script src="<c:url value='/js/file.js' />"></script>
<script>
$(document).ready(function(){
	selectFileList();
});

function fileuploadClick(){
	$("#fileupload").click();
}

function goView() {
	var thisUrl = window.location.pathname;
	location = thisUrl+"?action=view&artiId=${bodArti.artiId}";
}

function update() {
	var form = document.updateForm;
	if(form.title.value == "") {
		alert("제목을 입력 해 주세요.");
		form.title.focus();
	}else {
		if(confirm("수정하시겠습니까?")) {
			/* form.itemIdList.value = itemIdList; */
			$("#cont").val(CKEDITOR.instances.cont.getData());
			$.ajax({
				url : "<c:url value='/public/bodArti/multi/update.json' />",
				type : "POST",
				data : $("#updateForm").serialize(),
				dataType : "json",
				success : function(res) {
					if ("success" == res.result) {
						alert("수정되었습니다.");
						/* goView(); */
					}else {
						alert(res.message);
					}
				}
			});
		}
	}
}

/* var itemIdList = new Array();
function completeFileUpload(fileItem) {
	$("#uploaded-files > td").append("<p><a href='/file/download.json?itemId="+fileItem.itemId+"' title='파일 다운로드'>"+fileItem.fileNm+" <strong>("+fileItem.fileSize+" KB / 다운로드 : 0)</strong></a> <a href='#;' style='color:red' onclick='deleteFile(\""+fileItem.itemId+"\")'>X</a> </p>");

	itemIdList.push(fileItem.itemId);
} */

function selectFileList() {
	$.ajax({
		url : "<c:url value='/public/file/view.json' />",
		type : "POST",
		data : {"fileId" : "${bodArti.fileId}"},
		dataType : "json",
		success : function(res) {
			if ("success" == res.result) {
				$("#fileList").html("");
				
				var fileExistCnt = 0;
				var html = "";
				for(idx in res.data.fileList) {
					var fileItem = res.data.fileList[idx];
					html += "<p><a href='/file/download.json?itemId="+fileItem.itemId+"' title='파일 다운로드'>"+fileItem.fileNm+" <strong>("+fileItem.fileSize+" KB / 다운로드 : "+fileItem.dwnCnt+")</strong></a> <a href='#;' style='color:red' onclick='deleteFile(\""+fileItem.itemId+"\")'>X</a> </p>"
					fileExistCnt++;
				}
				fileCnt = fileExistCnt;
				
				$("#uploaded-files > td").html(html);
			}else {
				alert(res.message);
			}
		}
	});
}

function fileUpload(){
	$("#updateForm").ajaxSubmit({
		url : "<c:url value='/public/file/upload.json' />",
		type : "POST",
		dataType : "json",
		success : function(res) {
			selectFileList()
		}
	});
}

function deleteFile(itemId){
	$.ajax({
		url : "<c:url value='/file/delete.json' />",
		type : "POST",
		dataType : "json",
		data : {"itemId" : itemId, "fileId" : ${bodArti.fileId}},
		success : function(res) {
			if ("success" == res.result) {
				alert("삭제성공");
				selectFileList();
			}
			else{
				alert(res.message);
			}
		}
	});
}
</script>