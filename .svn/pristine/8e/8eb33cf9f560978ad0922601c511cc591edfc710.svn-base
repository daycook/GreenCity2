<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf" %>
<div class="contentWrap">
	<!-- 일반게시판 -->
	<div class="baseTableCont">
		<div class="clearfix">
			<h3 style="display:inline-block;">${bod.bodNm} 게시판 </h3>
			<form onsubmit="return false" style="float:right; margin-top:25px;">
				<div class="form-group">
					<label for="searchTitle" style="width: 20%;">
						<span>
							<select id="searchTitle" class="form-control">
								<option value="titleLike">제목</option>
								<option value="contLike">내용</option>
							</select>
						</span> 
					</label>
					
					<label for="searchTxt" style="width: 50%;">
						<input type="text" id="searchTxt" placeholder="검색어를 입력하세요" title="검색어를 입력하세요" style="width:100%;" class="form-control">
					</label>
					<button class="btn btn-outline-black" type="button" onclick="selectList()">검색</button>
				</div>
			</form>
		</div>
		<div class="">        
	 		<div>
				총 게시물 : <strong id="paginationTotalCnt"></strong>
			</div>
			<table class="baseTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="datatable">
				<caption>
					${menu.menuNm}
				</caption>
				<colgroup>
					<col width="5%" />
					<col width="43%" />
					<col width="20%" class="web" />
					<col width="10%" class="web" />
					<col width="12%" class='web'/>
					<col width="10%" class="web" />
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th class="web">첨부</th>
						<th class="web">작성자</th>
						<th class='web'>등록일</th>
						<th class="web">조회수</th>
					</tr>
					
				</thead>
				<tbody>
					
				</tbody>
			</table>
			
			<div class="text-right">
				<c:if test="${isAuthInsert}">
					<button type='button' class='btn btn-outline-black' style="margin-top: 10px;" onclick='goInsert()'>등록</button>
				</c:if>
			</div>

			<div class="text-center paginationStyle" id="pagination"></div>
		</div>
		<div id="insertBtn" style="float:right; margin-top:-74px;">
			
		</div>
		<div>
			${bod.bodFooter}
		</div>
	</div>
</div>
<script src='<c:url value="/js/pagination.js"/>'></script>

<script>
$(document).ready(function() {
	selectList();
});

function selectList() {
	var dataList;
	if($("#searchTxt").val() != "") {
		if($("#searchTitle").val() == "titleLike") {
			dataList = {"titleLike" : $("#searchTxt").val(), "bodId" : "${bod.bodId}", "start" : firstRecordIndex, "length" : 10, "pagingYn" : true};
		}else {
			dataList = {"contLike" : $("#searchTxt").val(), "bodId" : "${bod.bodId}", "start" : firstRecordIndex, "length" : 10, "pagingYn" : true};
		}
	}else {
		dataList = {"bodId" : "${bod.bodId}", "start" : firstRecordIndex, "length" : 10, "pagingYn" : true};
	}
	$.ajax({
		url : "<c:url value='/public/bodArti/list.json' />",
		type : "POST",
		data : dataList,
		dataType : "json",
		success : function(res) {
			if ("success" == res.result) {
				var html = "";
				if(res.data.length == 0) {
					html += "<tr>";
					html += "<td colspan='6' style='text-align:center;'>게시글이 없습니다.</td>";
					html += "</tr>";
				}else {
					var index = 1+((currentPage-1)*parseInt("${bod.artiCnt}"));
					for(idx in res.data) {
						var data = res.data[idx];
						html += "<tr>";
						html += "<td style='text-align:center;'>"+index+"</td>";
						html += "<td style='text-align:left; text-indent:15px;'>";
						if(data.depth > 1) {
							html += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>┗</b>  ";
						}
						if(data.scrtYn == '1') {
							html += "<a onclick=\"goScrtView('"+data.artiId+"')\">";
							html += "<i class='fa fa-lock'></i> 비밀글 입니다.";
							html += "</a>";
						}else {
							html += "<a onclick=\"goView('"+data.artiId+"')\">";
							html += data.title;
							html += "</a>";
						}
						html += "</td>";
						html += "<td class='web'>";
						if(data.fileCnt > 0) {
							html += "<i class='fa fa-file'></i>";
						}
						html += "</td>";
						html += "<td class='web' style='text-align:center;'>";
						html += data.user.userNm;
						html += "</td>";
						html += "<td class='web' style='text-align:center;'>";
						html += date_to_str(new Date(data.regDt));
						html += "</td >";
						html += "<td class='web' style='text-align:center;'>"+data.hit+"</td>";
						html += "</tr>";
						index ++;
					}		
					setPagination(res.recordsTotal, 10);
					console.log(res.writeAuth)
					if(res.writeAuth > 0){
						$("#insertBtn").empty();
						//$("#insertBtn").append("<button type='button' class='btn bod-btn-sub btn-default btn-primary' onclick='goInsert()'>등록</button>");
					}
					renderPagination();
				}
				$("#datatable > tbody").html(html);
			}else {
				alert(res.message);
			}
			
		}
	});
}

//등록페이지
function goInsert() {
	var thisUrl = window.location.pathname;
	location.href = thisUrl+"?action=insert";
}

//게시물 상세보기
function goView(artiId) {
	var thisUrl = window.location.pathname;
	location.href = thisUrl+"?action=view&artiId="+artiId;
}

//게시물 본인확인 여부 체크
function goScrtView(artiId) {
	$.ajax({
		url : "<c:url value='/public/bodArti/isScrt.json' />",
		type : "POST",
		data : {"artiId" : artiId},
		dataType : "json",
		success : function(res) {
			if ("success" == res.result) {
				var thisUrl = window.location.pathname;
				location.href = thisUrl+"?action=view&artiId="+artiId;		
			}else {
				alert(res.message);
			}
		}
	});
}


</script>