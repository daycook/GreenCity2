<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf" %>

<div class="contentWrap">
	<cs:cmsMenuInfoTag siteId="${currentSite.siteId}" menuId="${menu.menuId}" />
	
	<div class="contents-wrapper"> 
		<form id="insertForm" name="insertForm">
			<input title='입력' type="hidden" name="bodId" value="${bod.bodId}" />
			<input title='입력' type="hidden" name="depth" value="2" />
			<input title='입력' type="hidden" name="artiGrp" value="${upperBodArti.artiId}" />
			<input title='입력' type="hidden" name="fileId" />
			<input title='입력' type="hidden" name="itemIdList" />
			<table class="table no-caption boardWrite-basic" summary="제목,비밀글,본문내용,첨부내용 항목입니다.">
				<colgroup>
					<col width="15%" />
					<col width="35" />
					<col width="15%" />
					<col width="35%" />
				</colgroup>
				<caption>
					게시글 등록하기
				</caption>
				<tbody>
					<tr>
						<th scope="row" class="blNone">원본글 제목</th>
						<td colspan="3"><c:out value="${upperBodArti.title}" /></td>
					</tr>
					<tr>
						<th scope="row" class="blNone">제목</th>
						<td colspan="3"><input title='입력' name="title" type="text" class="form-control"></td>
					</tr>
					<tr>
						<c:if test="${bod.scrtYn}">
							<th scope="row" class="blNone">비밀글 여부</th>
							<td><input title='입력' type="checkbox" name="scrtYn"></td>
						</c:if>
					</tr>
					<tr>
						<th scope="row" class="hiddenX">내용</th>
					</tr>
					<tr>
						<td colspan="4" class="tdEditor">
							<textarea id="cont" name="cont" class="form-control ckeditor" rows="5"></textarea>
						</td>
					</tr>
					<tr class="app_input" id="uploaded-files">
						<th scope="row" class="blNone">첨부<br>
							<div class="fileUpload btn-group btn btn-primary mt5"> <span>업로드</span>
								<input title='입력' id="fileupload" type="file" name="files[]" data-url="/public/file/upload.json" class="upload">
							</div>
						</th>
						<td colspan="3">
							
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="btnWrap text-center">
			<button type="button" class="btn btn-purple" onclick="insert()">등록</button>
			<button type="button" class="btn btn-default" onclick="goList()">목록</button>
		</div>
	</div>
</div>
<script src="<c:url value='/js/file.js' />"></script>
<script>
var isOut = true;
$(document).ready(function(){
	fileInit(); //파일 init
	fileUploadCnt = "${bod.fileUploadCnt}";
	
	$(window).on("beforeunload", function(){
		if(isOut) return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
	});
});

function goList() {
	isOut = false;
	location.href = getServletPath();
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
				url : "<c:url value='/public/bodArti/multi/insertAnsw.json' />",
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
</script>