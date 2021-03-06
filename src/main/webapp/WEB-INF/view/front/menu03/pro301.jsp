<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf" %>
<main>
     <div class="container-fluid px-4">
         <h1 class="mt-4">${menu.menuNm}</h1>
         <ol class="breadcrumb mb-4">
             <li class="breadcrumb-item active"><i class="fas fa-home"></i>  ${sideMenu.menuNm} > ${menu.menuNm}</li>
         </ol>
         <div class="card mb-4">
             <div class="card-body">
             	<div class="clearfix" style="background-color: #e1e1ea; padding-right: 10px;"">	
					<form id="searchForm" onsubmit="return false" style="float:right; margin-top:25px;">
						<input type="hidden" id="excelFileName" name="excelFileName">
						<input type="hidden" id="excelFileDownName" name="excelFileDownName" value="실시간 관측자료">
						
						<div class="form-group">
							<label for="searchTitle" style="width: 25%;">
								<span>
									<select id="searchTitle" name="searchTitle" class="form-control">
										<option value="nm">관측소명</option>
										<option value="perm">허가번호</option>
									</select>
								</span> 
							</label>
							<label for="searchTxt" style="width: 35%;">
								<input type="text" id="searchTxt" name="searchTxt" placeholder="검색어를 입력하세요" title="검색어를 입력하세요" style="width:100%;" class="form-control">
							</label>
							<div style="float: right; margin-left: 10px;">
								<button class="btn btn-outline-blue" type="button" onclick="selectList()">검색</button>
								<button class="btn btn-outline-green" type="button" onclick="fn_excel_down()">엑셀다운로드</button>
							</div>
						</div>
					</form>
				</div>
                <div class="" style="overflow: auto;">     
                	<div>
						총 게시물 : <strong id="paginationTotalCnt"></strong>
					</div>    
					<table class="baseTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="datatable">
						<colgroup>
							<col width="50px"/>
							<col width="200px"/>
							<col width="100px"/>
							<col width="100px"/>
							<col width="100px"/>
							<col width="200px"/>
							<col width="100px"/>
							<col width="100px"/>
							<col width="100px"/>
							<col width="100px"/>
							<col width="100px"/>
							<col width="100px"/>
							<col width="100px"/>
							<col width="100px"/>
							<col width="100px"/>
							<col width="100px"/>
							<!-- <col width="100px"/> -->
							<col width="100px"/>
							<!-- <col width="100px"/> -->
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
								<th>배터리</th>
								<th>NO3</th>
								<th>NH4</th>
								<th>PH</th>
								<th>NH3</th>
								<!-- <th>CL</th> -->
								<th>대기압</th>
								<<!-- th>강수량</th> -->
							</tr>
							
						</thead>
						<tbody style="text-align: center;">
							
						</tbody>
					</table>
				</div>
             </div>
         </div>
     </div>
 </main>
<script src='<c:url value="/js/pagination.js"/>'></script>
<script>
$(document).ready(function() {
	if("${paramMap.type}" == "map"){
		$("#searchTitle").val("perm");
		$("#searchTxt").val("${paramMap.siteRpmsno}");
	}
	selectList();
});

//실시간 관측자료 데이터 조회
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
			if(leng == 0){
				html += "<tr><td colspan='13'>데이터가 존재하지 않습니다.</td></tr>";
			}else{
				for(var i=0; i<leng; i++){
					var data = list[i]
					html += "<tr onclick='javascript:fn_go_detail("+data.siteId+")'>";
					html += "<td>"+(i+1)+"</td>";
					html += "<td>"+udchk(data.siteName)+"</td>";
					html += "<td>"+udchk(data.mSn)+"</td>";
					html += "<td>"+udchk(data.siteDph)+"</td>";
					html += "<td>"+udchk(data.siteAltoc)+"</td>";
					html += "<td>"+udchk(data.chDataTime)+"</td>";
					html += "<td>"+udchk(data.el)+"</td>";
					html += "<td>"+udchk(data.gl)+"</td>";
					html += "<td>"+udchk(data.pressr)+"</td>";
					html += "<td>"+udchk(data.temp)+"</td>";
					html += "<td>"+udchk(data.ec)+"</td>";
					html += "<td>"+udchk(data.batt)+"</td>";
					html += "<td>"+udchk(data.no3)+"</td>";
					html += "<td>"+udchk(data.nh4)+"</td>";
					html += "<td>"+udchk(data.ph)+"</td>";
					html += "<td>"+udchk(data.nh3)+"</td>";
					/* html += "<td>"+udchk(data.cl)+"</td>"; */
					html += "<td>"+udchk(data.wBaro)+"</td>";
					/* html += "<td>"+udchk(data.rainfall)+"</td>"; */
					html += "</tr>";
				}
			}
			$("#datatable tbody").empty(html);
			$("#datatable tbody").append(html);
			
			$("#paginationTotalCnt").html(leng+"건");
			
			$(".loading").hide();
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
	
}

function fn_go_detail(siteId){
	location.href = "<c:url value='/front/menu03/pro302.do?siteId="+siteId+"'/>";
}

//실시간 관측자로 엑셀 다운로드를 위한 파일 생성
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

//실시간 관측자로 엑셀 파일 다운
function fn_excel_real_down(){
	$("#searchForm").attr("action", "<c:url value='/front/statistics/selectRealTimeDataListExcelDown.do'/>");
	$('#searchForm')[0].submit();
}
</script>