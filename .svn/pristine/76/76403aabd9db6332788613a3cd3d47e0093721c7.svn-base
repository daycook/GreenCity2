<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf" %>
<!-- 일반게시판 -->
<style>
	table td div{
		text-align:left;
	}
</style>
<div class="">
	<div class="baseTableCont"> 
		<table class="baseTable" summary="제목,작성자,등록일,본문내용,첨부내용 항목입니다.">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" class="web" />
				<col width="35%" class="web" />
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="blNone">제목</th>
					<td colspan="3"> <c:out value="${bodArti.title}" /></td>
				</tr>
				<tr>
					<th scope="row" class="blNone">작성자</th>
					<td> <c:out value="${bodArti.user.userNm}" /></td>
					<th scope="row" class="blNone web">등록일</th>
					<td class="web"> <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${bodArti.regDt}" /></td>
				</tr>
				<tr>
					<th scope="row" colspan="4" class="hiddenX">내용</th>
				</tr>
				<tr>
					<td colspan="4" class="tdCont" style="min-height: 500px;"> ${bodArti.cont} </td>
				</tr>
				<tr class="append">
					<th scope="row" colspan="4" class="mobile">첨부</th>
				</tr>
				<tr class="append">
					<th scope="row" class="web">첨부</th>
					<td colspan="4" id="fileList">
						
					</td>
				</tr>
			</tbody>
		</table>
		<div class="bod-btnbox">
			<div class="fl-r">		
 				<button type="button" class="btn btn-outline-black" style="margin-top: 10px; float: right;" onclick="goList()">목록</button>	
 				<button type="button" class="btn btn-outline-black" style="margin-top: 10px; float: right; margin-right: 5px;" onclick="goUpdate()">수정</button>
 			</div>
			
		</div>
		<c:if test="${bod.cmntYn}">
			<jsp:include page="../cmnt.jsp" />
		</c:if>
	</div>
</div>
<script>

$(document).ready(function(){
	selectFileList();
});

function share(type) {
	if(type == 'facebook') {
		window.open("https://www.facebook.com/sharer/sharer.php?u="+encodeURIComponent(document.URL),"_blank");
	}else if(type == 'twitter') {
		window.open("https://twitter.com/intent/tweet?text="+encodeURIComponent("${bodArti.title}")+"&url="+encodeURIComponent(document.URL),"_blank");
	}
}

/**
 * 첨부파일 목록 조회
 */
function selectFileList() {
	if("${bodArti.fileId}" != '') {
		$.ajax({
			url : "<c:url value='/public/file/view.json' />",
			type : "POST",
			data : {"fileId" : "${bodArti.fileId}"},
			dataType : "json",
			success : function(res) {
				if ("success" == res.result) {
					$("#fileList").html("");
					
					var html = "";
					for(idx in res.data.fileList) {
						var fileItem = res.data.fileList[idx];
						html += "<p><a href='/file/download.json?fileId="+fileItem.fileId+"&itemId="+fileItem.itemId+"' title='파일 다운로드'>";
						html += fileItem.fileNm;
						html += " <strong>("+fileItem.fileSize+" KB / 다운로드 : "+fileItem.dwnCnt+")</strong></a></p>";
					}
					
					$("#fileList").html(html);
				}else {
					alert(res.message);
				}
			}
		});
	}
}

function goList() {
	location.href = window.location.pathname;
}

function goUpdate() {
	var thisUrl = window.location.pathname;
	location.href = thisUrl+"?action=update&artiId=${bodArti.artiId}";
}

function goAnsw() {
	location.href = window.location.pathname+"?action=answ&upperArtiId=${bodArti.artiId}";
}

function del() {
	if(confirm("정말 삭제하시겠습니까?")) {
		
	}
}

</script>