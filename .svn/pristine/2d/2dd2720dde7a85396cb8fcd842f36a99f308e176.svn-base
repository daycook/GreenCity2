<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf" %>

<main>
     <div class="container-fluid px-4">
         <h1 class="mt-4">${menu.menuNm}</h1>
         <ol class="breadcrumb mb-4">
             <li class="breadcrumb-item active"><i class="fas fa-home"></i> ${sideMenu.menuNm} > ${menu.menuNm}</li>
         </ol>
         <div class="card mb-4">
             <div class="card-body">
             	<div class="clearfix" style="background-color: #e1e1ea; padding-right: 10px;"">
					<form id="searchForm" onsubmit="return false" style="float:right; margin-top:25px;">
						<input type="hidden" id="firstRecordIndex" name="firstRecordIndex">
						<div class="form-group" style="margin-right: 10px;">
							<input type="hidden" id="searchTitle" name="searchTitle" value="perm">
							<label for="searchTxt">
								<select id="searchTxt" name="searchTxt" placeholder="검색어를 입력하세요" title="검색어를 입력하세요" style="width:100%;" class="form-control" onchange="selectList()">
								</select>
							</label>
						</div>
					</form>
				</div>
                 <div class="" style="overflow: auto;">        
			 		<div>
						총 게시물 : <strong id="paginationTotalCnt"></strong>
					</div>
					<table class="baseTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="datatable">
						<colgroup>
							<col width="5%"/>
							<col width="8%"/>
							<col width="8%"/>
							<col width="8%"/>
							<col width="8%"/>
							<col width="8%"/>
							<col width="8%"/>
							<col width="8%"/>
							<col width="8%"/>
							<col width="30%"/>
						</colgroup>
						<thead>
							<tr>
								<th>순번</th>
								<th>관측소명</th>
								<th>위도</th>
								<th>경도</th>
								<th>표고_TOC</th>
								<th>관정심도</th>
								<th>케이싱구경</th>
								<th>유역구분</th>
								<th>유역명</th>
								<th>소재지</th>
							</tr>
							
						</thead>
						<tbody style="text-align: center;">
							
						</tbody>
					</table>
		
					<div class="text-center paginationStyle" id="pagination"></div>
				</div>
             </div>
         </div>
     </div>
 </main>
 
 <!-- 관측소 상세 모달 -->
<div id="detailModal" class="modal">
  <form id="">
  <!-- Modal content -->
  <div class="modal-content" style="width: 1500px; height: 600px; margin: 5% auto;">
            <div style="width: 100%; text-align: right;">
		    <span class="material-icons" style="cursor: pointer;" onclick="javascript:fn_close_modal('detailModal')">
				<i class="fas fa-times"></i>
			</span>
			</div>
            <p style="text-align: center;"><span style="font-size: 14pt; height: 100px;"><b><span style="font-size: 24pt;">관측소 상세</span></b></span></p>
			<br>
			<div style="height: 650px;">
				<div id="siteDtlDiv" class="onlyWeb" style="float: left;">
					<div class="siteImg" style="margin-bottom: 5px;" id="img1">
					</div>
					<div class="siteImg" id="img2">
					</div>
				</div>
				<div style="float: right;">
					<table class="subComtTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="insertTable" style="width: 1000px;">
						<colgroup>
							<col width="20%"/>
							<col width="30%"/>
							<col width="20%"/>
							<col width="30%"/>
						</colgroup>
						<thead>
							<tr>
								<th>구분</th>
								<th>데이터</th>
								<th>구분</th>
								<th>데이터</th>
							</tr>
						</thead>
						<tbody id="detailTbody" style="text-align: center;">
							
						</tbody>
					</table>
				</div>
			</div>
  </div>
  </form>
</div>
<script src='<c:url value="/js/pagination.js"/>'></script>

<script>
$(document).ready(function() {
	fn_select_site_list()
	selectList();
});

//관측소 정로 리스트 조회
function selectList(){
	$(".loading").show();
	var formData = $("#searchForm").serialize();
	$.ajax({
		url : "<c:url value='/front/siteInfo/selectSiteInfoList.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(result){
			
			var html = "";
			var list = result.siteInfoList;
			var leng = list.length;
			if(leng == 0){
				html += "<tr><td colspan='10'>데이터가 존재하지 않습니다.</td></tr>";
			}else{
				for(var i=0; i<leng; i++){
					var data = list[i];
					html += "<tr onclick='javascript:fn_show_modal(\"detail\", "+data.siteId+")'>";
					html += "<td>"+data.num+"</td>";
					html += "<td>"+udchk(data.siteName)+"</td>";
					html += "<td>"+udchk(data.siteLa)+"</td>";
					html += "<td>"+udchk(data.siteLo)+"</td>";
					html += "<td>"+udchk(data.siteAltoc)+"</td>";
					html += "<td>"+udchk(data.siteDph)+"</td>"
					html += "<td>"+udchk(data.siteCalbr)+"</td>";
					html += "<td>"+udchk(data.siteBdgrNm)+"</td>";
					html += "<td>"+udchk(data.siteSdgrNm)+"</td>";
					html += "<td>"+udchk(data.sitePos)+"</td>";
					html += "</tr>";
				}
			}
			$("#datatable tbody").empty(html);
			$("#datatable tbody").append(html);
			
			setPagination(result.total, 10);
			renderPagination();
			
			$(".loading").hide();
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
	
}

//모달창 Close 기능
function fn_close_modal(type) {
     $('#'+type).hide();
};

//모달창 제어
function fn_show_modal(type, siteId){
	if(type=="detail"){
		if(siteId == "back"){
			siteId = $("#siteId").val();
		}
		fn_set_detail(siteId);
	}
}


//관측소 상세정보 셋팅
function fn_set_detail(siteId){
	$("#detailModal").show();
	
	$("#siteId").val(siteId);
	$("#detailTbody").empty();
	
	var html = "";
	
	$(".loading").show();
	
	$.ajax({
		url : "<c:url value='/front/siteManage/selectSiteInfo.json'/>",
		type : "POST",
		data : {"siteId":siteId},
		dataType : "json",
		success : function(result){
			var html = "";
			var data = result.siteInfo;
			$("#img1").empty();
			$("#img2").empty();
			if(udchk(data.sitePic1) != null && udchk(data.sitePic1) != ""){
				$("#img1").append('<img src="/GreenCity/front/common/display.do?name='+data.sitePic1+'"  style="height: 200px; width:400px;">')
				$("#img1Div").html('<img src="/GreenCity/front/common/display.do?name='+data.sitePic1+'"  style="height: 200px; width:100%;">');
			}else{
				$("#img1").append("<div style='margin-top:20%;'>이미지가 없습니다.</div>");
				$("#img1Div").html("<div style='margin-top:20%;'>이미지가 없습니다.</div>");
			}
			if(udchk(data.sitePic2) != null && udchk(data.sitePic2) != ""){
				$("#img2").append('<img src="/GreenCity/front/common/display.do?name='+data.sitePic2+'"  style="height: 200px; width:400px;">');
				$("#img2Div").html('<img src="/GreenCity/front/common/display.do?name='+data.sitePic2+'"  style="height: 200px; width:100%;">');
			}else{
				$("#img2").append("<div style='margin-top:20%;'>이미지가 없습니다.</div>");
				$("#img2Div").html("<div style='margin-top:20%;'>이미지가 없습니다.</div>");
			}
			
			html += '<tr><th>관측소명</th><td>'+udchk(data.siteName)+'</td><th>관측년도</th><td>'+udchk(data.siteDevdt)+'</td></tr>';
			html += '<tr><th>위치</th><td colspan="3">'+udchk(data.sitePos)+'</td></tr>';
			html += '<tr><th>허가번호</th><td>'+udchk(data.siteRpmsno)+'</td><th>대유역</th><td>'+udchk(data.siteBdgrNm)+'</td></tr>';
			html += '<tr><th>표고_TOC(m)</th><td>'+udchk(data.siteAltoc)+'</td><th>소유역</th><td>'+udchk(data.siteSdgrNm)+'</td></tr>';
			html += '<tr><th>X_COORD</th><td>'+udchk(data.wellX)+'</td><th>Y_COORD</th><td>'+udchk(data.wellY)+'</td></tr>';
			html += '<tr><th>경도</th><td>'+udchk(data.siteLo)+'</td><th>심도(m)</th><td>'+udchk(data.siteDph)+'</td></tr>';
			html += '<tr><th>위도</th><td>'+udchk(data.siteLa)+'</td><th>케이싱구경(mm)</th><td>'+udchk(data.siteCalbr)+'</td></tr>';
			if(udchk(data.siteGcol) == "" || udchk(data.siteGcol) == null){
				html += '<tr><th>관측소 지질주상도</th><td colspan="3">지질주상도 파일이 없습니다.</td></tr>';
			}else{
				html += '<tr><th>관측소 지질주상도</th><td colspan="3" onclick="javascript:fn_imgFiledownload()"><a>'+udchk(data.siteName)+'지질주상도</a></td></tr>';
			}
			
			
			$("#detailTbody").append(html);
			
			$(".loading").hide();
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}
</script>