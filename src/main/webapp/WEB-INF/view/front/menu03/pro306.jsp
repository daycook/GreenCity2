<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf" %>
<div class="contentWrap">
	<!-- 일반게시판 -->
	<div class="baseTableCont">
		<div class="clearfix">
			<h3 style="display:inline-block;">${menu.menuNm}</h3>
			<form id="searchForm" onsubmit="return false" style="float:right; margin-top:25px;">
				<input type="hidden" id="excelFileName" name="excelFileName">
				<input type="hidden" id="excelFileDownName" name="excelFileDownName" value="실시간 관측자료">
				
				<div class="form-group">
					<label for="searchTitle" style="width: 25%;">
						<span>
							<select id="searchTitle" class="form-control">
								<option value="nm">관측소</option>
								<option value="perm">허가번호</option>
							</select>
						</span> 
					</label>
					<label for="searchTxt" style="width: 35%;">
						<input type="text" id="searchTxt" placeholder="검색어를 입력하세요" title="검색어를 입력하세요" style="width:100%;" class="form-control">
					</label>
					<button class="btn btn-outline-blue" type="button" onclick="selectList()">검색</button>
					<button class="btn btn-outline-green" type="button" onclick="fn_excel_down()">엑셀다운로드</button>
				</div>
			</form>
		</div>
		<div class="">        
	 		<div>
				총 게시물 : <strong id="paginationTotalCnt"></strong>
			</div>
			<table class="baseTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="datatable">
				<colgroup>
					<col width="5%"/>
					<col width="15%"/>
					<col width="6%"/>
					<col width="6%"/>
					<col width="6%"/>
					<col width="13%"/>
					<col width="6%"/>
					<col width="6%"/>
					<col width="6%"/>
					<col width="6%"/>
					<col width="6%"/>
					<col width="6%"/>
					<col width="6%"/>
				</colgroup>
				<thead>
					<tr>
						<th>순번</th>
						<th>관측소명</th>
						<th>센서순번</th>
						<th>관정깊이</th>
						<th>표고_TOC</th>
						<th>관측시간</th>
						<th>수위EL</th>
						<th>수위GL</th>
						<th>압력</th>
						<th>온도</th>
						<th>전기전도도</th>
						<th>대기압</th>
						<th>배터리</th>
					</tr>
					
				</thead>
				<tbody style="text-align: center;">
					
				</tbody>
			</table>
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

function selectList(){
	$(".loading").show();
	var formData = $("#searchForm").serialize();
	$.ajax({
		url : "<c:url value='/front/statistics/selectRealTimeDataList.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(result){
			var html = "";
			
			var list = result.realTimeDataList;
			var leng = list.length;
			
			for(var i=0; i<leng; i++){
				var data = list[i]
				
				html += "<tr onclick='javascript:fn_show_modal(\"detail\")'>";
				html += "<td>"+(i+1)+"</td>";
				html += "<td>"+data.siteName+"</td>";
				html += "<td>"+data.mSn+"</td>";
				html += "<td>"+data.siteDph+"</td>";
				html += "<td>"+data.siteAltoc+"</td>";
				html += "<td>"+data.dataTime+"</td>";
				html += "<td>"+data.el+"</td>";
				html += "<td>"+data.gl+"</td>";
				html += "<td>"+data.pressr+"</td>";
				html += "<td>"+data.temp+"</td>";
				html += "<td>"+data.ec+"</td>";
				html += "<td>"+data.siteName+"</td>";
				html += "<td>"+data.batt+"</td>";
				html += "</tr>";
			}
			$("#datatable tbody").empty(html);
			$("#datatable tbody").append(html);
			
			$(".loading").hide();
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
	
}

function fn_excel_down(){
	$(".loading").show();
	var formData = $("#searchForm").serialize();
	$.ajax({
		url : "<c:url value='/front/statistics/selectRealTimeDataListExcel.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(result){
			$("#excelFileName").val(result.fileName);
			fn_excel_real_down()
			$(".loading").hide();
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
	/* $("#searchForm").attr("action", "/front/statistics/selectRealTimeDataListExcel.json");
	$('#searchForm')[0].submit(); */
}

function fn_excel_real_down(){
	$("#searchForm").attr("action", "<c:url value='/front/statistics/selectRealTimeDataListExcelDown.do'/>");
	$('#searchForm')[0].submit();
}
</script>