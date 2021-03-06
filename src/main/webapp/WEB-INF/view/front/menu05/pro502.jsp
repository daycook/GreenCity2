<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf" %>
<main>
     <div class="container-fluid px-4">
         <h1 class="mt-4">${menu.menuNm}</h1>
         <ol class="breadcrumb mb-4">
             <li class="breadcrumb-item active"> <i class="fas fa-home"></i> ${sideMenu.menuNm} > ${menu.menuNm}</li>
         </ol>
         <div class="card mb-4">
             <div class="card-body">
             	<div class="clearfix" style="background-color: #e1e1ea; padding-right: 10px;"">	
					<form id="searchForm" onsubmit="return false" style="float:right; margin-top:25px;">
						<input type="hidden" id="firstRecordIndex" name="firstRecordIndex">
						<div class="form-group">
							<label for="searchTitle">
								<span>
									<select id="searchTitle2" name="searchTitle2" class="form-control">
										<option value="nm">관측소명</option>
										<option value="perm">허가번호</option>
									</select>
								</span> 
							</label>
							<label for="searchTxt">
								<input type="text" id="searchTxt2" name="searchTxt2" placeholder="검색어를 입력하세요" title="검색어를 입력하세요" style="width:100%;" class="form-control">
							</label>
							<div style="float: right; margin-left: 10px;">
								<button class="btn btn-outline-blue" type="button" onclick="selectList()">검색</button>
							</div>
						</div>
					</form>
				</div>
                <div class="" style="margin-top: 10px; overflow: auto;"> 
					<table class="baseTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="datatable">
						<colgroup>
							<col width="20%"/>
							<col width="16%"/>
							<col width="16%"/>
							<col width="16%"/>
							<col width="16%"/>
							<col width="16%"/>
						</colgroup>
						<thead>
							<tr>
								<th>관측소명</th>
								<th>정기점검</th>
								<th>센서교체</th>
								<th>RTU점검</th>
								<th>전원장치 점검</th>
								<th>수위보정</th>
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
	selectList();
});

//관측소 점검통계 리스트 조회
function selectList(){
	$("#firstRecordIndex").val(firstRecordIndex);
	$(".loading").show();
	var formData = $("#searchForm").serialize();
	$.ajax({
		url : "<c:url value='/front/siteChckManage/selectSiteChckStatics.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(result){
			
			var html = "";
			var list = result.list;
			var leng = list.length;
			if(leng == 0){
				html += "<tr><td colspan='6'>데이터가 존재하지 않습니다.</td></tr>";
			}else{
				for(var i=0; i<leng; i++){
					var data = list[i];
					html += "<tr>";
					html += "<td>"+udchk(data.siteName)+"</td>";
					html += "<td>"+udchk(data.chckKnd1)+"</td>";
					html += "<td>"+udchk(data.chckKnd2)+"</td>";
					html += "<td>"+udchk(data.chckKnd3)+"</td>";
					html += "<td>"+udchk(data.chckKnd4)+"</td>"
					html += "<td>"+udchk(data.chckKnd5)+"</td>";
					html += "</tr>";
				}
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
</script>